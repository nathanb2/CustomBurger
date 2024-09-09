import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_lunch/AppStrings.dart';
import 'package:your_lunch/AppStyles.dart';
import 'package:your_lunch/service/DummyDB.dart';
import 'package:your_lunch/view/SignInPage.dart';
import 'package:your_lunch/view/main.dart';
import 'package:your_lunch/viewModel/OrderVM.dart';
import 'package:your_lunch/AppColors.dart'; // Assuming AppColors is defined

import 'BurgerMenuV.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.homeTitle),
      ),
      body: Center( // Add Center widget here
        child: Padding(
          padding: EdgeInsets.all(24.0), // Adjust padding as needed
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButton(
                text: AppStrings.loginButton,
                onPressed: () {
                  Provider.of<OrderVM>(context, listen: false).clearOrder();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInV()),
                  );
                },
              ),
              SizedBox(height: 16.0), // Space between buttons
              AppButton(
                text: AppStrings.guest,
                onPressed: () {
                  Provider.of<OrderVM>(context, listen: false).clearOrder();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BurgerMenuV()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text, style: AppStyles.button),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width / 4, 50), // Full width button
        backgroundColor: AppColors.primary,
        textStyle: AppStyles.button,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}