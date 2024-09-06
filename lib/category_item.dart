import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/category_model.dart';

class CategoryItem extends StatelessWidget {

  CategoryModel model;
  bool isOdd;

  CategoryItem({required this.model, required this.isOdd, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: model.color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
              bottomLeft: isOdd ? Radius.circular(28) : Radius.zero,
              bottomRight: !isOdd ? Radius.circular(28) : Radius.zero)),
      child: Column(
        children: [
          Expanded(child: Image.asset(model.image)),
          Container(
            margin: EdgeInsets.only(bottom: 18),
            child: Text(
              model.name,
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }
}