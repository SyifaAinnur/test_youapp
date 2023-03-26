class ApiService {
  static final String baseurl = 'http://techtest.youapp.ai/';
  static _AuthEndpoint authEndPoint = _AuthEndpoint();
}

class _AuthEndpoint {
  final String registerEmail = '/api/register';
  final String loginEmail = '/api/login';
}
