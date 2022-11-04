import 'dart:async';

import 'package:flutter/material.dart';

import '../home_screen.dart';

class StreamBuilderState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder<int>(
              stream: streamNumbers(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      '${snapshot.error}',
                    ),
                  );
                }

                return Center(
                  child: Text(
                    '${snapshot.data}',
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: Text('다시 가져와라'),
            )
          ],
        ),
      ),
    );
  }

  Stream<int> streamNumbers() async* {
    for (int i = 0; i < 100; i++) {
      await Future.delayed(
        const Duration(
          seconds: 1,
        ),
      );
      yield i;
    }
  }
}

class StreamNumber extends Stream {
  @override
  StreamSubscription listen(void Function(dynamic event)? onData,
      {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    // TODO: implement listen
    throw UnimplementedError();
  }
}

