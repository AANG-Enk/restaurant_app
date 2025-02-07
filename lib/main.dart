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
import 'package:restaurant_app/services/api_services.dart';

class BottomNavigationProvider extends ChangeNotifier{
  int _selectedPage = 0;
  final PageController _pageController = PageController();

  int get selectedPage => _selectedPage;
  PageController get pageController => _pageController;

  void activePage(int index) {
    if(_selectedPage != index){
      _selectedPage = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }

  void jumpPage(int index){
    _selectedPage = index;
    _pageController.jumpToPage(index);
    notifyListeners();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bottomNavProvider = BottomNavigationProvider();
  final configTheme = ConfigTheme();
  final configFont = ConfigFont();
  final configApi = ConfigApi(ApiServices());
  await configTheme.loadTheme();
  await configFont.loadFont();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => bottomNavProvider,
        ),
        ChangeNotifierProvider(
          create: (context) => configTheme,
        ),
        ChangeNotifierProvider(
          create: (context) => configFont,
        ),
        ChangeNotifierProvider(
          create: (context) => configApi,
        ),
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

class BottomNavScreen extends StatelessWidget{
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final configTheme = Provider.of<ConfigTheme>(context);
    final navigationProvider = Provider.of<BottomNavigationProvider>(context);
    bool isDarkMode = configTheme.isDarkMode;
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: navigationProvider.pageController,
          onPageChanged: (index){
            navigationProvider.activePage(index);
          },
          children: [
            HomeScreen(),
            SearchScreen(),
            SettingScreen()
          ],
        ),
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
        index: navigationProvider.selectedPage,
        onTap: (index){
          navigationProvider.jumpPage(index);
        },
      )
    );
  }

}