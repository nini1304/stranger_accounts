import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stranger_accounts/cubit/AcquiredCubit.dart';
import 'package:stranger_accounts/cubit/AcquiredState.dart';
import 'package:stranger_accounts/ui/widget/AcquiredCard.dart';
import '../cubit/PageStatus.dart';
//page to show the acquired services

class AcquiredServicesPage extends StatefulWidget {
  const AcquiredServicesPage({super.key});

  @override
  _AcquiredServicesPageState createState() => _AcquiredServicesPageState();
}

class _AcquiredServicesPageState extends State<AcquiredServicesPage> {
  final acquiredCubit = AcquiredCubit();
  @override
  void initState() {
    acquiredCubit.acquired();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Servicios adquiridos'),
      ),
      body: BlocBuilder<AcquiredCubit, AcquiredState>(
        bloc: acquiredCubit,
        builder: (context, state) {
          if (state.status == PageStatus.initial) {
            return Center(
              child: Text('No hay servicios adquiridos'),
            );
          } else if (state.status == PageStatus.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == PageStatus.failure) {
            return Center(
              child: Text(state.errorMessage!),
            );
          } else {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                final item = state.data[index];
                return AcquiredCard();
              },
            );
          }
        },
      ),
    );
  }
}
