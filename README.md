# pacil_inventory

<h1>Tugas 7</h1>

<h2>Implementasi Checklist</h2>

1) Pastikan semua dependencies telah diinstal. Hal ini dapat dilihat dari menjalankan flutter doctor pada ```...\Flutter\flutter\flutter_console```. Pastikan setiap poin sudah berwarna hijau.
2) Buat aplikasi baru bernama ```pacil_inventory``` dengan menjalankan ```flutter create pacil_inventory```. Masuk ke folder aplikasi: ```cd pacil_inventory```.
3) Buat file baru di ```pacil_inventory/lib``` bernaman ```menu.dart```. Tambahkan kode import ```import 'package:flutter/material.dart';``` pada baris pertama file tersebut.
4) Masuk ke file ```main.dart```, lalu cut kode dari baris 39 hingga paling bawah, dan paste di file ```menu.dart``` yang barusan dibuat.
5) Tambahkan baris import berikut di file ```menu.dart```: ```import 'package:pacil_inventory/menu.dart';```
6) Di file ```main.dart```, ganti baris yang berisi ```colorScheme: ColorScheme.fromSeed(...),``` menjadi ```colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),```. Lalu, baris yang berisi ```MyHomePage(title: 'Flutter Demo Home Page')``` diganti menjadi ```MyHomePage()```
7) Ubah seluruh file menu.dart menjadi berikut:
```
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final List<InventoryItem> items = [
    InventoryItem("Lihat Item", Icons.list_alt_rounded),
    InventoryItem("Tambah Item", Icons.add_box_rounded),
    InventoryItem("Logout", Icons.logout),
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
          'Pacil Inventory',
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
                  'Pacil Inventory', // Text yang menandakan toko
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
                children: items.map((InventoryItem item) {
                  // Iterasi untuk setiap item
                  return InventoryCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
            
        
    }
}

class InventoryItem {
  final String name;
  final IconData icon;

  InventoryItem(this.name, this.icon);
}

class InventoryCard extends StatelessWidget {
  final InventoryItem item;

  const InventoryCard(this.item, {super.key}); // Constructor

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
9) ```InventoryCard```: sebuah Stateless Widget
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
  // Bagian redirection ke InventoryFormPage
  onTap: () {
    /*
    TODO: Buatlah routing ke InventoryFormPage di sini,
    setelah halaman InventoryFormPage sudah dibuat.
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
```
...
// Impor drawer widget
import 'package:pacil_inventory/widgets/left_drawer.dart';
...
return Scaffold(
  appBar: AppBar(
    title: const Text(
      'Pacil Inventory',
    ),
    backgroundColor: Colors.indigo,
    foregroundColor: Colors.white,
  ),
  // Masukkan drawer sebagai parameter nilai drawer dari widget Scaffold
  drawer: const LeftDrawer(),
...
```
5. pada directory ```lib```, buat file baru bernama ```inventory_list_form.dart```, lalu isi dengan code berikut:
```
import 'package:flutter/material.dart';
import 'package:pacil_inventory/widgets/left_drawer.dart';

class InventoryFormPage extends StatefulWidget {
    const InventoryFormPage({super.key});

    @override
    State<InventoryFormPage> createState() => _InventoryFormPageState();
}

class _InventoryFormPageState extends State<InventoryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";
    @override
    Widget build(BuildContext context) {
        return Placeholder();
  }
}
```

6. Ubah widget ```Placeholder``` dengan code berikut:
```
Scaffold(
  appBar: AppBar(
    title: const Center(
      child: Text(
        'Form Tambah Item',
      ),
    ),
    backgroundColor: Colors.indigo,
    foregroundColor: Colors.white,
  ),
  drawer: const LeftDrawer(),
  body: Form(
    key: _formKey,
    child: SingleChildScrollView(),
  ),
);
```

7. Tambahkan variabel berikut pada class ```_InventoryFormPageState```:
```
...
class _InventoryFormPageState extends State<InventoryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";
...
```
dan code berikut pada ```body:```:
```
...
body: Form(
    key: _formKey,
    child: SingleChildScrollView(
      child: Column()
    );
...
```

8. Isilah ```Column(...)``` dengan code berikut:
```
crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Nama Item",
              labelText: "Nama Item",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onChanged: (String? value) {
              setState(() {
                _name = value!;
              });
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Nama tidak boleh kosong!";
              }
              return null;
            },
          ),
      ),
      Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Amount",
      labelText: "Amount",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    onChanged: (String? value) {
      setState(() {
        _amount = int.parse(value!);
      });
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Amount tidak boleh kosong!";
      }
      if (int.tryParse(value) == null) {
        return "Amount harus berupa angka!";
      }
      return null;
    },
  ),
),
      Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Deskripsi",
      labelText: "Deskripsi",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    onChanged: (String? value) {
      setState(() {
        _description = value!;
      });
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Deskripsi tidak boleh kosong!";
      }
      return null;
    },
  ),
),
Align(
  alignment: Alignment.bottomCenter,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Colors.indigo),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Produk berhasil tersimpan'),
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text('Nama: $_name'),
                          Text('Amount: $_amount'),
                          Text('Description: $_description'),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
        }
        _formKey.currentState!.reset();
      },
      child: const Text(
        "Save",
        style: TextStyle(color: Colors.white),
      ),
    ),
  ),
),
],
```

9. Masuk ke file menu.dart, lalu tambahkan code berikut pada widget ```InventoryItem```:
```
...
// Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
            
          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Tambah Item") {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => const InventoryFormPage()));
          }
        },
