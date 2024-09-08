import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:promptia/core/core.dart';
import 'package:promptia/core/utils/error_converter.dart';
import 'package:promptia/features/prompt/presentation/providers/prompt_view_model_provider.dart';
import 'package:promptia/features/prompt/presentation/widgets/prompt_field.dart';

class AddPromptPage extends ConsumerStatefulWidget {
  const AddPromptPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddPromptPageState();
}

class _AddPromptPageState extends ConsumerState<AddPromptPage> {
  final double num18 = (NumberConstants.n10 * 2) - 2;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController promptController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AsyncValue<void> addPromptState = const AsyncData(null);

  @override
  void dispose() {
    titleController.dispose();
    promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Prompt"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: num18, vertical: num18),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              PromptField(
                label: "title",
                hintText: "Enter your title",
                controller: titleController,
                onValidate: Validator.requiredTitle,
              ),
              const SizedBox(
                height: NumberConstants.n10,
              ),
              PromptField(
                isPromptField: true,
                label: "prompt",
                hintText: "Enter your prompt",
                controller: promptController,
                onValidate: Validator.requiredPrompt,
              ),
              const SizedBox(
                height: NumberConstants.n10 * 2,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      addPromptState = const AsyncLoading();
                    });
                    logger.d("Form is valid");
                    final addPromptRes = await ref
                        .read(promptViewModelProviderProvider.notifier)
                        .addPrompt(
                          title: titleController.text.trim(),
                          prompt: promptController.text.trim(),
                        );
                    ref.invalidate(promptViewModelProviderProvider);
                    ref.invalidate(fetchAllPromptProvider);

                    if (addPromptRes.hasValue) {
                      setState(
                        () {
                          addPromptState = const AsyncData(null);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              behavior: SnackBarBehavior.floating,
                              padding: const EdgeInsets.all(10),
                              showCloseIcon: true,
                              backgroundColor: Colors.green,
                              content: const Text("Prompt added successfully"),
                            ),
                          );
                          const Duration(seconds: 3);

                          context.pop();
                        },
                      );
                    } else {
                      setState(() {
                        addPromptState =
                            AsyncError(addPromptRes.error!, StackTrace.empty);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            behavior: SnackBarBehavior.floating,
                            padding: const EdgeInsets.all(10),
                            backgroundColor: Colors.red,
                            content: Text(
                              errorConverter(addPromptRes.error),
                            ),
                            showCloseIcon: true,
                          ),
                        );
                      });
                    }
                  }
                },
                style: commonButtonStyle(),
                child: !addPromptState.isLoading
                    ? const Text(
                        "Submit",
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
            ],
          ),
        ),
      ),
    );
  }
}
