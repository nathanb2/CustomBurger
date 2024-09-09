import 'package:flutter/material.dart';

abstract class CrudViewModel<T> extends ChangeNotifier {
  List<T> items = [];
  String errorMessage = '';
  bool isLoading = false;

  Future<void> loadItems();
  Future<void> createItem(T item);
  Future<void> updateItem(String id, T updatedItem);
  Future<void> deleteItem(String id);
}