import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_lunch/model/Burger.dart';
import 'package:your_lunch/model/Ingredients.dart';
import 'package:your_lunch/model/Order.dart';
import 'package:your_lunch/service/DummyDB.dart';
import '../repository/BurgerRepo.dart';
import '../repository/OrderRepo.dart';

class OrderVM extends ChangeNotifier {
  final OrderRepo _orderRepository = OrderRepo();
  final BurgerRepo _burgerRepository = BurgerRepo();
  Burger? _currentBurger;
  Order? _order;
  bool _isLoading = false;
  String _errorMessage = "";

  // Merged menu properties
  List<Burger> _predefinedBurgers = [];
  Ingredients? _ingredients;

  List<Burger> get predefinedBurgers => _predefinedBurgers;
  Ingredients? get ingredients => _ingredients;
  Order? get order => _order;
  Burger? get currentBurger => _currentBurger;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  OrderVM() {
    createBurger();
    loadOrder();
    loadBurgers();
    loadIngredients();
  }

  void createBurger() {
    _currentBurger = Burger(id: Random().nextInt(10), name: "customized");
    notifyListeners();
  }

  Future<void> loadBurgers() async {
    _isLoading = true;
    notifyListeners();
    try {
      _predefinedBurgers = await _burgerRepository.getPredefinedBurgers();
      _errorMessage = "";
    } catch (e) {
      _errorMessage = 'Failed to load burgers: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadIngredients() async {
    _isLoading = true;
    notifyListeners();
    try {
      _ingredients = await _burgerRepository.getIngredients();
      _errorMessage = "";
    } catch (e) {
      _errorMessage = 'Failed to load ingredients: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createOrder(void Function() onSuccess) async {
    _isLoading = true;
    notifyListeners();
    try {
      _order = await _orderRepository.createOrder(_order!);
      _errorMessage = "";
      onSuccess();
    } catch (e) {
      _errorMessage = 'Failed to createOrder: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadOrder() async {
    _isLoading = true;
    notifyListeners();
    try {
      _order = await _orderRepository.loadOrder();
      _errorMessage = "";
    } catch (e) {
      _errorMessage = 'Failed to loadOrder: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  startOrder() async {
    _order = Order();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _order?.userId = prefs.getInt('userId');
  }

  saveCurrentBurger() {
    if (_order == null) {
      startOrder();
    }
    _order?.burgers.add(currentBurger!);
    createBurger();
  }

  savePredefinedBurger(Burger burger) {
    if (_order == null) {
      startOrder();
    }
    _order?.burgers.add(burger);
    createBurger();
  }

  void clearOrder() {
    _order = null;
    _currentBurger = null;
    _orderRepository.clearOrder();
  }
}