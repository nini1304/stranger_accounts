import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stranger_accounts/ui/widget/item_card.dart';

import '../cubit/PageStatus.dart';
import '../cubit/item_cubit.dart';
import '../cubit/item_state.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  final itemCubit = ItemCubit();
  @override
  void initState() {
    itemCubit.item();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ItemCubit, ItemState>(
        bloc: itemCubit,
        listener: (BuildContext context, ItemState state) {
          if (state.status == PageStatus.failure) {
            //PENDIENTE
          }
        },
        builder: (BuildContext context, ItemState state) {
          if (state.status == PageStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              //tamaño del grid
              childAspectRatio: 0.8,
            ),
            itemCount: state.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemCard(
                itemId: state.data[index].itemId,
                articleConcept: state.data[index].articleConcept,
                gamePrice: state.data[index].gamePrice,
                price: state.data[index].price,
                picture: state.data[index].picture,
              );
            },
          );
        },
      ),
      appBar: AppBar(
        title: const Text('Items'),
        backgroundColor: const Color(0xff252A34),
      ),
    );
  }
}
