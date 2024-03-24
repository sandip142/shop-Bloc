import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/Home/bloc/home_bloc.dart';
import 'package:shop/features/Home/bloc/home_event.dart';
import 'package:shop/features/Home/bloc/home_state.dart';
import 'package:shop/features/Home/widget/product_tile.dart';
import 'package:shop/features/cart/ui/cart_page.dart';
import 'package:shop/features/whishlist/ui/whishlist_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    homeBloc.add(HomeIntialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HometNavigateToCart) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartPage(),
            ),
          );
        } else if (state is HometNavigateToWhishlist) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WhishlistPage(),
            ),
          );
        } else if (state is HomeAddedToCartShowSnackbar) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Added to cart"),
            ),
          );
        } else if (state is HomeAddedToWhishlistShowSnackbar) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Added to Whishlist"),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoaded:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedsuccces:
            final successLoad = state as HomeLoadedsuccces;
            return Scaffold(
              appBar: AppBar(
                title: const Text("sandip's Grocery"),
                backgroundColor: Colors.teal,
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductWhislistButtonNavigateEvent());
                    },
                    icon: const Icon(Icons.favorite),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductCartButtonNavigateEvent());
                    },
                    icon: const Icon(Icons.shopping_cart_outlined),
                  ),
                ],
              ),
              body: ListView.builder(
                  itemCount: successLoad.product.length,
                  itemBuilder: (context, index) {
                    return ProductTile(
                      dataModel: successLoad.product[index],
                      homeBloc: homeBloc,
                    );
                  }),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
