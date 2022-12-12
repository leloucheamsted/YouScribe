import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test_run/app_bloc.dart';
import 'package:test_run/common/constants/constants.dart';
import 'package:test_run/modules/account/account.dart';
import 'package:test_run/modules/home/presentation/pages/home.dart';
import 'package:test_run/modules/library/library.dart';
import 'package:test_run/modules/list/my_list.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final List<Widget> pages = const [
    Home(),
    Library(),
    MyList(),
    Account(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: IndexedStack(
        index: context.watch<AppBloc>().currentTab,
        children: pages,
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 19,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: ColorPalette.primaryColor,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 15.0,
                      offset: const Offset(0.0, 0.75))
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _navigationItem(FontsAwersomeIcons.home, "Acceuill", 0),
                    _navigationItem(FontsAwersomeIcons.list, "Bibliotheque", 1),
                    _navigationItem(
                        FontsAwersomeIcons.library, "Mes Listes", 2),
                    _navigationItem(
                        FontsAwersomeIcons.account, "Mon compte", 3),
                  ],
                ),
              ))),
    );
  }

  Widget _navigationItem(IconData icon, name, int tabIndex) {
    return Expanded(
      child: Material(
        color: Colors.white.withOpacity(0.0),
        child: InkResponse(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            context.read<AppBloc>().changeTab(tabIndex);
          },
          child: Ink(
            decoration: BoxDecoration(
              color: ColorPalette.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: context.watch<AppBloc>().currentTab == tabIndex
                      ? ColorPalette.actionColor
                      : ColorPalette.secondColor,
                ),
                Text(
                  name,
                  style: TextStyle(
                      fontFamily: Fonts.regular,
                      color: context.watch<AppBloc>().currentTab == tabIndex
                          ? ColorPalette.actionColor
                          : ColorPalette.secondColor,
                      fontSize: 13),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
