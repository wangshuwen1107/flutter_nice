import 'package:flutter/cupertino.dart';

class RequestData<T> {
  String errorMsg;
  String errorCode;
  T data;
  bool success;

  RequestData({
    @required this.success,
    this.data,
    this.errorCode,
    this.errorMsg,
  });
}
