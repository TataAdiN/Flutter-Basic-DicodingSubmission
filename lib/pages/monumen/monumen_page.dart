import 'package:flutter/material.dart';

import '../../models/monument.dart';
import 'monumen_state.dart';

class MonumentPage extends StatefulWidget {
  const MonumentPage({super.key, required this.monument});

  final Monument monument;

  @override
  State<MonumentPage> createState() => MonumentPageState();
}