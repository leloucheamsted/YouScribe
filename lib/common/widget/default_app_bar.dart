import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_run/common/constants/constants.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      color: ColorPalette.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text('    '),
            Text(
              'YouScribe',
              style: TextStyle(
                fontFamily: Fonts.semiBold,
                fontSize: 20,
              ),
            ),
            Icon(
              FontsAwersomeIcons.search,
              size: 18,
              color: ColorPalette.secondColor,
            ),
          ],
        ),
      ),
    );
  }
}
