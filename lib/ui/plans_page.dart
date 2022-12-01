import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stranger_accounts/ui/widget/PlansCard.dart';

import '../cubit/PageStatus.dart';

import '../cubit/plans_cubit.dart';
import '../cubit/plans_state.dart';

class PlansPage extends StatefulWidget {
  const PlansPage({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  @override
  State<PlansPage> createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  String profilename = "";

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PlansCubit(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Personalizar Plan'),
            backgroundColor: const Color(0xff252A34),
          ),
          body: BlocConsumer<PlansCubit, PlansState>(
            listener: (context, state) {
              if (state.status == PageStatus.loading) {
                showDialog(
                  context: context,
                  builder: (context1) => const AlertDialog(
                    title: Text('Iniciando....'),
                    content: Text('Espere un momento'),
                  ),
                );
              } else if (state.status == PageStatus.failure) {
                showDialog(
                  context: context,
                  builder: (context1) => const AlertDialog(
                    title: Text('Algo malo sucedio....'),
                    content: Text('Intente de nuevo'),
                  ),
                );
                Navigator.pop(context); // quito el dialog
                Navigator.pushReplacementNamed(context, '/home');
              }
            },
            builder: (context, state) =>
                Center(child: PersonalizeForm(context)),
          ),
        ));
  }

  Widget PersonalizeForm(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/wallpaper.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(children: <Widget>[
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
            ),
            child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  TextFormField(
                    //decorando el textfield

                    decoration: const InputDecoration(
                      labelText: 'Nombre de Perfil de usuario',
                      icon: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                    //validando el textfield
                    onSaved: (value) {
                      profilename = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor ingrese un usuario';
                      }
                    },
                  ),
                ])),
          )
        ]));
  }
}
