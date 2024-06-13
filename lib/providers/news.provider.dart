import 'package:flutter/material.dart';
import 'package:sobatternak_application/helpers/api.dart';
import 'package:sobatternak_application/models/topNews.model.dart';
import 'package:sobatternak_application/utils/const.dart';

class NewsProvider with ChangeNotifier {
  bool isLoading = true;
  TopNewsModel? resNews;
  getTopNews() async {
    final res = await api('${baseUrl}top-headlines?country=us&apiKey=${apiKey}');

    if(res.status == 200){
      resNews = TopNewsModel.fromJson(res.data);
    } else {
      resNews = TopNewsModel();
    }
    isLoading = false;
    notifyListeners();
  }
}
