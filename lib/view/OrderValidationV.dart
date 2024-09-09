import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_lunch/viewModel/OrderVM.dart';
import '../AppStrings.dart';

class OrderValidationV extends StatelessWidget {
  const OrderValidationV({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderVM>(builder: (context, orderVM, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.orderValidation),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (orderVM.order?.userId != null)
                _buildLoggedInView(context, orderVM)
              else
                _buildLoginForm(context, orderVM),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildLoggedInView(BuildContext context, OrderVM orderVM) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            AppStrings.loggedInMessage,
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
            orderVM.createOrder(() {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    "/",
                        (route) => false, // Remove all previous routes
                  );
              });
            },
            child: const Text(AppStrings.validate),
          ),
        ],
      ),
    );
  }
  Widget _buildLoginForm(BuildContext context, OrderVM orderVM) {
    final phoneController = TextEditingController();
    final addressController = TextEditingController();

    return Column(
      children: [
        const Text(
          AppStrings.enterDetails,
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: phoneController,
          decoration: const InputDecoration(labelText: AppStrings.phoneNumber),
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: addressController,
          decoration: const InputDecoration(labelText: AppStrings.address),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            orderVM.createOrder(() {
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/",
                (route) => false, // Remove all previous routes
              );
            });
          },
          child: const Text(AppStrings.submit),
        ),
      ],
    );
  }
}
