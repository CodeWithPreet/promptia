import 'package:flutter/material.dart';

class NameRoute {
  static const String root = '';
  static const String login = 'login';
  static const String signup = 'signup';
  static const String auth = "/auth";
  static const String loading = "loading";
}

class NameNavigation {
  static String goToHome() {
    return "";
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
      ),
    );
  }
}
