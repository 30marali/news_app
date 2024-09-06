import 'package:flutter/material.dart';

class DrawerTab extends StatelessWidget {
  Function onClick;
  static const int CATEGORY_ID = 1;
  static const int SETTINGS_ID = 2;

   DrawerTab({required this.onClick,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .2,
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Center(
                child: Text(
              "News App!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.widgets)),
                InkWell(
                  onTap: () {
                    onClick(CATEGORY_ID);
                  },
                  child: Text(
                    "Categories",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
              InkWell(
                onTap: () {
                  onClick(SETTINGS_ID);
                },
                child: Text(
                  "Settings",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
