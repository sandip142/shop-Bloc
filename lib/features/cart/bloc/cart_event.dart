import 'package:shop/features/Home/Model/home_data_model.dart';

abstract class CartEvent{}

class CartSuccessLoadevent extends CartEvent{}

class CartRemoveEvent extends CartEvent{
  final DataModel onClickedToRemove;
  CartRemoveEvent({required this.onClickedToRemove});
}