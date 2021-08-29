class BaseApi {
  static Uri doAbsUrl(String unencodedPath, Map<String, dynamic> params) {
    const appKey =
        'phynMLgDkiG06cECKA3LJATNiUZ1ijs-eNhTf0IGq4mSpJF3bD42MjPUjWwj7sqLuPy4_nBCOyX3-fRiUl6rnoCjQ0vYyKb-LR03x9kYGq53IBQ5SrN8G1jSQjUDplXF';
    const urlServerApi = 'ostest.whitetigersoft.ru';

    params.addAll({'appKey': appKey});
    Uri absUrl = Uri.http(urlServerApi, unencodedPath, params);
    return absUrl;
  }
}
