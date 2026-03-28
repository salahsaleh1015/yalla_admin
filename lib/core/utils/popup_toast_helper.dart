

import 'package:flutter/material.dart';


// void showCustomToast(
//     BuildContext context,
//     String message, {
//       Color backgroundColor = Colors.black87,
//       Color textColor = Colors.white,
//       Duration duration = const Duration(seconds: 2),
//       double topPaddingFactor = 0.15,
//     }) {
//   final overlay = Overlay.of(context);
//
//   // نعمل الـ Overlay Entry
//   final overlayEntry = OverlayEntry(
//     builder: (context) => Positioned(
//       top: MediaQuery.of(context).size.height * topPaddingFactor,
//       left: 20,
//       right: 20,
//       child: _AnimatedToast(
//         message: message,
//         backgroundColor: backgroundColor,
//         textColor: textColor,
//         duration: duration,
//       ),
//     ),
//   );
//
//   // نعرضه
//   overlay.insert(overlayEntry);
//
//   // نحذفه بعد المدة المحددة
//   Future.delayed(duration + const Duration(milliseconds: 300), () {
//     overlayEntry.remove();
//   });
// }
//
// class _AnimatedToast extends StatefulWidget {
//   final String message;
//   final Color backgroundColor;
//   final Color textColor;
//   final Duration duration;
//
//   const _AnimatedToast({
//     required this.message,
//     required this.backgroundColor,
//     required this.textColor,
//     required this.duration,
//   });
//
//   @override
//   State<_AnimatedToast> createState() => _AnimatedToastState();
// }
//
// class _AnimatedToastState extends State<_AnimatedToast>
//     with SingleTickerProviderStateMixin {
//   double opacity = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(milliseconds: 50), () {
//       if (mounted) setState(() => opacity = 1.0);
//     });
//
//     // بعد المدة نخفّي التوست تدريجيًا
//     Future.delayed(widget.duration, () {
//       if (mounted) setState(() => opacity = 0.0);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedOpacity(
//       opacity: opacity,
//       duration: const Duration(milliseconds: 300),
//       child: Center(
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//           decoration: BoxDecoration(
//             color: widget.backgroundColor,
//             borderRadius: BorderRadius.circular(16),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.25),
//                 blurRadius: 8,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: Text(
//             widget.message,
//             style: TextStyle(
//               color: widget.textColor,
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'dart:ui';
import 'package:flutter/material.dart';

enum ToastType { success, error, warning, info }

void showCustomToast(
    BuildContext context,
    String message, {
      ToastType type = ToastType.info,
      Duration duration = const Duration(seconds: 2),
    }) {
  final overlay = Overlay.of(context);

  final overlayEntry = OverlayEntry(
    builder: (context) => _AnimatedToast(
      message: message,
      type: type,
      duration: duration,
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(duration + const Duration(milliseconds: 600), () {
    overlayEntry.remove();
  });
}

class _AnimatedToast extends StatefulWidget {
  final String message;
  final ToastType type;
  final Duration duration;

  const _AnimatedToast({
    required this.message,
    required this.type,
    required this.duration,
  });

  @override
  State<_AnimatedToast> createState() => _AnimatedToastState();
}

class _AnimatedToastState extends State<_AnimatedToast>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacity;
  late Animation<Offset> slide;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    opacity = Tween(begin: 0.0, end: 1.0).animate(controller);

    slide = Tween(
      begin: const Offset(0, -0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutBack,
    ));

    scale = Tween(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    );

    controller.forward();

    Future.delayed(widget.duration, () {
      controller.reverse();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Color get backgroundColor {
    switch (widget.type) {
      case ToastType.success:
        return Colors.green;
      case ToastType.error:
        return Colors.red;
      case ToastType.warning:
        return Colors.orange;
      case ToastType.info:
        return Colors.blue;
    }
  }

  IconData get icon {
    switch (widget.type) {
      case ToastType.success:
        return Icons.check_circle;
      case ToastType.error:
        return Icons.error;
      case ToastType.warning:
        return Icons.warning;
      case ToastType.info:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Positioned(
      top: MediaQuery.of(context).padding.top + 16, // SafeArea
      left: screenWidth * 0.05,
      right: screenWidth * 0.05,
      child: FadeTransition(
        opacity: opacity,
        child: SlideTransition(
          position: slide,
          child: ScaleTransition(
            scale: scale,
            child: Material(
              color: Colors.transparent,
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 500, // مهم للتابلت والويب
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.04,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: backgroundColor.withValues(alpha: 0.85),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(icon, color: Colors.white),
                            SizedBox(width: screenWidth * 0.02),
                            Flexible(
                              child: Text(
                                widget.message,
                                maxLines: 2, // مهم جدًا
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}