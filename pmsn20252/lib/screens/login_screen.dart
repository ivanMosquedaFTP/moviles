import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController conUser = TextEditingController();
  TextEditingController conPwd = TextEditingController();

  bool isValidating = false;

  @override
  Widget build(BuildContext context) {
    final txtUser = TextField(
      keyboardType: TextInputType.emailAddress,
      controller: conUser,
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
        // decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(url))),
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
                "Star wars",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontFamily: 'Jedi',
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
                child: Column(
                  children: [
                    txtUser,
                    txtPwd,
                    IconButton(
                      onPressed: () {
                        isValidating = true;
                        setState(() {});
                        Future.delayed(Duration(milliseconds: 3000)).then(
                          (value) => Navigator.pushNamed(context, "/home"),
                        );
                      },
                      icon: Icon(Icons.login, size: 40),
                    ),
                    IconButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, "/register"),
                      icon: Icon(Icons.add_circle),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 300,
              child: isValidating
                  // ? Lottie.asset("assets/loadingAnimation.json", height: 200)
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
