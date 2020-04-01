import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inovola_task/model/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:inovola_task/utils/colors.dart';
import 'package:inovola_task/widgets/image_slider.dart';
import 'package:scoped_model/scoped_model.dart';

class Trip extends StatefulWidget {


  DataModelController _model;
  Trip(this._model){
    //_model.fn_getData();
  }


  @override
  _TripState createState() => _TripState();
}

class _TripState extends State<Trip> {


  @override
  Widget build(BuildContext context) {


    print('${MediaQuery.of(context).size.width}  ddd ${MediaQuery.of(context).size.height}');

    return Scaffold(

      //scoped model
      body: ScopedModelDescendant<DataModelController>(builder: (BuildContext context,Widget child,DataModelController model){

        return Column(// build the screen
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ImageSlider(widget._model.OBJ.img),//lib->widgets  to display image slider
              _InformationBody(),// to display all info
              _BookingButton()// to display booking button
            ]);
      } ,)
    );
  }

// widget of the screen
////////////////////////////////////////
  Widget _BookingButton()
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      height:  MediaQuery.of(context).size.height*0.07,
      color: light_perpel,// from colors
      child: Center(child: Text("قم بالحجز الان",style: TextStyle(color: Colors.white,
          fontSize: ScreenUtil().setSp(20),fontWeight: FontWeight.bold),)),
    );
  }

  Widget _InformationBody()
  {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal:  ScreenUtil().setSp(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding:  EdgeInsets.all( ScreenUtil().setSp(14)),
                child: Center(
                  child: Text('${widget._model.OBJ.title}',
                    style: TextStyle(fontSize:  ScreenUtil().setSp(26),color: Colors.black,),
                    textDirection: TextDirection.rtl,),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal:  ScreenUtil().setSp(8),vertical:  ScreenUtil().setSp(2)),
                    child: Text('${_fn_formateDate(widget._model.OBJ.date)}',
                      style: TextStyle(fontSize:  ScreenUtil().setSp(14),color: Colors.black,),
                      textDirection: TextDirection.rtl,),
                  ),
                  Image.asset("assets/images/calender.png",width:  ScreenUtil().setSp(20),height:  ScreenUtil().setSp(20),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal:  ScreenUtil().setSp(8),vertical:  ScreenUtil().setSp(2)),
                    child: Text('${widget._model.OBJ.address}',
                      style: TextStyle(fontSize:  ScreenUtil().setSp(14),color: Colors.black,),
                      textDirection: TextDirection.rtl,),
                  ),
                  Image.asset("assets/images/pin.png",width:  ScreenUtil().setSp(16),height:  ScreenUtil().setSp(16),),
                ],
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: ScreenUtil().setSp(4)),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height:  ScreenUtil().setSp(0.5),
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal:  ScreenUtil().setSp(8),vertical:  ScreenUtil().setSp(2)),
                    child: Text('${widget._model.OBJ.trainerName}',
                      style: TextStyle(fontSize:  ScreenUtil().setSp(14),color: Colors.black,fontWeight: FontWeight.bold),
                      textDirection: TextDirection.rtl,),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: MediaQuery.of(context).size.width*0.05,
                    backgroundImage:NetworkImage(widget._model.OBJ.trainerImg,),),

                ],
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:  ScreenUtil().setSp(8),vertical:  ScreenUtil().setSp(2)),
                child: Text('${widget._model.OBJ.trainerInfo}',
                  style: TextStyle(fontSize:  ScreenUtil().setSp(14),color: Colors.black,),
                  textDirection: TextDirection.rtl,),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: ScreenUtil().setSp(4)),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height:  ScreenUtil().setSp(0.5),
                  color: Colors.black,
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:  ScreenUtil().setSp(8),vertical:  ScreenUtil().setSp(2)),
                child: Text('${widget._model.OBJ.interest}',
                  style: TextStyle(fontSize:  ScreenUtil().setSp(16),color: Colors.black,fontWeight: FontWeight.bold),
                  textDirection: TextDirection.rtl,),
              ),
              Text('${widget._model.OBJ.occasionDetail}',
                style: TextStyle(fontSize:  ScreenUtil().setSp(14),color: Colors.black,),
                textDirection: TextDirection.rtl,),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: ScreenUtil().setSp(4)),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height:  ScreenUtil().setSp(0.5),
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('${widget._model.OBJ.price} ريال ',
                    style: TextStyle(fontSize:  ScreenUtil().setSp(16),color: Colors.black,fontWeight: FontWeight.bold),
                    textDirection: TextDirection.rtl,),

                  Padding(
                    padding:  EdgeInsets.all( ScreenUtil().setSp(8)),
                    child: Text('تكلفة الحجز:',
                      style: TextStyle(fontSize:  ScreenUtil().setSp(16),color: Colors.black,fontWeight: FontWeight.bold),
                      textDirection: TextDirection.rtl,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


// functions
//////////////////////////////////
 String _fn_formateDate(String date)
  {
    // to remove t and z litters from the string
    date =date.substring(0,date.length-8);
    date = date.replaceAll('T', '  ');
    date = date.replaceAll('Z', '  ');
    print(date);
    int h = int.parse(date.substring(date.length-5,date.length-3));
    if(h>12)
      {
        date=date.replaceAll(h.toString(), (h-12).toString())+' مساءا ';
      }
    else
      {
        date=date+" صباحا ";
      }
    //print(h);

    return date;
  }



}
