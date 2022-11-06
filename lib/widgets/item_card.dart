import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider_learn/constants/app_color_constants.dart';
import 'package:todo_app_provider_learn/models/item.dart';
import 'package:todo_app_provider_learn/provider/grid_items_provider.dart';
import 'package:todo_app_provider_learn/provider/todo_provider.dart';
import 'package:todo_app_provider_learn/widgets/item_add.dart';

class ItemCard extends StatelessWidget {
  ItemCard({Key? key, required this.item}) : super(key: key);
  Item item;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      primary: false,
      padding: const EdgeInsets.all(10.0),
      crossAxisSpacing: 10,
      mainAxisSpacing: 20,
      children: <Widget>[
        Consumer<GirdItems>(builder: ((context, state, child) {
          return SizedBox(
            width: 160,
            height: 160,
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => AddItem(item: item));
              },
              onLongPress: () {
                state.deleteCategoriez(item);
              },
              child: Card(
                color: AppColorConstants.white,
                elevation: 2.0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          item.title,
                          style:
                              const TextStyle(color: AppColorConstants.purple),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Consumer<TodoProvider>(
                              builder: (context, state, child) {
                            return Text(
                              'to-do(${state.alltodos.where((todo) => todo.category.contains(item.title)).length})',
                              style: const TextStyle(
                                fontWeight: FontWeight.w200,
                              ),
                            );
                          })),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(100, 20, 0, 0),
                        child: Icon(
                          Icons.assignment,
                          color: AppColorConstants.purple,
                          size: 22,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }))
      ],
    );
  }
}
