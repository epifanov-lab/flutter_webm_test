import 'package:flutter/material.dart';
import 'package:webm_test/grid_item_model.dart';

class TestPage2 extends StatefulWidget {
  const TestPage2({Key? key}) : super(key: key);

  @override
  State<TestPage2> createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: _buildListsList(8),
      ),
    );
  }

  List<Widget> _buildListsList(int count) {
    final result = <Widget>[];
    result.add(const SizedBox(height: 24, width: 24));
    for (int i = 0; i < count; i++) {
      final items = generateRandomGridItemsList(16);
      final view = _buildListView(items);
      result.add(view);
      result.add(const SizedBox(height: 24, width: 24));
    }
    return result;
  }

  Widget _buildListView(List<GridItemModel> items) {
    return SizedBox(
      height: 256,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        controller: _controller,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemCount: items.length,
        itemBuilder: (context, index) => _buildGridItem(items[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 24, width: 24),
      ),
    );
  }

  Widget _buildGridItem(GridItemModel item) {
    return Container(
      width: 128,
      height: 256,
      padding: const EdgeInsets.all(12),
      color: (item.isLocal ? Colors.redAccent : Colors.blueAccent).withOpacity(0.66),
      child: Center(
        child: Text(
          item.uri,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
