

import 'package:flutter/material.dart';


void showCustomToast(
    BuildContext context,
    String message, {
      Color backgroundColor = Colors.black87,
      Color textColor = Colors.white,
      Duration duration = const Duration(seconds: 2),
      double topPaddingFactor = 0.15,
    }) {
  final overlay = Overlay.of(context);

  // نعمل الـ Overlay Entry
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).size.height * topPaddingFactor,
      left: 20,
      right: 20,
      child: _AnimatedToast(
        message: message,
        backgroundColor: backgroundColor,
        textColor: textColor,
        duration: duration,
      ),
    ),
  );

  // نعرضه
  overlay.insert(overlayEntry);

  // نحذفه بعد المدة المحددة
  Future.delayed(duration + const Duration(milliseconds: 300), () {
    overlayEntry.remove();
  });
}

class _AnimatedToast extends StatefulWidget {
  final String message;
  final Color backgroundColor;
  final Color textColor;
  final Duration duration;

  const _AnimatedToast({
    required this.message,
    required this.backgroundColor,
    required this.textColor,
    required this.duration,
  });

  @override
  State<_AnimatedToast> createState() => _AnimatedToastState();
}

class _AnimatedToastState extends State<_AnimatedToast>
    with SingleTickerProviderStateMixin {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 50), () {
      if (mounted) setState(() => opacity = 1.0);
    });

    // بعد المدة نخفّي التوست تدريجيًا
    Future.delayed(widget.duration, () {
      if (mounted) setState(() => opacity = 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 300),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Text(
            widget.message,
            style: TextStyle(
              color: widget.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
