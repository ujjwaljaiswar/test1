import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(home: LoginPage()));

class LoginPage extends StatelessWidget {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginUser(BuildContext context) async {
    final String apiUrl = 'https://virashtechnologies.com/test-virash/login.php';
    final String mobile = mobileController.text;
    final String password = passwordController.text;

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'mobile': mobile,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      print('Login successful');
      print(response.body);
    }

    else {
      print('Login failed');
      print(response.body);
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddProductPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: mobileController,
                decoration: InputDecoration(labelText: 'Mobile Number'),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () => loginUser(context),
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class AddProductPage extends StatelessWidget {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productDescriptionController = TextEditingController();

  Future<void> addProduct() async {
    final String apiUrl = 'https://virashtechnologies.com/test-virash/productData.php';
    final String productName = productNameController.text;
    final String productDescription = productDescriptionController.text;
    final String categoryId = '19';
    final String isImage = 'no';
    final String saleRate = '10.00';
    final String mrp = '12.00';
    final String unit = 'pieces';

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'product_name': productName,
        'description': productDescription,
        'category_id': categoryId,
        'is_image': isImage,
        'sale_rate': saleRate,
        'mrp': mrp,
        'unit': unit,
      },
    );

    if (response.statusCode == 200) {
      print('Product added successfully');
      print(response.body);
    }
    else {
      print('Product addition failed');
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: productNameController,
                decoration: InputDecoration(labelText: 'Product Name'),
              ),
              TextField(
                controller: productDescriptionController,
                decoration: InputDecoration(labelText: 'Product Description'),
              ),
              ElevatedButton(
                onPressed: addProduct,
                child: Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
