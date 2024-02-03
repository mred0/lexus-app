import 'package:flutter/material.dart';
import 'package:lexus_app/custome_widgets/text_field_widget.dart';
import 'package:lexus_app/theme/style.dart';

class PaperPage extends StatefulWidget {
  const PaperPage({super.key});

  @override
  State<PaperPage> createState() => _PaperPageState();
}

class _PaperPageState extends State<PaperPage>
    with SingleTickerProviderStateMixin {
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController schoolAddressController = TextEditingController();

  String? selectedBoard = '';
  List<String> boards = ['GSEB', 'NCERT', 'HSEB', 'PSEB'];

  @override
  void initState() {
    super.initState();

    // Initialize the TabController
  }

  @override
  void dispose() {
    // Dispose of the TabController when the widget is disposed

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Style.secondary,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Style.secondary),
            elevation: 0,
            backgroundColor: Style.primary,
            title: const Text(
              'Generate Question Paper',
              style: TextStyle(color: Style.secondary),
            ),
            bottom: const TabBar(
              labelColor: Style.secondary,
              indicatorColor: Style.secondary,
              tabs: [
                Tab(text: 'Tab 1'),
                Tab(text: 'Tab 2'),
                Tab(text: 'Tab 3'),
              ],
            ),
          ),
          body: Builder(builder: (context) {
            TabController? tabController = DefaultTabController.of(context);
            return TabBarView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(2, 10, 0, 3.0),
                        child: Text('School Name'),
                      ),
                      AppTextField(
                        hintText: 'School Name',
                        controller: schoolNameController,
                        textsize: 12,
                        boxheight: 50,
                        maxLine: 1,
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(2, 12, 0, 3.0),
                        child: Text('School Address'),
                      ),
                      AppTextField(
                        hintText: 'School Adress',
                        controller: schoolAddressController,
                        textsize: 12,
                        minLine: 2,
                        maxLine: 15,
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(2, 12, 0, 3.0),
                        child: Text('Upload School Logo'),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 1.8),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            const Expanded(
                                child: Text(
                              'Upload File Here',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            )),
                            Container(
                              height: 50,
                              width: 75,
                              decoration: BoxDecoration(
                                  color: Style.primary,
                                  border: Border.all(
                                      color: Colors.grey, width: 1.8),
                                  borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(8),
                                      topRight: Radius.circular(8))),
                              child: const Icon(
                                Icons.upload_file,
                                color: Style.secondary,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(2, 12, 0, 3.0),
                        child: Text('Select Board'),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 1.8),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton<String>(
                          // value: selectedBook,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          isExpanded: true,
                          onChanged: (value) {
                            setState(() {
                              selectedBoard = value;
                            });
                          },
                          elevation: 2,
                          hint: const Text(
                            'select subject',
                            style: TextStyle(fontSize: 15),
                          ),
                          menuMaxHeight: 350,
                          underline: const SizedBox(),
                          items: boards
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tabController.index = 1;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                              color: Style.primary,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                  color: Colors.white, // Set the text color
                                  fontSize: 16.0,
                                  fontWeight:
                                      FontWeight.w600 // Set the font size
                                  ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Center(
                  child: Text('Tab 2 Content'),
                ),
                const Center(
                  child: Text('Tab 3 Content'),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
