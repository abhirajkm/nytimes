import 'package:flutter/cupertino.dart';
import 'package:nytimes/providers/news.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderTree {
  static List<SingleChildWidget> get(BuildContext context) {
    return [
      ChangeNotifierProvider.value(value: NewsProvider()),
    ];
  }
}
