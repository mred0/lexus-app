import 'package:flutter/material.dart';
import 'package:lexus_app/theme/style.dart';

class DownloadsPage extends StatefulWidget {
  const DownloadsPage({super.key});

  @override
  State<DownloadsPage> createState() => _DownloadsPageState();
}

class _DownloadsPageState extends State<DownloadsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Style.bg_color,
      appBar: AppBar(
          elevation: 0,
          bottom: const PreferredSize(
              preferredSize: Size(0, 5),
              child: Divider(
                color: Colors.grey,
                height: 1.5,
                thickness: 2.5,
              )),
          backgroundColor: Style.bg_color,
          title: const Text('Downloaded Books')),
      body: Padding(
        padding: const EdgeInsets.only(top: 7),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
              decoration: const BoxDecoration(
                  color: Style.secondary,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: ListTile(
                leading: Image.asset(
                  'assets/book.png',
                  fit: BoxFit.fill,
                  height: 50,
                ),
                trailing: const Icon(
                  Icons.delete_outline_outlined,
                  size: 30,
                  color: Style.primary,
                ),
                title: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Books Auther'),
                    Text('Books Auther'),
                  ],
                ),
                // Add other widgets or customization as needed
              ),
            );
          },
        ),
      ),
    ));
  }
}
