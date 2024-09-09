import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'Burger.dart'; // Import the Burger class

enum Status { Edit, Payed, Sent }

class Order {
  List<Burger> burgers = [];
  int? userId;
  Status status;
  DateTime? lastStatusUpdate;

  // Constructor
  Order({
    this.userId,
    this.status = Status.Edit,
    this.lastStatusUpdate,
    List<dynamic>? burgers,
  });
}
