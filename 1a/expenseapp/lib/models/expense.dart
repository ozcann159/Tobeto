import 'package:expenseapp/pages/expense_list.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


enum Category {food, education, travel, work}

const categoryIcons = {
  Category.food: Icons.food_bank,
  Category.education : Icons.cast_for_education,
  Category.travel : Icons.car_rental,
  Category.work: Icons.business
};

const uuid = Uuid();

class Expense {
  Expense({required this.name, required this.price, required this.date, required this.category})
      : id = uuid.v4();

//Ctor' da bir değeri almak yerine değer atamak

  final String id;
  final String name;
  final double price;
  final DateTime date;
  final Category category;

  //getter method => bir değişken gibi davranır
  //setter method => bir değişkenin değerini değiştiren method

  String get getFormattedDate{
    var formatter = DateFormat.yMd();
    return formatter.format(date);
  }

}

//848569cb-3657-4e9c-8b25-6e8720566b01, Yemek, 50
//d6ea1a2d-0a2c-4147-b412-b46e8f1e75c8, Yemek, 50
//7cc8a366-2012-4e79-b9e3-598b96f5de57, Yemek, 50