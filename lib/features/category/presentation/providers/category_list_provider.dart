import 'package:crafty_bay/app/set_up_network_caller.dart';
import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/services/network_caller.dart';
import 'package:crafty_bay/features/category/data/models/category_model.dart';
import 'package:flutter/foundation.dart';

class CategoryListProvider extends ChangeNotifier {
  final int _pageSize = 30;

  int _currentPageNumber = 0;

  int? _lastPageNumber;

  bool _initialLoading = false;
  bool _loadingMoreData = false;

  final List<CategoryModel> _categoryList = [];
  String? _errorMessage;

  List<CategoryModel> get categoryList => _categoryList;

  bool get initialLoading => _initialLoading;

  bool get moreLoading => _loadingMoreData;

  String? get errorMessage => _errorMessage;

  Future<bool> fetchCategoryList() async {
    bool isSuccess = false;
    if (_currentPageNumber == 0) {
      _categoryList.clear();
      _initialLoading = true;
    } else if (_currentPageNumber < _lastPageNumber!) {
      _loadingMoreData = true;
    } else {
      return false;
    }
    notifyListeners();
    _currentPageNumber++;

    final NetworkResponse response = await getNetworkCaller().getRequest(
      url: Urls.categoryListUrl(_pageSize, _currentPageNumber),
    );
    if (response.isSuccess) {
      _lastPageNumber ??= response.responseData['data']['last_page'];
      List<CategoryModel> list = [];
      for (Map<String, dynamic> jsonData
          in response.responseData['data']['results']) {
        list.add(
          CategoryModel.fromJson(jsonData),
        ); //Converts raw JSON into a Dart object
      }
      _categoryList.addAll(list);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    if (_initialLoading) {
      _initialLoading = false;
    } else {
      _loadingMoreData = false;
    }
    notifyListeners();
    return isSuccess;
  }

  Future<void> refreshCategoryList() async {
    _currentPageNumber = 0;
    _lastPageNumber = null;
    await fetchCategoryList();
  }
}
