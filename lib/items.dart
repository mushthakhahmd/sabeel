import 'package:flutter/material.dart';
import 'package:sabeel/constant.dart';
import 'package:sabeel/db/db_function.dart';
import 'package:sabeel/home.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:sabeel/model/item_model.dart';
import 'package:sabeel/views/pdf_view.dart';

class item_list_wakeup extends StatefulWidget {
  final int cat_id;
  const item_list_wakeup({Key? key, required this.cat_id}) : super(key: key);

  @override
  _item_list_wakeupState createState() => _item_list_wakeupState();
}

class _item_list_wakeupState extends State<item_list_wakeup> {
  @override
  void initState() {
    super.initState();

    getItems(widget.cat_id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 330,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: Container(
                  height: 36,
                  width: 36,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const home_page()));
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xff1D438A),
                          size: 24,
                        )),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SpaceBar(),
            Expanded(
              child: ValueListenableBuilder(
                  valueListenable: itemsNotifier,
                  builder:
                      (BuildContext ctx, List<Items> items, Widget? child) {
                    return ListView.builder(
                      itemCount: itemsNotifier.value.length,
                      shrinkWrap: true,
                      itemBuilder: (itemBuilder, index) {
                        final item = itemsNotifier.value[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<dynamic>(
                                builder: (_) => PdfViewPage(
                                  path: item.imgUrl,
                                  pageHeader: item.title,
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: ListTile(
                                leading: SizedBox(
                                    height: 50.0,
                                    width: 50.0, // fixed width and height
                                    child: Image.asset("list.png")),
                                title: Text(
                                  item.title,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                subtitle: Text(
                                  item.subTitle,
                                  style: const TextStyle(
                                      color: Colors.black87, fontSize: 16),
                                ),
                                trailing: Padding(
                                  padding: const EdgeInsets.only(bottom: 25),
                                  child: Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(
                                              0.5), //color of shadow
                                          spreadRadius:
                                              0.5, //spread radius// blur radius
                                          // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: FavoriteButton(
                                      iconSize: 24,
                                      isFavorite: item.isFavorite,
                                      // iconDisabledColor: Colors.white,
                                      valueChanged: (_isFavorite) async {
                                        await updateFavorite(
                                            item.id, _isFavorite.toString());
                                        print('Is Favorite : $_isFavorite');
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
