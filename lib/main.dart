import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:promptia/core/config/supabase_config.dart';
import 'package:promptia/core/routes/app_router.dart';
import 'package:promptia/core/theme/app_input_decoration_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await SupabaseConfig.onInit();

  // await Supabase.initialize(
  //   url: SupabaseConstants.apiUrl,
  //   anonKey: SupabaseConstants.apiKey,
  // );
  GoRouter.optionURLReflectsImperativeAPIs = true;
  // final authNotifer = rootProvider.read(authViewModelProvider.notifier);
  // await authNotifer.loadCurrentUser();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  final String _title = "Promptia";

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      // routeInformationParser: router.routeInformationParser,
      // routeInformationProvider: router.routeInformationProvider,
      // routerDelegate: router.routerDelegate,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        colorScheme: const ColorScheme.light(primary: Colors.black),
        primaryColor: Colors.black,
        //useMaterial3: true,
        // brightness: Brightness.light,

        inputDecorationTheme: AppInputDecorationTheme.lightTheme,
      ),
    );
  }
}
