import 'package:flutter/material.dart';
import 'package:newsapp/models/articles_model.dart';
import 'package:newsapp/services/news_service.dart';
import 'package:newsapp/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.q});
  final String q;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilder();
}

var future;

class _NewsListViewBuilder extends State<NewsListViewBuilder> {
  @override
  void initState() {
    super.initState();
    future = NewsService().getTopHeadLines(q: widget.q);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListView(articles: snapshot.data!);
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
              child: Text('oops there was an error , try later'),
            );
          } else {
            //هنا بقدر اخلي ال loading indictor في نص الشاشة من كل الاتجاهات
            return SliverFillViewport(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
        });
  }
}
