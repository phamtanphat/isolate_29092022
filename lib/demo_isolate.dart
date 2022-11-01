import 'dart:isolate';
import 'package:flutter/material.dart';
class DemoIsolatePage extends StatefulWidget {

  @override
  State<DemoIsolatePage> createState() => _DemoIsolatePageState();
}

class _DemoIsolatePageState extends State<DemoIsolatePage> {

  // Future getCount() {
  //   return compute(doSomething, 0);
  // }

  Future getCount() {
    ReceivePort port = ReceivePort();
    Isolate.spawn(doSomething, port.sendPort);
    return port.first;
  }

  static void doSomething(SendPort sendPort) {
    int count = 0;
    for (int i = 0; i < 100000; i++) {
      count += i;
    }
    sendPort.send(count);
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
