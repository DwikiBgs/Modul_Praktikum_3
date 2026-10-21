import 'package:flutter/material.dart';

void main() => runApp(const BiodataApp());

class BiodataApp extends StatelessWidget {
  const BiodataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biodata Diri',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const BiodataPage(),
    );
  }
}

class BiodataPage extends StatelessWidget {
  const BiodataPage({super.key});

  // ===== Data biodata (ganti dengan data Anda sendiri) =====
  static const nama = 'Dwiki Bagus Wicaksono';
  static const nim = '241080200045';
  static const prodi = 'Informatika';
  static const semester = 5;
  static const kota = 'Sidoarjo';
  static const email = 'dwiki@example.com';
  static const hobi = ['Membaca', 'Bersepeda', 'Desain'];
  static const keahlian = ['UI Design', 'HTML & CSS'];
  static const deskripsiDiri =
      'Saya mahasiswa Informatika yang sedang '
      'belajar membangun aplikasi web dengan Flutter.';

  // Baris informasi: ikon + label kecil + nilai.
  // Memakai Expanded agar teks panjang turun ke baris baru (aman di layar sempit).
  Widget _infoRow(BuildContext context, IconData icon, String label,
      String value) {
    final warna = Theme.of(context).colorScheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: warna.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: warna.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Judul bagian + ikon kecil.
  Widget _judulBagian(BuildContext context, IconData icon, String teks) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 8),
        Text(
          teks,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;

    // Inisial otomatis dari nama (misal "Alya Putri" -> "AP")
    final inisial = nama
        .split(' ')
        .where((kata) => kata.isNotEmpty)
        .take(2)
        .map((kata) => kata[0].toUpperCase())
        .join();

    return Scaffold(
      appBar: AppBar(title: const Text('Biodata Diri')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ===== KARTU PROFIL (Row + Column) =====
                // Container berwarna dengan padding, margin, dan borderRadius.
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: warna.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 36,
                        backgroundColor: warna.onPrimary,
                        child: Text(
                          inisial,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: warna.primary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nama,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: warna.onPrimary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.badge,
                                    size: 18, color: warna.onPrimary),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    'NIM: $nim',
                                    style: TextStyle(color: warna.onPrimary),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.school,
                                    size: 18, color: warna.onPrimary),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    prodi,
                                    style: TextStyle(color: warna.onPrimary),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // ===== INFORMASI DIRI (Column berisi banyak Text + SizedBox) =====
                Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _judulBagian(context, Icons.person, 'Informasi'),
                        const SizedBox(height: 16),
                        _infoRow(context, Icons.format_list_numbered,
                            'Semester', '$semester'),
                        const SizedBox(height: 12),
                        _infoRow(context, Icons.location_on, 'Kota', kota),
                        const SizedBox(height: 12),
                        _infoRow(context, Icons.email, 'Email', email),
                        const Divider(height: 32),

                        // Hobi
                        _judulBagian(context, Icons.favorite, 'Hobi'),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: hobi
                              .map((item) => Chip(label: Text(item)))
                              .toList(),
                        ),
                        const SizedBox(height: 20),

                        // Informasi baru: Keahlian
                        _judulBagian(context, Icons.code, 'Keahlian'),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: keahlian
                              .map((item) => Chip(label: Text(item)))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),

                // ===== TENTANG SAYA (Container berwarna kedua) =====
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: warna.primaryContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _judulBagian(context, Icons.info, 'Tentang saya'),
                      const SizedBox(height: 8),
                      const Text(deskripsiDiri),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}