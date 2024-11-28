import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class PdfService {
  Future<String> downloadPdf(String url) async {
    try {
      // Mendapatkan direktori penyimpanan lokal
      final directory = await getApplicationDocumentsDirectory(); // Import 'path_provider'
      final filePath = '${directory.path}/file.pdf'; // Tentukan nama dan path file lokal

      // Unduh file PDF dan simpan ke path lokal
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // Simpan file PDF
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        return filePath; // Mengembalikan path file lokal
      } else {
        throw Exception("Gagal mengunduh file PDF");
      }
    } catch (e) {
      throw Exception("Error saat mengunduh PDF: $e");
    }
  }
}


