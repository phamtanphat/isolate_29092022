import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class DemoIsolatePage extends StatefulWidget {

  @override
  State<DemoIsolatePage> createState() => _DemoIsolatePageState();
}

class _DemoIsolatePageState extends State<DemoIsolatePage> {

  Future getCount() {
    return compute(doSomething, 0);
  }

  int doSomething(int value) {
      for (int i = 0; i < 10000000000; i++) {
        value += i;
      }
      return value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Isolate"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            ElevatedButton(
                onPressed: (){
                  getCount()
                      .then((value) => print(value));
                },
                child: Text("Start Isolate")
            )
          ],
        ),
      ),
    );
  }
}
