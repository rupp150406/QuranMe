import 'package:flutter/material.dart';
import '../models/doa.dart';

class DoaDetailScreen extends StatelessWidget {
  const DoaDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Doa doa = ModalRoute.of(context)!.settings.arguments as Doa;

    return Scaffold(
      appBar: AppBar(title: Text(doa.judul)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Arabic Text
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.green.shade50,
                ),
                child: Text(
                  doa.arab,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
              ),

              const SizedBox(height: 24),

              // Latin Text
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.grey.shade100,
                ),
                child: Text(
                  doa.latin,
                  style: const TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 24),

              // Translation
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Arti:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    doa.terjemah,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