...
```

10. Pada folder ```lib```, buat folder baru bernama ```screens```. Pindahkan file ```menu.dart``` dan ```inventory_list_form.dart``` ke folder ```screens```. Pastikan IDE dapat melakukan refactor secara otomatis.


<h2>Navigator.push() dan Navigator.pushReplacement()</h2>

Perbedaan utama dari ```push()``` dan ```pushReplacement()``` adalah ```push()``` menambah route ke atas tumpukan stack dari route-route yang sudah ada, sementara ```pushReplacement() mengganti route paling atas dari stack dengan route yang baru. Contoh penggunaannya pada aplikasi pacil_inventory adalah di file ```menu.dart``` di mana kita akan mem- ```push()```  route ```InventoryFormPage``` ke dalam stack saat button ```Tambah Item``` ditekan. Hal ini membuat route ```InventoryFormPage``` menimpa route sebelumnya pada layar. Karena kita menggunakan ```push()```, maka jika kita menekan tombol back pada perangkat kita, tampilan akan dialihkan ke route sebelumnya. Namun, jika kita menggunakan pushReplacement(), saat button ```Tambah Item``` di-klik, route yang sekarang sedang ditampilkan (```MyHomePage```) akan di-replace dengan route ```InventoryFormPage```. Sehingga, jika kita menekan tombol back, tampilan tidak akan berpindah pada route ```MyHomePage``` karena tidak ada dalam stack -- kita akan dikeluarkan dari aplikasi.


<h2>Layout Widget</h2>

Di Flutter, layout widget terbagi menjadi dua: single-child (hanya dapat memiliki 1 child), dan multi-child (dapat memiliki lebih dari satu child).

<h3>Single-Child Layout Widgets</h3>

Berikut single-child layout widgets yang umum digunakan:

1. Align: mengatur alignment dari childnya
2. AspectRatio: mengatur ukuran dari childnya berdasarkan rasio tertentu
3. Baseline: memposisikan childnya sesuai dengan baseline child tersebut, contoh untuk meng-align teks berdasarkan batas bawahnya.
4. Center: memposisikan childnya tepat di tengah widget ini.
5. ConstrainedBox: dapat membuat constraint-constraint lain dalam memposisikan childnya.
6. Container: Widget yang dapat mengatur posisi childnya secara fleksibel
7. Padding: memposisikan childnya sesuai padding yang diberikan
8. SizedBox: memaksa childnya untuk memiliki ukuran tertentu

Berikut single-child layout widgets lainnya:
  
9. CustomSingleChildLayout
10. Expanded
11. FittedBox
12. FractionallySizedBox
13. IntrinsicHeight
14. IntrinsicWidth
15. LimitedBox
16. Offstage
17. OverflowBox
18. SizedOverflowBox
19. Transform

<h3>Multi-Child Layout Widgets</h3>

Berikut multi-child layout widgets yang umum digunakan:

1. Column: memposisikan childrennya dalam sumbu vertikal.
2. GridView: memposisikan childrennya dalam bentuk grid, yang berjalan secara horizontal dan vertikal.
3. ListView: Dapat discroll, baik untuk meletakkan children yang banyak/tidak mau menempati banyak fixed-space.
4. Row: memposisikan childrennya dalam sumbu horizontal.
5. Stack: menempatkan childrennya secara bertumpukkan.

Berikut multi-child layout widgets lainnya:

6. CustomMultiChildLayout
7. Flow
8. IndexedStack
9. LayoutBuilder
10. ListBody
11. Table
12. Wrap


