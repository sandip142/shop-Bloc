import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/data/cart_add.dart';
import 'package:shop/data/grocery_data.dart';
import 'package:shop/data/whishlist_add.dart';
import 'package:shop/features/Home/Model/home_data_model.dart';
import 'package:shop/features/Home/bloc/home_event.dart';
import 'package:shop/features/Home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeIntialEvent>((event, emit) async {
      emit(HomeLoaded());
      await Future.delayed(const Duration(seconds: 3));
      emit(
        HomeLoadedsuccces(
          product: GroceryData.groceryProducts
            .map((e) => DataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()
        ),
      );
    });

    on<HomeProductCartButtomClickedEvent>((event, emit) {
      print('cart clicked');
      cartlist.add(event.clickedAddToCart);
      emit(HomeAddedToCartShowSnackbar());
    });

    on<HomeProductWishlistButtomClickedEvent>((event, emit) {
      print('whishlist clicked');
      whishlist.add(event.clickedAddToWhishlist);
      emit(HomeAddedToWhishlistShowSnackbar());
    });

    on<HomeProductCartButtonNavigateEvent>((event, emit) {
      emit(HometNavigateToCart());
    });

    on<HomeProductWhislistButtonNavigateEvent>((event, emit) {
      emit(HometNavigateToWhishlist());
    });
  }
}
