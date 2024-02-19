import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebView Links',
      theme: ThemeData(
        primaryColor: const Color(0xFF552448),
        // If you want to use Material 3 and colorScheme, then:
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF552448),
          secondary: const Color(0xFFeae3d4),
        ),
      ),
      home: const MyHomePage(title: 'VP & Broker-Manager Michele DiBenedetto'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: <Widget>[
          _linkButton(context, 'MicheleDiBenedetto.net',
              'https://micheledibenedetto.net/'),
          _linkButton(context, 'Berkshire Hathaway HomeServices Profile',
              'https://www.bhhs.com/fox-and-roach-realtors-pa301/morristown/michele-dibenedetto/cid-145868'),
          _linkButton(context, 'Fox & Roach Profile',
              'https://micheledibenedetto.foxandroach.com/'),
          _linkButton(context, 'Realtor.com Profile',
              'https://www.realtor.com/realestateagents/56bc2ad17e54f7010021c5eb'),
          _linkButton(context, 'Zillow Profile',
              'https://www.zillow.com/profile/Michele%20DiBenedetto'),
        ],
      ),
    );
  }

  Widget _linkButton(BuildContext context, String title, String url) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: const Color(0xFF552448), onPrimary: const Color(0xFFeae3d4)),
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WebViewScreen(url: url, title: title))),
      child: Text(title),
    );
  }
}

class WebViewScreen extends StatelessWidget {
  final String url;
  final String title;

  const WebViewScreen({super.key, required this.url, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
