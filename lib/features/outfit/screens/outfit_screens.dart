import 'package:flutter/material.dart';

class OutfitScreens extends StatelessWidget {
  const OutfitScreens({super.key});

  @override
  Widget build(BuildContext context) {
    // Data untuk rekomendasi outfit berdasarkan warna kulit
    final List<Map<String, String>> outfitRecommendations = [
      {
        'title': 'Kulit Cerah',
        'description':
            'Cobalah warna pastel seperti baby blue, pink, atau mint.',
        'image': 'assets/images/light_skin_outfit.jpg',
      },
      {
        'title': 'Kulit Medium',
        'description':
            'Warna bumi seperti olive, beige, atau cokelat cocok untuk Anda.',
        'image': 'assets/images/medium_skin_outfit.jpg',
      },
      {
        'title': 'Kulit Gelap',
        'description':
            'Pilih warna terang seperti putih, kuning cerah, atau merah.',
        'image': 'assets/images/dark_skin_outfit.jpg',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rekomendasi Outfit'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.75,
          ),
          itemCount: outfitRecommendations.length,
          itemBuilder: (context, index) {
            final outfit = outfitRecommendations[index];
            return GestureDetector(
              onTap: () => _showDetails(context, outfit),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Image.asset(
                          outfit['image']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            outfit['title']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            outfit['description']!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showDetails(BuildContext context, Map<String, String> outfit) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(outfit['title']!),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  outfit['image']!,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                outfit['description']!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}
