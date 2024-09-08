import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:promptia/core/core.dart';
import 'package:promptia/core/utils/prompt_card.dart';

import 'package:promptia/features/auth/auth.dart';
import 'package:promptia/features/prompt/presentation/providers/prompt_view_model_provider.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  AsyncValue<void> promptState = const AsyncData(null);

  @override
  void initState() {
    ref.read(promptViewModelProviderProvider.notifier).listenChanges();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authViewModelProvider);
    final response = ref.watch(promptViewModelProviderProvider);

    if (user.hasValue) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("Profile Page"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Center(
            child: Column(
              children: [
                Text(
                  user.value?.userMetadata?["name"] ?? " ",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(user.value?.email ?? ""),
                const SizedBox(
                  height: NumberConstants.n10 * 2,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await ref.read(authViewModelProvider.notifier).signOut();
                    ref.invalidate(authViewModelProvider);
                  },
                  style: commonButtonStyle(
                    height: 40,
                    width: 100,
                    foregroundColor: AppColor.blackColor,
                    backgroundColor: AppColor.whiteColor,
                  ),
                  child: const Text("Sign Out"),
                ),
                const SizedBox(
                  height: NumberConstants.n10 * 4,
                ),
                const Divider(
                  color: AppColor.blackColor,
                  thickness: 1,
                ),
                const SizedBox(
                  height: NumberConstants.n10 * 2,
                ),
                response.when(
                  data: (data) {
                    return !promptState.isLoading
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 30),
                            child: Column(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    final prompt = data[index];
                                    return PromptCard(
                                      email: prompt.user.email,
                                      createdAt: prompt.created_at,
                                      name: prompt.user.metadata.name,
                                      title: prompt.title,
                                      prompt: prompt.prompt,
                                      isDelete: true,
                                      id: prompt.id,
                                    );
                                  },
                                ),
                              ],
                            ),
                          )
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("No prompt found"),
                                const SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    context.push("/add-prompt");
                                  },
                                  style: commonButtonStyle(
                                    height: 40,
                                    width: 80,
                                  ),
                                  child: const Text("Add Prompt"),
                                ),
                              ],
                            ),
                          );
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(
                      strokeAlign: BorderSide.strokeAlignInside,
                      strokeWidth: 2,
                    ),
                  ),
                  error: (error, stackTrace) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("$error"),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context.push("/add-prompt");
                            },
                            style: commonButtonStyle(
                              height: 40,
                              width: 80,
                            ),
                            child: const Text("Add Prompt"),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }

    return const Scaffold(
      body: Text("Loading..."),
    );
  }
}
