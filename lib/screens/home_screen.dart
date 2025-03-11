import 'package:flutter/material.dart';
import 'dart:math';
import '../models/surah.dart';
import '../models/doa.dart';
import '../services/api_service.dart';
import '../widgets/surah_card.dart';
import '../widgets/doa_slider.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  List<Surah> _randomSurahs = [];
  List<Doa> _doas = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final surahs = await _apiService.getSurahs();
      final doas = await _apiService.getDoas();

      // Get 5 random surahs
      final random = Random();
      final List<Surah> randomSurahs = [];
      final List<int> selectedIndices = [];

      while (randomSurahs.length < 5 && randomSurahs.length < surahs.length) {
        final index = random.nextInt(surahs.length);
        if (!selectedIndices.contains(index)) {
          selectedIndices.add(index);
          randomSurahs.add(surahs[index]);
        }
      }

      if (mounted) {
        setState(() {
          _randomSurahs = randomSurahs;
          _doas = doas;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'QuranMe',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadData,
        child:
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Doa Slider
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: DoaSlider(doas: _doas),
                      ),

                      // Random Surahs
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Surah Acak',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _randomSurahs.length,
                        itemBuilder: (context, index) {
                          return SurahCard(surah: _randomSurahs[index]);
                        },
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}
