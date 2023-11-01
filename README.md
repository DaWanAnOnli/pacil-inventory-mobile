# pacil_inventory

<h1>Tugas 7</h1>

<h2>Implementasi Checklist</h2>

1) Pastikan semua dependencies telah diinstal. Hal ini dapat dilihat dari menjalankan flutter doctor pada ```...\Flutter\flutter\flutter_console```. Pastikan setiap poin sudah berwarna hijau.
2) Buat aplikasi baru bernama ```pacil_inventory``` dengan menjalankan ```flutter create pacil_inventory```. Masuk ke folder aplikasi: ```cd pacil_inventory```.
3) Buat file baru di ```pacil_inventory/lib``` bernaman ```menu.dart```. Tambahkan kode import ```import 'package:flutter/material.dart';``` pada baris pertama file tersebut.
4) Masuk ke file ```main.dart```, lalu cut kode dari baris 39 hingga paling bawah, dan paste di file ```menu.dart``` yang barusan dibuat.
5) Tambahkan baris import berikut di file ```menu.dart```: ```import 'package:shopping_list/menu.dart';```
6) Di file ```main.dart```, ganti baris yang berisi ```colorScheme: ColorScheme.fromSeed(...),``` menjadi ```colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),```. Lalu, baris yang berisi ```MyHomePage(title: 'Flutter Demo Home Page')``` diganti menjadi ```MyHomePage()```
7) Ubah seluruh file menu.dart menjadi berikut:
```
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.list_alt_rounded),
    ShopItem("Tambah Item", Icons.add_box_rounded),
    ShopItem("Logout", Icons.logout),
];

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

 @override
    Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping List',
        ),
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'PBP Shop', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
            
        
    }
}

class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
