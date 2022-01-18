import 'package:flutter/material.dart';
import 'package:flutter_2022_learn/widge/TextLearnDemo.dart';
import 'package:flutter_2022_learn/widge/Login.dart';
import 'package:flutter_2022_learn/widge/routeSetMain.dart';
import 'package:flutter_2022_learn/widge/ColumnAndRow.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 隐藏debug
      // home: HomePage(),
      // home: LoginPageDemo(),
      routes: {
        // 统一设置路由 调用
        "/": (context) => RouteLogin(),
        "RouteNextLogin": (context) => RouteNextLogin(),
        "ColumnAndRow": (context) => ColumnAndRow(),
        "WrapLayout": (context) => WrapLayout(),
        "TabTitleListDemo": (context) => TabTitleListDemo(),
        "TabBarListScrollView": (context) => TabBarListScrollView()
      },
      theme: ThemeData(primarySwatch: Colors.yellow), // 修改主题颜色
      // darkTheme: ThemeData(
      //     brightness: Brightness.dark, primarySwatch: Colors.deepPurple),
      initialRoute: "TabBarListScrollView",
      // initialRoute: "WrapLayout",
    );
  }
}

class HomePage extends StatelessWidget {
  // const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("2022Learn"),
        // centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.red),
        titleSpacing: 20.0,
      ),
      // body: AddNum(),
      body: TextLearnDemo(),
    );
  }
}

class AddNum extends StatefulWidget {
  const AddNum({Key? key}) : super(key: key);

  @override
  _AddNumState createState() => _AddNumState();
}

class _AddNumState extends State<AddNum> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    // return Row();
    return Column(
      children: [
        Text("$count"),
        // RaisedButton(onPressed: onPressed)
        // ElevatedButton
        ElevatedButton(
            onPressed: () {
              setState(() {
                count++;
              });
            },
            child: Text("点击"))
      ],
    );
  }
}
