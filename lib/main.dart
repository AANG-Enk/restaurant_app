import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/style.dart';
import 'package:restaurant_app/config/config_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ConfigTheme(),
      child: Consumer<ConfigTheme>(
        builder: (context, configTheme, child){
          return MaterialApp(
            title: 'Makan Yuks',
            debugShowCheckedModeBanner: false,
            theme: myLightTheme,
            darkTheme: myDarkTheme,
            themeMode: configTheme.thememode,
            home: HomeScreen(),
          );
        }
      ),
    );
  }
}

class HomeScreen extends StatelessWidget{
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final themeConfig = Provider.of<ConfigTheme>(context);
    bool isDark = themeConfig.thememode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Makan Yuks', style: myTextTheme.headlineLarge),
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(isDark 
                  ? FontAwesomeIcons.sun 
                  : FontAwesomeIcons.moon),
                onPressed: () {
                  themeConfig.swithTheme(!isDark);
                },
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: (){
                  print('Tombol pencarian ditekan');
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}