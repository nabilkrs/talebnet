import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:webview_flutter/webview_flutter.dart';




class Website extends StatefulWidget {
  final String website;
  Website(this.website);

  @override
  _WebsiteState createState() => _WebsiteState();
}

class _WebsiteState extends State<Website> {

  bool isLoading = true;
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
          children: [
            WebView(
              key: _key,
              javascriptMode: JavascriptMode.unrestricted,
              // initialUrl:'https://www.bing.com/covid/local/tunisia?form=C19ANS',
              initialUrl: widget.website,

              onPageFinished: (finish) {
                setState(() {
                  isLoading = false;
                });
              },
            ),
            isLoading
                ? Center(
                    child: LoadingBouncingGrid.square(
                        backgroundColor: Colors.indigo,
                      
                    ),
                  )
                : Stack(),
          ],
        ),
),
      );

  }
}