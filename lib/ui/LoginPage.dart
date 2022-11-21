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
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

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
                  title: Text('Cargando'),
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
                  title: Text('Error'),
                  content: Text('Intente de nuevo'),
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
      child: Column(
        // centreando el contenido
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //cargamos el logo
          Image.asset(
            'images/logo.png',
            width: 350,
            height: 300,
          ),
          // creamos un texto
          const Padding(
            padding: EdgeInsets.all(6),
            child: Text(
              "Ingrese su correo:",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          // creamos el boton de ingresar
          Padding(
            padding: const EdgeInsets.all(6),
            child: TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(6),
            child: Text(
              "Ingrese su contrasena :",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(6),
            child: TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(6),
              child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.add_reaction_outlined,
                    size: 24,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    //cuando se presione el boton se ejecuta el cubit
                    BlocProvider.of<LoginCubit>(context).login(
                        _usernameController.text, _passwordController.text);
                  },
                  style:
                      TextButton.styleFrom(backgroundColor: Color(0xff08D9D6)),
                  label: const Text(
                    "Ingresar",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ))),
        ],
      ),
    );
  }
}
