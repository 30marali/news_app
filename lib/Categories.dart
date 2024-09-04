import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/category_item.dart';
import 'package:news_app/category_model.dart';

class CategoryTab extends StatelessWidget {
//  Function onClick;


  CategoryTab({super.key});

  List<CategoryModel> allCategories = CategoryModel.getCategories();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 15,
          ),
          Text(
            textAlign: TextAlign.start ,
            "Pick your category\nof interest",
            style: TextStyle(fontSize: 30,
            fontWeight: FontWeight.bold,
              color: Color(0xff4F5A69)
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: GridView.builder(
              itemBuilder: (context, index) {
                return CategoryItem(
                  model: allCategories[index],
                  isOdd: index.isOdd,
                );
              },
              itemCount: allCategories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12),
            ),
          )
        ],
      ),
    );
  }
}

//InkWell(
//                   onTap: () {
//                     onClick(allCategories[index]);
//                   }
