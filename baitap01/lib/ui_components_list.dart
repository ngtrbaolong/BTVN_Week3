import 'package:flutter/material.dart';
import 'text_detail_screen.dart';
import 'image_detail_screen.dart';

class UIComponentsList extends StatelessWidget {
  const UIComponentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'UI Components List',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Display Section
          const Text(
            'Display',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildComponentCard(
            context: context,
            title: 'Text',
            description: 'Displays text',
          ),
          const SizedBox(height: 8),
          _buildComponentCard(
            context: context,
            title: 'Image',
            description: 'Displays an image',
          ),

          const SizedBox(height: 24),

          // Input Section
          const Text(
            'Input',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildComponentCard(
            context: context,
            title: 'TextField',
            description: 'Input field for text',
          ),
          const SizedBox(height: 8),
          _buildComponentCard(
            context: context,
            title: 'PasswordField',
            description: 'Input field for passwords',
          ),

          const SizedBox(height: 24),

          // Layout Section
          const Text(
            'Layout',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildComponentCard(
            context: context,
            title: 'Column',
            description: 'Arranges elements vertically',
          ),
          const SizedBox(height: 8),
          _buildComponentCard(
            context: context,
            title: 'Row',
            description: 'Arranges elements horizontally',
          ),
        ],
      ),
    );
  }

  Widget _buildComponentCard({
    required BuildContext context,
    required String title,
    required String description,
  }) {
    return GestureDetector(
      onTap: () {
        // Navigate to the appropriate detail screen based on the title
        if (title == 'Text') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TextDetailScreen()),
          );
        } else if (title == 'Image') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ImageDetailScreen()),
          );
        } else {
          // For other components, show a simple SnackBar for now
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$title detail view coming soon!'),
              duration: const Duration(seconds: 1),
            ),
          );
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFD7EAFA), // Light blue color
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}