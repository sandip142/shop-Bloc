import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/cart/bloc/cart_bloc.dart';
import 'package:shop/features/cart/bloc/cart_event.dart';
import 'package:shop/features/cart/bloc/cart_state.dart';
import 'package:shop/features/cart/ui/cart_tile.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    cartBloc.add(CartSuccessLoadevent());
    super.initState();
  }

  CartBloc cartBloc = CartBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Page'),
        centerTitle: true,
      ),
      body: BlocConsumer<CartBloc, Cartstate>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartAction,
        buildWhen: (previous, current) => current is! CartAction,
        listener: (context, state) {
          if (state is CartRemoveShowSnackbar) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("item is Deleted from cart"),
              ),
            );
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successload = state as CartSuccessState;
              return ListView.builder(
                  itemCount: successload.cartItem.length,
                  itemBuilder: (context, index) {
                    return CartTile(
                      dataModel: successload.cartItem[index],
                      cartBloc: cartBloc,
                    );
                  });
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
