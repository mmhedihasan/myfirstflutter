import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mynewapp/Product_List_Pojo.dart';



class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final Client httpClint= Client();
  ProductListPojo productListPojo = ProductListPojo();
  bool dataLoadingInProgress = false;
  Future<void> getProductListFromApi() async {
    dataLoadingInProgress = true;
    setState(() { });
    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct');
    Response response= await httpClint.get(uri);
    productListPojo = ProductListPojo.fromJson(jsonDecode(response.body));
    // print(productListPojo.status);
    // print(productListPojo.data?.length ?? 0);
    dataLoadingInProgress = false;
    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductListFromApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const addProduct()));
          },child: Icon(Icons.add) ,
      ),
      body: RefreshIndicator(
        onRefresh: () async{
          getProductListFromApi();
        },
        child: dataLoadingInProgress ? const Center(
          child: CircularProgressIndicator(),
        ) : ListView.builder (
            itemCount: productListPojo.data?.length ?? 0,
            itemBuilder: (context, index){
              return  ListTile(
                title: Text(productListPojo.data?[index].productName ?? 'Unknown'),
                subtitle: Text('Quantity : ${productListPojo.data?[index].qty ?? 'Unknown'}'),
                trailing: Text('Total : ${productListPojo.data?[index].totalPrice ?? 'Unknown'}'),
                leading: Text('${productListPojo.data?[index].unitPrice ?? 'Unknown'}/Unit'),

              );
            }
        ),
      )
    );
  }
}
class addProduct extends StatefulWidget {
  const addProduct({Key? key}) : super(key: key);

  @override
  State<addProduct> createState() => _addProductState();
}

class _addProductState extends State<addProduct> {

  final TextEditingController productNameETController= TextEditingController();
  final TextEditingController productCodeETController= TextEditingController();
  final TextEditingController productQuantityETController= TextEditingController();
  final TextEditingController productTotalPriceETController= TextEditingController();
  final TextEditingController productUnitPriceETController= TextEditingController();
  final TextEditingController productImageETController= TextEditingController();
  final Client httpClient = Client();
  Future<void> addNewProductToApi() async {
    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct');
    Response response= await httpClient.post(
        uri,
        headers: {
          'Content-Type' : 'application/json'
        },
        body: jsonEncode(
        {
          "Img": productImageETController.text,
          "ProductCode": productCodeETController.text,
          "ProductName": productNameETController.text,
          "Qty": productQuantityETController.text,
          "TotalPrice": productTotalPriceETController.text,
          "UnitPrice": productUnitPriceETController.text
        }
    )
    );
    final responseJson = jsonDecode(response.body);
    if(responseJson["status"] == "success"){
      productImageETController.clear();
      productUnitPriceETController.clear();
      productTotalPriceETController.clear();
      productNameETController.clear();
      productQuantityETController.clear();
      productCodeETController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data Insert Successfully'))
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data Insert Faild'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
              TextFormField(
                controller: productNameETController,
                decoration: const InputDecoration(
                  hintText: "Product Name"
                ),
                ), TextFormField(
                controller: productCodeETController,
                decoration: const InputDecoration(
                  hintText: "Product Code"
                ),
                ),TextFormField(
                controller: productTotalPriceETController,
                decoration: const InputDecoration(
                  hintText: "Product Total Price"
                ),
                ),TextFormField(
                controller: productUnitPriceETController,
                decoration: const InputDecoration(
                  hintText: "Product Unite Price"
                ),
                ),TextFormField(
                controller: productImageETController,
                decoration: const InputDecoration(
                  hintText: "Product Image"
                ),
                ),
            ElevatedButton(onPressed: (){
              addNewProductToApi();
            }, child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}
