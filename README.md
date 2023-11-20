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

<h2>Elemen Input</h2>

1. TextFormField: digunakan sebagai tempat untuk memasukkan teks
2. InputDecoration: Digunakan untuk menambahkan elemen-elemen tambahan pada form input, seperti hintText dan labelText
3. hintText: menempatkan teks sementara di dalam form yang akan dimasukkan input. Text ini hanya muncul saat form kosong. Digunakan untuk memberitahu user di mana harus memasukkan input.
4. labelText: menempatkan label di sebelah tempat input. Digunakan untuk memberitahu user apa yang harus diinput. 
5. OutlineInputBorder: digunakan untuk menambahkan border di sekitar InputDecoration
6. onChanged: digunakan untuk mendeteksi setiap perubahan pada form. Berguna untuk real-time validation, misal memberitahu user jika tipe karakter yang digunakan untuk input tidak sesuai
7. validator: berguna untuk mem-validasi input saat submit. Contoh ada form yang kosong.

<h2>Flutter Clean Architecture</h2>

Clean Architecture bukanlah konsep eksklusif dari flutter, namun merupakan prinsip pengembangan software yang mementingkan separation of concerns. Di flutter, clean architecture terdiri atas tiga aspek: Presentation Layer (UI), Domain Layer (business logic), dan Data Layer (Storage & Database). Berikut cara mengimplementasikan clean architecture pada Flutter:

1. Presentation Layer: semua route disatukan di dalam folder bernama ```screens```. File-file route berisi widget-widget yang disertai dengan handler untuk user-interaction.

2. Domain Layer: semua file yang berhubungan dengan domain layer disatukan dalam folder ```domain```. File-file ini berisi class-class yang mendefinisikan objek-objek yang ada dalam aplikasi, dengan variabel dan method masing-masing.

3. Data Layer: semua file yang berhubungan dengan data layer disatukan dalam folder ```data```. Jika menggunakan data eksternal, buat juga folder ```repositories```. File dalam folder-folder ini berisi implementasi pengambilan dan penyimpanan data ke storage.



<h1>Tugas 9</h1>

<h2>Implementasi Checklist</h2>



<h3>Setup Autentikasi untuk Flutter</h3>

1) Pada proyek Django ```pacil-inventory```, buat app baru bernama authentication. Tambahkan ke ```INSTALLED_APPS``` di ```settings.py```.
2) Di terminal, jalankan ```pip install django-cors-headers```.
3) Di variable ```INSTALLED_APPS```, tambahkan ```corsheaders```.
4) Di variable ```MIDDLEWARE```, tambahkan ```corsheaders.middleware.CorsMiddleware```.
5) Tambahkan variable-variable berikut juga di ```settings.py```:
```
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
```
6) Masukkan code berikut dalam file ```authentication/views.py```:
```
from django.shortcuts import render
from django.contrib.auth import authenticate, login as auth_login
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
                # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email atau kata sandi."
        }, status=401)
```

7) Di folder ```authentication```, buat file urls.py, dan tambahkan routing berikut:
```
from django.urls import path
from authentication.views import login

app_name = 'authentication'

urlpatterns = [
    path('login/', login, name='login'),
]
```
8) Pada file ```pacil_inventory/urls.py```, tambahkan ```path('auth/', include('authentication.urls')),```

<h3>Integrasi Sistem Autentikasi</h3>

1) Jalankan perintah berikut di terminal:
```
flutter pub add provider
flutter pub add pbp_django_auth
```
2) Pada file main.dart, lakukan modifikasi pada class MyApp menjadi berikut:
```
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child : MaterialApp(
      routes: {
      '/itemDetail': (context) => ItemDetailPage(),
      },
      title: 'Pacil Inventory',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: LoginPage(),
    ),
    );

  }
}
```

