import 'package:your_lunch/model/Order.dart';
import 'package:your_lunch/service/BaseService.dart';
import 'package:your_lunch/service/DummyDB.dart';

class OrderService extends BaseService{

  createOrder(Order order) {
    return DummyDB().createOrder(order);
  }

  Order? loadOrder() {
    return DummyDB().order;
  }

  void clearOrder() {
    DummyDB().resetOrder();
  }


}