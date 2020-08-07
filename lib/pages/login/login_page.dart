import 'package:call_1807/models/state.dart';
import 'package:call_1807/pages/home/home_page.dart';
import 'package:call_1807/services/app_state_repository.dart';
import 'package:call_1807/services/login_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _key = GlobalKey<ScaffoldState>();
  final _loginService = LoginService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _sigin() async {
    var _result = await _loginService.signIn(
      email: _emailController.text,
      password: _passwordController.text,
    );
    if (_result.status) {
      Navigator.of(context).pushReplacementNamed(HomePage.routeName);
    } else {
      _key.currentState
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(
              _result.message?.toString() ?? 'Erro indefinido',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onError,
              ),
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: FlutterLogo(
                  size: 150,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'e-mail',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                ),
                controller: _emailController,
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'password',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                ),
                obscureText: true,
                controller: _passwordController,
              ),
              SizedBox(
                height: 8,
              ),
              OutlineButton(
                onPressed: _sigin,
                child: Text('Sign in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
