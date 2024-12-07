import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:live_class_project/models/product.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key, required this.product});

  static const String name = '/update-product';

  final Product product;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _priceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  bool _updateProductInProgress = false;

  @override
  void initState() {
    super.initState();
    _nameTEController.text = widget.product.productName ?? '';
    _priceTEController.text = widget.product.unitPrice ?? '';
    _totalPriceTEController.text = widget.product.totalPrice ?? '';
    _quantityTEController.text = widget.product.quantity ?? '';
    _imageTEController.text = widget.product.image ?? '';
    _codeTEController.text = widget.product.productCode ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _buildProductForm(),
        ),
      ),
    );
  }

  Widget _buildProductForm() {
    return Form(
      // TODO: complete form validation
      child: Column(
        children: [
          TextFormField(
            controller: _nameTEController,
            decoration: const InputDecoration(
                hintText: 'Name', labelText: 'Product name'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter product name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _priceTEController,
            decoration: const InputDecoration(
                hintText: 'Price', labelText: 'Product Price'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter product price';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _totalPriceTEController,
            decoration: const InputDecoration(
                hintText: 'Total price', labelText: 'Product Total Price'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter product total price';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _quantityTEController,
            decoration: const InputDecoration(
                hintText: 'Quantity', labelText: 'Product Quantity'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter product quantity';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _codeTEController,
            decoration: const InputDecoration(
                hintText: 'Code', labelText: 'Product Code'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter product code';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _imageTEController,
            decoration: const InputDecoration(
                hintText: 'Image url', labelText: 'Product Image'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter product image url';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          Visibility(
            visible: _updateProductInProgress == false,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: ElevatedButton(
              onPressed: () {
                // TODO: check form validation
                _updateProduct();
              },
              child: const Text('Update Product'),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _updateProduct() async {
    _updateProductInProgress = true;
    setState(() {});
    Uri uri = Uri.parse(
        'https://crud.teamrabbil.com/api/v1/UpdateProduct/${widget.product.id}');

    Map<String, dynamic> requestBody = {
      "Img": _imageTEController.text.trim(),
      "ProductCode": _codeTEController.text.trim(),
      "ProductName": _nameTEController.text.trim(),
      "Qty": _quantityTEController.text.trim(),
      "TotalPrice": _totalPriceTEController.text.trim(),
      "UnitPrice": _priceTEController.text.trim()
    };

    Response response = await post(
      uri,
      headers: {'Content-type': 'application/json'},
      body: jsonEncode(requestBody),
    );
    print(response.statusCode);
    print(response.body);
    _updateProductInProgress = false;
    setState(() {});
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product has been updated!'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product update failed! Try again.'),
        ),
      );
    }
  }

  @override
  void dispose() {
    _nameTEController.dispose();
    _codeTEController.dispose();
    _priceTEController.dispose();
    _totalPriceTEController.dispose();
    _imageTEController.dispose();
    _quantityTEController.dispose();
    super.dispose();
  }
}
