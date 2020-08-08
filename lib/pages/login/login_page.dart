import 'package:call_1807/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _key = GlobalKey<ScaffoldState>();
  AuthController _authController;
  ReactionDisposer _disposer;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _authController = Provider.of<AuthController>(context);
    _disposer = autorun((_) {
      if (_authController.loginResult != null &&
          !_authController.loginResult.status) {
        _key.currentState
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(
                _authController.loginResult.message?.toString() ??
                    'Erro indefinido',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onError,
                ),
              ),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
      }
    });
  }

  void _sigin() async {
    _authController.signIn(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _disposer();
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
