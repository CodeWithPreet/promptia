import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage customPageTransition({
  required Widget child,
  Duration transitionDuration = const Duration(milliseconds: 300),
  Offset beginOffset = const Offset(1.0, 0.0),
  Offset endOffset = Offset.zero,
  Curve curve = Curves.easeInOut,
  required LocalKey? pageKey,
}) {
  return CustomTransitionPage(
    child: child,
    key: pageKey,
    transitionDuration: transitionDuration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final tween = Tween<Offset>(begin: beginOffset, end: endOffset)
          .chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}
