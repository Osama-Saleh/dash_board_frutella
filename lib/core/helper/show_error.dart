import 'package:flutter/material.dart';

void showError(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Please select an Image')));
                                
}