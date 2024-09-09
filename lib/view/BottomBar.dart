import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_lunch/viewModel/OrderVM.dart';
import '../AppColors.dart';
import '../AppStrings.dart';
import '../AppStyles.dart'; // Assuming AppColors is in the parent directory

class BottomBarWidget extends StatefulWidget {
  final int burgerCount;
  final double amount;
  final VoidCallback onOrderPressed;

  BottomBarWidget({
    required this.burgerCount,
    required this.amount,
    required this.onOrderPressed,
  });

  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OrderVM>(builder: (context, orderVM, child) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        color: AppColors.background, // Set background color from AppColors
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Burger Count
            Text(
              'Burgers: ${orderVM.order?.burgers.length ?? 0}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            // Order Button
            ElevatedButton(
              onPressed: widget.onOrderPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary, // Set button color from AppColors
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              ),
              child: Text(
                AppStrings.order, // Use order string from AppStrings (if available)
                style: AppStyles.button,
              ),
            ),
            // Amount
            Text(
              '\$${(orderVM.order?.burgers.length ?? 0) * 50}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    });
  }
}