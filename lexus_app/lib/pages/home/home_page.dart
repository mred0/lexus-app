// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:lexus_app/pages/chatgpt/chatgpt_page.dart';
import 'package:lexus_app/pages/downloads/downloads_page.dart';
import 'package:lexus_app/pages/profile/profile_page.dart';

import 'package:lexus_app/theme/style.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // var controller = Get.isRegistered<HomeController>()
  //     ? Get.find<HomeController>()
  //     : Get.put(HomeController());
  bool isSearch = false;
  Book? selectedBook = Book(
    title: 'Book 1',
    author: 'Author 1',
    coverImage: 'assets/book.png',
  );
  @override
  void initState() {
    super.initState();
  }

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Style.secondary,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                    shape: BoxShape.rectangle,
                    color: Style.bg_color),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProfilePage()),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(left: 0, top: 2),
                            child: CircleAvatar(
                              radius: 22,
                              backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
                              ),
                              backgroundColor: Colors.amber,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 80,
                          child: Image.asset('assets/logo.png'),
                        ),
                        SizedBox(
                          child: (isSearch == false)
                              ? IconButton(
                                  padding: const EdgeInsets.all(10),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white54),
                                  ),
                                  icon: const Icon(Icons.search),
                                  onPressed: () {
                                    setState(() {
                                      isSearch = true;
                                    });
                                  },
                                )
                              : IconButton(
                                  icon: const Icon(Icons.close),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white54),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isSearch = false;
                                    });
                                  },
                                ),
                        ),
                      ],
                    ),
                  ),
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                    (isSearch == true)
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: Colors.white,
                                  ),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Search',
                                      prefixIcon: Icon(Icons.search),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 50.0, vertical: 10.0),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        color: Colors.white,
                                      ),
                                      child: DropdownButton<Book>(
                                        // value: selectedBook,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        isExpanded: true,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedBook = value;
                                          });
                                        },
                                        elevation: 2,
                                        hint: const Text(
                                          'select subject',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        menuMaxHeight: 350,
                                        underline: const SizedBox(),
                                        items: books
                                            .map<DropdownMenuItem<Book>>(
                                                (Book value) {
                                          return DropdownMenuItem<Book>(
                                            value: value,
                                            child: Text(value.title),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 2, 0, 0),
                                      width: MediaQuery.of(context).size.width *
                                          0.28,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        // color: Colors.white,
                                      ),
                                      child: const Text(
                                        '12 Results Found',
                                        maxLines: 2,
                                        overflow: TextOverflow.clip,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                  ]),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Continue Reading...'),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DownloadsPage()));
                            },
                            child: const Text(
                              'Go To Downloads >',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Style.primary,
                                color: Style.primary,
                              ),
                            ),
                          ),

                          // IconButton(
                          //     style: ButtonStyle(
                          //       backgroundColor:
                          //           MaterialStateProperty.all(Colors.grey[300]),
                          //     ),
                          //     onPressed: () {},
                          //     icon: const Icon(Icons.download))
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      height: 100,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: books.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              onTap: () {
                                // Handle book item tap
                              },
                              child: Card(
                                elevation: 0,
                                color: Style.bg_color,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Image.asset(
                                        'assets/book.png',
                                        fit: BoxFit.fill,
                                        height: 60,
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(5, 0, 5, 0),
                                        child: SizedBox(
                                          width: 60,
                                          child: Text(
                                            'Chepter 1',
                                            style: TextStyle(
                                              fontSize: 11,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ));
                        },
                      ),
                    ),
                    const Divider(color: Colors.grey, height: 20, thickness: 2),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        crossAxisSpacing: 10.0, // Spacing between columns
                        mainAxisSpacing: 10.0, // Spacing between rows
                      ),
                      itemCount: 50,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            // Handle book item tap
                          },
                          child: Card(
                            elevation: 0,
                            color: Style.bg_color,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/book.png',
                                    fit: BoxFit.fill,
                                    height: 95,
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                    height: 10,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Chepter 1'),
                                            Text('Auther:-XYZ')
                                          ],
                                        ),
                                        Icon(
                                            Icons.download_for_offline_outlined)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChatPage()),
            );
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff74AA9C),
            ),
            child: const Icon(
              Icons.wechat_rounded,
              size: 30,
              color: Style.secondary,
            ),
          ),
        ),
      ),
    );
  }
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
