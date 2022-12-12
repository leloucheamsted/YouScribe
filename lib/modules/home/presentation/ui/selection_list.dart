import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_run/common/constants/constants.dart';
import 'package:test_run/modules/home/domain/entity/home.entity.dart';

class SelectionList extends StatelessWidget {
  final List<ShelfPushs> shelfPlus;
  const SelectionList({super.key, required this.shelfPlus});
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
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: map<Widget>(shelfPlus, (index, url) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 10.0, 0, 20),
            child: _selectionType(shelfPlus[index]),
          ),
        );
      }),
    );
  }

  ///
  ///
  Widget _selectionType(ShelfPushs shelfPushs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                shelfPushs.title.toString().length > 30
                    ? "${shelfPushs.title.toString().substring(0, 30)}..."
                    : shelfPushs.title.toString(),
                style: const TextStyle(
                  fontFamily: Fonts.semiBold,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: ColorPalette.secondColor,
                ),
              ),
              Container(
                height: 25,
                width: 25,
                decoration: const BoxDecoration(
                    color: ColorPalette.actionColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    )),
                child: Transform.rotate(
                  angle: 100 * pi / 180,
                  child: const Icon(
                    FontsAwersomeIcons.searchPlus,
                    size: 15,
                    color: ColorPalette.primaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 180,
          child: _itemProduct(shelfPushs.products ?? []),
        )
      ],
    );
  }

  ///
  ///
  Widget _itemProduct(List<Products> products) {
    return ListView.builder(
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _cardItem(products[index]);
        });
  }

  ///
  ///
  Widget _cardItem(Products products) {
    return Container(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                height: 140,
                width: 100,
                child: PhysicalModel(
                  color: ColorPalette.actionColor,
                  elevation: 18,
                  borderRadius: BorderRadius.circular(6),
                  shadowColor: ColorPalette.primaryColor,
                  child: Container(
                    height: 120,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                          image:
                              NetworkImage(products.imageUrls?.first.url ?? ""),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3),
                child: Text(
                  products.title.toString().length > 13
                      ? "${products.title.toString().substring(0, 13)}..."
                      : products.title.toString(),
                  style: const TextStyle(
                    fontFamily: Fonts.semiBold,
                  ),
                ),
              ),
              Text(
                products.author.toString().length > 13
                    ? products.author.toString().substring(0, 13)
                    : products.author.toString(),
                style: const TextStyle(
                  fontFamily: Fonts.regular,
                  color: ColorPalette.thirdColor,
                  fontSize: 12,
                ),
              )
            ],
          ),
          // floating button
          Positioned(
            bottom: 50,
            left: 10,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: ColorPalette.actionColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Icon(
                products.extensions![0].toString() == "mp3"
                    ? FontsAwersomeIcons.audio
                    : products.extensions!.length > 1
                        ? FontsAwersomeIcons.book
                        : FontsAwersomeIcons.newspaper,
                size: 18,
                color: ColorPalette.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
