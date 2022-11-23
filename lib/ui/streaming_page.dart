import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stranger_accounts/cubit/streaming_cubit.dart';
import 'package:stranger_accounts/cubit/streaming_state.dart';
import 'package:stranger_accounts/ui/widget/streaming_card.dart';

import '../cubit/PageStatus.dart';

class StreamingPage extends StatefulWidget {
  const StreamingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StreamingPageState createState() => _StreamingPageState();
}

class _StreamingPageState extends State<StreamingPage> {
  final streamingCubit = StreamingCubit();
  @override
  void initState() {
    // TODO: implement initState
    streamingCubit.streaming();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<StreamingCubit, StreamingState>(
        bloc: streamingCubit,
        listener: (BuildContext context, StreamingState state) {
          if (state.status == PageStatus.failure) {
            //PENDIENTE
          }
        },
        builder: (BuildContext context, StreamingState state) {
          if (state.status == PageStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              return StreamingCard(
                  platformName: state.data[index].platformName,
                  planPrice: state.data[index].durationLabel,
                  picture: state.data[index].picture,
                  serviceId: state.data[index].serviceId);
            },
          );
        },
      ),
      appBar: AppBar(
        title: const Text('Servicios de Streaming'),
        backgroundColor: const Color(0xff252A34),
      ),
    );
  }
}
