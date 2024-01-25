import 'package:flutter/material.dart';

class MoodTracker extends StatelessWidget {
  const MoodTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Colors.yellow.shade300,
              Colors.purple.shade100,
              Colors.purple.shade100
            ],
            radius: 1.5,
          ),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'How do you feel today?',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        MoodButton(text: '😄', mood: 'Happy'),
                        SizedBox(width: 10),
                        MoodButton(text: '😔', mood: 'Sad'),
                        SizedBox(width: 10),
                        MoodButton(text: '😡', mood: 'Angry'),
                        SizedBox(width: 10),
                        MoodButton(text: '🙁', mood: 'Upset'),
                        SizedBox(width: 10),
                        MoodButton(text: '😐', mood: 'Fine'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Optional description...',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: MoodHistory(),
            ),
          ],
        ),
      ),
    );
  }
}

class MoodButton extends StatelessWidget {
  final String text;
  final String mood;

  const MoodButton({super.key, required this.text, required this.mood});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle mood selection
        print('You selected $mood');
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 40),
      ),
    );
  }
}

class MoodHistory extends StatelessWidget {
  const MoodHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5, // Replace with actual history length
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          color: Colors.white,
          child: ListTile(
            title: Text('Mood entry $index'),
            subtitle: const Text('Date and time'), // Replace with actual date
          ),
        );
      },
    );
  }
}
