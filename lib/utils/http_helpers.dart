class HttpHelper{
  final String baseUrl = 'https://djuang.chilipp.com/api';

  String getUri(String entpoints){
    return baseUrl + entpoints;
  }
}