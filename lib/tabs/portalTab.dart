import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class PortalTab extends StatefulWidget {
  const PortalTab({Key? key}) : super(key: key);

  @override
  State<PortalTab> createState() => _PortalTabState();
}

class _PortalTabState extends State<PortalTab> {
  /// TODO: webview of farmers portal
  final String uri = "https://www.india.gov.in/farmers-portal";

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  bool isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    super.initState();
  }

  // void navigateBack(){
  //   _controller.
  // }

  updateLoaded(){
    setState(() {
      isLoaded = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        WebViewController controller = await _controller.future;
        if(await controller.canGoBack()) {
          controller.goBack();
          return false;
        }
        else {
          return true;
        }
      },
      child: Container(
          child: Stack(
            children: [
              Visibility(
                visible: !isLoaded,
                child: Center(child: CircularProgressIndicator()),
              ),
              WebView(
                initialUrl: "https://www.india.gov.in/farmers-portal",
                zoomEnabled: true,
                gestureNavigationEnabled: true,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                  updateLoaded();
                },
              ),
            ],
          )
      ),
    );
  }
}
