import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/PageStatus.dart';
import '../cubit/VerifyCodeCubit.dart';
import '../cubit/VerifyCodeState.dart';

class VerifyCodePage extends StatefulWidget {
  const VerifyCodePage({Key? key}) : super(key: key);
  //creando el estado de Login Page
  @override
  State<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  final _codeeController = TextEditingController();
  @override
  Widget build(BuildContext context2) {
    //utilizamos un bloc provider para poder acceder al cubit
    return BlocProvider(
      create: (context) => VerifyCodeCubit(),
      // The Scaffold is a widget in Flutter used to implements the basic material design visual layout structure
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Restablecer contraseña'),
          backgroundColor: const Color(0xff252A34),
        ),
        //Este una union entre BlocBuilder y BlocListener. Este se utiliza cuando queremos dibujar
        // algo con base al estado (OrdersState) y por otra parte queremos tomar acciones (e.g. Reportar Analytics) con base al estado.
        body: BlocConsumer<VerifyCodeCubit, VerifyCodeState>(
          //escuchando el estado del cubit
          listener: (context1, state) {
            // Si el cubit dice cargando, se muestra un AlertDialog
            if (state.status == PageStatus.loading) {
              showDialog(
                context: context,
                builder: (context1) => const AlertDialog(
                  title: Text('Verificando....'),
                  content: Text('Espere un momento por favor'),
                ),
              );
            } else if (state.status == PageStatus.success &&
                state.verifycSuccess) {
              // Si el cubit dice que la autenticación fue correcta,
              // se va a al login
              //Navigator.pop(context1); // quito el dialog
              Navigator.pushReplacementNamed(context1, '/restorepass');
            } else {
              // Si el cubit dice que hubo error se lo muestra.
              Navigator.pop(context1); // quito el dialog
              showDialog(
                context: context,
                builder: (context1) => const AlertDialog(
                  title: Text('Codigo incorrecto'),
                  content: Text('Intente de nuevo'),
                ),
              );
            }
          },
          builder: (context, state) => Center(child: VerifyCodeForm(context)),
        ),
      ),
    );
  }

  Widget VerifyCodeForm(BuildContext context) {
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
                  "Ingrese el codigo:",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              // creamos el boton de ingresar
              Padding(
                padding: const EdgeInsets.all(6),
                child: TextFormField(
                  controller: _codeeController,
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
                        BlocProvider.of<VerifyCodeCubit>(context)
                            .verifyc(_codeeController.text);
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xff08D9D6)),
                      label: const Text(
                        "Verificar Codigo",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ))),
            ]));
  }
}
