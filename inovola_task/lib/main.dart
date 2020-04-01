import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inovola_task/screens/splash.dart';
import 'package:inovola_task/screens/trip.dart';
import 'package:scoped_model/scoped_model.dart';

import 'model/data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // creat obj _model to represent the Data model
  final  DataModelController _model = DataModelController();



  @override
  Widget build(BuildContext context) {

    //to stop screen rotation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    _model.fn_getData();


    return ScopedModel<DataModelController>(
      model: _model,
      child: MaterialApp(
        title: 'InoVola test',


        routes: {
          // i'm passing the model to wrap the data Up to show it into the screen
          '/trip':(context)=>Trip(_model),
          '/':(context)=>Splash(_model)
        },

        debugShowCheckedModeBanner: false,
      ) ,
    );
  }
}
