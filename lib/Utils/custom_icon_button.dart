import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key, required this.imageUrl, required this.onPressed,
  });
  final String imageUrl;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.network(
        imageUrl,
        width: 40, // Adjust the size as needed
        height: 40, // Adjust the size as needed
      ),
      onPressed: onPressed
    );
  }
}