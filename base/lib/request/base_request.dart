abstract class BaseRequest {
  String path;

  Map<String, dynamic> paramsMap;

  Future enqueue() ;

  BaseRequest.form(String path, Map<String, dynamic> paramsMap){
    this.path = path;
    this.paramsMap = paramsMap;
  }


}
