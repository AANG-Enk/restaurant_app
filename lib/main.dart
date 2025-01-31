import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/style.dart';
import 'package:restaurant_app/config/config_api.dart';
import 'package:restaurant_app/config/config_font.dart';
import 'package:restaurant_app/config/config_theme.dart';
import 'package:restaurant_app/screen/HomeScreen.dart';
import 'package:restaurant_app/screen/SearchScreen.dart';
import 'package:restaurant_app/screen/SettingScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final configTheme = ConfigTheme();
  final configFont = ConfigFont();
  final configApi = ConfigApi();
  await configTheme.loadTheme();
  await configFont.loadFont();
  await configApi.getListRestaurant();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => configTheme,
        ),
        ChangeNotifierProvider(
          create: (context) => configFont,
        ),
        ChangeNotifierProvider(
          create: (context) => configApi,
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final configTheme = Provider.of<ConfigTheme>(context);
    return MaterialApp(
      title: 'Makan Yuks',
      debugShowCheckedModeBanner: false,
      theme: myLightTheme,
      darkTheme: myDarkTheme,
      themeMode: configTheme.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: BottomNavScreen(),
    );
  }
}

class BottomNavScreen extends StatefulWidget{
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen>{
  int selectedPage = 0;
  final PageController _pageController = PageController();
  final List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(),
    SettingScreen(),
  ];

  void onPage(int index){
    setState(() {
      selectedPage = index;
    });
  }

  void onNavItem(int index){
    setState((){
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final configTheme = Provider.of<ConfigTheme>(context);
    final configFont = Provider.of<ConfigFont>(context);
    bool isDarkMode = configTheme.isDarkMode;
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: onPage,
        children: _pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 55.0,
        color: isDarkMode ? darkSecondaryColor : lightSecondaryColor, 
        backgroundColor: isDarkMode ? darkPrimaryColor : lightPrimaryColor, 
        buttonBackgroundColor: isDarkMode ? darkSecondaryColor : lightSecondaryColor,
        animationDuration: const Duration(milliseconds: 300),
        items: const <Widget>[
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(FontAwesomeIcons.house, size: 30.0,),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(FontAwesomeIcons.search, size: 30.0,),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(FontAwesomeIcons.cogs, size: 30.0,),
          ),
        ],
        onTap: onNavItem
      )
    );
  }
}