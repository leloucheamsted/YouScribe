import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:test_run/modules/home/domain/entity/editorial_presentation.entity.dart';
import 'package:test_run/modules/home/domain/entity/home.entity.dart';

class HomeDataBloc {
  final String editorialBaseImageURL = "http://CMS.uscri.be";
  HomeDataBloc() {
    loadData();
  }

  Future<HomeEntity> loadData() async {
    final String response = await rootBundle.loadString('assets/homeJson.json');
    final data = await jsonDecode(response) as Map<String, dynamic>;
    HomeEntity entity = HomeEntity.fromJson(data);
    log("${entity.editorials}");
    return _returnData(entity);
  }

  Future<List<EditorialPresentationEntity>> loadEditor(
      List<Editorials> editorials) async {
    late final List<EditorialPresentationEntity> edito = [];

    for (var item in editorials) {
      if (item.firstImage!.isNotEmpty) {
        edito.add(
          EditorialPresentationEntity(
              imageUrl: "$editorialBaseImageURL/${item.firstImage!}",
              typeId: item.typeId!,
              link: item.firstLink!),
        );
      }
      if (item.secondImage!.isNotEmpty) {
        edito.add(
          EditorialPresentationEntity(
              imageUrl: "$editorialBaseImageURL/${item.secondImage!}",
              typeId: item.typeId!,
              link: item.secondLink!),
        );
      }
    }

    return edito;
  }

  Future<T> _returnData<T>(dynamic data) {
    return Future.delayed(const Duration(milliseconds: 5000), () => data);
  }
}
