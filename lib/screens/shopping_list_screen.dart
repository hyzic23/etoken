import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:etoken/models/product.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  List<String> entries = <String>['A', 'B', 'C'];
  final _logger = Logger('ShoppingListScreen');
  final List<int> colorCodes = <int>[600, 500, 100];
  //final url = 'http://localhost:5096/api/Product';
  final url =
      'https://flutter-app-e6c30-default-rtdb.firebaseio.com/shopping-list.json';
  final dio = Dio();
  var jsonList;
  Map productMap = Map();

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    try {
      // final response = await dio.get(
      //     'https://flutter-app-e6c30-default-rtdb.firebaseio.com/shopping-list.json');
      final urll = Uri.https('flutter-app-e6c30-default-rtdb.firebaseio.com',
          'shopping-list.json');

      final response = await http.get(urll);
      final Map<String, dynamic> listData = jsonDecode(response.body);
      print('ResData $listData');

      //final response = await dio.get(url);
      //print('reSPONSE is $response');
      //if (response.statusCode == 200) {
      //setState(() {
      //final Map<String, dynamic> listData = jsonDecode(response);
      //print('list Data $listData');

      // final Map<String, dynamic> listData = jsonDecode(response.data);
      // print('listData is $listData');
      // String products = jsonEncode(response.data);
      // print('Products is $products');

      // Map map = jsonDecode(products);
      // print('Products dd is $map');
      // //List<String> tags = dd;
      // //print('Products Tags is $tags');

      // Map<String, Product> list = json.decode(products);
      // print('List is $list');

      //final Map<String, Product> list = json.decode(response.data);
      //print('Json is $list');
      //var list = response.data as List;
      //List<Product> products = List<Product>.from(response.data);
      //_logger.log('Product List is $products['name']');
      //print('Product List is $products');
      //productMap = list.asMap();
      // print(response.data.toString());
      // print('List is $list');
      // print('Map is $productMap');
      //jsonList = response.data[''] as List;
      // });
      //}
    } catch (e, strackTrace) {
      //_logger.severe('Error!!!', e, strackTrace);
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Shopping List', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.red[900],
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: productMap.length,
            itemBuilder: (BuildContext context, index) {
              return Container(
                height: 50,
                child: ListTile(
                  title: Text(productMap['name']),
                ),
                //color: Colors.amber[colorCodes[index]],
                // child: Center(
                //   child: Text('Entry ${entries[index]}'),
                // ),
              );
            }),
      ),
    );
  }

  // Widget ScaldFoldWidget() => ScaldFold(
  //   title: 'Shopping List',

  //   );
}
