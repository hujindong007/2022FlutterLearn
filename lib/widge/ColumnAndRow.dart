import 'dart:developer';

import 'package:flutter/material.dart';

class ColumnAndRow extends StatelessWidget {
  const ColumnAndRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              print("点击home");
            },
            icon: Icon(Icons.home)),
        title: Text("页面布局"),
        titleTextStyle:
            TextStyle(color: Colors.red, backgroundColor: Colors.blue),
        centerTitle: true,
        titleSpacing: 10.0,
        actions: [
          IconButton(
              onPressed: () {
                print("点击左侧第一个按钮");
              },
              icon: Icon(Icons.add)),
          IconButton(
              onPressed: () {
                print("点击左侧第二个按钮");
              },
              icon: Icon(Icons.add))
        ],
        shadowColor: Colors.blue,
      ),
      body: Container(
        color: Colors.yellow,
        // width: 100,
        // height: 350,
        // child: Column(
        //   // column 没有设置宽度的时候 布局以子控件最width的为标准
        //   children: [
        //     Container(
        //       color: Colors.blue,
        //       height: 100,
        //       width: 100,
        //     ),
        //     Container(
        //       color: Colors.red,
        //       height: 100,
        //       width: 150,
        //     ),
        //     Container(
        //       color: Colors.cyan,
        //       height: 100,
        //       width: 100,
        //     )
        //   ],
        // ),
        // child: Row(
        //   // Row布局 当没有设置高度时候，默认是以子控件中最height为标准
        //   //     Key? key,
        //   // MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
        //   // MainAxisSize mainAxisSize = MainAxisSize.max,
        //   // CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
        //   // TextDirection? textDirection,
        //   // VerticalDirection verticalDirection = VerticalDirection.down,
        //   // TextBaseline? textBaseline, // NO DEFAULT: we don't know what the text's baseline should be
        //   // List<Widget> children = const <Widget>[],
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 设置控件水平
        //   mainAxisSize: MainAxisSize.max, // min 根据子控件大小宽度来 max 是屏幕宽 默认是max
        //   crossAxisAlignment: CrossAxisAlignment.center, // 纵向对齐
        //   // verticalDirection: VerticalDirection.up, // 水平
        //   children: [
        //     Container(
        //       color: Colors.red,
        //       height: 100,
        //       width: 100,
        //     ),
        //     ConstrainedBox( // 设置间距box
        //         constraints: BoxConstraints(
        //             minWidth: 10.0, // double.infinity 宽度尽可能大
        //             minHeight: 10.0)),
        //     Container(
        //       color: Colors.orange,
        //       height: 150,
        //       width: 100,
        //     ),
        //     Container(
        //       color: Colors.blue,
        //       height: 100,
        //       width: 100,
        //     ),
        //   ],
        // ),
        child: Flex(
          // 弹性布局
          direction: Axis.vertical,
          children: [
            Expanded(
              child: Container(
                color: Colors.red,
                width: 100,
                height: 100,
              ),
              flex: 2,
            ),
            Expanded(
              child: Container(
                color: Colors.yellow,
                width: 100,
                height: 100,
              ),
              flex: 0,
            ),
            Expanded(
              child: Container(
                color: Colors.blue,
                width: 100,
                height: 100,
              ),
              flex: 0,
            )
          ],
        ),
      ),
    );
  }
}

class WrapLayout extends StatefulWidget {
  const WrapLayout({Key? key}) : super(key: key);

  @override
  _WrapLayoutState createState() => _WrapLayoutState();
}

class _WrapLayoutState extends State<WrapLayout> {
  List<int> li = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 20; i++) {
      li.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 5.0, // 水平间距
      runSpacing: 15.0, //  垂直间距
      alignment: WrapAlignment.spaceEvenly, // 水平布局
      runAlignment: WrapAlignment.spaceEvenly, // 垂直布局
      textDirection: TextDirection.rtl, //文字排列顺序
      // clipBehavior: Clip.antiAlias,
      children: li
          .map((e) => Container(
                color: Colors.yellow,
                height: 100,
                width: 100,
                child: Text(e.toString()),
              ))
          .toList(),
    );
  }
}

// class TabBarControllerPage extends StatefulWidget {
//   const TabBarControllerPage({ Key? key }) : super(key: key);

//   @override
//   _TabBarControllerPageState createState() => _TabBarControllerPageState();
// }

// class _TabBarControllerPageState extends State<TabBarControllerPage>{
//   @override
//   Widget build(BuildContext context) {
//     return Container(

