import 'package:flutter/material.dart';
import 'package:news_app/NewsData.dart';

class NewsItem extends StatelessWidget {
  NewsItem({required this.articles, super.key});

  Articles articles;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      color: Colors.white54,
      margin: EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.network(
                  articles.urlToImage ?? "",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                articles.author ?? "",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                articles.title ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                articles.description ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                textAlign: TextAlign.end,
                articles.publishedAt ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
