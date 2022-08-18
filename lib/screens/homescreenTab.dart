import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zerobalance/constants/size_config.dart';
import 'package:zerobalance/main.dart';
import 'package:zerobalance/screens/homescreen.dart';
import 'package:zerobalance/screens/noNetworkScreen.dart';
import 'package:zerobalance/utils/connectivityService.dart';
import 'package:zerobalance/utils/customAppBar.dart';

class HomeScreenTab extends ConsumerStatefulWidget {
  const HomeScreenTab({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreenTab> createState() => _HomeScreenTabState();
}

class _HomeScreenTabState extends ConsumerState<HomeScreenTab> {
  int _currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.watch(connectionProvider.stream),
        builder: (context, snapshot) {
          final connectivityResult = snapshot.data;
          debugPrint(snapshot.data.toString());
          // if (connectivityResult == ConnectivityResult.none ||
          //     connectivityResult == null) {
          //   return NoNetworkScreen();
          // }
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: customAppBar(context),
            bottomNavigationBar: BottomBar(
                barColor: Colors.transparent,
                width: SizeConfig.screenWidth * 0.9,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 5)
                      ]),
                  child: BottomNavyBar(
                    curve: Curves.ease,
                    selectedIndex: _selectedIndex,
                    showElevation:
                        true, // use this to remove appBar's elevation
                    onItemSelected: (index) => setState(() {
                      _selectedIndex = index;
                      _pageController.animateToPage(index,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.fastOutSlowIn);
                    }),
                    items: [
                      BottomNavyBarItem(
                        icon: Icon(Icons.home),
                        title: Text('Home'),
                        inactiveColor: Colors.grey,
                        activeColor: Color.fromARGB(254, 48, 63, 159),
                      ),
                      BottomNavyBarItem(
                          icon: Icon(Icons.people),
                          title: Text('Card'),
                          inactiveColor: Colors.grey,
                          activeColor: Color.fromARGB(254, 48, 63, 159)),
                      BottomNavyBarItem(
                          icon: Icon(Icons.message),
                          title: Text('Analytics'),
                          inactiveColor: Colors.grey,
                          activeColor: Color.fromARGB(254, 48, 63, 159)),
                      BottomNavyBarItem(
                          icon: Icon(Icons.settings),
                          title: Text('Offers'),
                          inactiveColor: Colors.grey,
                          activeColor: Color.fromARGB(254, 48, 63, 159)),
                    ],
                  ),
                ),
                body: (context, controller) {
                  return SizedBox(
                    height: SizeConfig.screenHeight * 0.87,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() => _currentIndex = index);
                      },
                      children: <Widget>[
                        HomeScreen(),
                        Container(
                          color: Colors.red,
                        ),
                        Container(
                          color: Colors.green,
                        ),
                        Container(
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  );
                }),
          );
        });
  }
}
