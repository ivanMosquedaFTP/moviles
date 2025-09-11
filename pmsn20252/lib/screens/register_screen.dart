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
  final TextEditingController _conName = TextEditingController();
  final TextEditingController _conMiddleName = TextEditingController();
  final TextEditingController _conLastName = TextEditingController();
  final TextEditingController _conEmail = TextEditingController();
  final TextEditingController _conPwd = TextEditingController();

  final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  // list to store each field's validation
  late List<bool> _validate;

  File? _profileImage;
  final ImagePicker _picker = ImagePicker();
  bool isValidating = false;

  @override
  void initState() {
    super.initState();
    // true means there's empty/error
    // false means there's text/no error
    //           name, middle, last, email, pwd
    _validate = [false, false, false, false, false];
  }

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

  // Clear error on input change
  void _clearError(int index) {
    // true means there's error
    if (_validate[index]) {
      // sets it to false, which means there's no error
      setState(() {
        _validate[index] = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final txtName = TextField(
      keyboardType: TextInputType.name,
      controller: _conName,
      // false means no error
      onChanged: (_) => _clearError(0),
      decoration: InputDecoration(
        hintText: "Name",
        errorText: _validate[0] ? "The name field cannot be empty." : null,
      ),
    );
    final txtMiddleName = TextField(
      keyboardType: TextInputType.name,
      controller: _conMiddleName,
      onChanged: (_) => _clearError(1),
      decoration: InputDecoration(
        hintText: "Middle name",
        errorText: _validate[1]
            ? "The middle name field cannot be empty."
            : null,
      ),
    );
    final txtLastName = TextField(
      keyboardType: TextInputType.name,
      controller: _conLastName,
      onChanged: (_) => _clearError(2),
      decoration: InputDecoration(
        hintText: "Last name",
        errorText: _validate[2] ? "The last name field cannot be empty." : null,
      ),
    );
    final txtEmail = TextField(
      keyboardType: TextInputType.emailAddress,
      controller: _conEmail,
      onChanged: (_) => _clearError(3),
      decoration: InputDecoration(
        hintText: "Email address",
        errorText: _validate[3]
            ? (_conEmail.text.isEmpty
                  ? "The email field cannot be empty."
                  : "Please enter a valid email address.")
            : null,
      ),
    );
    final txtPwd = TextField(
      obscureText: true,
      controller: _conPwd,
      onChanged: (_) => _clearError(4),
      decoration: InputDecoration(
        hintText: "Password",
        errorText: _validate[4] ? "The password field cannot be empty." : null,
      ),
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
                          setState(() {
                            _validate[0] = _conName.text.isEmpty;
                            _validate[1] = _conMiddleName.text.isEmpty;
                            _validate[2] = _conLastName.text.isEmpty;
                            // checking for either empty or invalid email
                            _validate[3] =
                                _conEmail.text.isEmpty ||
                                !_emailRegex.hasMatch(_conEmail.text);
                            _validate[4] = _conPwd.text.isEmpty;
                          });

                          final bool formValidated =
                              _conName.text.isNotEmpty &&
                              _conMiddleName.text.isNotEmpty &&
                              _conLastName.text.isNotEmpty &&
                              _conEmail.text.isNotEmpty &&
                              _emailRegex.hasMatch(_conEmail.text) &&
                              _conPwd.text.isNotEmpty;

                          if (formValidated) {
                            setState(() {
                              isValidating = true;
                            });
                            Future.delayed(Duration(milliseconds: 3000)).then(
                              (value) => Navigator.pushNamed(context, "/login"),
                            );
                          }
                        },
                        icon: Icon(Icons.add_circle, size: 40),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_circle_left),
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
