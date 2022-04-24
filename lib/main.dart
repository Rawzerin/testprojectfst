import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


    late WebViewController _controller;

   _getBack()async{
     if(await _controller.canGoBack())
     {
       await _controller.goBack();
     }
   }

   _getForward()async{
     if(await _controller.canGoForward())
     {
       await _controller.goForward();
     }
   }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Webview App'),
        actions: [
          IconButton(icon: Icon(Icons.arrow_back), onPressed: _getBack,),
          IconButton(icon: Icon(Icons.arrow_forward), onPressed: _getForward,),
          ],

      ),
      body: SafeArea(
        child: WebView(
          initialUrl:'https://ice.aiub.edu/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webviewcontroller){
            _controller ;webviewcontroller;
          },
        )
      ),



      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// class _controller {
// }
//
// // class _controller {
// // }
