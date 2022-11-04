import 'dart:math';

import 'package:flutter/material.dart';

import '../home_screen.dart';

class FutureBuilderState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder<int>(
              future: getNumber(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting &&
                    (!snapshot.hasData || snapshot.hasError)) {
                  return CircularProgressIndicator();
                }

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

  // 무작위로 50 미만시 에러
  Future<int> getNumber() async {
    print('getNumber starts');
    await Future.delayed(
      Duration(seconds: 3),
    );
    print('getNumber finished');

    final random = Random();
    final number = random.nextInt(100);
    return number > 50 ? number : throw Exception('던지고 싶어서 던진 에러');
  }
}
