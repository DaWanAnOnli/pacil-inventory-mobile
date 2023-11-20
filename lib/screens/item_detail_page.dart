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