import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_price_prediction/home/controller/home_controller.dart';

class LocationDropDown extends StatefulWidget {
  const LocationDropDown({super.key});

  @override
  State<LocationDropDown> createState() => _LocationDropDownState();
}

class _LocationDropDownState extends State<LocationDropDown> {

  late final HomeController _homeController;
  final OutlineInputBorder _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(
        color: Colors.blue,
        width: 2
    ),
  );


  @override
  void initState() {
    super.initState();
    _homeController = Get.find<HomeController>();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      focusColor: Colors.transparent,
      decoration: InputDecoration(
        border: _border,
        focusedErrorBorder: _border,
        focusedBorder: _border,
        errorBorder: _border,
        enabledBorder: _border,
        disabledBorder: _border,
      ),
      isExpanded: true,
      borderRadius: BorderRadius.circular(12),
      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 8),
      icon: const SizedBox(),
      style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),
      value: _homeController.currentLocation.value,
      items: _homeController.locations.map((location) => DropdownMenuItem(value: location,child: Text(location,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),))).toList(),
      onChanged: (newLocation){
        _homeController.currentLocation.value = newLocation.toString();
      },
    );
  }
}
