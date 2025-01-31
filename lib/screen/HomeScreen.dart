import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/style.dart';
import 'package:restaurant_app/config/config_api.dart';
import 'package:restaurant_app/config/config_font.dart';
import 'package:restaurant_app/config/config_theme.dart';
import 'package:restaurant_app/helper/link.dart';

class HomeScreen extends StatelessWidget{
  HomeScreen({super.key});
  final Link _configLink = new Link();
  @override
  Widget build(BuildContext context) {
    final configTheme = Provider.of<ConfigTheme>(context);
    final configFont = Provider.of<ConfigFont>(context);
    final configApi = Provider.of<ConfigApi>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              children: [
                Text(
                  'Restaurant',
                  style: myTextTheme(configFont.font).headlineLarge,
                ),
                Text(
                  'Recomendation restaurant for you!',
                  style: myTextTheme(configFont.font).bodySmall,
                )
              ],
            ),
          ),
          const SizedBox(height: 20.0,),
          if(configApi.isLoading)...[
            const Center(
              child: CircularProgressIndicator(),
            )
          ]else if(configApi.lists.isEmpty)...[
            Center(
              child: ElevatedButton(
                onPressed: (){
                  configApi.getListRestaurant();
                },
                child: Text(
                  'Load Restaurant',
                  style: myTextTheme(configFont.font).headlineMedium,
                ),
              ),
            ),
          ]else...[
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: configApi.lists.length,
              itemBuilder: (context, index) {
                final restaurant = configApi.lists[index];
                print("City : ${restaurant.city}");
                return Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  shadowColor: configTheme.isDarkMode ? darkSecondaryColor : lightSecondaryColor,
                  color: configTheme.isDarkMode ? darkSecondaryColor : lightSecondaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 35.0,
                          backgroundImage: _configLink.getLinkImage('small', restaurant.pictureId),
                          backgroundColor: configTheme.isDarkMode ? darkBlackColor : lightBlackColor,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                restaurant.name,
                                style: myTextTheme(configFont.font).titleLarge
                              ),
                              const SizedBox(height: 5.0,),
                              Text(
                                restaurant.city,
                                style: myTextTheme(configFont.font).titleMedium
                              ),
                              Row(
                                children: [
                                  RatingBar.builder(
                                    initialRating: restaurant.rating,
                                    minRating: 1.0,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 15.0,
                                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (val){
                                      print("Rating : ${val}");
                                    },
                                  ),
                                  Text(
                                    '(${restaurant.rating.toString()})',
                                    style: myTextTheme(configFont.font).titleMedium,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}