import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // function to play notes
  void playSound(String note, int noteNumber) {
    final AudioPlayer player = AudioPlayer();
    player.play(AssetSource('$note$noteNumber.mp3'));
  }

// function to show color tiles
  Expanded showTile(Color color, String note, int noteNumber) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        constraints: const BoxConstraints.expand(),
        child: TextButton(
          onPressed: () {
            playSound(note, noteNumber);
          },
          style: TextButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: Text(
            '${note.toUpperCase()}$noteNumber',
            style: const TextStyle(
              fontSize: 40,
              fontFamily: 'Bookerly',
              fontWeight: FontWeight.bold,
              ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blueGrey[900],
            title: const Text('Xylophone',
                style: TextStyle(
                  color: Colors.white,
                )),
          ),

          //TODO button to randomize colors

          body: SafeArea(
            child: Column(
              children: [
                showTile(Colors.red, 'c', 3),
                showTile(Colors.orange, 'd', 3),
                showTile(Colors.yellow, 'e', 3),
                showTile(Colors.green, 'f', 3),
                showTile(Colors.blue, 'g', 3),
                showTile(Colors.indigo, 'a', 3),
                showTile(Colors.purple, 'b', 3),
                showTile(Colors.grey, 'c', 4),
              ],
            ),
          )),
    );
  }
}
