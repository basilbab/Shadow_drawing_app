import 'package:drawing_app/draw_home.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  
  late final firstCamera;
  XFile? _selectedImage;
  Future<void> getCamera() async {
    final cameras = await availableCameras();
    firstCamera = cameras.first;
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    // ignore: unnecessary_null_comparison
    if (PickedFile != null) {
      setState(() {
        _selectedImage = XFile(pickedFile!.path);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => ScreenDraw( camera: firstCamera, selectedImage: _selectedImage, imagePath: '')));
      });
    }
  }

  @override
  void initState() {
    getCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'Kidzee Drawing',
          style: TextStyle(
              color: Colors.white, fontFamily: 'Georgia', fontSize: 22),
        ),
      ),
      body: SafeArea(
          child: GridView.builder(
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1, crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => ScreenDraw( camera: firstCamera, imagePath: 'assets/${index+1}.jpg')));
              },
              child: Container(
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                   border: Border.all(color: Colors.blueAccent),
                  image: DecorationImage(
                      image: AssetImage('assets/${index+1}.jpg')),
                ),
              ),
            ),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        tooltip: 'Browse Gallery',
        onPressed: () async {
          pickImage();
        },
        child:  const Icon(Icons.image,
        color: Colors.white,),
      ),
    );
  }
}
