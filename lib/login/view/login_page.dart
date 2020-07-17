import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_mobx/login/service/login_rest_service.dart';
import 'package:flutter_ecommerce_mobx/login/store/login_store.dart';
import 'package:flutter_ecommerce_mobx/shared/auth/service/authentication_facade_impl.dart';
import 'package:flutter_ecommerce_mobx/shared/auth/store/authentication_store.dart';
import 'package:flutter_ecommerce_mobx/shared/token/token_service_storage.dart';
import 'package:flutter_ecommerce_mobx/shared/user/service/user_rest_service.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final fkey = GlobalKey<FormState>();

  LoginStore _loginStore;
  AuthenticationStore _authenticationStore;
  ReactionDisposer _reaction;

  @override
  void initState() {
    _initDependencies();
    super.initState();
  }

  _initDependencies() {
    final Dio dio = new Dio();
    _loginStore = LoginStore(AuthenticationFacadeImpl(
        LoginRestService(dio), UserRestService(), TokenServiceStorage()));
    _authenticationStore = AuthenticationStore.getInstance();
    _reaction = reaction((_) => _loginStore.request?.status, (_) {
      final status = _loginStore.request?.status;
      if (status == FutureStatus.rejected) {
        _errorDialog("blablabla");
      } else if (status == FutureStatus.fulfilled) {
        _acceptedDialog();
        _authenticationStore.authenticate(_loginStore.request.value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Observer(
            builder: (BuildContext context) => Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 70.0,
                    ),
                    Form(key: fkey, child: Column(children: _loginForm())),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.3,
                      margin: const EdgeInsets.only(top: 30.0),
                      child: RaisedButton(
                        color: Theme.of(context).accentColor,
                        onPressed: () {
                          if (fkey.currentState.validate() &&
                              !_loginStore.loading) _loginStore.submit();
                        },
                        child: _loginStore.loading
                            ? const Center(
                                child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.black),
                              ))
                            : const Text(
                                "SUBMIT",
                                style: TextStyle(color: Colors.black54),
                              ),
                      ),
                    )
                  ],
                )),
      ),
    ));
  }

  List<Widget> _loginForm() {
    return [
      TextFormField(
        onChanged: (v) => _loginStore.username = v.trim(),
        validator: (e) => e.contains("@") && e.contains(".")
            ? null
            : "O valor colocado não é um email!",
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            icon: const Icon(Icons.person),
            labelText: "Email",
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(1.0)),
                borderSide: BorderSide(color: Theme.of(context).primaryColor))),
      ),
      SizedBox(
        height: 10.0,
      ),
      TextFormField(
        onChanged: (v) => _loginStore.password = v.trim(),
        validator: (e) => e.length >= 8
            ? null
            : "A senha deve conter no mínimo 8 caractéres.",
        obscureText: true,
        decoration: InputDecoration(
            icon: const Icon(Icons.vpn_key),
            labelText: "Password",
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(1.0)),
                borderSide: BorderSide(color: Theme.of(context).primaryColor))),
      ),
    ];
  }

  void _errorDialog(String error) {
    showDialog(
        context: context,
        child: AlertDialog(
          title: const Text("O usuário não conseguiu logar!",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          content: Text("Motivo: " + error),
        ));
  }

  void _acceptedDialog() {
    Navigator.of(context).pushReplacementNamed("/products");
    /* showDialog(
        context: context,
        child: const AlertDialog(
          content: Text(
            "O usuário foi logado com sucesso!",
            style: TextStyle(color: Colors.green),
          ),
        ));*/
  }
}
