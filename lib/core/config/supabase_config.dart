import 'package:promptia/core/core.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static final SupabaseClient supabaseClient = Supabase.instance.client;
  static Future<void> onInit() async {
    await Supabase.initialize(
      url: SupabaseConstants.apiUrl,
      anonKey: SupabaseConstants.apiKey,
    );
  }

  Future<void> listenAuthChanges(context) async {
    SupabaseConfig.supabaseClient.auth.onAuthStateChange.listen(
      (data) {
        final AuthChangeEvent event = data.event;
        final Session? session = data.session;
        logger.i("event : $event");
        logger.i("session : $session");
        if (event == AuthChangeEvent.signedIn) {
          context.go(NameRoute.root);
        } else if (event == AuthChangeEvent.signedOut) {
          context.go(NameRoute.login);
        } else if (event == AuthChangeEvent.tokenRefreshed) {
          context.go(NameRoute.login);
        }
        // switch (event) {
        //   case AuthChangeEvent.initialSession:
        //     // Handle initial session
        //     context.go(NameRoute.login);
        //     break;
        //   case AuthChangeEvent.signedIn:
        //     // Handle signed in
        //     context.go(NameRoute.root);
        //     break;
        //   case AuthChangeEvent.signedOut:
        //     // Handle signed out
        //     context.go(NameRoute.login);
        //     break;
        //   case AuthChangeEvent.passwordRecovery:
        //     // Handle password recovery
        //     break;
        //   case AuthChangeEvent.tokenRefreshed:
        //     // Handle token refreshed
        //     break;
        //   case AuthChangeEvent.userUpdated:
        //     // Handle user updated
        //     break;
        //   case AuthChangeEvent.userDeleted:
        //     // Handle user deleted
        //     break;
        //   case AuthChangeEvent.mfaChallengeVerified:
        //     // Handle mfa challenge verified
        //     break;
        // }
      },
    );
  }
}
