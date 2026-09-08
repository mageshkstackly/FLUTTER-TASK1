import 'package:flutter/material.dart';

import 'routes/app_router.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const OneCloudApp());
}

class OneCloudApp extends StatelessWidget {
  const OneCloudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'One Cloud Enterprise Platform',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 2, 96, 237),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 2, 40, 255),
        fontFamily: 'Arial',
      ),
      initialRoute: AppRoutes.login,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}