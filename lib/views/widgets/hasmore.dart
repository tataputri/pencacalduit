import 'package:firemax_football/constants/constant.dart';
import 'package:firemax_football/views/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class HasMore extends StatelessWidget {
  final bool hasMore;
  const HasMore({super.key, required this.hasMore});

  @override
  Widget build(BuildContext context) {
    return hasMore
        ? Center(
            child: Padding(
                padding: Constant.xSpaceSymetric(vertical: 10),
                child: const CustomLoading()),
          )
        : Container();
  }
}
