import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/business/bloc/favorite/favorite_bloc.dart';
import 'package:negadras/business/screens/widgets/business_card.dart';
import 'package:negadras/routes/router.gr.dart';
import 'package:negadras/utils/bottom_nav_bar.dart';
import 'package:auto_route/auto_route.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      FavoriteBloc favoriteBloc = BlocProvider.of<FavoriteBloc>(context);
      favoriteBloc.add(ShowFavoritesEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteBloc = BlocProvider.of<FavoriteBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(20, 40, 65, 1),
        centerTitle: true,
        title: Text(
          "Favorites",
          style: TextStyle(color: Colors.amberAccent),
        ),
      ),
      bottomNavigationBar: ownerBottomNav(context, 1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: BlocBuilder<FavoriteBloc, FavoriteState>(
                builder: (context, state) {
                  print("favorites page state: $state");
                  if (state is FavoriteInitial) {
                    favoriteBloc.add(ShowFavoritesEvent());
                  } else if (state is NoFavoriteState) {
                    return Center(
                      child: Text("You have no favorite businesses"),
                    );
                  } else if (state is FavoriteSuccess) {
                    return ListView.builder(
                      itemCount: state.businessList.length,
                      itemBuilder: (context, i) {
                        return BusinessCard(
                          from: (_) {
                            favoriteBloc.add(RemoveFromFavoritesEvent(
                                state.businessList[i].id));
                            context.router.popAndPush(FavoritesRoute());
                          },
                          businessId: state.businessList[i].id,
                          businessName: state.businessList[i].name,
                          rating:
                              2.5, //Get the review repo and pass the business id
                          locationInfo: state.businessList[i].location,
                          imagePath: 'assets/images/macbook.jpg',
                          isFavorite: state.businessList[i].isFavorite ?? false,
                        );
                      },
                    );
                  }

                  if (state is FavoriteFailure) {
                    return Center(
                      child: Text("Failed to retrieve Favorites"),
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
