import 'package:elthor/src/providers/bottom_nav_provider.dart';
import 'package:elthor/src/screens/map_screen.dart';
import 'package:elthor/src/screens/ride_insights.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BottomNavProvider>(
        builder: (context,state,_) {
          return IndexedStack(
            index: state.currentIndex,
            children: const [
              MapView(),
              RideInsights()
            ],
          );
        }
      ),
      bottomNavigationBar: Consumer<BottomNavProvider>(
        builder: (context,state,_) {
          return BottomNavigationBar(
            currentIndex: state.currentIndex,
            selectedItemColor: const Color(0xff393185),
            onTap: (value) {
              context.read<BottomNavProvider>().changeIndex = value;
            },
            items: const [
            BottomNavigationBarItem(
              label: 'Find',
              icon: FaIcon(FontAwesomeIcons.locationArrow)),
            BottomNavigationBarItem(
              label: 'Ride Insights',
              icon: FaIcon(FontAwesomeIcons.road))
          ]);
        }
      ),
    );
  }
}