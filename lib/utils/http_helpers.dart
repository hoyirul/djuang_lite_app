class HttpHelper{
  final String baseUrl = 'http://192.168.1.5:8000/api';

  String getUri(String entpoints){
    return baseUrl + entpoints;
  }
}