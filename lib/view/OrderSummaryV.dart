import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_lunch/view/OrderValidationV.dart';
import 'package:your_lunch/viewModel/OrderVM.dart';
import 'AppBar.dart';

class BurgerOrderV extends StatelessWidget {
  const BurgerOrderV({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderVM>(builder: (context, orderVM, child) {
      return Scaffold(
        appBar: CustomAppBar(),
        body: Padding(
          padding: EdgeInsets.all(24.0), // Adjust padding as desired
          child: Column(
            children: [
              if (orderVM.order?.burgers.isNotEmpty ?? false) // Check for burgers
                Expanded(
                  child: ListView.builder(
                    itemCount: orderVM.order?.burgers.length ?? 0,
                    itemBuilder: (context, index) {
                      final burger = orderVM.order?.burgers[index];
                      return ExpansionTile(
                        title: Text(burger?.name ?? "Customized"),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Weight: ${burger?.steack?.weight}g'),
                                Text(
                                  'Cook Level: ${burger?.cookLevel?.name}',
                                ),
                                Text(
                                  'Toppings: ${burger?.toppings?.map((t) => t.name).join(", ") ?? "None"}',
                                ),
                                Text(
                                  'Sauces: ${burger?.sauces?.map((s) => s.name).join(", ") ?? "None"}',
                                ),
                                Text(
                                  'Sauce Inside: ${burger?.sauceInside == true ? "Yes" : "No"}',
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                      onPressed: () {
                        // Handle order submission
                        // You might need to add a function to OrderVM for submitting orders
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OrderValidationV()),
                      );
                  },
                  child: Text('Place Order'),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}