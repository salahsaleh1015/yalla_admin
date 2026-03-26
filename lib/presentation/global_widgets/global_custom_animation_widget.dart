
import 'package:flutter/material.dart';

class GlobalCustomAnimationWidget extends StatelessWidget {
  const GlobalCustomAnimationWidget({
    super.key,
    required this.index,
    required this.child,
    this.isHorizontal = false,
  });

  final int index;
  final Widget child;
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      // زودنا الوقت الأساسي لـ 800 مللي ثانية (بدل 400)
      // وزودنا التأخير بين العناصر لـ 200 مللي ثانية (بدل 100)
      duration: Duration(
        milliseconds: 1200 + (index * 300),
      ),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeOutQuart, // جرب Quart بدل Quad بيدي نعومة أكتر في البطء
      builder: (context, value, child) {
        // حساب الإزاحة
        double offsetValue = 30 * (1 - value); // زودنا المسافة لـ 30 عشان الحركة تبان أوضح وهي بطيئة
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: isHorizontal
                ? Offset(offsetValue, 0)
                : Offset(0, offsetValue),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}