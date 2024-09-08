import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:promptia/core/core.dart';
import 'package:promptia/features/auth/presentation/pages/login_page.dart';
import 'package:promptia/features/auth/presentation/pages/signup_page.dart';
import 'package:promptia/features/auth/presentation/providers/auth_view_model.dart';
import 'package:promptia/features/home/presentation/pages/home_page.dart';
import 'package:promptia/features/profile/presentation/pages/profile_page.dart';
import 'package:promptia/features/prompt/presentation/pages/add_prompt_page.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    refreshListenable: RouteNotifier(ref),
    redirect: (_, state) {
      return redirect(state, ref);
    },
    routes: [
      GoRoute(
        path: "/auth",
        redirect: (_, state) {
          if (state.fullPath! == "/auth") return "/auth/login";
          return null;
        },
        routes: [
          GoRoute(
            path: "login",
            // name: NameRoute.login,
            pageBuilder: (context, state) {
              return customPageTransition(
                child: LoginPage(
                  key: state.pageKey,
                ),
                pageKey: state.pageKey,
              );
            },
          ),
          GoRoute(
            path: "signup",
            pageBuilder: (context, state) {
              return customPageTransition(
                child: SignupPage(
                  key: state.pageKey,
                ),
                pageKey: state.pageKey,
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: "/",
        // pageBuilder: (context, state) {
        //   return customPageTransition(
        //     child: HomePage(
        //       key: state.pageKey,
        //     ),
        //     pageKey: state.pageKey,
        //   );
        // },
        builder: (context, state) {
          return HomePage(
            key: state.pageKey,
          );
        },
        routes: [
          GoRoute(
            path: "profile",
            pageBuilder: (context, state) {
              return customPageTransition(
                child: ProfilePage(
                  key: state.pageKey,
                ),
                pageKey: state.pageKey,
              );
            },
          ),
          GoRoute(
              path: "add-prompt",
              pageBuilder: (context, state) {
                return customPageTransition(
                  child: AddPromptPage(
                    key: state.pageKey,
                  ),
                  pageKey: state.pageKey,
                );
              }),
        ],
        // builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: "/loading",
        pageBuilder: (context, state) {
          return customPageTransition(
            child: LoadingView(
              key: state.pageKey,
            ),
            pageKey: state.pageKey,
          );
        },
      ),
    ],
  );
}

String? redirect(state, Ref ref) {
  final userState = ref.read(authViewModelProvider);

  logger.d("${state.fullPath!} $userState");
  if (userState.isLoading) {
    return "/loading";
  }
  if (userState.hasValue) {
    if (state.fullPath == "/loading" || state.fullPath.startsWith("/auth")) {
      return '/';
    }
    return null;
  }
  if (userState.hasError) {
    if (state.fullPath!.startsWith("/auth")) {
      return null;
    }
    return '/auth/login';
  }
  // if (userState.value == null) {
  //   if (state.fullPath!.startsWith("/auth")) {
  //     logger.d("Inside auth ${state.fullPath}");
  //     if (userState.hasValue) return '/';
  //     return null;
  //   }
  // }

  return null;
}

class RouteNotifier extends ChangeNotifier {
  final Ref _ref;
  RouteNotifier(this._ref) {
    _ref.listen(authViewModelProvider, (_, __) {
      notifyListeners();
    });
  }
}


//create hello screen


