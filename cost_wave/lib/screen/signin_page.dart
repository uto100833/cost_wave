import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/widgets/logo.dart';
import '../components/widgets/simple_text.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);
  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  String infoText = '';
  String email = '';
  String password = '';
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void signin() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        // メール/パスワードでログイン
        final FirebaseAuth auth = FirebaseAuth.instance;
        await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        // ユーザー登録に成功した場合
        setState(() {
          infoText = "ログインに成功しました！";
        });
      } catch (e) {
        // ユーザー登録に失敗した場合
        setState(() {
          infoText = "ログインに失敗しました：${e.toString()}";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary, // 背景色をテーマに合わせる
      body: Form(
        key: _formKey,
        child: Center(
          child: Card(
            color: Theme.of(context).colorScheme.primary,
            elevation: 8,
            child: Container(
              padding: const EdgeInsets.all(32.0),
              constraints: const BoxConstraints(maxWidth: 350),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Logo(width: 250, height: 250),
                    _gap(),
                    const SimpleText(
                      text: "Enter your email and password to continue.",
                    ),
                    _gap(),
                    _mailField(),
                    _gap(),
                    _passwordField(),
                    _gap(),
                    _rememberMeCheckbox(),
                    _gap(),
                    _signinButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);

  Widget _mailField() => TextFormField(
        validator: (value) {
          // add email validation
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }

          bool emailValid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value);
          if (!emailValid) {
            return 'Please enter a valid email';
          }

          return null;
        },
        onChanged: (String value) {
          setState(() {
            email = value;
          });
        },
        decoration: const InputDecoration(
          labelText: 'Email',
          hintText: 'Enter your email',
          prefixIcon: Icon(Icons.email_outlined),
          border: OutlineInputBorder(),
        ),
      );

  Widget _passwordField() => TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }

          if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
          return null;
        },
        onChanged: (String value) {
          setState(() {
            password = value;
          });
        },
        obscureText: !_isPasswordVisible,
        decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Enter your password',
            prefixIcon: const Icon(Icons.lock_outline_rounded),
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(
                  _isPasswordVisible ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            )),
      );

  Widget _rememberMeCheckbox() => CheckboxListTile(
        value: _rememberMe,
        onChanged: (value) {
          if (value == null) return;
          setState(() {
            _rememberMe = value;
          });
        },
        title: const Text('Remember me'),
        controlAffinity: ListTileControlAffinity.leading,
        dense: true,
        contentPadding: const EdgeInsets.all(0),
      );

  Widget _signinButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          onPressed: signin,
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Sign in',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
}
