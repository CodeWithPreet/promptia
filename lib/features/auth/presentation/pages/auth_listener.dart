// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:promptia/core/core.dart';
// import 'package:promptia/features/auth/presentation/providers/auth_providers.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class AuthListener extends ConsumerStatefulWidget {
//   const AuthListener({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _AuthListenerState();
// }

// class _AuthListenerState extends ConsumerState<AuthListener> {
//   @override
//   Widget build(BuildContext context) {
//     final authState = ref.watch(authStateProvider);

//     return authState.when(
//       data: (data) {
//         final AuthChangeEvent event = data.event;
//         final Session? session = data.session;
//         logger.i("event : $event");
//         logger.i("session : $session");
//         if (event == AuthChangeEvent.signedIn) {
//           context.go(NameNavigation.goToHome());
//         } else if (event == AuthChangeEvent.signedOut) {
//           context.go(NameRoute.login);
//         } else if (event == AuthChangeEvent.tokenRefreshed) {
//           context.go(NameRoute.login);
//         }

//         // switch (event) {
//         //   case AuthChangeEvent.initialSession:
//         //     // Handle initial session
//         //     context.go(NameRoute.login);
//         //     break;
//         //   case AuthChangeEvent.signedIn:
//         //     // Handle signed in
//         //     context.go(NameRoute.root);
//         //     break;
//         //   case AuthChangeEvent.signedOut:
//         //     // Handle signed out
//         //     context.go(NameRoute.login);
//         //     break;
//         //   case AuthChangeEvent.passwordRecovery:
//         //     // Handle password recovery
//         //     break;
//         //   case AuthChangeEvent.tokenRefreshed:
//         //     // Handle token refreshed
//         //     break;
//         //   case AuthChangeEvent.userUpdated:
//         //     // Handle user updated
//         //     break;
//         //   case AuthChangeEvent.userDeleted:
//         //     // Handle user deleted
//         //     break;
//         //   case AuthChangeEvent.mfaChallengeVerified:
//         //     // Handle mfa challenge verified
//         //     break;
//         // }

//         return Scaffold(
//           body: Center(child: Text('Auth Event: $event, Session: $session')),
//         );
//       },
//       error: (error, stack) {
//         // Show an error SnackBar
//         WidgetsBinding.instance.addPostFrameCallback(
//           (_) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text('Error: ${error.toString()}'),
//                 backgroundColor: Colors.red,
//               ),
//             );
//           },
//         );

//         // Return a placeholder widget while the SnackBar is shown
//         return const Scaffold(
//           body: Center(child: Text('Something went wrong.')),
//         );
//       },
//       loading: () {
//         return const SizedBox(
//           width: 24,
//           height: 24,
//           child: CircularProgressIndicator(
//             strokeWidth: 2,
//             color: Colors.white,
//           ),
//         );
//       },
//     );
//   }
// }