3) Pada folder ```screens```, buat file baru bernama ```login.dart```, dan isi dengan code berikut:
```
import 'package:pacil_inventory/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
    runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
const LoginApp({super.key});

@override
Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login',
        theme: ThemeData(
            primarySwatch: Colors.blue,
    ),
    home: const LoginPage(),
    );
    }
}

class LoginPage extends StatefulWidget {
    const LoginPage({super.key});

    @override
    _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                title: const Text('Login'),
            ),
            body: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        TextField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                                labelText: 'Username',
                            ),
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                labelText: 'Password',
                            ),
                            obscureText: true,
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                            onPressed: () async {
                                String username = _usernameController.text;
                                String password = _passwordController.text;

                                // Cek kredensial
                                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                // Untuk menyambungkan Android emulator dengan Django pada localhost,
                                // gunakan URL http://10.0.2.2/
                                final response = await request.login("http://<APP_URL_KAMU>/auth/login/", {
                                'username': username,
                                'password': password,
                                });
                    
                                if (request.loggedIn) {
                                    String message = response['message'];
                                    String uname = response['username'];
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => MyHomePage()),
                                    );
                                    ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(
                                            SnackBar(content: Text("$message Selamat datang, $uname.")));
                                    } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                            title: const Text('Login Gagal'),
                                            content:
                                                Text(response['message']),
                                            actions: [
                                                TextButton(
                                                    child: const Text('OK'),
                                                    onPressed: () {
                                                        Navigator.pop(context);
                                                    },
                                                ),
                                            ],
                                        ),
                                    );
                                }
                            },
                            child: const Text('Login'),
                        ),
                    ],
                ),
            ),
        );
    }
}
```

<h3>Membuat Model Kustom</h3>

1) Jalankan proyek Django dan akses ```localhost:8000/json```.
2) Buka web Quicktype, dan ganti setup name menjadi ```Item```, source type menjadi ```JSON```, dan language mnenjadi ```Dart```.
3) Copy-paste output dari ```localhost:8000/json```, lalu klik ```Copy Code```.
4) Di proyek Flutter, buat file baru di ```lib/models``` bernama ```product.dart```, dan paste code yang barusan di-copy.

<h3>Fetch Data dari Django Untuk Ditampilkan ke Flutter</h3>

1) Di terminal proyek Flutter, jalankan command ```flutter pub add http```.
2) Tambahkan code berikut di file ```android/app/src/main/AndroidManifest.xml```:
```
...
    <application>
    ...
    </application>
    <!-- Required to fetch data from the Internet. -->
    <uses-permission android:name="android.permission.INTERNET" />
...
```
3) Pada folder lib/screens, buat file baru bernama ```list_item.dart```, lalu isi dengan code berikut:

```
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pacil_inventory/models/item.dart';
import 'package:pacil_inventory/screens/item_detail_page.dart';
import 'package:pacil_inventory/widgets/left_drawer.dart';

class ItemPage extends StatefulWidget {
    const ItemPage({Key? key}) : super(key: key);

    @override
    _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
Future<List<Item>> fetchItem() async {
    // ATTN: Ganti URL sesuai kebutuhan
    var url = Uri.parse(
        'http://localhost:8000/json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Item
    List<Item> list_item = [];
    for (var d in data) {
        if (d != null) {
            list_item.add(Item.fromJson(d));
        }
    }
    return list_item;
}

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Item'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchItem(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "Tidak ada data Item.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => 
                        
                        GestureDetector(
                        // When the child is tapped, show a snackbar.
                        onTap: () {
                        Navigator.pushNamed(
                          context,
                          ItemDetailPage.routeName,
                          arguments: ItemDetailArguments(
                            "${snapshot.data![index].pk}"
                          ),
                        );
                        },
                        // The custom button
                        child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                    "${snapshot.data![index].fields.name}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    
                                    ),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.amount}"),
                                    const SizedBox(height: 10),
                                    Text(
                                        "${snapshot.data![index].fields.description}")
                                ],
                                ),
                                
                            )
                      )
                        
                        
                        );
                    }
                }
            }));
    }
}
```

4) Pada file ```widgets/left_drawer.dart```, tambahkan ```ListTile``` baru sebagai berikut:
```
// ListTile Menu

ListTile(
    leading: const Icon(Icons.shopping_basket),
    title: const Text('Daftar Item'),
    onTap: () {
        // Route menu ke halaman produk
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ItemPage()),
        );
    },
),

// ListTile Tambah Item
```

<h3>Integrasi Form Flutter</h3>

<h4>Langkah-langkah di proyek Django</h4>

