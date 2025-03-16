import 'package:flutter/material.dart';

class TextDetailScreen extends StatelessWidget {
  const TextDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Text Detail',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Styled text example
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(fontSize: 28, color: Colors.black),
                  children: [
                    const TextSpan(text: 'The '),
                    TextSpan(
                      text: 'quick',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        decorationThickness: 2,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    const TextSpan(text: ' '),
                    const TextSpan(
                      text: 'Brown',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const TextSpan(text: '\nfox '),
                    const TextSpan(
                      text: 'j u m p s',
                      style: TextStyle(letterSpacing: 4.0),
                    ),
                    const TextSpan(text: ' '),
                    const TextSpan(
                      text: 'over',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(text: '\n'),
                    TextSpan(
                      text: 'the',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                        decorationColor: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    const TextSpan(text: ' '),
                    const TextSpan(
                      text: 'lazy',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    const TextSpan(text: ' dog.'),
                  ],
                ),
              ),
              // Divider
              const SizedBox(height: 40),
              Container(width: 100, height: 1, color: Colors.grey[300]),
            ],
          ),
        ),
      ),
    );
  }
}