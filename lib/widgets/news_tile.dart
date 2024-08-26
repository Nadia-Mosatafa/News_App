import 'package:flutter/material.dart';
import 'package:newsapp/models/articles_model.dart';
import 'package:newsapp/views/web_page_view.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //بستخدمها عشان ادي border معين للصورة
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: articleModel.image != null
              ? Image.network(
                  articleModel.image!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : Image.network(
                  'https://th.bing.com/th/id/OIP.yYBFzWZ0R970KK2bJhwO9AHaEi?w=257&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
        ),
        const SizedBox(
          height: 12,
        ),
        GestureDetector(
          onTap: () {
            print(articleModel.url.toString());
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return WebPageView(
                  url: articleModel.url.toString(),
                );
              }),
            );
          },
          child: Text(
            articleModel.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          articleModel.description ?? "",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
/*onTap: () {
            print('url = $articleModel.url');
            /*Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return WebViewPage(url: articleModel.url);
              }),
            );*/
          },*/