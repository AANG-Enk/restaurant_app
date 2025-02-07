import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/style.dart';
import 'package:restaurant_app/config/config_api.dart';
import 'package:restaurant_app/config/config_font.dart';
import 'package:restaurant_app/config/config_theme.dart';
import 'package:restaurant_app/helper/link.dart';
import 'package:restaurant_app/screen/DetailScreen.dart';
import 'package:restaurant_app/utils/api_result.dart';

class HomeScreen extends StatelessWidget{
  HomeScreen({super.key});
  final Link _configLink = new Link();
  @override
  Widget build(BuildContext context) {
    final configTheme = Provider.of<ConfigTheme>(context);
    final configFont = Provider.of<ConfigFont>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
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
          Consumer<ConfigApi>(
            builder: (context, provider, child){
              if(provider.listRestaurants is Loading){
                return const Center(child: CircularProgressIndicator(),);
              }
              if(provider.listRestaurants is Error){
                final message = (provider.listRestaurants as Error).message;
                return Center(child: Text(message, style: myTextTheme(configFont.font).bodyMedium,),);
              }
              if(provider.listRestaurants is Success){
                var data = (provider.listRestaurants as Success).data;
                if(data.isEmpty){
                  return const Center(child: Text('Tidak Ada Data Restaurant'),); 
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final restaurant = data[index];
                    return GestureDetector(
                      onTap: (){
                        context.read<ConfigApi>().getRestaurant(restaurant.id);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Detailscreen(id: restaurant.id)));
                      },
                      child: Card(
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
                                backgroundImage: restaurant.pictureId != null ? _configLink.getLinkImage('small', restaurant.pictureId!) : const NetworkImage('https://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg'),
                                backgroundColor: configTheme.isDarkMode ? darkBlackColor : lightBlackColor,
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      restaurant.name != null ? restaurant.name! : 'Tidak Diketahui',
                                      style: myTextTheme(configFont.font).titleLarge
                                    ),
                                    const SizedBox(height: 5.0,),
                                    Text(
                                      restaurant.city != null ? restaurant.city! : 'Tidak Diketahui',
                                      style: myTextTheme(configFont.font).titleMedium
                                    ),
                                    Row(
                                      children: [
                                        RatingBar.builder(
                                          initialRating: restaurant.rating != null ? restaurant.rating! : 0.0,
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
                      ),
                    );
                  },
                );
              }else{
                return Center(child: Text('Data Tidak Ada', style: myTextTheme(configFont.font).bodyLarge,),);
              }
            }
          )
        ],
      ),
    );
  }
}