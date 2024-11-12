import 'package:flutter/material.dart';
import 'package:simplepbp_eshop_flutter/widgets/left_drawer.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "Default";
  int _amount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Produk',
        ),
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Name",
                  labelText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String value) {
                  setState(() {
                    _name = value;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Name tidak boleh empty!";
                  }
                  if (value.length > 30) {
                    return "Name tidak boleh lebih daripada 30 karakter!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Price",
                  labelText: "Price",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  setState(() {
                    _price = int.tryParse(value) ?? 0;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Price tidak boleh empty!";
                  }
                  int? val = int.tryParse(value);
                  if (val == null) {
                    return "Price harus merupakan sebuah bilangan.";
                  }
                  if (val < 0) {
                    return "Price tidak boleh negatif!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Description",
                  labelText: "Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String value) {
                  setState(() {
                    _description = value;
                  });
                },
                validator: (String? value) {
                  // Description  optional;
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
                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  setState(() {
                    _amount = int.tryParse(value) ?? 0;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Amount tidak boleh empty!";
                  }
                  int? val = int.tryParse(value);
                  if (val == null) {
                    return "Amount harus merupakan sebuah bilangan!";
                  }
                  if (val < 0) {
                    return "Amount tidak boleh negatif!";
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
                    backgroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.primary),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Set default description if empty
                      if (_description.isEmpty) {
                        _description = 'Default';
                      }

                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Product berhasil disimpan.'),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Name: $_name'),
                                  Text('Price: $_price'),
                                  Text('Description: $_description'),
                                  Text('Stocks: $_amount'),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.pop(context);
                                  _formKey.currentState!.reset();
                                  setState(() {
                                    _name = "";
                                    _price = 0;
                                    _description = "Default";
                                    _amount = 0;
                                  });
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
