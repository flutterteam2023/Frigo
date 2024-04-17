import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frigo/firebase_options.dart';
import 'package:frigo/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main()async {
    WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const ProviderScope(child: MyApp()));
}
final route = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (context, orientation) {
        return MaterialApp.router(
          routerConfig: route.config(),
          debugShowCheckedModeBanner: false,
          title: 'Frigo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
                scrolledUnderElevation: 0,
              ),
            useMaterial3: true,
          ),
        );
      }
    );
  }
}

