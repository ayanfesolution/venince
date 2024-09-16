import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:vinance/core/utils/my_color.dart';

import '../../../../../core/route/route.dart';
import '../../../../../core/utils/my_strings.dart';
import '../../../../../core/utils/url_container.dart';
import '../../../../components/snack_bar/show_custom_snackbar.dart';

class DepositAppWebViewWidget extends StatefulWidget {
  const DepositAppWebViewWidget({super.key, required this.url});

  final String url;

  @override
  State<DepositAppWebViewWidget> createState() =>
      _DepositAppWebViewWidgetState();
}

class _DepositAppWebViewWidgetState extends State<DepositAppWebViewWidget> {
  late WebViewController _webViewController;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // // Enable hybrid composition on Android
    // if (Platform.isAndroid) {
    //   WebView.platform = SurfaceAndroidWebView();
    // }

    // Initialize WebViewController
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });

            // Handle specific URLs
            if (url == '${UrlContainer.domainUrl}/user/deposit/history') {
              Get.offAndToNamed(RouteHelper.dashboardScreen);
              CustomSnackBar.success(
                successList: [MyStrings.depositSuccessful],
              );
            } else if (url == '${UrlContainer.domainUrl}/user/deposit' ||
                url == '${UrlContainer.domainUrl}/user/dashboard') {
              Get.back();
              CustomSnackBar.error(errorList: [MyStrings.requestFail]);
            }
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onHttpError: (HttpResponseError error) {
            // Handle HTTP error
            print('HTTP Error: ${error.response?.statusCode}');
            CustomSnackBar.error(
              errorList: [MyStrings.requestFail],
            );
          },
          // Uncomment if needed
          // onWebResourceError: (WebResourceError error) {
          //   print('Web Resource Error: ${error.description}');
          // },
          // onNavigationRequest: (NavigationRequest request) {
          //   if (request.url.startsWith('example.com')) {
          //     return NavigationDecision.prevent;
          //   }
          //   return NavigationDecision.navigate;
          // },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(title: const Text('Deposit')),
      body: Stack(
        children: [
          isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: MyColor.getPrimaryTextColor(),
                  ),
                )
              : const SizedBox(),
          WebViewWidget(controller: _webViewController),
          // Uncomment if needed
          // Positioned(
          //   bottom: 20,
          //   right: 20,
          //   child: FloatingActionButton(
          //     onPressed: () => _webViewController.reload(),
          //     child: Icon(Icons.refresh),
          //   ),
          // ),
        ],
      ),
    );
  }
}
