// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lexus_app/home/home_controller.dart';
import 'package:lexus_app/theme/style.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  var controller = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final List<Book> books = [
      Book(
        title: 'Book 1',
        author: 'Author 1',
        coverImage: 'assets/book.png',
      ),
      Book(
        title: 'Book 2',
        author: 'Author 2',
        coverImage: 'assets/book.png',
      ),
      Book(
        title: 'Book 2',
        author: 'Author 2',
        coverImage: 'assets/book.png',
      ),
      Book(
        title: 'Book 2',
        author: 'Author 2',
        coverImage: 'assets/book.png',
      ),
      Book(
        title: 'Book 2',
        author: 'Author 2',
        coverImage: 'assets/book.png',
      ),
      Book(
        title: 'Book 2',
        author: 'Author 2',
        coverImage: 'assets/book.png',
      ),
      Book(
        title: 'Book 2',
        author: 'Author 2',
        coverImage: 'assets/book.png',
      ),
      Book(
        title: 'Book 2',
        author: 'Author 2',
        coverImage: 'assets/book.png',
      ),
      // Add more books here
    ];
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(180.0),
          child: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            backgroundColor: Colors.grey[300], // Change to your desired color
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            centerTitle: true,
            title: SizedBox(
              height: 80,
              child: Image.asset('assets/logo.png'),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
                  ),
                ),
              ),
            ],
            flexibleSpace:
                Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                    ),
                  ),
                ),
              ),
            ]),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Obx(() => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.shade200,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 25,
                            child: DropdownButton(
                              underline: const SizedBox(),
                              onChanged: (newValue) {
                                controller.setSelected(newValue!);
                              },
                              value: controller.selected.value,
                              items:
                                  controller.dropdownValues.map((selectedType) {
                                return DropdownMenuItem(
                                  value: selectedType,
                                  child: Text(
                                    selectedType,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SizedBox(
                height: 600,
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 10.0, // Spacing between columns
                    mainAxisSpacing: 10.0, // Spacing between rows
                  ),
                  itemCount: books.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // Handle book item tap
                      },
                      child: Card(
                        color: Style.primary,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Image.asset(
                                  books[index].coverImage,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<PersistentBottomNavBarItem> navBarItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.menu_book_outlined),
      title: "Books",
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.search),
      title: ("Search"),
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.question_answer),
      title: ("Profile"),
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person),
      title: ("Profile"),
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.grey,
    ),
  ];
}

class Book {
  final String title;
  final String author;
  final String coverImage;

  Book({
    required this.title,
    required this.author,
    required this.coverImage,
  });
}
