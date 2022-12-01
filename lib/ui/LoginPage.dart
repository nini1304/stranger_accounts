import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/LoginCubit.dart';

import '../cubit/LoginState.dart';
import '../cubit/PageStatus.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  //creando el estado de Login Page
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context2) {
    //utilizamos un bloc provider para poder acceder al cubit
    return BlocProvider(
      create: (context) => LoginCubit(),
      // The Scaffold is a widget in Flutter used to implements the basic material design visual layout structure
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ingresar'),
          backgroundColor: const Color(0xff252A34),
        ),

        //Este una union entre BlocBuilder y BlocListener. Este se utiliza cuando queremos dibujar
        // algo con base al estado (OrdersState) y por otra parte queremos tomar acciones (e.g. Reportar Analytics) con base al estado.
        body: BlocConsumer<LoginCubit, LoginState>(
          //escuchando el estado del cubit
          listener: (context1, state) {
            // Si el cubit dice cargando, se muestra un AlertDialog
            if (state.status == PageStatus.loading) {
              showDialog(
                context: context,
                builder: (context1) => const AlertDialog(
                  title: Text('Iniciando....'),
                  content: Text('Espere un momento'),
                ),
              );
            } else if (state.status == PageStatus.success &&
                state.loginSuccess) {
              // Si el cubit dice que la autenticación fue correcta,
              // se va a la pagian princial
              Navigator.pop(context1); // quito el dialog
              Navigator.pushReplacementNamed(context1, '/home');
            } else {
              // Si el cubit dice que hubo error se lo muestra.
              Navigator.pop(context1); // quito el dialog
              showDialog(
                context: context,
                builder: (context1) => const AlertDialog(
                  title: Text('Usuario no encontrado'),
                  content: Text('Usuario o contraseña incorrectos'),
                ),
              );
            }
          },
          builder: (context, state) => Center(child: LoginForm(context)),
        ),
      ),
    );
  }

  Widget LoginForm(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(32),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/wallpaper.png'),
          fit: BoxFit.cover,
        ),
      ),

      //configurando un children para que tenga varios hijos usando un column
      child: ListView(
        // centreando el contenido
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: //cargamos el logo
                Image.asset(
              'images/logo.png',
              width: 350,
              height: 300,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Color(0xffB2B2B2),
                width: 4,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: new Offset(0.0, 20.0),
                  blurRadius: 20.0,
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  //creando un textfield para el usuario
                  TextFormField(
                    //para que sea de tipo email
                    keyboardType: TextInputType.emailAddress,
                    //decorando el textfield

                    decoration: const InputDecoration(
                      labelText: 'Usuario',
                      icon: Icon(Icons.person),
                    ),
                    //validando el textfield
                    onSaved: (value) {
                      username = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor ingrese un usuario';
                      }
                    },
                  ),
                  //creando un textfield para la contraseña
                  TextFormField(
                    //decorando el textfield
                    decoration: const InputDecoration(
                      labelText: 'Contraseña',
                      icon: Icon(Icons.lock),
                    ),
                    //para que sea de tipo password
                    obscureText: true,
                    //validando el textfield
                    onSaved: (value) {
                      password = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor ingrese una contraseña';
                      }
                    },
                  ),
                  //creando un boton para el login
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        //validando el formulario
                        if (_formKey.currentState!.validate()) {
                          //guardando el formulario
                          _formKey.currentState!.save();
                          //llamando al cubit para que haga el login
                          BlocProvider.of<LoginCubit>(context)
                              .login(username, password);
                        }
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xff08D9D6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: const Text('          Ingresar          ',
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/verifyuser');
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xffFF2E63),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: const Text('Olvide mi contraseña',
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
