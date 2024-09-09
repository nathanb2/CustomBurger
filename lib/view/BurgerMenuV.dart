import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_lunch/viewModel/OrderVM.dart';
import '../AppColors.dart';
import '../AppStrings.dart';
import '../AppStyles.dart';
import '../model/Burger.dart';
import 'AppBar.dart';
import 'BottomBar.dart';
import 'BurgerComposePage.dart';
import 'OrderSummaryV.dart';

class BurgerMenuV extends StatelessWidget {
  const BurgerMenuV({super.key});

  @override
  Widget build(BuildContext context) {
    void _handleCustomizePressed(BuildContext context, OrderVM orderVM) {
      orderVM.createBurger();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BurgerComposer()),
      );
    }

    void _handleBurgerSelection(Burger burger, OrderVM orderVM) {
      orderVM.savePredefinedBurger(burger);
    }

    return Consumer<OrderVM>(
      builder: (context, orderVM, child) {
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            title: Text(AppStrings.appName),
          ),
          bottomNavigationBar: BottomBarWidget(
            burgerCount: orderVM.order?.burgers.length ?? 0,
            amount: 2, // Update this based on actual amount
            onOrderPressed: () {
              // This is the onSuccess lambda that gets called when the order is created
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BurgerOrderV()),
              );
            },
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _handleCustomizePressed(context, orderVM),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                  ),
                  child: const Text('Customize', style: AppStyles.button),
                ),
                const SizedBox(height: 20), // Space between the buttons
                orderVM.predefinedBurgers.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: orderVM.predefinedBurgers.length,
                        itemBuilder: (context, index) {
                          final burger = orderVM.predefinedBurgers[index];
                          return Column(// Wrap each item in a Column
                              children: [
                            SizedBox(height: 10.0),
                            SizedBox(
                              width: MediaQuery.of(context).size.width /
                                  4, // Adjust width as needed
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomBurgerButton(
                                    burger: burger,
                                    onPressed: () =>
                                        _handleBurgerSelection(burger, orderVM),
                                  ),
                                ],
                              ),
                            ),
                          ]);
                        },
                      )
                    : const Text('No burgers available'),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomBurgerButton extends StatelessWidget {
  final Burger burger;
  final VoidCallback onPressed;

  const CustomBurgerButton({
    required this.burger,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      ),
      child: Row(
        children: [
          if (burger.image != null)
            Image.network(
              burger.image ?? "",
              width: 50,
              height: 50,
            ),
          const SizedBox(width: 10),
          Text(burger.name, style: AppStyles.button),
        ],
      ),
    );
  }
}
