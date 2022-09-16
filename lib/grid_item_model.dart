import 'dart:math';

const List<String> remoteWebmUris = [
  //'https://file-examples.com/storage/fe49a9fa16632246e9a1f3a/2020/03/file_example_WEBM_480_900KB.webm',
  //'http://techslides.com/demos/sample-videos/small.webm',
  'https://upload.wikimedia.org/wikipedia/commons/transcoded/8/87/Schlossbergbahn.webm/Schlossbergbahn.webm.720p.vp9.webm',
];

const List<String> localWebmUris = [
  'assets/webm/sample_960x400_ocean_with_audio.webm',
  'assets/webm/sample_960x540.webm',
  'assets/webm/sample_1920x1080.webm',
];

List<GridItemModel> generateRandomGridItemsList(int length) {
  final rnd = Random();
  final List<GridItemModel> result = [];
  for (int i = 0; i < length; i++) {
    final isLocal = rnd.nextBool();
    final list = isLocal ? localWebmUris : remoteWebmUris;
    final uri = list[rnd.nextInt(list.length)];
    final item = GridItemModel(uri, isLocal);
    result.add(item);
  }
  return result;
}

class GridItemModel {
  final String uri;
  final bool isLocal;
  GridItemModel(this.uri, this.isLocal);
}