import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../AppStrings.dart';
import '../AppColors.dart';
import '../AppStyles.dart';
import 'BurgerComposePage.dart';
import 'BurgerMenuV.dart';
import 'HomePage.dart';
import 'OrderSummaryV.dart';
import '../viewModel/OrderVM.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => OrderVM(),
        child: MaterialApp(
          title: AppStrings.appName,
          theme: ThemeData(
            primaryColor: AppColors.primary,
            scaffoldBackgroundColor: AppColors.background,
            textTheme: const TextTheme(
              headline1: AppStyles.headline1,
              button: AppStyles.button,
            ),
          ),
          home: HomeScreen(), // Assuming HomeScreen is your initial screen
          routes: {
            '/Home': (context) => HomeScreen(),
            '/BurgerMenu': (context) => const BurgerMenuV(),
            '/Composer': (context) => const BurgerComposer(),
            '/Summary': (context) => BurgerOrderV(),
          },
        )
    );
  }
}

// ... BurgerMenuV and other widget code ...
