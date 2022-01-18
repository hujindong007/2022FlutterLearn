import 'package:flutter/material.dart';

class RouteLogin extends StatelessWidget {
  const RouteLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("main设置路由"),
      ),
      body: ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamed("RouteNextLogin", arguments: "路由下一个界面123");
          },
          child: Text("登录")),
    );
  }
}

class RouteNextLogin extends StatelessWidget {
  const RouteNextLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.toString()),
      ),
      body: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop("返回上一个界面");
          },
          child: Text("返回")),
    );
  }
}
