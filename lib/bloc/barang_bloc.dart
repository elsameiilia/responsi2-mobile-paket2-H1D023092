import 'dart:convert';
import 'package:responsi2_mobile_paket2_h1d023092/helpers/api.dart';
import 'package:responsi2_mobile_paket2_h1d023092/helpers/api_url.dart';
import 'package:responsi2_mobile_paket2_h1d023092/model/barang.dart';

class BarangBloc {
  static Future<List<Barang>> getBarang() async {
    String apiUrl = ApiUrl.listBarang;
    var response = await Api().get(apiUrl);
    var jsonObj = json.decode(response);
    List<dynamic> listBarang = (jsonObj as Map<String, dynamic>)['data'];
    List<Barang> barangs = [];
    for (int i = 0; i < listBarang.length; i++) {
      barangs.add(Barang.fromJson(listBarang[i]));
    }
    return barangs;
  }

  static Future addBarang ({Barang? barang}) async {
    String apiUrl = ApiUrl.createBarang;
    var body = {
      'nama': barang?.nama,
      'harga': barang?.harga.toString(),
      'jumlah': barang?.jumlah.toString(),
      'tanggal_masuk': barang?.tanggal_masuk,
      'tanggal_kadaluarsa': barang?.tanggal_kadaluarsa
    };

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response);
    return jsonObj['status'];
  }

  static Future updateBarang ({Barang? barang}) async {
    String apiUrl = ApiUrl.updateBarang(int.parse(barang!.id!));

    var body = {
      'nama': barang.nama,
      'harga': barang.harga.toString(),
      'jumlah': barang.jumlah.toString(),
      'tanggal_masuk': barang.tanggal_masuk,
      'tanggal_kadaluarsa': barang.tanggal_kadaluarsa
    };

    print("Body : $body");
    var response = await Api().put(apiUrl, jsonEncode(body));
    var jsonObj = json.decode(response);
    return jsonObj['status'];
  }

  static Future<bool> deleteBarang ({int? id}) async {
    String apiUrl = ApiUrl.deleteBarang(id!);

    var response = await Api().delete(apiUrl);
    var jsonObj = json.decode(response);
    return jsonObj['status'];
  }
}