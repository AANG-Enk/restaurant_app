import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/style.dart';
import 'package:restaurant_app/config/config_api.dart';
import 'package:restaurant_app/config/config_font.dart';
import 'package:restaurant_app/config/config_theme.dart';
import 'package:restaurant_app/helper/link.dart';
import 'package:restaurant_app/screen/DetailScreen.dart';

class SearchScreen extends StatelessWidget{
  SearchScreen({super.key});
  final TextEditingController _searchController = TextEditingController();
  final Link _configLink = new Link();
  @override
  Widget build(BuildContext context) {
    final configTheme = Provider.of<ConfigTheme>(context);
    final configFont = Provider.of<ConfigFont>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Search',
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              hintText: 'Masukkan Kata',
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              labelStyle: TextStyle(color: configTheme.isDarkMode ? lightPrimaryColor : darkPrimaryColor),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: configTheme.isDarkMode ? lightPrimaryColor : darkPrimaryColor, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: (value){
              context.read<ConfigApi>().searchByNameRestaurant(context, value);
            },
          ),
          const SizedBox(height: 10.0,),
          Text('Daftar Restaurant',style: myTextTheme(configFont.font).headlineSmall,),
          const SizedBox(height: 10.0,),
          Expanded(
            child: Selector<ConfigApi, bool>(
              selector: (_, provider) => provider.isSearchLoading,
              builder: (context, isSearchLoading, child){
                if(isSearchLoading){
                  return const Center(child: CircularProgressIndicator(),);
                }
                return Consumer<ConfigApi>(
                  builder: (context, provider, child){
                    if(provider.listRestaurant.isEmpty){
                      return Center(child: Text('Restaurant Tidak Ditemukan', style: myTextTheme(configFont.font).titleLarge,));
                    }
                    return ListView.builder(
                      itemCount: provider.listRestaurant.length,
                      itemBuilder: (context, index){
                        final restaurant = provider.listRestaurant.elementAt(index);
                        return GestureDetector(
                          onTap: (){
                            context.read<ConfigApi>().getDetailRestaurant(restaurant.id);
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
                  }
                );
              },
            ),
          )
        ],
      ),
    );
  }
}