import 'package:your_lunch/model/Element.dart';

class Steack extends Element {
  int? weight;

  Steack({
    required int id,
    required String name,
    required this.weight,
  }) : super(id: id, name: name);
}
