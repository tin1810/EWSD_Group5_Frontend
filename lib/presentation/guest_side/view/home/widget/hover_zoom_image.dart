import 'package:flutter/material.dart';

class HoverZoomImage extends StatefulWidget {
  final String imageUrl;

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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: isHovered ? 310 : 300,
        height: isHovered ? 250 : 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(widget.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
