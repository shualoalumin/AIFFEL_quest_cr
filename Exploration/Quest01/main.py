import tensorflow as tf
import time
import logging
from fastapi import FastAPI, File, UploadFile
from fastapi.responses import JSONResponse
from fastapi.middleware.cors import CORSMiddleware
from tensorflow.keras.models import load_model
from tensorflow.keras.layers import Layer
from PIL import Image
import io
import numpy as np
from pyngrok import ngrok

# 로깅 설정
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# 사용자 정의 레이어 정의
class CustomScaleLayer(Layer):
    def __init__(self, scale=1.0, **kwargs):
        super(CustomScaleLayer, self).__init__(**kwargs)
        self.scale = scale

    def call(self, inputs):
        inputs = tf.convert_to_tensor(inputs)
        return inputs * self.scale
    
    def compute_output_shape(self, input_shape):
        # 입력과 출력의 형태가 동일하다고 가정
        return input_shape
    
# FastAPI 앱 생성 및 CORS 설정
app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # 모든 출처 허용 (배포 시 수정 가능)
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# 사용자 정의 레이어를 custom_objects로 등록하여 모델 불러오기
model = load_model(
    'flower_classifier_v1.h5',
    custom_objects={'CustomScaleLayer': CustomScaleLayer}
)

# 클래스 이름 매핑
CLASS_NAMES = {
    0: "Dandelion",
    1: "Daisy",
    2: "Tulips",
    3: "Sunflowers",
    4: "Roses"
}

# 이미지 전처리 함수
async def preprocess_image(image_file: UploadFile, target_size: tuple = (299, 299)) -> np.ndarray:
    contents = await image_file.read()
    image = Image.open(io.BytesIO(contents)).convert('RGB')
    image = image.resize(target_size)
    image_array = np.array(image) / 127.5 - 1.0  # [-1, 1] 스케일링
    image_array = np.expand_dims(image_array, 0)
    return image_array

# 예측 엔드포인트
@app.post("/predict")
async def predict(image: UploadFile = File(...)):
    try:
        logger.info("Prediction requested")

        # 이미지 전처리
        preprocessed_image = await preprocess_image(image)

        # 추론 시간 측정 시작
        start_time = time.time()

        # 예측 수행
        predictions = model.predict(preprocessed_image)[0]

        # 추론 시간 측정 종료
        inference_time = time.time() - start_time

        # 예측 결과 해석
        predicted_class = np.argmax(predictions)
        confidence = predictions[predicted_class]
        class_name = CLASS_NAMES[predicted_class]  # 클래스 이름 매핑

        logger.info(f"Prediction result: Class={predicted_class}, Name={class_name}, Confidence={confidence:.4f}, Inference time={inference_time:.4f}")

        return JSONResponse({
            "predicted_class": int(predicted_class),
            "class_name": class_name,
            "confidence": float(confidence),
            "inference_time": inference_time
        })

    except FileNotFoundError as e:
        logger.error(f"파일을 찾을 수 없습니다: {str(e)}")
        return JSONResponse({"error": "File not found"}, status_code=404)

    except ValueError as e:
        logger.error(f"전처리 오류: {str(e)}")
        return JSONResponse({"error": "Invalid image format"}, status_code=400)

    except Exception as e:
        logger.error(f"알 수 없는 오류 발생: {str(e)}")
        return JSONResponse({"error": str(e)}, status_code=500)



if __name__ == "__main__":
    # ngrok을 사용하여 공개 URL 생성
    ngrok_tunnel = ngrok.connect(8000)
    logger.info(f"Public URL: {ngrok_tunnel.public_url}")

    # FastAPI 서버 실행
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)