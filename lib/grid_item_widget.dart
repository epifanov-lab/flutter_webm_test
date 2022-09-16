import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:webm_test/grid_item_model.dart';
import 'package:webm_test/main.dart';

class GridItemWidget extends StatefulWidget {
  final int index;
  final GridItemModel item;

  const GridItemWidget({
    required this.index,
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  State<GridItemWidget> createState() => _GridItemWidgetState();
}

class _GridItemWidgetState extends State<GridItemWidget> {
  late final StreamSubscription _subscription;

  VideoPlayerController? _videoPlayerController;
  bool _isFocused = false;
  bool _isPlayerInitialized = false;

  @override
  void initState() {
    _subscription = god.horizontalScrollEvents.stream
        .listen((focusedIndex) => _onHorizontalScrollEvents(focusedIndex));
    super.initState();
  }

  Future _onHorizontalScrollEvents(int focusedIndex) async {
    _isFocused = widget.index == focusedIndex;
    setState(() {});
    if (_isFocused) {
      await _initializePlayerController();
    } else {
      _destroyPlayer();
    }
  }

  Future _initializePlayerController() async {
    _videoPlayerController = widget.item.isLocal
        ? VideoPlayerController.asset(widget.item.uri)
        : VideoPlayerController.network(widget.item.uri);
    //videoPlayerController.addListener(_listenPlayerChanges);
    await _videoPlayerController!.initialize();
    await _videoPlayerController!.setLooping(true);
    await _videoPlayerController!.setVolume(1);
    await _videoPlayerController!.play();
    _isPlayerInitialized = true;
    setState(() {});
  }

  void _destroyPlayer() {
    _videoPlayerController?.dispose();
    _videoPlayerController = null;
    _isPlayerInitialized = false;
    setState(() {});
  }

  @override
  void dispose() {
    _destroyPlayer();
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 256,
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(8),
      color: (widget.item.isLocal ? Colors.redAccent : Colors.blueAccent)
          .withOpacity(_isFocused ? 1 : 0.33),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 666),
        child: _isFocused && _videoPlayerController != null && _isPlayerInitialized
            ? VideoPlayer(_videoPlayerController!)
            : Center(
                child: Text(
                  widget.item.uri,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
      ),
    );
  }
}
