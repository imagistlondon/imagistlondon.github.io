import 'package:recase/recase.dart';

enum Index { HOME, TERMS, WORK_SHOWCASE, WORK_ARCHIVE, WORK_TAGS }

extension IndexExtension on Index {
  String display() {
    return new ReCase(this.toString().replaceFirst('Index.', '')).titleCase;
  }

  String workDisplay() {
    return new ReCase(this.toString().replaceFirst('Index.WORK_', ''))
        .titleCase;
  }

  bool isWork() {
    return this.toString().contains('WORK');
  }
}

class Indexes {
  static List<Index> works() {
    return Index.values.where((i) => i.toString().contains('WORK_')).toList();
  }

  static Map<Index, String> INDEX_URLS = {
    Index.HOME: '/',
    Index.TERMS: '/terms',
    Index.WORK_SHOWCASE: '/showcase',
    Index.WORK_ARCHIVE: 'archive',
    Index.WORK_TAGS: '/tags'
  };
}
