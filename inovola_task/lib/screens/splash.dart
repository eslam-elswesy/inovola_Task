import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inovola_task/model/data.dart';
import 'package:inovola_task/utils/colors.dart';

class Splash extends StatefulWidget {


  DataModelController _model;//get the model
  Splash(this._model){
    print("const1");
     //get the data  into the  model to wrap the data up to fast the response of code
  }

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds:6), () {// to make splash screen for 6 s
      print('goooooooo');
      Navigator.of(context).pushReplacementNamed('/trip');
    });
  }

  @override
  Widget build(BuildContext context) {


    // is awesome package make the design fit all screen sizes more than 3.7 approxi
    ScreenUtil.init(context, width: 411, height: 797, allowFontScaling: true);


    return Scaffold(
      //show the screen of splash
        body: Container(
              height:MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: light_gray,
              child: Image.asset("assets/images/splash.jpg",
              width: ScreenUtil().setWidth(200),
                height: ScreenUtil().setHeight(200),
              )
        )
    );
  }
}
