import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stranger_accounts/ui/widget/plans_card.dart';

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
    // TODO: implement initState
    plansCubit.plans();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PlansCubit, PlansState>(
        bloc: plansCubit,
        listener: (BuildContext context, PlansState state) {
          if (state.status == PageStatus.failure) {
            //PENDIENTE
          }
        },
        builder: (BuildContext context, PlansState state) {
          if (state.status == PageStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              return PlansCard(
                  /*
                  plansId: state.data[index].plansId,
                  days: state.data[index].days,
                  price: state.data[index].price,
                  durationLabel: state.data[index].durationLabel,
                  serviceId: state.data[index].serviceId*/
                  );
            },
          );
        },
      ),
      appBar: AppBar(
<<<<<<< HEAD
        title: const Text('Persoalizar Plan'),
=======
        title: const Text('Planes del servicio'),
>>>>>>> da3875cd110fc110f247aeebbd225c1751e09a6a
        backgroundColor: const Color(0xff252A34),
      ),
    );
  }
}
