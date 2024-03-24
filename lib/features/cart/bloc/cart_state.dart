import 'package:shop/features/Home/Model/home_data_model.dart';

abstract class Cartstate{}

class CartIntial extends Cartstate{}

class CartSuccessState extends Cartstate{
 final List<DataModel> cartItem;
 CartSuccessState({required this.cartItem});
}

class CartAction extends Cartstate{}

class CartRemoveShowSnackbar extends CartAction{}