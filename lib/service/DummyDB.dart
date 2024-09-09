import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_lunch/model/Element.dart';
import 'package:your_lunch/model/Ingredients.dart';
import 'package:your_lunch/model/User.dart';
import 'package:your_lunch/model/request/SignInRequest.dart';
import '../model/Burger.dart';
import '../model/Order.dart';

class DummyDB {
  User DUMMY_USER = User(
      userId: 1,
      firstName: "Nathan",
      email: "ndb994@gmail.com",
      password: "1234",
      phone: "0509808032");
  Ingredients? DUMMY_INGREDIENTS;
  List<Burger>? DUMMY_BURGERS;
  Order? _order;
  User? _user;

  // Private constructor
  DummyDB._internal() {
    print('Creating DummyDB instance');
    DUMMY_INGREDIENTS = Ingredients().generateDummy();
    DUMMY_BURGERS = generateBurgers(DUMMY_INGREDIENTS!);
  }

  // Static private instance
  static final DummyDB _instance = DummyDB._internal();

  // Factory constructor to return the single instance
  factory DummyDB() => _instance;

  Order? get order => _order;

  // Method to get all burgers
  List<Burger>? getAllBurgers() {
    return _order?.burgers;
  }

  // Method to create an order
  Order? createOrder(Order order) {
    _order = order;
    _order?.userId = _user?.userId;
    _order?.status = Status.Edit;
    _order?.lastStatusUpdate = DateTime.now();
    return _order;
  }

  // Method to clear all orders (for resetting the state)
  void resetOrder() {
    _order = null;
    resetUser();
  }

  Future<void> resetUser() async {
    _user = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('userId', -1);
  }

  User? signIn(SignInRequest request) {
    if (request.email == DUMMY_USER.email &&
        request.password == DUMMY_USER.password) {
      _user = DUMMY_USER;
      _user?.token = generateToken(10);
      return _user;
    } else {
      return null;
    }
  }

  String generateToken(int length) {
    const characters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    return List.generate(
            length, (index) => characters[random.nextInt(characters.length)])
        .join();
  }

  List<Burger> generateBurgers(Ingredients dummyIngredients) {
    List<Burger> burgers = [];

    // Check if ingredients are properly initialized
    if (dummyIngredients.steacks == null ||
        dummyIngredients.toppings == null ||
        dummyIngredients.sauces == null) {
      print('Ingredients are not properly initialized.');
      return burgers;
    }

    // Burger 1
    Burger burger1 = Burger(id: 1, name: "The Best");
    burger1.steack = dummyIngredients.steacks![0]; // Use ! to assert non-null
    burger1.sauces = [];
    burger1.cookLevel = dummyIngredients.cookLevels?[0];
    burger1.toppings = [
      dummyIngredients.toppings![0],
      dummyIngredients.toppings![1]
    ]; // Use safe access
    burger1.sauces
        ?.addAll([dummyIngredients.sauces![0], dummyIngredients.sauces![1]]);
    burger1.sauceInside = true;
    burgers.add(burger1);

    // Burger 2
    Burger burger2 = Burger(id: 2, name: "The Chief");
    burger2.steack = dummyIngredients.steacks![2];
    burger2.sauces = [];
    burger2.cookLevel = dummyIngredients.cookLevels?[1];
    burger2.toppings = [
      dummyIngredients.toppings![1],
      dummyIngredients.toppings![2],
      dummyIngredients.toppings![3]
    ];
    burger2.sauces
        ?.addAll([dummyIngredients.sauces![1], dummyIngredients.sauces![2]]);
    burger2.sauceInside = false;
    burgers.add(burger2);

    return burgers;
  }

  List<Burger>? getPredefinedBurgers() {
    return DUMMY_BURGERS;
  }
}
