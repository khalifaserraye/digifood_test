import 'package:digifood/presentation/screens/home/components/home_body.dart';
import 'package:digifood/presentation/screens/home/components/home_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      body: HomeBody(),
    );
  }
}
