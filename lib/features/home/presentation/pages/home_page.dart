import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:promptia/core/core.dart';
import 'package:promptia/core/utils/prompt_card.dart';
import 'package:promptia/features/prompt/presentation/providers/prompt_view_model_provider.dart';

// class HomePage extends ConsumerStatefulWidget {
//   const HomePage({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
// }

// class _HomeViewState extends ConsumerState<HomePage> {
//   AsyncValue<void> promptState = const AsyncData(null);
//   @override
//   Widget build(BuildContext context) {
//     final response = ref.watch(fetchAllPromptProvider);

//     return response.when(
//       data: (data) {
//         return Scaffold(
//           floatingActionButton: FloatingActionButton(
//             onPressed: () {
//               context.push("/add-prompt");
//             },
//             child: const Icon(Icons.add),
//           ),
//           appBar: AppBar(
//             title: const Text("promptia"),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   context.push("/profile");
//                 },
//                 child: const Text("Profile"),
//               ),
//             ],
//           ),
//           body: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
//             child: !promptState.isLoading
//                 ? Column(
//                     children: [
//                       ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: data.length,
//                         itemBuilder: (context, index) {
//                           final prompt = data[index];
//                           return PromptCard(
//                             email: prompt.user.email,
//                             createdAt: prompt.created_at,
//                             name: prompt.user.metadata.name,
//                             title: prompt.title,
//                             prompt: prompt.prompt,
//                             id: prompt.id,
//                           );
//                         },
//                       ),
//                     ],
//                   )
//                 : Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text("No prompt found"),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             context.push("/add-prompt");
//                           },
//                           style: commonButtonStyle(
//                             height: 40,
//                             width: 80,
//                           ),
//                           child: const Text("Add Prompt"),
//                         ),
//                       ],
//                     ),
//                   ),
//           ),
//         );
//       },
//       loading: () => const Center(
//         child: CircularProgressIndicator(
//           strokeAlign: BorderSide.strokeAlignInside,
//           strokeWidth: 2,
//         ),
//       ),
//       error: (error, stackTrace) => Scaffold(
//         body: Center(
//           child: Text("Error: $error"),
//         ),
//       ),
//     );
//   }
// }

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  AsyncValue<void> promptState = const AsyncData(null);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final response = ref.watch(fetchAllPromptProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push("/add-prompt");
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("promptia"),
        actions: [
          TextButton(
            onPressed: () {
              context.push("/profile");
            },
            child: const Text("Profile"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: response.when(
          data: (data) {
            return !promptState.isLoading
                ? Column(
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
                            id: prompt.id,
                          );
                        },
                      ),
                    ],
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
      ),
    );
  }
}
