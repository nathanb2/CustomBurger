import 'package:your_lunch/model/Burger.dart';
import 'package:your_lunch/model/Ingredients.dart';
import 'package:your_lunch/service/BaseService.dart';
import 'package:your_lunch/service/DummyDB.dart';

class BurgerService extends BaseService{

  List<Burger>? getPredefinedBurgers() {
    return DummyDB().getPredefinedBurgers();
  }

  Ingredients? getIngredients() {
    return DummyDB().DUMMY_INGREDIENTS;
  }
}