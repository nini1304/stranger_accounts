import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stranger_accounts/ui/widget/music_card.dart';

import '../cubit/PageStatus.dart';
import '../cubit/music_cubit.dart';
import '../cubit/music_state.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  final musicCubit = MusicCubit();
  @override
  void initState() {
    // TODO: implement initState
    musicCubit.music();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MusicCubit, MusicState>(
        bloc: musicCubit,
        listener: (BuildContext context, MusicState state) {
          if (state.status == PageStatus.failure) {
            //PENDIENTE
          }
        },
        builder: (BuildContext context, MusicState state) {
          if (state.status == PageStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              return MusicCard(
                  platformName: state.data[index].platformName,
                  planPrice: state.data[index].durationLabel,
                  picture: state.data[index].picture,
                  serviceId: state.data[index].serviceId);
            },
          );
        },
      ),
      appBar: AppBar(
        title: const Text('Servicios de Music'),
        backgroundColor: const Color(0xff252A34),
      ),
    );
  }
}
