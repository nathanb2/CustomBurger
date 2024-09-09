import 'package:your_lunch/model/Burger.dart';
import 'package:your_lunch/model/Ingredients.dart';

import '../service/BurgerService.dart';

class BurgerRepo{


  final BurgerService _burgerService = BurgerService();

  Future<List<Burger>> getPredefinedBurgers() async {
    try {
      final burgers = await _burgerService.getPredefinedBurgers();
      if (burgers != null) {
        return burgers;
      }else{
        throw Exception('getPredefinedBurgers error');
      }
    } catch (e) {
      // Handle error or rethrow
      throw Exception('Failed to getPredefinedBurgers: $e');
    }
  }

  Future<Ingredients> getIngredients() async {
    try {
      final ingredients = await _burgerService.getIngredients();
      if (ingredients != null) {
        return ingredients;
      }else{
        throw Exception('getIngredients error');
      }
    } catch (e) {
      // Handle error or rethrow
      throw Exception('Failed to getIngredients: $e');
    }
  }
}