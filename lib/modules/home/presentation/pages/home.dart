import 'dart:convert';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_run/common/constants/constants.dart';
import 'package:test_run/common/widget/default_app_bar.dart';
import 'package:test_run/modules/home/bloc/home_data.bloc.dart';
import 'package:test_run/modules/home/domain/entity/editorial_presentation.entity.dart';
import 'package:test_run/modules/home/domain/entity/home.entity.dart';
import 'package:test_run/modules/home/presentation/services/search.dart';
import 'package:test_run/modules/home/presentation/ui/editor_list.dart';
import 'package:test_run/modules/home/presentation/ui/selection_list.dart';
import 'package:test_run/modules/home/presentation/ui/skeleton_view.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeDataBloc bloc = HomeDataBloc();
  HomeEntity _homeEntity = HomeEntity();
  List<EditorialPresentationEntity> editors = [];
  List<Editorials>? list;
  // @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    HomeEntity entity = await bloc.loadData();
    List<EditorialPresentationEntity> editorsList =
        await bloc.loadEditor(entity.editorials!);
    setState(() {
      _homeEntity = entity;
      editors = editorsList;
      list = _homeEntity.editorials;
    });
    log("${_homeEntity.editorials}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorPalette.primaryColor,
        title: const Text(
          'YouScribe',
          style: TextStyle(
            color: ColorPalette.secondColor,
            fontFamily: Fonts.semiBold,
            fontSize: 20,
          ),
        ),
        actions: <Widget>[
          Container(
            width: 50,
            height: 40,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                //showSearch(context: context, delegate: Search([]));
              },
              child: const Icon(
                FontsAwersomeIcons.search,
                size: 18,
                color: ColorPalette.secondColor,
              ),
            ),
          )
        ],
        automaticallyImplyLeading: false,
        toolbarHeight: 55, systemOverlayStyle: SystemUiOverlayStyle.light,
        // flexibleSpace: const DefaultAppBar(),
      ),
      body: SizedBox(
        child: _homeEntity.editorials == null
            ? Skeleton(
                width: 200,
                height: 300,
              )
            : RefreshIndicator(
                onRefresh: () async {},
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      EditorList(list: editors ?? []),
                      SelectionList(shelfPlus: _homeEntity.shelfPushs ?? [])
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
