// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stranger_accounts/ui/widget/gaming_card.dart';
import '../cubit/PageStatus.dart';
import '../cubit/gaming_cubit.dart';
import '../cubit/gaming_state.dart';

class GamingPage extends StatefulWidget {
  const GamingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GamingPageState createState() => _GamingPageState();
}

class _GamingPageState extends State<GamingPage> {
  final gamingCubit = GamingCubit();
  @override
  void initState() {
    // TODO: implement initState
    gamingCubit.gaming();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<GamingCubit, GamingState>(
        bloc: gamingCubit,
        listener: (BuildContext context, GamingState state) {
          if (state.status == PageStatus.failure) {
            //PENDIENTE
          }
        },
        builder: (BuildContext context, GamingState state) {
          if (state.status == PageStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              return GamingCard(
                  platformName: state.data[index].platformName,
                  planPrice: state.data[index].durationLabel,
                  picture: state.data[index].picture,
                  serviceId: state.data[index].serviceId);
            },
          );
        },
      ),
      appBar: AppBar(
        title: const Text('Servicios de Gaming'),
        backgroundColor: const Color(0xff252A34),
      ),
    );
  }
}
