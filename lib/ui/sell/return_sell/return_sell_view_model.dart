import 'package:flutter/material.dart';
class ReturnSellViewModel extends ChangeNotifier{
  String selectrange = 'Fixed';


  changeVal(){
    notifyListeners();
  }


}