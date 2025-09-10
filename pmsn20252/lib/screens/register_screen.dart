import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController conName = TextEditingController();
  TextEditingController conMiddleName = TextEditingController();
  TextEditingController conLastName = TextEditingController();
  TextEditingController conEmail = TextEditingController();
  TextEditingController conPwd = TextEditingController();

  // optional, stores the file
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();
  bool isValidating = false;

  // function to pick image from gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Select Image Source"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _pickImage(ImageSource.gallery);
            },
            child: Text("Gallery"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _pickImage(ImageSource.camera);
            },
            child: Text("Camera"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final txtName = TextField(
      keyboardType: TextInputType.name,
      controller: conName,
      decoration: InputDecoration(hintText: "Name"),
    );
    final txtMiddleName = TextField(
      keyboardType: TextInputType.name,
      controller: conMiddleName,
      decoration: InputDecoration(hintText: "Middle name"),
    );
    final txtLastName = TextField(
      keyboardType: TextInputType.name,
      controller: conLastName,
      decoration: InputDecoration(hintText: "Last name"),
    );
    final txtEmail = TextField(
      keyboardType: TextInputType.emailAddress,
      controller: conEmail,
      decoration: InputDecoration(hintText: "Email address"),
    );
    final txtPwd = TextField(
      obscureText: true,
      controller: conPwd,
      decoration: InputDecoration(hintText: "Password"),
    );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/loginBackground.jpg"),
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 100,
              child: Text(
                "Register",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontFamily: 'Jedi',
                ),
              ),
            ),
            Positioned(
              top: 180,
              child: GestureDetector(
                onTap: _showImageSourceDialog,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _profileImage != null
                      ? FileImage(_profileImage!)
                      : null,
                  child: _profileImage == null
                      ? Icon(Icons.add_a_photo, size: 50, color: Colors.grey)
                      : null,
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      txtName,
                      txtMiddleName,
                      txtLastName,
                      txtEmail,
                      txtPwd,
                      IconButton(
                        onPressed: () {
                          isValidating = true;
                          setState(() {});
                          Future.delayed(Duration(milliseconds: 3000)).then(
                            (value) => Navigator.pushNamed(context, "/login"),
                          );
                        },
                        icon: Icon(Icons.login, size: 40),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 300,
              child: isValidating
                  ? Lottie.asset(
                      "assets/loadingAnimationLightMode.json",
                      height: 200,
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
