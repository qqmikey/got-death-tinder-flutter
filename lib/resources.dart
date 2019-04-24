
class Constants {
  static final urls = Url();
}

class Url {
  String base = 'http://185.185.69.218:4000';

  String api;

  String auth;
  String devices;
  String profile;

  String series;

  Url() {
    api = '$base/api/v1';
    auth = '$api/auth';
    profile = '$api/profile';
    devices = '$api/devices';

    series = '$api/series';
  }

}