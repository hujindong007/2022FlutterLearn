import 'package:flutter/material.dart';

class LoginPageDemo extends StatelessWidget {
  const LoginPageDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: ElevatedButton(
          onPressed: () async {
            var result = await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return MenuPageDemo(
                  title: "菜单标题",
                );
              },
              settings: RouteSettings(
                name: "设置",
                // arguments: "传值到下一个界面",
                arguments: {"name": "Hello"},
              ),
              maintainState: false,
              fullscreenDialog: false, // 设置跳转模式  false 导航模式 true present模式
            ));
            print(result);
          },
          child: Text("登录")),
    );
  }
}

class MenuPageDemo extends StatelessWidget {
  // 可以自己定义一些参数
  final String title; //定义title，设置required 为必传
  const MenuPageDemo({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(title + "   " + arguments.toString()),
      ),
      body: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop("返回传值123");
          },
          child: Text("返回")),
    );
  }
}