1) tambahkan fungsi berikut pada ```main/views.py```:
```
@csrf_exempt
def create_item_flutter(request):
    if request.method == 'POST':
        
        data = json.loads(request.body)

        new_product = Item.objects.create(
            user = request.user,
            name = data["name"],
            amount = int(data["amount"]),
            description = data["description"]
        )

        new_product.save()

        return JsonResponse({"status": "success"}, status=200)
    else:
        return JsonResponse({"status": "error"}, status=401)
```

2) Tambahkan path berikut pada ```main/urls.py```:
```
path('create-flutter/', create_product_flutter, name='create_product_flutter'),
```

<h4>Langkah-langkah di proyek Flutter</h4>

1) Pada file ```inventory_list_form```, tambahkan code berikut pada widget ```build````:
```
...
@override
Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
...
```

3) Ubah bagian code ```onPressed: ()``` button tambah menjadi berikut:
```
onPressed: () async {
          if (_formKey.currentState!.validate()) {
              // Kirim ke Django dan tunggu respons
              // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
              final response = await request.postJson(
              "http://localhost:8000/create-flutter/",
              jsonEncode(<String, String>{
                  'name': _name,
                  'amount': _amount.toString(),
                  'description': _description,
                  // TODO: Sesuaikan field data sesuai dengan aplikasimu
              }));
              if (response['status'] == 'success') {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(
                  content: Text("Produk baru berhasil disimpan!"),
                  ));
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
              } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(
                      content:
                          Text("Terdapat kesalahan, silakan coba lagi."),
                  ));
              }
          }
      },
```

<h3>Fitur Logout</h3>

<h4>Langkah-langkah di proyek Django</h4>

1) tambahkan code berikut di file ```authentication/views.py```:
```
from django.contrib.auth import logout as auth_logout
...
@csrf_exempt
def logout(request):
    username = request.user.username

    try:
        auth_logout(request)
        return JsonResponse({
            "username": username,
            "status": True,
            "message": "Logout berhasil!"
        }, status=200)
    except:
        return JsonResponse({
        "status": False,
        "message": "Logout gagal."
        }, status=401)
```

2) Tambahkan path berikut pada ```authentication/urls.py```:
```
path('logout/', logout, name='logout'),
```

<h4>Langkah-langkah di proyek Flutter</h4>

1) Modifikasi widget ```build``` pada file ```lib/widgets/inventory_card.dart```:
```
...
@override
Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
...
```

2) Pada widget ```Inkwell```, ubah ```onTap: () {...}``` menjadi ```onTap: () async {...}```

Terakhir, pada file inventory_card.dart, tambahkan code berikut setelah bagian ```if (item.name == "Tambah Item") {...}```:
```
else if (item.name == "Lihat Item") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ItemPage()));
      }
    else if (item.name == "Logout") {
        final response = await request.logout(
            // TODO: Ganti URL sesuai kebutuhan
            "http://localhost:8000/auth/logout/");
        String message = response["message"];
        if (response['status']) {
          String uname = response["username"];
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("$message Sampai jumpa, $uname."),
          ));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("$message"),
          ));
        }
      }
...
```

<h3>Halaman Detail Item</h3>

Dapat dilihat pada file ```list_item.dart``` masih terdapat error, karena file ```item_detail_page.dart``` belum dibuat.

1) Buat file ```item_detail_page.dart``` di ```lib/screens``` dan tambahkan code berikut:
```
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pacil_inventory/models/item.dart';
import 'package:pacil_inventory/widgets/left_drawer.dart';



class ItemDetailArguments {
  final String itemPk;


  ItemDetailArguments(this.itemPk);
}


class ItemDetailPage extends StatefulWidget {
    const ItemDetailPage({Key? key}) : super(key: key);

      static const routeName = '/itemDetail';
    

