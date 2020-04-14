import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:story_view/story_controller.dart';
import 'package:story_view/story_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryView(
        [
          StoryItem.text('Lala Story', Colors.deepOrange),
          StoryItem.pageImage(CachedNetworkImageProvider(
              'https://i.pinimg.com/474x/a5/1d/4c/a51d4c678651f73cca108a0d1fe263eb.jpg')),
          StoryItem.inlineImage(CachedNetworkImageProvider(
              'https://miro.medium.com/max/4000/1*LzlOI-NGS-xrPsSk3o1IFw.jpeg')),
          StoryItem.inlineImage(CachedNetworkImageProvider(
              'https://i.pinimg.com/originals/d8/cb/73/d8cb7349c00cff94773e16cda529494f.jpg')),
          StoryItem.pageVideo('https://youtu.be/wLtiLCNnbto',
              controller: storyController)
        ],
        progressPosition: ProgressPosition.bottom,
        repeat: true,
      ),
    );
  }
}
