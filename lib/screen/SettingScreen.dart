import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/style.dart';
import 'package:restaurant_app/config/config_font.dart';
import 'package:restaurant_app/config/config_theme.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});
  final dropDownKey = GlobalKey<DropdownSearchState>();

  List<String> fonts = [
    'Lato', 'Roboto', 'Roboto Condensed', 'Poppins', 'Open Sans', 'Montserrat'
  ];

  List<String> colors = [
    'Merah','Kuning','Hijau','Biru','Cokelat',
  ];
  @override
  Widget build(BuildContext context) {
    final configTheme = Provider.of<ConfigTheme>(context);
    final configFont = Provider.of<ConfigFont>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Pengaturan',
          style: myTextTheme(configFont.font).displaySmall,
        ),
        const SizedBox(
          height: 20.0,
        ),
        SizedBox(
          width: double.infinity,
          child: Container(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              shadowColor: configTheme.isDarkMode ? darkSecondaryColor : lightSecondaryColor,
              color: configTheme.isDarkMode ? darkSecondaryColor : lightSecondaryColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mode Gelap',
                          style: myTextTheme(configFont.font).labelLarge,
                        ),
                        Switch(
                          value: configTheme.isDarkMode, 
                          onChanged: (value){
                            configTheme.swithTheme();
                          },
                          activeColor: configTheme.isDarkMode ? darkPrimaryColor : lightPrimaryColor,
                          activeTrackColor: Colors.green,
                          inactiveThumbColor: Colors.black,
                          inactiveTrackColor: Colors.grey,
                        )
                      ],
                    ),
                    Divider(
                      color: configTheme.isDarkMode ? darkWhiteColor : lightWhiteColor,
                      thickness: 1.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tipe Font',
                          style: myTextTheme(configFont.font).labelLarge,
                        ),
                        const SizedBox(width: 15.0,),
                        Expanded(
                          child: DropdownButtonFormField(
                            value: configFont.font,
                            decoration: const InputDecoration(
                              labelText: 'Pilih Font',
                              border: OutlineInputBorder(),
                            ),
                            items: fonts.map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(item, style: myTextTheme(configFont.font).titleMedium,),
                            )).toList(), 
                            onChanged: (value){
                              configFont.changeFont(value!);
                            }
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          'Restaurant App ver. 1.0.0',
          style: myTextTheme(configFont.font).titleSmall,
        ),
        Text(
          'Created by : Farhan Mohaemin Saparidja',
          style: myTextTheme(configFont.font).titleSmall,
        ),
        Text(
          'Dicoding Belajar Fundamental Aplikasi Flutter',
          style: myTextTheme(configFont.font).titleSmall,
        )
      ],
    ); 
  }
}