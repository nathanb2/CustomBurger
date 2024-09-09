import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_lunch/view/BurgerMenuV.dart';
import 'package:your_lunch/viewModel/UserVM.dart';

import '../AppColors.dart'; // Assuming AppColors is defined with color constants
import '../AppStrings.dart';
import '../AppStyles.dart'; // Assuming AppStrings is defined with string constants

class SignInV extends StatefulWidget {
  @override
  _SignInVState createState() => _SignInVState();
}

class _SignInVState extends State<SignInV> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserVM(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.signIn), // Use constant for title
        ),
        body: Padding(
          padding: EdgeInsets.all(24.0), // Adjust padding as desired
          child: Consumer<UserVM>(
            builder: (context, userVM, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: AppStrings.email, // Use constant for label
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0), // Rounded corners
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 8.0), // Add some margin between fields
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: AppStrings.password, // Use constant for label
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0), // More space after password field

                  if (userVM.isLoading)
                    Center(child: CircularProgressIndicator())
                  else
                    ElevatedButton(
                      onPressed: () async {
                        userVM.signInRequest.email = _emailController.text;
                        userVM.signInRequest.password = _passwordController.text;

                        // Call the sign-in function and pass the onSuccess callback
                        await userVM.signIn(() {
                          // Define the onSuccess callback
                          // This will be called when sign-in is successful
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BurgerMenuV()),); // Example: navigate to device selection page
                        });
                      },
                      child: Text(AppStrings.signIn, style: AppStyles.button), // Use constant for button text
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 50), // Adjust button size
                        backgroundColor: AppColors.primary, // Use primary color constant
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  if (userVM.errorMessage.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Icon(Icons.error, color: Colors.red),
                          SizedBox(width: 8.0),
                          Text(
                            userVM.errorMessage,
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}