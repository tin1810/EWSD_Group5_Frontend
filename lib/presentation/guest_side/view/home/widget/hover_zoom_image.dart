import 'dart:typed_data';

import 'package:flutter/material.dart';

class HoverZoomImage extends StatefulWidget {
  final Uint8List imageUrl;

  const HoverZoomImage({super.key, required this.imageUrl});

  @override
  _HoverZoomImageState createState() => _HoverZoomImageState();
}

class _HoverZoomImageState extends State<HoverZoomImage> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Stack(
        children: [
          Image.asset(
            "assets/images/article_error.jpg",
            width: isHovered ? 310 : 300,
            height: isHovered ? 250 : 240,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: isHovered ? 310 : 300,
            height: isHovered ? 250 : 240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: MemoryImage(widget.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
