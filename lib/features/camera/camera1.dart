import 'package:face_skin_detection_flutter/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

class CameraScreen1 extends StatefulWidget {
  const CameraScreen1({super.key});

  @override
  _CameraScreen1State createState() => _CameraScreen1State();
}

class _CameraScreen1State extends State<CameraScreen1> {
  File? _image;
  String _result = "Prediksi akan ditampilkan di sini";

  // Fungsi untuk memilih gambar dari galeri
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Menyimpan gambar yang dipilih
      });
    }
  }

  // Fungsi untuk mengirim gambar ke API dan mendapatkan hasil prediksi
  Future<void> _predict() async {
    if (_image == null) return;

    final uri = Uri.parse(
        'https://trusting-content-duck.ngrok-free.app/deteksi'); // Ganti dengan URL API Anda

    // Mengirim gambar ke API
    var request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath('file', _image!.path));

    var response = await request.send();
    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      final result = jsonDecode(responseData);
      print(result);
      setState(() {
        _result = 'Prediksi: ${result['predicted_class']} ';
      });
    } else {
      setState(() {
        _result = "Gagal mendapatkan prediksi";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Deteksi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Card untuk menampilkan gambar atau placeholder
              _image == null
                  ? Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.photo,
                              size: 100,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Pilih gambar dari galeri',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 10,
                              offset: Offset(0, 10),
                            ),
                          ],
                          image: DecorationImage(
                            image: FileImage(_image!),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
              const SizedBox(height: 20),

              // Tombol pilih gambar dengan styling
              ElevatedButton(
                onPressed: _pickImage,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurple,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: const Text('Pilih Foto dari Galeri'),
              ),

              const SizedBox(height: 20),

              // Tombol prediksi dengan styling
              ElevatedButton(
                onPressed: _image == null ? null : _predict,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: _image == null ? Colors.grey : Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: const Text('Prediksi'),
              ),

              const SizedBox(height: 20),

              // Menampilkan hasil prediksi
              Text(
                _result,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
