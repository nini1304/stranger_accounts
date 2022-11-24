import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/PageStatus.dart';
import '../cubit/VerifyUserCubit.dart';
import '../cubit/VerifyUserState.dart';

class VerifyUserPage extends StatefulWidget {
  const VerifyUserPage({Key? key}) : super(key: key);
  //creando el estado de Login Page
  @override
  State<VerifyUserPage> createState() => _VerifyUserPageState();
}

class _VerifyUserPageState extends State<VerifyUserPage> {
  final _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context2) {
    //utilizamos un bloc provider para poder acceder al cubit
    return BlocProvider(
      create: (context) => VerifyUserCubit(),
      // The Scaffold is a widget in Flutter used to implements the basic material design visual layout structure
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Restablecer contraseña'),
          backgroundColor: const Color(0xff252A34),
        ),
        //Este una union entre BlocBuilder y BlocListener. Este se utiliza cuando queremos dibujar
        // algo con base al estado (OrdersState) y por otra parte queremos tomar acciones (e.g. Reportar Analytics) con base al estado.
        body: BlocConsumer<VerifyUserCubit, VerifyUserState>(
          //escuchando el estado del cubit
          listener: (context1, state) {
            // Si el cubit dice cargando, se muestra un AlertDialog
            if (state.status == PageStatus.loading) {
              showDialog(
                context: context,
                builder: (context1) => const AlertDialog(
                  title: Text('Verificando....'),
                  content: Text(
                      'Se le enviara un codigo de verificacion a su correo'),
                ),
              );
            } else if (state.status == PageStatus.success &&
                state.verifyuSuccess) {
              // Si el cubit dice que la autenticación fue correcta,
              // se va a al login
              //Navigator.pop(context1); // quito el dialog
              Navigator.pushReplacementNamed(context1, '/verifycode');
            } else {
              // Si el cubit dice que hubo error se lo muestra.
              Navigator.pop(context1); // quito el dialog
              showDialog(
                context: context,
                builder: (context1) => const AlertDialog(
                  title: Text('No se encontro el correo'),
                  content:
                      Text('El correo que ingreso no se encuentra registrado'),
                ),
              );
            }
          },
          builder: (context, state) => Center(child: VerifyUserForm(context)),
        ),
      ),
    );
  }

  Widget VerifyUserForm(BuildContext context) {
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
            //configurando un children para que tenga varios hijos usando un column
            children: <Widget>[
              //cargamos el logo
              Image.asset(
                'images/logo.png',
                width: 350,
                height: 300,
              ),
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
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(6),
                  child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.app_shortcut,
                        size: 24,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        //cuando se presione el boton se ejecuta el cubit
                        BlocProvider.of<VerifyUserCubit>(context)
                            .verify(_usernameController.text);
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xff08D9D6)),
                      label: const Text(
                        "Verificar Correo",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ))),
            ]));
  }
}
