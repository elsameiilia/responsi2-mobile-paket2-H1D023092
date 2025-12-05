class ApiUrl {
  static const String baseUrl = "http://localhost:8080/";

  static const String login = baseUrl + "/login";
  static const String registrasi = baseUrl + "/registrasi";
  static const String listBarang = baseUrl + "/barang";
  static const String createBarang = baseUrl + "/barang";
  
  static String detailBarang(int id) {
    return baseUrl + '/barang/' + id.toString();
  }

  static String updateBarang(int id) {
    return baseUrl + '/barang/' + id.toString();
  }

  static String deleteBarang(int id) {
    return baseUrl + '/barang/' + id.toString();
  }
}