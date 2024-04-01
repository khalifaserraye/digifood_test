import 'package:digifood/presentation/constants/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:digifood/buisness_logic/bloc/product/product_bloc.dart';
import 'package:digifood/data/models/product.dart';
import 'package:digifood/presentation/constants/app_colors.dart';
import 'package:digifood/presentation/utils/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProductForm extends StatefulWidget {
  final ProductBloc productBloc;

  const AddProductForm({Key? key, required this.productBloc}) : super(key: key);

  @override
  _AddProductFormState createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late double _price;
  late String _description;
  bool _toastShown = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.r),
      child: BlocListener<ProductBloc, ProductState>(
        bloc: widget.productBloc,
        listener: (context, state) {
          if (!_toastShown) {
            if (state is AddSuccessfulState) {
              showToast(message: "Product added successfully");
              Navigator.pop(context);
            } else if (state is AddErrorState) {
              showToast(message: "Error: ${state.error}");
            }
            _toastShown = true;
          }
        },
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 16.h),
              // Text widget displaying "Add product" heading
              Text(
                "Add product",
                style: TextStyle(
                  color: mainColor,
                  fontSize: 28.r,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.h),
              // Text form field for product name
              TextFormField(
                decoration:
                    textInputDecoration.copyWith(labelText: "Product Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product name';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              SizedBox(height: 16.h),
              // Text form field for product price
              TextFormField(
                decoration: textInputDecoration.copyWith(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || double.tryParse(value) == null) {
                    return 'Please enter a valid price';
                  }
                  return null;
                },
                onSaved: (value) => _price = double.parse(value!),
              ),
              SizedBox(height: 16.h),
              // Text form field for product description
              TextFormField(
                decoration:
                    textInputDecoration.copyWith(labelText: 'Description'),
                maxLines: null,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product description';
                  }
                  return null;
                },
                onSaved: (value) => _description = value!,
              ),
              // Elevated button for submitting the form
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final product = Product(
                        name: _name,
                        price: _price,
                        description: _description,
                      );
                      widget.productBloc.add(AddEvent(product));
                    }
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 16.r),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
