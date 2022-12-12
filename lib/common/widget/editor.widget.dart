import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_run/common/constants/constants.dart';
import 'package:test_run/modules/home/domain/entity/editorial_presentation.entity.dart';
import 'package:test_run/modules/home/domain/entity/home.entity.dart';

class EditorWidget extends StatelessWidget {
  final EditorialPresentationEntity editorials;
  const EditorWidget({super.key, required this.editorials});

  @override
  Widget build(BuildContext context) {
    print(editorials.imageUrl);
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 15, 5, 4),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(editorials.imageUrl.toString()),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
          color: ColorPalette.actionColor,
        ),
        height: 100,
      ),
    );
  }
}