    @override
    _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
Future<List<Item>> fetchItem(BuildContext context) async {
    
    final args = ModalRoute.of(context)!.settings.arguments as ItemDetailArguments;
    // ATTN: Ganti URL sesuai kebutuhan
    var urlString = 'http://localhost:8000/json/${args.itemPk}';
    var url = Uri.parse(
        urlString);
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Item
    List<Item> list_item = [];
    for (var d in data) {
        if (d != null) {
            list_item.add(Item.fromJson(d));
        }
    }
    return list_item;
}

@override
Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        title: const Text('Item'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchItem(context),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "Tidak ada data Item.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                }
                else{
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) =>                      
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                    "${snapshot.data![index].fields.name}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    
                                    ),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.amount}"),
                                    const SizedBox(height: 10),
                                    Text(
                                        "${snapshot.data![index].fields.description}"),
                                    TextButton(
                                      style: ButtonStyle(
                                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                       },
                                      child: Text('Back'),
                                    )],
                                ),
                                
                            )
                        
                        
                        );}
                    }
                }
              ));
            }   
    }
```



2) Pada file ```main.dart```, tambahkan code berikut pada widget ```MaterialApp```:
```
...
child : MaterialApp(
routes: {
'/itemDetail': (context) => ItemDetailPage(),
},
...
```

<h2>Pengambilan data JSON tanpa model</h2>

Secara prinsip data JSON dapat diambil tanpa perlu adanya model. Namun hal ini tidak direkomendasikan karena jika demikian data yang diperoleh adalah String, dan pemrosesan data dilakukan seperti layaknya memproses string. Tentu dalam paradigma pemrograman yang modular hal seperti ini bukanlah best practice. Alangkah lebih baik jika data JSON dikonversi menjadi sebuah model terlebih dahulu sehingga pemrosesan data menjadi lebih terstruktur.

<h2>CookieRequest</h2>

CookieRequest digunakan agar aplikasi Flutter dapat menerima cookie dari sever. Hal ini berguna untuk membuat session dari user yang sedang login. CookieRequest perlu dibagikan ke semua komponen agar semua komponen dapat berinteraksi dengan server melalui cookie.Dalam kasus ini, cookies berperan agar user dapat berpindah-pindah route tanpa harus login kembali pada saat setiap kali pindah.

<h2>Mekanisme Pengambilan Data JSON</h2>

1) Aplikasi flutter memanggil halaman web yang berisi string JSON.
2) String JSON ini dikonversi menjadi JSON object menggunakan function jsonDecode.
3) JSON object dikonversi menjadi instance dari model yang telah kita definisikan menggunakan method ```NamaModel.fromJson(jsonObject)```
4) Pemrosesan data dapat dilakukan seperti layaknya model pada Dart.

<h2>Widget yang Digunakan</h2>

1) Provider: tempat untuk menginisialisasi sebuah value yang dapat diakses oleh childnya.
2) routes: tabel routing top-level untuk seluruh aplikasi. Berisi mapping antara route dan routeName masing-masing.
3) Navigator: Widget di mana child-childnya disimpan dalam bentuk stack. Biasa digunakan untuk mengatur urutan routing yang dibuka
4) MaterialPageRoute: Menyediakan transisi saat melakukan perpindahan route.
5) ScaffoldMessenger: Menyediakan API untuk menampilkan snack bars dan material banners. Dalam kasus ini digunakan untuk snack bars. 
6) TextEditingController: Memantau setiap perubahan yang terjadi pada suatu input text. 
7) EdgeInsets: Widget untuk membuat padding
8) MainAxisAlignment: Mengatur alignment childern berdasarkan axis utama. Dalam kasus ini karena menggunakan Column, maka axis utama yang dimaksud adalah axis vertical. 
9) AlertDialog: membuat AlertDialog
10) Future: Placeholder untuk komputasi asinkron yang belum selesai, akan diganti dengan hasil komputasinya jika sudah selesai.
11) CircularProgressIndicator: membuat circular progress indicator, biasa digunakan sebagai tanda bahwa aplikasi sedang loading.
12) ListView: membuat array of widget yang dapat discroll jika ruang tidak cukup
13) GestureDetector: widget yang mendeteksi gestures seperti tap, drag, dsb. 
14) FutureBuilder: membuat widget yang isinya bergantung dari status terakhir dari widget Future.
15) AsyncSnapshot: Representasi hasi interaksi terakhir dengan sebuah komputasi asinkron.
16) TextButton: membuat text button. 
17) MaterialStateProperty: nilai-nilai yang bergantung pada state material dari sebuah widget.


