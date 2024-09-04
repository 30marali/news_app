import 'package:flutter/material.dart';
import 'package:news_app/Categories.dart';
import 'package:news_app/api_manager.dart';
import 'package:news_app/tab_bar.dart';
import 'package:news_app/tab_item.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(
              "assets/images/pattern.png",
            ),
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "News App",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(45),
            bottomRight: Radius.circular(45),
          )),
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 30,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 30,
              ),
            )
          ],
        ),
        body: CategoryTab(),
        // body: TabBarWidget(),
      ),
    );
  }
}
