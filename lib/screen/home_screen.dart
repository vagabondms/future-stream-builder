import 'package:flutter/material.dart';
import 'package:futurebuilder/screen/states/stream_builder_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() {
    /// StreamBuilderExample
    return StreamBuilderState();

    ///  FutureBuilder example
    // return FutureBuilderState();
  }
}
