import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storybrain/story_Brain.dart';


class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBrain storyBrain = StoryBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
         gradient: LinearGradient(
           begin: Alignment.bottomCenter,
             end: Alignment.topRight,
             colors: [
           Colors.white,
           Colors.amber,
           Colors.deepPurple,
           Colors.black
         ])
        ),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(

                    storyBrain.getStory(),
                    style: const TextStyle(
                      fontSize: 25.0,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(

                  onPressed: () {

                    setState(() {
                      storyBrain.nextStory(1);
                    });
                  },

                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Center(
                      child: Text(

                        storyBrain.getChoice1(),
                        style: TextStyle(
                          fontSize: 20.0,

                        ),
                      ),
                    ),
                  )
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,

                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: TextButton(
                    onPressed: () {

                      setState(() {
                        storyBrain.nextStory(2);
                      });
                    },

                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: Center(
                        child: Text(

                          storyBrain.getChoice2(),
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white

                          ),
                        ),
                      ),
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
