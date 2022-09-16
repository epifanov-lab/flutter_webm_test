import 'package:flutter/material.dart';
import 'package:webm_test/grid_item_model.dart';

const int _axisSize = 16;

class TestPage1 extends StatefulWidget {
  const TestPage1({Key? key}) : super(key: key);

  @override
  State<TestPage1> createState() => _TestPage1State();
}

class _TestPage1State extends State<TestPage1> {
  final List<GridItemModel> _items = generateRandomGridItemsList(_axisSize * _axisSize);

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      scaleEnabled: true,
      constrained: true,
      boundaryMargin: const EdgeInsets.all(24),
      child: GridView.count(
        crossAxisCount: _axisSize,
        children: _items.map((e) => _buildGridItem(e)).toList(),
      ),
    );
  }

  Widget _buildGridItem(GridItemModel item) {
    return Container(
      width: 128,
      height: 128,
      color: item.isLocal ? Colors.redAccent : Colors.blueAccent,
      child: Text(
        item.uri,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }
}
