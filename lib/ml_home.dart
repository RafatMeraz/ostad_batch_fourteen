import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';

class MachineLearningHome extends StatefulWidget {
  const MachineLearningHome({super.key});

  @override
  State<MachineLearningHome> createState() => _MachineLearningHomeState();
}

class _MachineLearningHomeState extends State<MachineLearningHome> {
  File? _image;
  List<Face> _faces = [];
  ui.Image? _uiImage;
  final ImagePicker _picker = ImagePicker();
  late final FaceDetector _faceDetector;

  @override
  void initState() {
    super.initState();
    final options = FaceDetectorOptions(
      enableContours: true,
      enableLandmarks: true,
    );
    _faceDetector = FaceDetector(options: options);
  }

  @override
  void dispose() {
    _faceDetector.close();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final File file = File(pickedFile.path);
      final data = await file.readAsBytes();
      final ui.Image uiImage = await decodeImageFromList(data);

      setState(() {
        _image = file;
        _uiImage = uiImage;
        _faces = [];
      });
      _detectFaces(_image!);
    }
  }

  Future<void> _detectFaces(File image) async {
    final inputImage = InputImage.fromFile(image);
    final List<Face> faces = await _faceDetector.processImage(inputImage);

    setState(() {
      _faces = faces;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ML Face Detection'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: _image == null
                  ? const Text('No image selected.')
                  : Column(
                      children: [
                        if (_uiImage != null)
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                            ),
                            child: FittedBox(
                              child: SizedBox(
                                width: _uiImage!.width.toDouble(),
                                height: _uiImage!.height.toDouble(),
                                child: CustomPaint(
                                  painter: FacePainter(_uiImage!, _faces),
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(height: 20),
                        Text(
                          'Detected ${_faces.length} faces',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _faces.length,
                          itemBuilder: (context, index) {
                            final face = _faces[index];
                            return ListTile(
                              title: Text('Face ${index + 1}'),
                              subtitle: Text(
                                  'Bounding Box: ${face.boundingBox.toString()}'),
                            );
                          },
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: 'Pick Image',
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}

class FacePainter extends CustomPainter {
  final ui.Image image;
  final List<Face> faces;

  FacePainter(this.image, this.faces);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(image, Offset.zero, Paint());

    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..color = Colors.green;

    for (final face in faces) {
      canvas.drawRect(face.boundingBox, paint);
    }
  }

  @override
  bool shouldRepaint(FacePainter oldDelegate) {
    return oldDelegate.image != image || oldDelegate.faces != faces;
  }
}
