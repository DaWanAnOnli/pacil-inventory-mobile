import 'package:flutter/material.dart';
import 'package:pacil_inventory/screens/inventory_list_form.dart';

class InventoryItem {
  final String name;
  final IconData icon;
  final Color color;

  InventoryItem(this.name, this.icon, this.color);
}