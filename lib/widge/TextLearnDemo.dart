import 'dart:developer';
import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextLearnDemo extends StatefulWidget {
  const TextLearnDemo({Key? key}) : super(key: key);

  @override
  _TextLearnDemoState createState() => _TextLearnDemoState();
}

class _TextLearnDemoState extends State<TextLearnDemo> {
  bool _switchSelected = true; //维护单选开关状态
  bool _check = false;
  // bool
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            text: "测试",
            style: TextStyle(color: Colors.red, fontSize: 15),
            children: [
              TextSpan(
                  text: "测试里面One", style: TextStyle(color: Colors.lightBlue))
            ],
          ),
        ),
        Text.rich(
          TextSpan(
              text: "测试1", style: TextStyle(color: Colors.red, fontSize: 15)),
        ),
        Column(
          children: [
            //---------------Button----------------
            ElevatedButton.icon(
              onPressed: () {
                log("点击了波纹按钮");
              },
              icon: Icon(Icons.add),
              label: Text(
                "波纹按钮",
                style:
                    TextStyle(color: Colors.black, backgroundColor: Colors.red),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.red;
                  }
                  return Colors.white;
                }),
                // shadowColor: MaterialStateProperty.all(20),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                log("点击了波纹按钮One");
              },
              icon: Icon(Icons.send_and_archive),
              label: Text("波纹按钮One"),
              style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.cyanAccent,
                  textStyle: TextStyle(
                    color: Colors.cyanAccent,
                    // backgroundColor: Colors.blue
                  )),
            ),
            TextButton.icon(
              onPressed: () {
                log("点击了扁平按钮");
              },
              icon: Icon(Icons.send),
              label: Text("扁平按钮"),
              style: TextButton.styleFrom(
                primary: Colors.red,
              ),
            ),
            OutlinedButton.icon(
                onPressed: () {
                  log("点击了边框按钮");
                },
                icon: Icon(Icons.ac_unit),
                label: Text(
                  "边框按钮",
                  style: TextStyle(color: Colors.amber),
                )),
            //---------------Button----------------

            //---------------Image----------------
            Icon(Icons.add),
            IconButton(
                onPressed: () {
                  log("点击图片");
                },
                icon: Icon(Icons.mail)),
            Image(
              image: AssetImage("images/imageDemoOne.jpeg"),
              width: 200,
              height: 100,
            ),
            Image(
              image: NetworkImage(
                  "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp09%2F210611094Q512b-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1644658582&t=66fce123a4e17bad6c6af5e194725d97"),
              width: 200,
              height: 100,
              alignment: Alignment.center,
              fit: BoxFit.none, // 图片显示方式
            ),
            //---------------Image----------------

            //---------------Switch Checkbox----------------
            Checkbox(
                value: _check,
                onChanged: (value) {
                  setState(() {
                    _check = value!;
                  });
                }),
            Switch(
                value: _switchSelected,
                onChanged: (value) {
                  setState(() {
                    _switchSelected = value;
                  });
                }),
            //---------------Switch Checkbox----------------
            SizedBox(
              height: 5,
            ),
            const CircularProgressIndicator(
              backgroundColor: Colors.red,
              color: Colors.yellow,
              value: .5,
              valueColor: AlwaysStoppedAnimation(Colors.cyan),
            ),
            Row(
              children: [
                SizedBox(
                  height: 5,
                  width: 100,
                  child: LinearProgressIndicator(),
                ),
              ],
            )
          ],
        ),
      ],
    );
    // return Container(
    //   // width: 200, 默认屏幕宽
    //   height: 200,
    //   color: Colors.green,
    //   alignment: AlignmentDirectional.center,
    //   child: Text(
    //     "文本控件" * 10,
    //     textAlign: TextAlign.center,
    //     // maxLines: 2,
    //     style: TextStyle(
    //       color: Colors.amber,
    //       fontSize: 15,
    //       decoration: TextDecoration.underline,
    //       decorationStyle: TextDecorationStyle.wavy,
    //       decorationColor: Colors.red,
    //       // shadows:
    //     ),
    //   ),
    // );
  }
}
