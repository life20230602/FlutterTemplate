import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_se/res/app_theme.dart';

///视频中间标签
class VideoTagListWidget extends StatelessWidget {
  const VideoTagListWidget(this.videoTagList, {super.key});

  final List<String> videoTagList;

  final _maxShowCount = 10;

  final _rowCount = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      child: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    final widgets = <Widget>[];
    var rowWidgets = <Widget>[];
    var newList = List.from(videoTagList);
    int length = min(newList.length, _maxShowCount);
    for (int i = 0; i < length; i++) {
      rowWidgets.add(_buildItem(context, i));
      if ((i + 1) % _rowCount == 0) {
        _addRow(widgets, rowWidgets);
        rowWidgets = <Widget>[];
      }
    }
    if (rowWidgets.isNotEmpty) {
      _addRow(widgets, rowWidgets);
    }
    return Column(children: widgets);
  }

  void _addRow(List<Widget> widgets, List<Widget> rowWidgets) {
    if (rowWidgets.length < _rowCount) {
      compensateWidget(rowWidgets, _rowCount - rowWidgets.length);
    }
    if (widgets.isNotEmpty) {
      widgets.add(const SizedBox(height: 10));
    }
    widgets.add(
      Row(
        children: rowWidgets,
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          margin: ((index + 1) % _rowCount == 0) ? null :  EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: context.appTheme.secondBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.fromLTRB(6, 8, 6, 8),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              videoTagList[index],
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: context.appTheme.whiteColor,
                fontSize: 13,
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///不足补偿
  void compensateWidget(List<Widget> widgets, int size) {
    for (int i = 0; i < size; i++) {
      widgets.add(const Expanded(flex: 1, child: SizedBox.shrink()));
    }
  }
}
