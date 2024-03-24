import 'package:flutter/material.dart';
import 'package:shop/features/Home/Model/home_data_model.dart';
import 'package:shop/features/cart/bloc/cart_bloc.dart';
import 'package:shop/features/cart/bloc/cart_event.dart';

class CartTile extends StatelessWidget {
  final DataModel dataModel;
  final CartBloc cartBloc;
  const CartTile({
    super.key,
    required this.dataModel,
    required this.cartBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(dataModel.imageUrl),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                dataModel.name,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                dataModel.description,
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
              Row(
                children: [
                  Text(
                    "Rs: ${dataModel.price}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                     cartBloc.add(CartRemoveEvent(onClickedToRemove:dataModel));
                    },
                    icon: const Icon(Icons.shopping_cart, size: 30),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
