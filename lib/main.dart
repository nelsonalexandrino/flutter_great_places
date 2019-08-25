import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/great_places_provider.dart';

import './screens/place_list_screen.dart';
import './screens/add_edit_place_screen.dart';
import './screens/place_details_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlacesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Great places',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PlacesListScreen(),
        routes: {
          AddEditPlaceScreen.routeName: (context) => AddEditPlaceScreen(),
          PlaceDetailScreen.routeName: (context) => PlaceDetailScreen(),
        },
      ),
    );
  }
}
