import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:agri_guard/models/scan_model.dart';

class HistoryDetailPage extends StatelessWidget {
  final ScanDetails scanData;

  const HistoryDetailPage({super.key, required this.scanData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            CachedNetworkImage(
              imageUrl: scanData.imageUrl,
              height: 256,
              width: 256,
            ),
            const SizedBox(height: 16),
            Text(
              scanData.diagnosedLabel,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Diagnose Percentage: ${scanData.diagnosePercentage}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Recommendations: ${scanData.suggestions}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
