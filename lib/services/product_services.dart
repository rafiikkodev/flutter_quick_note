import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductServices {
  final String apiUrl = "http://10.0.2.2/aplikasi%20login/panggil_produk.php";

  Future<List<dynamic>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['result'];
      } else {
        throw Exception(
            'Gagal memuat data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
