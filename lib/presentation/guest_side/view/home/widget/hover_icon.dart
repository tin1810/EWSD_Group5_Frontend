import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  final IconData icon;
  final String url;

  const HoverButton({super.key, required this.icon, required this.url});

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () {
          // Open URL in web browser
          print('Opening: ${widget.url}');
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: isHovered ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: Icon(widget.icon,
              color: isHovered ? Colors.black : Colors.white, size: 24),
        ),
      ),
    );
  }
}
