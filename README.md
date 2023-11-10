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

<h2>Statefull and Stateless Widget</h2>

Stateless Widget
- bersifat immutable; setelah terbentuk untuk pertama kali tidak dapat diubah lagi.
- Tidak memiliki state yang bisa diubah-ubah dalam dirinya sendiri. Semua 'perubahan' terjadi secara eksternal dan meliputi pembuatan ulang widget dari awal.
- Lebih efisien karena tidak harus mengakomodasi perubahan state.
- Baik digunakan untuk UI yang bersifat tetap, seperti logo, atau text.

Stateful Widget
- bersifat mutable; dapat berubah seiring berjalannya waktu
- Baik digunakan untuk widget yang dapat berubah baik melalui interaksi dengan user maupun dengan database.
- Berisi 2 komponen: StatefulWidget yang bersifat mutable, mempertahankan identitas widget, dan objek State yang dapat di-recreate jika terjadi perubahan

<h2>Widget yang digunakan dalam Tugas</h2>

```menu.dart```:

1) ```MyHomePage```: widget top-level yang merupakan Stateless Widget
2) ```Scaffold```: widget yang membentuk struktur dasar aplikasi (app bar & body)
3) ```AppBar```: bar yang berada di bagian atas tampilan yang berisi judul aplikasi
4) ```SingleChildScrollView```: widget yang memungkinkan scrolling layar
5) ```Padding```: Memberikan padding pada widget childnya
6) ```Column```: Membuat childrennya ditampilkan secara vertikal
7) ```Text```: Widget untuk menampilkan teks
8) ```GridView.count```: menentukan berapa kolom yang ada
9) ```ShopCard```: sebuah Stateless Widget
10) ```Material```: menentukan warna background yakni ```Colors.indigo```
11) ```InkWell```: widget yang membuat area yang dapat diklik.
12) ```SnackBar```: pesan yang muncul dari bawah layar
13) ```Container```: widget untuk menaruh icon dan text
14) ```Icons```: built-in icon dari Flutter

```main.dart```:
1) ```MyApp```: root widget dari aplikasi
2) ```MaterialApp```: widget yang men-set judul, theme, dan route dari aplikasi
3) ```title```: judul
4) ```theme```: menentukan palet warna yang digunakan
5) ```home```: menentukan halaman mana yang akan ditampilkan saat aplikasi baru dijalankan

<h1>Tugas 8</h1>

<h2>Implementasi Checklist</h2>

1) Masuk ke dalam directory ```pacil_inventory/lib```. Lalu buat directory baru bernama ```widgets```, lalu masuk ke dalamnya. Di dalam ```widgets```, buat file baru bernama ```left_drawer.dart```. Isi dengan code berikut:
```
import 'package:flutter/material.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            // TODO: Bagian drawer header
          ),
          // TODO: Bagian routing
        ],
      ),
    );
  }
}
```
bagian-bagian ```TODO``` akan diisi pada step-step berikutnya.

2. Masih di file yang sama, tambahkan import-import berikut di bagian atas file:
```
import 'package:flutter/material.dart';
import 'package:pacil_inventory/menu.dart';
// TODO: Impor halaman InventoryFormPage jika sudah dibuat
```

3. Isi bagian ```TODO: Bagian drawer header``` dengan code berikut:
```
...
ListTile(
  leading: const Icon(Icons.home_outlined),
  title: const Text('Halaman Utama'),
  // Bagian redirection ke MyHomePage
  onTap: () {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ));
  },
),
ListTile(
  leading: const Icon(Icons.add_shopping_cart),
  title: const Text('Tambah Produk'),
  // Bagian redirection ke ShopFormPage
  onTap: () {
    /*
    TODO: Buatlah routing ke ShopFormPage di sini,
    setelah halaman ShopFormPage sudah dibuat.
    */
  },
),
...
```

3. Sekarang, tambahkan code berikut di bagian ```TODO: Bagian drawer header```.
```
const DrawerHeader(
  decoration: BoxDecoration(
    color: Colors.indigo,
  ),
  child: Column(
    children: [
      Text(
        'Pacil Inventory',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      Padding(padding: EdgeInsets.all(10)),
      Text("Catat seluruh keperluan inventory-mu di sini!",
          textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: Colors.white,
          ),
      ),
    ],
  ),
),
```

4. Sekarang, di file menu.dart, masukkan code berikut:

