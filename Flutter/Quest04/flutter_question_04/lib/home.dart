import 'package:flutter/material.dart';
import 'article_page.dart';
import 'app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            AppLocalizations.of(context).translate('title'),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeadlineNews(context),
            SizedBox(height: 30),
            Text(
              "Latest News",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildNewsTile(
                    context,
                    "Gemini 2.0: Google ushers in the agentic AI era",
                    "Virtual Assistants",
                    "assets/images/gemini.jpg",
                    "Gemini 2.0 is Google's latest AI model...",
                  ),
                  _buildNewsTile(
                    context,
                    "Discovering the future of AI – Introducing AI Parabellum (an AI tools directory)",
                    "AI Tools",
                    "assets/images/parabellum.png",
                    "AI Parabellum is a comprehensive directory...",
                  ),
                  _buildNewsTile(
                    context,
                    "Google launches Veo and Imagen 3 generative AI models",
                    "Company",
                    "assets/images/imagen.png",
                    "Google's new Veo and Imagen 3 models...",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeadlineNews(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticlePage(
              title: "Ethical AI",
              content: "OpenAI funds \$1 million study on AI and morality...",
            ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Container(
        height: 330,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage("assets/images/ai_morality_study.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 16,
              left: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ethical AI",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "OpenAI funds \$1 million study \non AI and morality at Duke Uni.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "3 min ago",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsTile(BuildContext context, String title, String category,
      String imagePath, String content) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticlePage(
              title: title,
              content: content,
            ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: -0.3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
