import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryModel {
  final IconData icon;
  final String title;
  final String lastMessage;

  CategoryModel({this.icon, this.title, this.lastMessage = ''});
}

final categories = [
  CategoryModel(icon: FontAwesomeIcons.baseballBall, title: 'כתבי ספורט'),
  CategoryModel(icon: FontAwesomeIcons.microphone, title: 'זמרים מזרחיים'),
  CategoryModel(icon: FontAwesomeIcons.tv, title: 'בידור'),
  CategoryModel(icon: FontAwesomeIcons.car, title: 'רכבים'),
  CategoryModel(icon: FontAwesomeIcons.carCrash, title: 'כתבי ספורט'),
  CategoryModel(icon: FontAwesomeIcons.caretSquareUp, title: 'זמרים מזרחיים'),
  CategoryModel(icon: FontAwesomeIcons.cat, title: 'בידור'),
  CategoryModel(icon: FontAwesomeIcons.chevronLeft, title: 'רכבים'),
];
