import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/style.dart';
import 'package:restaurant_app/config/config_api.dart';
import 'package:restaurant_app/config/config_font.dart';
import 'package:restaurant_app/config/config_theme.dart';
import 'package:restaurant_app/helper/link.dart';
import 'package:restaurant_app/model/detail_restaurant.dart';
import 'package:restaurant_app/utils/api_result.dart';

class Detailscreen extends StatelessWidget {
  Detailscreen({super.key, required this.id});
  final String id;
  final Link _configLink = new Link();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final configTheme = Provider.of<ConfigTheme>(context);
    final configFont = Provider.of<ConfigFont>(context);
    final submitState = context.watch<ConfigApi>().addRiview;
    return Consumer<ConfigApi>(
      builder: (context, provider, child){
        if(provider.restaurant is Loading){
          return const Center(child: CircularProgressIndicator(),);
        }else if(provider.restaurant is Error){
          return const Center(child: Text('Internal Server Error'),);
        }else if(provider.restaurant is Success){
          var data = (provider.restaurant as Success).data;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: data.pictureId != null ? _configLink.getLinkImage('small', data.pictureId!) : const NetworkImage('https://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg'),
                    height: 250.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Table(
                        columnWidths: const {
                          0:IntrinsicColumnWidth(),
                          1:IntrinsicColumnWidth(),
                          2:IntrinsicColumnWidth(),
                        },
                        children: [
                          TableRow(children: [
                            Text('Restaurant', style: myTextTheme(configFont.font).labelMedium,),
                            Text(':', style: myTextTheme(configFont.font).labelMedium,),
                            Text(data.name != null ? data.name! : 'Tidak Diketahui', style: myTextTheme(configFont.font).bodyLarge,)
                          ]),
                          TableRow(children: [
                            Text('Rating', style: myTextTheme(configFont.font).labelMedium,),
                            Text(':', style: myTextTheme(configFont.font).labelMedium,),
                            Text(data.rating != null ? data.rating.toString() : 'Tidak Diketahui', style: myTextTheme(configFont.font).bodyLarge,)
                          ]),
                          TableRow(children: [
                            Text('Kota', style: myTextTheme(configFont.font).labelMedium,),
                            Text(':', style: myTextTheme(configFont.font).labelMedium,),
                            Text(data.city != null ? data.city! : 'Tidak Diketahui', style: myTextTheme(configFont.font).bodyLarge,)
                          ]),
                          TableRow(children: [
                            Text('Alamat', style: myTextTheme(configFont.font).labelMedium,),
                            Text(':', style: myTextTheme(configFont.font).labelMedium,),
                            Text(data.address != null ? data.address! : 'Tidak Diketahui', style: myTextTheme(configFont.font).bodyLarge,)
                          ]),
                          TableRow(children: [
                            Text('Deskripsi', style: myTextTheme(configFont.font).labelMedium,),
                            Text(':', style: myTextTheme(configFont.font).labelMedium,),
                            Text(data.description != null ? data.description! : 'Tidak Diketahui', style: myTextTheme(configFont.font).bodyLarge,)
                          ]),
                          TableRow(children: [
                            Text('Kateori', style: myTextTheme(configFont.font).labelMedium,),
                            Text(':', style: myTextTheme(configFont.font).labelMedium,),
                            Text(data.categories != null ? data.categories!.map((item) => item.name).join(', ') : 'Tidak Diketahui', style: myTextTheme(configFont.font).bodyLarge,)
                          ])
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Menu', style: myTextTheme(configFont.font).headlineMedium,),
                      Text('Makanan', style: myTextTheme(configFont.font).bodyLarge,),
                      SizedBox(
                        height: 120.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.menus!.foods.length,
                          itemBuilder: (context, index) {
                            final menu_food = data.menus!.foods.elementAt(index);
                            return Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              shadowColor: configTheme.isDarkMode ? darkSecondaryColor : lightSecondaryColor,
                              color: configTheme.isDarkMode ? darkSecondaryColor : lightSecondaryColor,
                              child: Container(
                                width: 200,
                                height: 120,
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Icon(
                                        Icons.fastfood,
                                        size: 40,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      menu_food.name,
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Text('Minuman', style: myTextTheme(configFont.font).bodyLarge,),
                      SizedBox(
                        height: 120.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.menus!.drinks.length,
                          itemBuilder: (context, index) {
                            final menu_drink = data.menus!.drinks.elementAt(index);
                            return Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              shadowColor: configTheme.isDarkMode ? darkSecondaryColor : lightSecondaryColor,
                              color: configTheme.isDarkMode ? darkSecondaryColor : lightSecondaryColor,
                              child: Container(
                                width: 200,
                                height: 120,
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Icon(
                                        Icons.fastfood,
                                        size: 40,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      menu_drink.name,
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tambah Review', style: myTextTheme(configFont.font).headlineMedium,),
                      Column(
                        children: [
                          TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'Nama',
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              hintText: 'Masukkan Nama',
                              border: const OutlineInputBorder(),
                              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                              labelStyle: TextStyle(color: configTheme.isDarkMode ? lightPrimaryColor : darkPrimaryColor),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: configTheme.isDarkMode ? lightPrimaryColor : darkPrimaryColor, width: 2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15.0,),
                          TextField(
                            controller: _reviewController,
                            maxLines: 5,
                            decoration: InputDecoration(
                              labelText: 'Masukkan Review',
                              floatingLabelBehavior: FloatingLabelBehavior.auto, 
                              labelStyle: TextStyle(color: configTheme.isDarkMode ? lightPrimaryColor : darkPrimaryColor),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: configTheme.isDarkMode ? lightPrimaryColor : darkPrimaryColor, width: 2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15.0,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: switch(submitState){
                                  Loading() => null,
                                  _ => () async{
                                    String name = _nameController.text.trim();
                                    String review = _reviewController.text.trim();
      
                                    if (name.isNotEmpty && review.isNotEmpty) {
                                      try {
                                        await context.read<ConfigApi>().addReviewRestaurant(id, name, review);
                                        _nameController.clear();
                                        _reviewController.clear();
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: const Text('Berhasil Menambahkan Review'))
                                        );
                                      } catch (e) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: const Text('Gagal Menambahkan Review'))
                                        );
                                      }
                                      
                                    }
                                  },
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: configTheme.isDarkMode ? Colors.orange[800] : Colors.blue,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                ),
                                child: switch(submitState){
                                  Loading() => const Center(child: CircularProgressIndicator(),),
                                  _ => Text('Submit',style: myTextTheme(configFont.font).labelLarge,),
                                },
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 20.0,),
                      Text('Daftar Review', style: myTextTheme(configFont.font).headlineMedium,),
                      ListView.builder(
                        itemCount: data.customerReviews!.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final riview_restaurant = data.customerReviews!.elementAt(index);
                          return Card(
                            shadowColor: configTheme.isDarkMode ? darkSecondaryColor : lightSecondaryColor,
                            color: configTheme.isDarkMode ? darkSecondaryColor : lightSecondaryColor,
                            elevation: 2,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor: Colors.blueAccent,
                                        child: Icon(Icons.person, color: Colors.white),
                                      ),
                                      const SizedBox(width: 10.0),
                                      Text(riview_restaurant.name, style: myTextTheme(configFont.font).labelLarge),
                                    ],
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(riview_restaurant.review, style: myTextTheme(configFont.font).labelMedium),
                                  const SizedBox(height: 5.0),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(riview_restaurant.date, style: myTextTheme(configFont.font).labelSmall),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }else{
          return const Center(child: Text('Tidak Ada Data'),);
        }
      },
    );
  }
}