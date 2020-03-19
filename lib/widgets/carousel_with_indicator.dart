import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:seiyuu/widgets/seiyuu_image.dart';

class CarouselWithIndicator extends StatefulWidget {
  final List<String> imageUrls;

  CarouselWithIndicator({@required this.imageUrls});

  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    //Stack in order to place indicator on top of slider
    return Stack(
      children: [
        CarouselSlider(
          //time for transition between each picture
          autoPlayInterval: Duration(seconds: 5),
          //animation
          autoPlayCurve: Curves.fastOutSlowIn,
          //allows use to keep an image still
          pauseAutoPlayOnTouch: Duration(seconds: 10),
          //focus on current picture
          enlargeCenterPage: true,
          items: widget.imageUrls.map(
            (url) {
              //The image in the carousel
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 3),
                child: SeiyuuImage(imageUrl: url),
              );
            },
          ).toList(), //child,
          autoPlay: true,
          //remember to set VERTICAL aspect ratio, since most agency photos are vertical
          aspectRatio: 1.0, //7 / 8, // 9 / 16, //2.0,
          onPageChanged: (index) {
            setState(() {
              _current = index;
            });
          },
        ),

        //The indicator circles
        Positioned(
          //top: 0.0,
          left: 0.0,
          right: 0.0,
          bottom: 5.0, // move the indicator dots up a little from the bottom
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //Create one indicator dot for each url, by using the map
            children: widget.imageUrls.map((url) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == widget.imageUrls.indexOf(url) //index
                        //if selected, use stronger and less opaque color
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        //if not selected, use weaker and more opaque color
                        : Color.fromRGBO(0, 0, 0, 0.4)),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
