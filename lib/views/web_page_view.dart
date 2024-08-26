import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPageView extends StatefulWidget {
  final String url;
  const WebPageView({super.key, required this.url});

  @override
  State<WebPageView> createState() => _WebPageViewState();
}

class _WebPageViewState extends State<WebPageView> {
  var isLoading = 0;
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            isLoading = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            isLoading = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            isLoading = 100;
          });
        },
      ))
      ..loadRequest(WebUri(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
        title: Container(
          alignment: Alignment.center,
          child: Text(
            widget.url,
            overflow: TextOverflow.ellipsis,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xffEEE3EB),
          ),
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
          if (isLoading < 100)
            LinearProgressIndicator(
              value: isLoading / 100,
            ),
        ],
      ),
    );
  }
}
