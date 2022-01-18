import 'package:flutter/material.dart';
import 'package:flutter_2022_learn/widge/ColumnAndRow.dart';

class BottomTabBarDemo extends StatefulWidget {
  // const BottomTabBarDemo({Key? key}) : super(key: key);
  List<Widget> widgets = [FlutterView(), AndroidViewOne(), IOSView()];

  @override
  _BottomTabBarDemoState createState() => _BottomTabBarDemoState();
}

class _BottomTabBarDemoState extends State<BottomTabBarDemo> {
  int _selectTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("底部TabBar"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: "Work")
        ],
        currentIndex: _selectTabIndex,
        // onTap: (v) {
        //   setState(() {
        //     _selectTabIndex = v;
        //   });
        // },
        onTap: _onTapBottomSelectIndex, // 和上面的效果一样
      ),
      body: widget.widgets[_selectTabIndex],
    );
  }

  void _onTapBottomSelectIndex(int v) {
    setState(() {
      _selectTabIndex = v;
    });
  }
}

class BottomAppBarDemo extends StatefulWidget {
  const BottomAppBarDemo({Key? key}) : super(key: key);

  @override
  _BottomAppBarDemoState createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo> {
  int _selectBarIndex = 0;
  List titles = ["Home", "Discover", "Message", "My"];

  List normalImgUrls = [
    "images/home_normal.png",
    "images/discover_normal.png",
    "images/message_normal.png",
    "images/my_normal.png"
  ];
  List selectedImgUrls = [
    "images/home_normal_select.png",
    "images/discover_normal_select.png",
    "images/message_normal_select.png",
    "images/my_normal_select.png"
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectBarIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width / 5; // 屏幕宽
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomAppBar"),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 49,
              width: itemWidth,
              child: _bottomAppBarItem(0),
            ),
            SizedBox(
              height: 49,
              width: itemWidth,
              child: _bottomAppBarItem(1),
            ),
            SizedBox(
              height: 49,
              width: itemWidth,
            ),
            SizedBox(
              height: 49,
              width: itemWidth,
              child: _bottomAppBarItem(2),
            ),
            SizedBox(
              height: 49,
              width: itemWidth,
              child: _bottomAppBarItem(3),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("点击+");
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _bottomAppBarItem(int index) {
    TextStyle style = TextStyle(fontSize: 12.0, color: Colors.black);
    String ImgUrl = normalImgUrls[index];
    if (_selectBarIndex == index) {
      style = TextStyle(fontSize: 12.0, color: Colors.yellow);
      ImgUrl = selectedImgUrls[index];
    }
    Widget item = Container(
      child: GestureDetector(
        child: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            Image.asset(
              ImgUrl,
              width: 25,
              height: 25,
            ),
            // Image.network(
            //   ImgUrl,
            //   width: 25,
            //   height: 25,
            // ),
            Text(
              titles[index],
              style: style,
            )
          ],
        ),
        onTap: () {
          if (_selectBarIndex != index) {
            // 不是同一个
            setState(() {
              _selectBarIndex = index;
            });
          }
        },
      ),
    );
    return item;
  }
}
