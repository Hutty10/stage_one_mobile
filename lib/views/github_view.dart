import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class GitHubView extends StatefulWidget {
  const GitHubView({super.key});

  @override
  State<GitHubView> createState() => _GitHubViewState();
}

class _GitHubViewState extends State<GitHubView> {
  late InAppWebViewController _controller;
  double _progress = 0;
  bool isLoading = true;
  String? title = 'Loading...';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final bool isLastPage = await _controller.canGoBack();
        if (isLastPage) {
          _controller.goBack();
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: Navigator.of(context).pop,
            icon: const Icon(Icons.close),
          ),
          title: Text('$title'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse('https://github.com/hutty10'),
              ),
              onWebViewCreated: (InAppWebViewController controller) =>
                  _controller = controller,
              onProgressChanged: (controller, progress) => setState(
                () {
                  _progress = progress / 100;
                },
              ),
              onLoadStart: (controller, url) => setState(
                () {
                  isLoading = true;
                },
              ),
              onLoadStop: (controller, url) => setState(
                () async {
                  isLoading = false;
                  final tt = await controller.getTitle();
                  title = tt?.split(' ').first;
                },
              ),
            ),
            _progress < 1
                ? LinearProgressIndicator(
                    value: _progress,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
