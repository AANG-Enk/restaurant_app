import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/style.dart';
import 'package:restaurant_app/config/config_api.dart';
import 'package:restaurant_app/config/config_font.dart';
import 'package:restaurant_app/config/config_theme.dart';
import 'package:restaurant_app/helper/link.dart';
import 'package:restaurant_app/utils/api_result.dart';

class Detailscreen extends StatelessWidget {
  Detailscreen({super.key, required this.id});
  final String id;
  final Link _configLink = new Link();
  @override
  Widget build(BuildContext context) {
    final configTheme = Provider.of<ConfigTheme>(context);
    final configFont = Provider.of<ConfigFont>(context);
    final submitState = context.watch<ConfigApi>().addRiview;
    final textFieldProvider = Provider.of<ConfigApi>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Consumer<ConfigApi>(
          builder: (context, provider, child){
            if(provider.restaurant is Loading){
              return const Center(child: CircularProgressIndicator(),);
            }else if(provider.restaurant is Error){
              final message = (provider.restaurant as Error).message;
              return Center(child: Text(message, style: myTextTheme(configFont.font).bodyMedium,),);
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
                                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                              Consumer<ConfigApi>(
                                builder: (context, provider, child){
                                  return TextField(
                                    controller: provider.nameController,
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
                                  );
                                }
                              ),
                              const SizedBox(height: 15.0,),
                              Consumer<ConfigApi>(
                                builder: (context, provider, child){
                                  return TextField(
                                    controller: provider.reviewController,
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
                                  );
                                }
                              ),
                              const SizedBox(height: 15.0,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: submitState is Loading 
                                      ? null
                                      : () async {
                                        String name = textFieldProvider.nameController.text.trim();
                                        String review = textFieldProvider.reviewController.text.trim();
                      
                                        if (name.isNotEmpty && review.isNotEmpty) {
                                          try {
                                            await context.read<ConfigApi>().addReviewRestaurant(id, name, review);
                                            textFieldProvider.cleartext();
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(content: Text('Berhasil Menambahkan Review')),
                                            );
                                          } catch (e) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(content: Text('Gagal Menambahkan Review')),
                                            );
                                          }
                                        }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: configTheme.isDarkMode ? Colors.orange[800] : Colors.blue,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: const EdgeInsets.symmetric(vertical: 15),
                                    ),
                                    child: submitState is Loading
                                      ? const CircularProgressIndicator()
                                      : Text('Submit', style: myTextTheme(configFont.font).labelLarge),
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
              return Center(child: Text('Tidak Ada Data', style: myTextTheme(configFont.font).bodyLarge,),);
            }
          },
        ),
      ),
    );
  }
}