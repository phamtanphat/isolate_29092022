import 'package:flutter/material.dart';
class DemoIsolatePage extends StatefulWidget {

  @override
  State<DemoIsolatePage> createState() => _DemoIsolatePageState();
}

class _DemoIsolatePageState extends State<DemoIsolatePage> {

  void doSomething() {
      int count = 0;
      for (int i = 0; i < 10000000000; i++) {
        count += i;
      }
      print(count);
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
                  doSomething();
                },
                child: Text("Start Isolate")
            )
          ],
        ),
      ),
    );
  }
}
