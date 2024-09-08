import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:promptia/core/utils/error_converter.dart';
import 'package:promptia/features/auth/presentation/providers/auth_view_model.dart';

import 'package:promptia/core/core.dart';

import '../widgets/widgets.dart';
//Info:

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final String _title = "Promptia";
  final String _message = "Welcome back";
  final String _buttonText = "login";
  final String _or = "--OR--";
  final double _n9 = NumberConstants.n9;
  final double _n10 = NumberConstants.n10;

  final String _textSpanLine = "Don't have an account ?";
  final String _textSpanWord = "SignUp";
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AsyncValue<String> loginState = const AsyncData("init");

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final _state = ref.watch(authViewModelProvider);

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(_n10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        _title,
                        style: TextStyle(
                          fontSize: _n9 * 3,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        _message,
                        style: TextStyle(
                          fontSize: _n9 * 2,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _n10,
                    ),

                    AuthField(
                      controller: emailController,
                      label: 'Email*',
                      hintText: 'Enter your Email',
                      onValidate: Validator.email,
                    ),
                    SizedBox(
                      height: _n10,
                    ),
                    AuthField(
                      controller: passwordController,
                      label: 'Password*',
                      hintText: 'Enter your Password',
                      isPasswordField: true,
                      onValidate: Validator.password,
                    ),
                    SizedBox(
                      height: _n10 * 2,
                    ),

                    if (loginState.hasError) ...[
                      Text(errorConverter(loginState.error)),
                      const SizedBox(
                        height: 4,
                      ),
                    ],

                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loginState = const AsyncLoading();
                          });
                          final loginRes = await ref
                              .read(authViewModelProvider.notifier)
                              .loginWithEmail(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                              );
                          if (loginRes.hasValue) {
                            // navigate to home
                            // if (mounted) context.go("/");
                          } else {
                            setState(() {
                              loginState =
                                  AsyncError(loginRes.error!, StackTrace.empty);
                            });
                          }
                        }
                      },
                      style: commonButtonStyle(),
                      child: !loginState.isLoading
                          ? Text(
                              _buttonText,
                            )
                          : const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            ),
                    ),

                    SizedBox(
                      height: _n10,
                    ),
                    Text(_or),
                    SizedBox(
                      height: _n10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_textSpanLine),
                        TextButton(
                          style: ButtonStyle(
                            minimumSize: WidgetStatePropertyAll(
                              Size(_n10, _n10 / 5),
                            ),
                            padding: WidgetStateProperty.all(
                              const EdgeInsets.all(1.0),
                            ),
                          ),
                          onPressed: () {
                            context.push("/auth/signup");
                          },
                          child: Text(
                            _textSpanWord,
                            style: TextStyle(
                              fontSize: _n10 + 3,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Text.rich(
                    //   TextSpan(
                    //     text: _textSpanLine,
                    //     children: [
                    //       TextSpan(
                    //         text: " $_textSpanWord",
                    //         recognizer: TapGestureRecognizer()
                    //       ..onTap = () {
                    //         context.push(NameRoute.signup);
                    //       },
                    //       ),
                    //     ],

                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
