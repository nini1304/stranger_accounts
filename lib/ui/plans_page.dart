import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/PageStatus.dart';
import '../cubit/plans_cubit.dart';
import '../cubit/plans_state.dart';

class PlansPage extends StatefulWidget {
  const PlansPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PlansPageState createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  final plansCubit = PlansCubit();
  @override
  void initState() {
    plansCubit.plans();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: BlocBuilder<PlansCubit, PlansState>(
        bloc: plansCubit,
        builder: (context, state) {
          if (state.status == PageStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == PageStatus.success) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.data[index].durationLabel),
                  subtitle: Text(state.data[index].price.toString()),
                );
              },
            );
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        },
      ),
    );
  }
}
