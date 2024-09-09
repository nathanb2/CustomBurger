import 'package:your_lunch/model/Burger.dart';
import 'package:your_lunch/model/Order.dart';

import '../service/BurgerService.dart';
import '../service/OrderService.dart';

class OrderRepo{


  final OrderService _orderService = OrderService();

  Future<Order> createOrder(Order orderParam) async {
    try {
      final order = await _orderService.createOrder(orderParam);
      if (order != null) {
        return order;
      }else{
        throw Exception('createOrder error');
      }
    } catch (e) {
      // Handle error or rethrow
      throw Exception('Failed to createOrder: $e');
    }
  }

  Future<Order> loadOrder() async{
    try {
      final order = await _orderService.loadOrder();
      if (order != null) {
        return order;
      }else{
        throw Exception('loadOrder error');
      }
    } catch (e) {
      // Handle error or rethrow
      throw Exception('Failed to loadOrder: $e');
    }
  }

  void clearOrder() {
    _orderService.clearOrder();
  }
}