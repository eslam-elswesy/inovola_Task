import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class ImageSlider extends StatefulWidget {

  List<dynamic> imgs ;//images from API

  ImageSlider(this.imgs);//constractor


  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {


  // to change the dots indecator
  int _current = 0;
  // to change the colors of buttons
  Color star=Colors.white;
  Color share=Colors.white;
  Color back=Colors.white;

  @override
  Widget build(BuildContext context) {

    return Stack(
        children: [
          _displayImages(context),// display the images
          Positioned(
              bottom: 0.0,
              left: 10,
              //right: 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(widget.imgs, (index, url) {
                  return Container(
                    width:  ScreenUtil().setSp(8),
                    height:  ScreenUtil().setSp(8),
                    margin: EdgeInsets.symmetric(vertical: ScreenUtil().setSp(10),
                        horizontal:  ScreenUtil().setSp(2)),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index ? Colors.white : Colors.grey
                    ),
                  );
                }),
              )
          ),//set the indecators dots
          Positioned(
              top:  ScreenUtil().setSp(20),
              left: 0.0,
              //right: 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                   icon: Icon(Icons.star_border,color: star,size:  ScreenUtil().setSp(30),),
                    iconSize:  ScreenUtil().setSp(25),
                    onPressed: (){
                     print("yes1");
                     setState(() {
                       star=Colors.deepPurple;
                     });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.share,color: share,size:  ScreenUtil().setSp(30),),
                    iconSize:  ScreenUtil().setSp(25),
                    onPressed: (){
                      print("yes2");
                      setState(() {
                        share=Colors.deepPurple;
                      });
                    },
                  )
                ],
              )
          ),//set the left buttons
          Positioned(
              top:  ScreenUtil().setSp(20),
              right: 0.0,
              //right: 0.0,
              child:IconButton(
                      icon: Icon(Icons.arrow_forward_ios,color: back,size:  ScreenUtil().setSp(20),),
                      iconSize:  ScreenUtil().setSp(25),
                      onPressed: (){
                        print("yes1");
                        setState(() {
                          back=Colors.deepPurple;
                        });
                      },
                   )
          ),//set right arrow button
        ]
    );
  }

  //help functons
  //////////////////////////////////////////

// dynamic count and generate the dots number of images
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

//create full screen Carousel with context
  CarouselSlider _displayImages(BuildContext mediaContext) {
    return CarouselSlider(
      autoPlay: true,
      viewportFraction: 1.0,
      onPageChanged: (index) {
        setState(() {
          _current = index;
        });
      },
      //aspectRatio: //MediaQuery.of(mediaContext).size.aspectRatio,
      items: widget.imgs.map(
            (url) {
             // print("url is $url");
          return Container(
            height: MediaQuery.of(context).size.height*0.5,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
              child: Image.network(url, fit: BoxFit.cover, width: 1000.0,height: 30,),
            ),
          );
        },
      ).toList(),
    );
  }
}