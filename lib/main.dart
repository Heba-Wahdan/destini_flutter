simport 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'storyBrain.dart';

void main() {
  runApp(const DestiniApp());
}

class DestiniApp extends StatelessWidget {
  const DestiniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: StoryPage());
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

StoryBrain storyBrain = StoryBrain();

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      storyBrain.getStoryText(),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                )),
            if (storyBrain.getChoice1().isNotEmpty &&
                storyBrain.getChoice2().isNotEmpty) ...[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          storyBrain.nextStory(1);
                        });
                      },
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.purple),
                      child: Text(
                        storyBrain.getChoice1(),
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          storyBrain.nextStory(2);
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.teal,
                      ),
                      child: Text(
                        storyBrain.getChoice2(),
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
            ],
            if (storyBrain.getChoice1().isEmpty &&
                storyBrain.getChoice2().isEmpty) ...[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          storyBrain.resetStory();
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text(
                        "Restart",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
