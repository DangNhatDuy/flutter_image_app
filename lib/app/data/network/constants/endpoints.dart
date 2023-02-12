class Endpoints {
  Endpoints._();

  static const String baseUrl = "https://api.unsplash.com";
  static const int receiveTimeout = 30000;
  static const int connectionTimeout = 30000;

  //Photos
  static const String listPhotos = '/photos';
}
