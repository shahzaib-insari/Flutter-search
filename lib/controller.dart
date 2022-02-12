// ignore_for_file: invalid_use_of_protected_member

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  List<String> foodList = [
    'Orange',
    'Berries',
    'Lemons',
    'Apples',
    'Mangoes',
    'Dates',
    'Avocados',
    'Black Beans',
    'Chickpeas',
    'Pinto beans',
    'White Beans',
    'Green lentils',
    'Split Peas',
    'Rice',
    'Oats',
    'Quinoa',
    'Pasta',
    'Sparkling water',
    'Coconut water',
    'Herbal tea',
    'Kombucha',
    'Almonds',
    'Peannuts',
    'Chia seeds',
    'Flax seeds',
    'Canned tomatoes',
    'Olive oil',
    'Broccoli',
    'Onions',
    'Garlic',
    'Carots',
    'Leafy greens',
    'Meat',
  ];
  RxList<dynamic> _foodListSearch = ["Meat"].obs; //RxList<String>();
  //List<String?> _foodListSearch = [].obs; //RxList<String>();

  final FocusNode _textFocusNode = FocusNode();
  List<dynamic> get foodListSearch => _foodListSearch.value;
  get textFocusNode => _textFocusNode;
  TextEditingController? textEditingController = TextEditingController();

  void updateList(String value) {
    _foodListSearch!.value = foodList
    .where((element) => element.toLowerCase().contains(value.toLowerCase()))
    .toList();
    //update();
    if (textEditingController!.text.isNotEmpty &&
        _foodListSearch!.length == 0) {
      log('foodListSearch length ${_foodListSearch!.length}');
    }
  }
  //error remove kr bhaiii

  @override
  void dispose() {
    _textFocusNode.dispose();
    textEditingController!.dispose();
    super.dispose();
  }
}
