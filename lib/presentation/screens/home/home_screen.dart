// ignore_for_file: library_private_types_in_public_api

import 'package:digifood/presentation/constants/app_colors.dart';
import 'package:digifood/presentation/screens/home/components/home_appbar.dart';
import 'package:digifood/presentation/screens/home/components/home_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: backgroundColor,
        appBar: HomeAppBar(),
        body: HomeBody());
  }
}
