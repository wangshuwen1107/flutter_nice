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

  @override
  String toString() {
    return 'RequestData{errorMsg: $errorMsg, errorCode: $errorCode, data: $data, success: $success}';
  }


}
