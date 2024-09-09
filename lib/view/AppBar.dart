import 'package:flutter/material.dart';
import '../AppColors.dart';
import '../AppStrings.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  VoidCallback? onCancel;
  String? cancelRouteName; // Route name to navigate to when cancel is pressed

  CustomAppBar({
    this.title,
    this.onCancel,
    this.cancelRouteName,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary, // Set background color
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: AppColors.onPrimary, // Set icon color
        onPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context); // Go back to the previous page
          } else {
            print('No route to pop');
          }
        },
      ),
      title: Center(
        child: Text(
          AppStrings.appName,
          style: TextStyle(
            color: AppColors.onPrimary, // Set text color
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.cancel),
          color: AppColors.onPrimary, // Set icon color
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              "/",
                  (route) => false, // Remove all previous routes
            );
          },
        ),
        SizedBox(width: 8), // Adding padding to the right side
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}