import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:webm_test/grid_item_model.dart';
import 'package:webm_test/grid_item_widget.dart';
import 'package:webm_test/main.dart';

class TestPage3 extends StatefulWidget {
  const TestPage3({Key? key}) : super(key: key);

  @override
  State<TestPage3> createState() => _TestPage3State();
}

class _TestPage3State extends State<TestPage3> {
  late final _listsList;

  @override
  void initState() {
    _listsList = _buildListsList(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollSnapList(
      scrollDirection: Axis.vertical,
      itemCount: 1,
      itemSize: 256,
      onItemFocus: (index) => god.verticalScrollEvents.add(index),
      itemBuilder: (context, index) => _listsList[index],
    );
  }

  List<Widget> _buildListsList(int count) {
    final result = <Widget>[];
    for (int i = 0; i < count; i++) {
      final items = generateRandomGridItemsList(16);
      final view = _buildListView(items);
      result.add(view);
    }
    return result;
  }

  Widget _buildListView(List<GridItemModel> items) {
    return SizedBox(
      height: 256,
      child: ScrollSnapList(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemSize: 260,
        onItemFocus: (index) => god.horizontalScrollEvents.add(index),
        itemBuilder: (context, index) => GridItemWidget(
          index: index,
          item: items[index],
        ),
      ),
    );
  }
}
