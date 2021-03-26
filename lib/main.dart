import 'dart:async';

import 'package:classmanage/Screens/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';

import 'utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
enum UniLinksType { string, uri }

class MyHomePage extends StatefulWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  static final RouteObserver<PageRoute> routeObserver =
  RouteObserver<PageRoute>();
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final UniLinksType _type = UniLinksType.string;
  StreamSubscription _sub;
@override
  void initState() {
    super.initState();
    initPlatformState();
  }
  @override
  void dispose() {
    super.dispose();
    if (_sub != null) _sub.cancel();
  }
  Future<void> initPlatformState() async {
    if (_type == UniLinksType.string) {
      await initPlatformStateForStringUniLinks();
    }
  }
  Future<void> initPlatformStateForStringUniLinks() async {
    String initialLink;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      initialLink = await getInitialLink();
      print('initial link: $initialLink');
      if (initialLink != null) {
        print('initialLink--$initialLink');
        //  跳转到指定页面
        schemeJump(context, initialLink);
      }
    } on PlatformException {
      initialLink = 'Failed to get initial link.';
    } on FormatException {
      initialLink = 'Failed to parse the initial link as Uri.';
    }
    // Attach a listener to the links stream
    _sub = getLinksStream().listen((String link) {
      if (!mounted || link == null) return;
      print('link--$link');
      //  跳转到指定页面
      schemeJump(context, link);
    }, onError: (Object err) {
      if (!mounted) return;
    });
  }
  void _incrementCounter() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container()),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
