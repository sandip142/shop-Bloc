import 'package:shop/features/Home/Model/home_data_model.dart';

abstract class HomeEvent{}

class HomeIntialEvent extends HomeEvent{}

class HomeProductCartButtomClickedEvent extends HomeEvent {
  final DataModel clickedAddToCart;
  HomeProductCartButtomClickedEvent({required this.clickedAddToCart});
}

class HomeProductWishlistButtomClickedEvent extends HomeEvent {
     final DataModel clickedAddToWhishlist;
  HomeProductWishlistButtomClickedEvent({required this.clickedAddToWhishlist});
}

class HomeProductCartButtonNavigateEvent extends HomeEvent{}

class HomeProductWhislistButtonNavigateEvent extends HomeEvent{}

