import 'package:shop/features/Home/Model/home_data_model.dart';

abstract class HomeState{}

class HomeInitial extends HomeState{}

class HomeLoaded extends HomeState{}

class HomeLoadedsuccces extends HomeState{
  final List<DataModel> product;
  HomeLoadedsuccces({required this.product});
}

class HomeError extends HomeState{}

//from here HomeAction state extends
class HomeActionState extends HomeState{}

class HometNavigateToCart extends HomeActionState{}

class HometNavigateToWhishlist extends HomeActionState{}

class HomeAddedToCartShowSnackbar extends HomeActionState{}

class HomeAddedToWhishlistShowSnackbar extends HomeActionState{}

