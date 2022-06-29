import 'package:agency/views/layouts/footer.dart';
import 'package:agency/views/layouts/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black54,
            centerTitle: true,
            toolbarHeight: 100,
            pinned: false,
            title: Header(),
            floating: true,
            automaticallyImplyLeading: false,
            titleTextStyle: Get.textTheme.bodyMedium,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                child,
                Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
