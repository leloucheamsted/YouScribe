import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_run/common/constants/constants.dart';
import 'package:test_run/common/widget/editor.widget.dart';
import 'package:test_run/modules/home/domain/entity/editorial_presentation.entity.dart';
import 'package:test_run/modules/home/domain/entity/home.entity.dart';

class EditorList extends StatefulWidget {
  final List<EditorialPresentationEntity> list;

  const EditorList({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  State<EditorList> createState() => _EditorListState();
}

class _EditorListState extends State<EditorList> {
  int _currentIndex = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: CarouselSlider(
          options: CarouselOptions(
              height: 160.0,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              aspectRatio: 2.0,
              onPageChanged: ((index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              })
              //disableCenter: true,
              ),
          items: widget.list
              .map((item) => EditorWidget(
                    editorials: item,
                  ))
              .toList(),
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(widget.list, (index, url) {
            return Container(
              width: 6.0,
              height: 6.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? ColorPalette.secondColor
                    : ColorPalette.thirdColor,
              ),
            );
          }),
        ),
      ],
    );
  }
}
