/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/PageStatus.dart';
import '../cubit/PaymentMCubit.dart';

class PaymentMethodsPage extends StatefulWidget {
  const PaymentMethodsPage({Key? key}) : super(key: key);
  @override
  State<PaymentMethodsPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentMethodsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentMCubit(),
      child: BlocBuilder<PaymentMethodsCubit, PaymentMethodsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Payment Methods'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Payment Methods'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<PaymentMethodsCubit>().getPaymentMethods();
                    },
                    child: const Text('Get Payment Methods'),
                  ),
                  const SizedBox(height: 20),
                  if (state.status == PageStatus.loading)
                    const CircularProgressIndicator()
                  else if (state.status == PageStatus.success)
                    Text(state.paymentMethods.toString())
                  else if (state.status == PageStatus.failure)
                    Text(state.errorMessage.toString())
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
*/
