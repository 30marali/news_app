import 'package:flutter/material.dart';
import 'package:news_app/api_manager.dart';
import 'package:news_app/news_item.dart';
import 'package:news_app/tab_item.dart';

class TabBarWidget extends StatefulWidget {
  String id;

  TabBarWidget({required this.id, super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(widget.id),
      builder: (context, snapchot) {
        if (snapchot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapchot.hasError) {
          return Text("Something went wrong!");
        }

        var sources = snapchot.data?.sources ?? [];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DefaultTabController(
                  length: sources.length,
                  child: TabBar(
                      isScrollable: true,
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.transparent,
                      onTap: (value) {
                        selectedTabIndex = value;
                        setState(() {});
                      },
                      tabs: sources
                          .map((e) => TabItem(
                                source: e,
                                isSelected:
                                    sources.elementAt(selectedTabIndex) == e,
                              ))
                          .toList())),
              SizedBox(
                height: 5,
              ),
              FutureBuilder(
                  future: ApiManager.getNewsData(
                      sources[selectedTabIndex].id ?? ""),
                  builder: (context, snapchot) {
                    if (snapchot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapchot.hasError) {
                      return Text("Something went wrong!");
                    }

                    var articles = snapchot.data?.articles ?? [];
                    return Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          height: 15,
                        ),
                        itemBuilder: (context, index) {
                          return NewsItem(articles: articles[index]);
                        },
                        itemCount: articles.length,
                      ),
                    );
                  })
            ],
          ),
        );
      },
    );
  }
}
