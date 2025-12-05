import 'package:flutter/material.dart';
import 'package:responsi2_mobile_paket2_h1d023092/bloc/barang_bloc.dart';
import 'package:responsi2_mobile_paket2_h1d023092/model/barang.dart';
import 'package:responsi2_mobile_paket2_h1d023092/ui/barang_form.dart';
import 'package:responsi2_mobile_paket2_h1d023092/ui/barang_page.dart';
import 'package:responsi2_mobile_paket2_h1d023092/widget/warning_dialog.dart';

class BarangDetail extends StatefulWidget {
  Barang? barang;
  BarangDetail({Key? key, this.barang}) : super(key: key);
  @override
  _BarangDetailState createState() => _BarangDetailState();
}

class _BarangDetailState extends State<BarangDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Detail Inventaris ElsaMart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.label, color: Colors.green),
                  title: const Text('Nama Barang'),
                  subtitle: Text(widget.barang!.nama ?? '-'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.attach_money, color: Colors.green),
                  title: const Text('Harga Barang'),
                  subtitle: Text('${widget.barang!.harga ?? '-'}'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.inventory, color: Colors.green),
                  title: const Text('Jumlah (stok)'),
                  subtitle: Text('${widget.barang!.jumlah ?? '-'}'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.calendar_today, color: Colors.green),
                  title: const Text('Tanggal Masuk'),
                  subtitle: Text(widget.barang!.tanggal_masuk ?? '-'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.event_busy, color: Colors.green),
                  title: const Text('Tanggal Kadaluarsa'),
                  subtitle: Text(widget.barang!.tanggal_kadaluarsa ?? '-'),
                ),
                const SizedBox(height: 16),
                _tombolHapusEdit(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.green,
            side: const BorderSide(color: Colors.green),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BarangForm(barang: widget.barang!),
              ),
            );
          },
          child: const Text('Edit'),
        ),
        const SizedBox(width: 10),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.red,
            side: const BorderSide(color: Colors.red),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: () => confirmHapus(),
          child: const Text('Hapus'),
        )
      ],
    );
  }

void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: const Text("Yakin ingin menghapus data ini?"),
      actions: [
        OutlinedButton(
          child: const Text("Ya"),
          onPressed: () {
            BarangBloc.deleteBarang(id: int.parse(widget.barang!.id!))
                .then((value) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const BarangPage()),
                  );
                })
                .catchError((error) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => const WarningDialog(
                      description: "Hapus gagal, silahkan coba lagi",
                    ),
                  );
                });
          },
        ),
        OutlinedButton(
          child: const Text("Batal"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
    showDialog(builder: (context) => alertDialog, context: context);
  }
}