import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:promptia/core/utils/error_converter.dart';
import 'package:promptia/features/auth/presentation/providers/auth_view_model.dart';
import 'package:promptia/core/core.dart';

import '../widgets/widgets.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final String _title = "Promptia";
  final String _message = "Welcome back";
  final String _buttonText = "signup";
  final String _or = "--OR--";
  final double _n9 = NumberConstants.n9;
  final double _n10 = NumberConstants.n10;

  final String _textSpanLine = "Already Have an account ?";
  final String _textSpanWord = "Login";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AsyncValue<void> signupState = const AsyncData(null);
  @override
  void initState() {
    super.initState();
  }

  signup() {}

  listen() {
    ref.listen(
      authViewModelProvider,
      (pre, next) {
        if (next is AsyncLoading) {
          setState(
            () {
              signupState = const AsyncLoading();
            },
          );
        } else if (next is AsyncData) {
          if (next.hasValue) {
            //navigate
          }
        } else {
          setState(
            () {
              signupState = AsyncError(next.error!, next.stackTrace!);
            },
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login failed: ${next.error}'),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose

    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    cPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    listen();
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
                      controller: nameController,
                      label: 'Name*',
                      hintText: 'Enter your Name',
                      //onValidate: validation.minLength(3).maxLength(20).build(),
                      onValidate: Validator.required,
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
                      height: _n10,
                    ),
                    AuthField(
                      controller: cPasswordController,
                      label: 'Confirm Password',
                      hintText: 'Enter your Confirm Password',
                      isPasswordField: true,
                      onValidate: (value) {
                        if (passwordController.text != value) {
                          return "Confirm Password do not match";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: _n10 * 2,
                    ),
                    if (signupState.hasError)
                      Text(errorConverter(signupState.error)),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if (signupState.hasValue) {
                            signupState = const AsyncLoading();
                            setState(() {});
                            final result = await ref
                                .read(authViewModelProvider.notifier)
                                .signupWithPassword(
                                  nameController.text.trim(),
                                  emailController.text.trim(),
                                  passwordController.text.trim(),
                                );

                            if (result.hasError) {
                              signupState =
                                  AsyncError(result.error!, StackTrace.empty);
                              setState(() {});
                            }
                          }
                        }
                      },
                      style: commonButtonStyle(),
                      child: !signupState.isLoading
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
                      height: _n10 - 7,
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
                            context.push("/auth/login");
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
