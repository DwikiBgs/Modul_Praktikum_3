import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:biodata_diri/main.dart';

void main() {
  testWidgets('Halaman biodata menampilkan kartu profil dan informasi',
          (WidgetTester tester) async {
        await tester.pumpWidget(const BiodataApp());

        // Judul AppBar dan avatar inisial.
        expect(find.text('Biodata Diri'), findsOneWidget);
        expect(find.byType(CircleAvatar), findsOneWidget);

        // Kartu profil: NIM tampil dengan ikon.
        expect(find.textContaining('NIM:'), findsOneWidget);
        expect(find.byIcon(Icons.badge), findsOneWidget);
        expect(find.byIcon(Icons.school), findsOneWidget);

        // Informasi tambahan dan bagian-bagian lain.
        expect(find.text('Semester'), findsOneWidget);
        expect(find.text('Kota'), findsOneWidget);
        expect(find.text('Email'), findsOneWidget);
        expect(find.text('Hobi'), findsOneWidget);
        expect(find.text('Keahlian'), findsOneWidget);
        expect(find.text('Tentang saya'), findsOneWidget);
      });
}