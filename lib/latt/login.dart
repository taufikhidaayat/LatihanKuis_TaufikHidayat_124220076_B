import 'package:flutter/material.dart';
import 'makanan.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = "";
  String? _nickname;
  String _password = "";
  bool isClicked = false;

  void _navigateToHome() async {
    await Future.delayed(Duration(seconds: 1));

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            makananPage(username: _username, nickname: _nickname),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _logoWidget(),
              SizedBox(height: 20),
              _usernameField(),
              _passwordField(),
              _nicknameField(),
              _loginButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logoWidget() {
    return Column(
      children: [
        Image.asset(
          'assets/images/gambarlogin.png',
          width: 200,
          height: 200,
        ),
        SizedBox(height: 10),
        Text(
          'Selamat Datang',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _nicknameField() {
    return _textField(
      hint: 'Masukkan Nickname (ex.taufik)',
      onChanged: (value) {
        _nickname = value;
      },
    );
  }

  Widget _usernameField() {
    return _textField(
      hint: 'Masukkan Username (ex.TAUFIK HIDAYAT)',
      onChanged: (value) {
        _username = value;
      },
    );
  }

  Widget _passwordField() {
    return _textField(
      hint: 'Masukkan Password',
      onChanged: (value) {
        _password = value;
      },
      obscureText: true,
    );
  }

  Widget _textField(
      {required String hint,
      required Function(String) onChanged,
      bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isClicked
                ? const Color.fromARGB(255, 255, 255, 255)
                : const Color.fromARGB(255, 205, 29, 161),
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
          onPressed: () {
            if (_username == "taufik" && _password == "123") {
              _navigateToHome();
              setState(() {
                isClicked = true;
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Login Gagal'),
                ),
              );
            }
          },
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: 19,
              color: Colors.white,
            ),
          ),
        ));
  }
}
