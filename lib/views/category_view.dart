import 'package:flutter/material.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/widgets/news_list_view_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.q});
  final String q;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //background شفافة
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                q,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  //عشان الخط يبقى اوضح
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ' News',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: CustomScrollView(
          slivers: [
            NewsListViewBuilder(
              q: q,
            ),
          ],
        ),
      ),
    );
  }
}
