import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AudioPlayer audioPlayer = AudioPlayer();
  double _volume = 0.5;

  void _playOnline() async {
    await audioPlayer.setSourceUrl(
      "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3",
    );
    await audioPlayer.resume();
  }

  void _play() async {
    audioPlayer.setVolume(_volume);
    await audioPlayer.play(
      AssetSource("audios/musica.mp3"),
    );
  }

  void _pause() async {
    await audioPlayer.pause();
  }

  void _stop() async {
    await audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Executando Sons"),
      ),
      body: Column(
        children: [
          Slider(
            value: _volume,
            min: 0,
            max: 1,
            onChanged: (novoVolume){
              setState(() {
                _volume = novoVolume;
              });
              audioPlayer.setVolume(novoVolume);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Image.asset("assets/images/executar.png"),
                  onTap: () => _play(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Image.asset("assets/images/pausar.png"),
                  onTap: () => _pause(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Image.asset("assets/images/parar.png"),
                  onTap: () => _stop(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
