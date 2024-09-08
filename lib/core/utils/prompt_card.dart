import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:promptia/core/utils/helper.dart';
import 'package:promptia/features/prompt/presentation/providers/prompt_view_model_provider.dart';

class PromptCard extends ConsumerWidget {
  final String name;
  final DateTime createdAt;
  final String email;
  final String title;
  final String prompt;
  final bool isDelete;
  final int? id;

  const PromptCard({
    super.key,
    required this.name,
    required this.createdAt,
    required this.email,
    required this.title,
    required this.prompt,
    this.isDelete = false,
    this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              formatDateTime(
                createdAt.toString(),
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(text: prompt),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        behavior: SnackBarBehavior.floating,
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Colors.green,
                        content: const Text('Prompt copied to clipboard'),
                        showCloseIcon: true,
                      ),
                    );
                  },
                ),
                ...[
                  if (isDelete)
                    IconButton(
                      onPressed: () {
                        ref
                            .read(promptViewModelProviderProvider.notifier)
                            .deletePrompt(id: id!);
                        ref.invalidate(promptViewModelProviderProvider);
                        ref.invalidate(fetchAllPromptProvider);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            behavior: SnackBarBehavior.floating,
                            padding: const EdgeInsets.all(10),
                            backgroundColor: Colors.red,
                            content: const Text('Prompt Deleted Successfully'),
                            showCloseIcon: true,
                          ),
                        );
                      },
                      icon: const Icon(Icons.delete_outline),
                    ),
                ]
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(width: 5),
                const SizedBox(height: 5),
                Text(prompt),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