//     );
//   }
// }

class TabTitleListDemo extends StatefulWidget {
  const TabTitleListDemo({Key? key}) : super(key: key);

  @override
  _TabTitleListDemoState createState() => _TabTitleListDemoState();
}

class _TabTitleListDemoState extends State<TabTitleListDemo>
    with SingleTickerProviderStateMixin {
  List tabs = ["Flutter", "Android", "IOS"];
  late TabController _controller;
  int _index = 0;
  @override
  void initState() {
    // 进入页面的时候
    // TODO: implement initState
    _controller = new TabController(
      initialIndex: _index,
      length: tabs.length,
      vsync: this,
    );
    _controller.addListener(() {
      // print("object");
      setState(() {
        _index = _controller.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // 页面销毁的时候
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("标题滑动"),
        bottom: TabBar(
            controller: _controller,
            tabs: tabs
                .map((e) => Tab(
                      text: e,
                    ))
                .toList()),
      ),
      body: Text("标题滑动" + _index.toString()),
    );
  }
}

class TabBarListScrollView extends StatefulWidget {
  // const TabBarListScrollView({Key? key}) : super(key: key);

  List<Widget> widgets = [FlutterView(), AndroidView(), IOSView()];
  @override
  _TabBarListScrollViewState createState() => _TabBarListScrollViewState();
}

class _TabBarListScrollViewState extends State<TabBarListScrollView>
    with SingleTickerProviderStateMixin {
  List tabs = ["Flutter", "Android", "IOS"];
  late TabController _controller;
  int _selectIndex = 1;
  @override
  void initState() {
    // TODO: implement initState
    _controller = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("可以左右滑动标题"),
        bottom: TabBar(
          controller: _controller, // 同一控制器
          tabs: tabs
              .map((e) => Tab(
                    text: e,
                  ))
              .toList(),
          indicatorColor: Colors.red,
          indicatorWeight: 2.0,
        ),
      ),
      drawer: MyDrawDemo(), // 左侧抽屉效果
      bottomNavigationBar: BottomNavigationBar(
        // 底部tabbar
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: "Business"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "School")
        ],
        currentIndex: _selectIndex,
        onTap: _onTapSelectIndexItem,
      ),
      floatingActionButton: FloatingActionButton(
        // 悬浮按钮
        onPressed: _onPressClick,
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      body: TabBarView(
        children: widget.widgets,
        controller: _controller, // 同一控制器
      ),
    );
  }

  void _onTapSelectIndexItem(int index) {
    // 点击底部tabbar
    log("点击底部tabbar");
    setState(() {
      _selectIndex = index;
    });
  }

  void _onPressClick() {
    log("点击悬浮按钮");
  }
}

class FlutterView extends StatelessWidget {
  const FlutterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("滚动到Flutter"),
    );
  }
}

class AndroidView extends StatelessWidget {
  const AndroidView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Android"),
    );
  }
}

class IOSView extends StatelessWidget {
  const IOSView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("IOSView"),
    );
  }
}

class MyDrawDemo extends StatelessWidget {
  const MyDrawDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        // backgroundColor: Colors.cyan,
        child: MediaQuery.removePadding(
            context: context,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(top: 58.0),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: ClipOval(
                        child: Image.asset(
                          "images/imageDemoOne.jpeg",
                          width: 80.0,
                          height: 80.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      "图像",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 0,
              ),
              Expanded(
                  child: ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("第一行"),
                    subtitle: Text("第一行子内容"),
                    onTap: _onTapCellClick,
                    onLongPress: _onLongPressCell,
                  ),
                  ListTile(
                    title: Text("第二行"),
                  )
                ],
              )),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                  child: ListView(
                shrinkWrap: true,
                // const EdgeInsets.fromLTRB(this.left, this.top, this.right, this.bottom);
                // padding: EdgeInsets.fromLTRB(10, 0, 10, 300),
                children: [
                  Text(
                    "连锁酒店了十几分老司机了放假时间地理老师会计分录涉及到会计师sljdljsljfsjdjfsjd山莨菪碱拉设计费老司机了十几分介绍了非结束 是方式是 是是老家法力水晶累进税率",
                    style: TextStyle(backgroundColor: Colors.red),
                  )
                ],
              ))
            ])));
  }

  void _onTapCellClick() {
    log("点击第一行");
  }

  void _onLongPressCell() {
    log("长按第一行cell");
  }
}
