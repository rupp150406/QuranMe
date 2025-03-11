import 'package:flutter/material.dart';
import '../models/surah.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:audioplayers/audioplayers.dart';

class SurahDetailScreen extends StatefulWidget {
  const SurahDetailScreen({super.key});

  @override
  SurahDetailScreenState createState() => SurahDetailScreenState();
}

class SurahDetailScreenState extends State<SurahDetailScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playAudio(String url) async {
    if (_isPlaying) {
      await _audioPlayer.pause();
      setState(() {
        _isPlaying = false;
      });
    } else {
      await _audioPlayer.play(UrlSource(url));
      setState(() {
        _isPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Surah surah = ModalRoute.of(context)!.settings.arguments as Surah;

    return Scaffold(
      appBar: AppBar(
        title: Text(surah.namaLatin),
        actions: [
          IconButton(
            icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: () => _playAudio(surah.audio),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Center(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.green.shade50,
                  ),
                  child: Column(
                    children: [
                      Text(
                        surah.nama,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        surah.arti,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Jumlah Ayat: ${surah.jumlahAyat} - Diturunkan di: ${surah.tempatTurun}',
                        style: const TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Description Section
              const Text(
                'Deskripsi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Html(
                data: surah.deskripsi,
                style: {
                  "body": Style(
                    fontSize: FontSize(16.0),
                    lineHeight: LineHeight(1.5),
                  ),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
