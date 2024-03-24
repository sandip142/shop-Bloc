import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/data/cart_add.dart';
import 'package:shop/features/cart/bloc/cart_event.dart';
import 'package:shop/features/cart/bloc/cart_state.dart';

class CartBloc extends Bloc<CartEvent, Cartstate> {
  CartBloc() : super(CartIntial()) {
    on<CartSuccessLoadevent>((event, emit) {
      emit(
        CartSuccessState(cartItem: cartlist),
      );
    });

    on<CartRemoveEvent>((event, emit) {
      cartlist.remove(event.onClickedToRemove);
      emit(
        CartSuccessState(cartItem: cartlist),
      );
      emit(CartRemoveShowSnackbar());
    });
  }
}
