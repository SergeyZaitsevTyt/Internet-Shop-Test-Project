class BaseApi {
  static const urlServerApi = 'http://ostest.whitetigersoft.ru/api';
  static const appKey =
      'phynMLgDkiG06cECKA3LJATNiUZ1ijs-eNhTf0IGq4mSpJF3bD42MjPUjWwj7sqLuPy4_nBCOyX3-fRiUl6rnoCjQ0vYyKb-LR03x9kYGq53IBQ5SrN8G1jSQjUDplXF';

  static String doAbsUrl(String urlForAdd) {
    String url;
    url = BaseApi.urlServerApi + urlForAdd + BaseApi.appKey;
    return url;
  }

  static String addParameterInUrl(
      String absUrl, String nameParameter, dynamic valueParameter) {
    return absUrl += '&' + nameParameter + '=' + valueParameter.toString();
  }
}