import 'package:your_lunch/model/Element.dart';
import 'package:your_lunch/model/Steack.dart';
import 'package:your_lunch/service/DummyDB.dart';

class Ingredients{
  List<Steack>? steacks;
  List<Element>? cookLevels;
  List<Element>? toppings;
  List<Element>? sauces;

  // Constructor
  Ingredients({
    this.steacks,
    this.cookLevels,
    this.toppings,
    this.sauces,
  });

  Ingredients generateDummy() {
    this.steacks = [];
    this.steacks?.add(Steack(id: 1, name: "150", weight: 150));
    this.steacks?.add(Steack(id: 2, name: "200", weight: 200));
    this.steacks?.add(Steack(id: 3, name: "300", weight: 300));
    
    this.toppings = [];
    this.toppings?.add(Element(id:4, name:"concober"));
    this.toppings?.add(Element(id:5, name:"tomatos"));
    this.toppings?.add(Element(id:6, name:"mushrooms"));
    this.toppings?.add(Element(id:7, name:"oignon"));
    this.toppings?.add(Element(id:8, name:"fried oignon"));
    this.toppings?.add(Element(id:9, name:"egg"));

    this.cookLevels = [];
    this.cookLevels?.add(Element(id:10, name:"Low"));
    this.cookLevels?.add(Element(id:11, name:"Medium"));
    this.cookLevels?.add(Element(id:12, name:"Hard"));

    this.sauces = [];
    this.sauces?.add(Element(id:13, name:"ketchup"));
    this.sauces?.add(Element(id:14, name:"mayonaise"));
    this.sauces?.add(Element(id:15, name:"mustard"));
    this.sauces?.add(Element(id:16, name:"barbecue"));

    return this;
  }
}