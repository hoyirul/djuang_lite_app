class HttpHelper{
  final String baseUrl = 'http://192.168.69.23:8000/api';

  String getUri(String entpoints){
    return baseUrl + entpoints;
  }
}