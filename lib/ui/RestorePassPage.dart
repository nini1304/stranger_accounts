import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/PageStatus.dart';
import '../cubit/RestorePassCubit.dart';
import '../cubit/RestorePassState.dart';

class RestorePassPage extends StatefulWidget {
  const RestorePassPage({Key? key}) : super(key: key);
  //creando el estado de Login Page
  @override
  State<RestorePassPage> createState() => _RestorePassPageState();
}

class _RestorePassPageState extends State<RestorePassPage> {
  String password = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context2) {
    //utilizamos un bloc provider para poder acceder al cubit
    return BlocProvider(
      create: (context) => RestorePassCubit(),
      // The Scaffold is a widget in Flutter used to implements the basic material design visual layout structure
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Restablecer contraseña'),
          backgroundColor: const Color(0xff252A34),
        ),
        //Este una union entre BlocBuilder y BlocListener. Este se utiliza cuando queremos dibujar
        // algo con base al estado (OrdersState) y por otra parte queremos tomar acciones (e.g. Reportar Analytics) con base al estado.
        body: BlocConsumer<RestorePassCubit, RestorePassState>(
          //escuchando el estado del cubit
          listener: (context1, state) {
            // Si el cubit dice cargando, se muestra un AlertDialog
            if (state.status == PageStatus.loading) {
              showDialog(
                context: context,
                builder: (context1) => const AlertDialog(
                  title: Text('Modificando....'),
                  content: Text('Inicie Sesion'),
                ),
              );
            } else if (state.status == PageStatus.success &&
                state.restorepassSuccess) {
              // Si el cubit dice que la autenticación fue correcta,
              // se va a al login
              //Navigator.pop(context1); // quito el dialog
              Navigator.pushReplacementNamed(context1, '/login');
            } else {
              // Si el cubit dice que hubo error se lo muestra.
              Navigator.pop(context1); // quito el dialog
              showDialog(
                context: context,
                builder: (context1) => const AlertDialog(
                  title: Text('Ocurrio un Error'),
                  content: Text('Intente de nuevo'),
                ),
              );
            }
          },
          builder: (context, state) => Center(child: RestorePassForm(context)),
        ),
      ),
    );
  }

  Widget RestorePassForm(BuildContext context) {
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
              Container(
                  //cargamos el logo
                  child: Image.asset(
                'images/logo.png',
                width: 350,
                height: 300,
              )),
              Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xffB2B2B2),
                        width: 4,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: Form(
                      key: _formKey,
                      child: Column(children: <Widget>[
                        TextFormField(
                          //decorando el textfield
                          decoration: const InputDecoration(
                            labelText: 'Ingrese su nueva contraseña',
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
                            } else if (value.length < 12) {
                              return 'La contraseña debe tener al menos 12 caracteres';
                            }
                          },
                        ),
                        Padding(
                            padding: EdgeInsets.all(6),
                            child: ElevatedButton(
                                onPressed: () {
                                  //validando el formulario
                                  if (_formKey.currentState!.validate()) {
                                    //guardando el formulario
                                    _formKey.currentState!.save();
                                    //cuando se presione el boton se ejecuta el cubit
                                    BlocProvider.of<RestorePassCubit>(context)
                                        .restorepass(password);
                                  }
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: Color(0xff08D9D6),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                child: const Text(
                                  "Actualizar",
                                  style: TextStyle(
                                    fontSize: 24,
                                  ),
                                ))),
                      ])))
            ]));
  }
}
