import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_lunch/viewModel/OrderVM.dart';
import '../AppColors.dart';
import '../AppStrings.dart';
import 'AppBar.dart';
import 'BottomBar.dart';
import 'OrderSummaryV.dart';

class BurgerComposer extends StatelessWidget {
  const BurgerComposer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderVM>(builder: (context, orderVM, child) {
      return Scaffold(
        appBar: CustomAppBar(),
        bottomNavigationBar: BottomBarWidget(
          burgerCount: orderVM.order?.burgers.length ?? 0,
          amount: 2, // Update with actual amount
          onOrderPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BurgerOrderV()),
            );
          },
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cook Level Selection
                Text(
                  AppStrings.selectSteackWeight,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: orderVM.ingredients?.steacks?.map((steack) {
                    return ChoiceChip(
                      avatar: steack.image != null
                          ? Image.network(
                        steack.image!,
                        width: 50,
                        height: 50,
                      )
                          : null, // Display image if available
                      label: Text(steack.name ?? ""),
                      selected:
                      orderVM.currentBurger?.steack?.id == steack.id,
                      onSelected: (bool selected) {
                        if (selected) {
                          orderVM.currentBurger?.steack = steack;
                          orderVM.notifyListeners();
                        }
                      },
                    );
                  }).toList() ?? [],
                ),
                SizedBox(height: 20),
                Text(
                  AppStrings.selectCookLevel,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: orderVM.ingredients?.cookLevels?.map((cookLevel) {
                    return ChoiceChip(
                      label: Text(cookLevel.name ?? ""),
                      selected: orderVM.currentBurger?.cookLevel?.id ==
                          cookLevel.id,
                      onSelected: (bool selected) {
                        if (selected) {
                          orderVM.currentBurger?.cookLevel = cookLevel;
                          orderVM.notifyListeners();
                        }
                      },
                      selectedColor: AppColors.primary,
                      disabledColor: AppColors.secondary,
                    );
                  }).toList() ?? [],
                ),
                SizedBox(height: 20),

                // Toppings Selection (GridView)
                Text(
                  AppStrings.chooseToppings,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  childAspectRatio: 3,
                  children: orderVM.ingredients?.toppings!.map((topping) {
                    return FilterChip(
                      avatar: topping.image != null
                          ? Image.network(
                        topping.image!,
                        width: 50,
                        height: 50,
                      )
                          : null, // Display image if available
                      label: Text(topping.name ?? ""),
                      selected: orderVM.currentBurger?.toppings
                          ?.any((t) => t.id == topping.id) ??
                          false,
                      onSelected: (bool selected) {
                        if (selected) {
                          orderVM.currentBurger?.toppings?.add(topping);
                        } else {
                          orderVM.currentBurger?.toppings
                              ?.removeWhere((t) => t.id == topping.id);
                        }
                        orderVM.notifyListeners();
                      },
                      selectedColor: AppColors.primary,
                      disabledColor: AppColors.secondary,
                    );
                  }).toList() ?? [],
                ),
                SizedBox(height: 20),

                // Sauces Selection (GridView)
                Text(
                  AppStrings.chooseSauces,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  childAspectRatio: 3,
                  children: orderVM.ingredients?.sauces?.map((sauce) {
                    return FilterChip(
                      label: Text(sauce.name ?? ""),
                      selected:
                      orderVM.currentBurger?.sauces?.contains(sauce) ??
                          false,
                      onSelected: (bool selected) {
                        if (selected) {
                          orderVM.currentBurger?.sauces?.add(sauce);
                        } else {
                          orderVM.currentBurger?.sauces?.remove(sauce);
                        }
                        orderVM.notifyListeners();
                      },
                      selectedColor: AppColors.primary,
                      disabledColor: AppColors.secondary,
                    );
                  }).toList() ?? [],
                ),
                SizedBox(height: 20),

                // Sauce Inside/Outside Switch
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.sauceInside,
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Switch(
                      value: orderVM.currentBurger?.sauceInside ?? false,
                      onChanged: (bool value) {
                        orderVM.currentBurger?.sauceInside = value;
                        orderVM.notifyListeners();
                      },
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      orderVM.saveCurrentBurger();
                      Navigator.pop(context);
                    },
                    child: Text(AppStrings.addToOrder),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
