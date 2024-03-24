import 'package:flutter/material.dart';
import 'package:shop/features/Home/Model/home_data_model.dart';
import 'package:shop/features/Home/bloc/home_bloc.dart';
import 'package:shop/features/Home/bloc/home_event.dart';

class ProductTile extends StatelessWidget {
  final DataModel dataModel;
  final HomeBloc homeBloc;
  const ProductTile({
    super.key,
    required this.dataModel,
    required this.homeBloc,
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
                      homeBloc.add(HomeProductWishlistButtomClickedEvent(
                        clickedAddToWhishlist: dataModel
                      ),);
                    },
                    icon: const Icon(
                      Icons.favorite_outline_outlined,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductCartButtomClickedEvent(
                        clickedAddToCart: dataModel
                      ));
                    },
                    icon: const Icon(Icons.shopping_cart_outlined, size: 30),
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
