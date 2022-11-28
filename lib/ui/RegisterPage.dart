import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/PageStatus.dart';
import '../cubit/RegisterCubit.dart';
import '../cubit/RegisterState.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  //creando el estado de Login Page
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _pictureController = TextEditingController();
  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context2) {
    //utilizamos un bloc provider para poder acceder al cubit
    return BlocProvider(
      create: (context) => RegisterCubit(),
      // The Scaffold is a widget in Flutter used to implements the basic material design visual layout structure
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Registrarse'),
          backgroundColor: const Color(0xff252A34),
        ),
        //Este una union entre BlocBuilder y BlocListener. Este se utiliza cuando queremos dibujar
        // algo con base al estado (OrdersState) y por otra parte queremos tomar acciones (e.g. Reportar Analytics) con base al estado.
        body: BlocConsumer<RegisterCubit, RegisterState>(
          //escuchando el estado del cubit
          listener: (context1, state) {
            // Si el cubit dice cargando, se muestra un AlertDialog
            if (state.status == PageStatus.loading) {
              showDialog(
                context: context,
                builder: (context1) => const AlertDialog(
                  title: Text('Registrando....'),
                  content: Text('Debe iniciar sesion para comenzar'),
                ),
              );
            } else if (state.status == PageStatus.success &&
                state.registerSuccess) {
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
                  title: Text('No se pudo registrar'),
                  content: Text('Intente de nuevo'),
                ),
              );
            }
          },
          builder: (context, state) => Center(child: RegisterForm(context)),
        ),
      ),
    );
  }

  Widget RegisterForm(BuildContext context) {
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
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color(0xffB2B2B2),
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(20),
                    child: ElevatedButton.icon(
                        icon: const Icon(
                          Icons.add_a_photo_outlined,
                          size: 24,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          //Usamos ImagePicker para poder seleccionar una imagen de la galeria
                          final ImagePicker _picker = ImagePicker();
                          final XFile? image = await _picker.pickImage(
                              source: ImageSource.gallery);
                          _pictureController.text = image!.path;
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Color(0xffFF2E63),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        label: const Text(
                          "Elegir Foto de Perfil",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ))),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Ingrese su nombre',
                  ),
                ),
                TextField(
                  controller: _lastnameController,
                  decoration: const InputDecoration(
                    labelText: 'Ingrese su apellido',
                  ),
                ),
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Ingrese su email',
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Ingrese su contraseña',
                  ),
                  obscureText: true,
                ),
                TextField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Ingrese su numero de celular',
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: ElevatedButton(
                        onPressed: () {
                          //cuando se presione el boton se ejecuta el cubit
                          BlocProvider.of<RegisterCubit>(context).register(
                              _pictureController.text,
                              _nameController.text,
                              _lastnameController.text,
                              _usernameController.text,
                              _passwordController.text,
                              _phoneController.text);
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Color(0xff08D9D6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: const Text(
                          "Registrarse",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
