import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider_learn/provider/grid_items_provider.dart';
import 'package:todo_app_provider_learn/widgets/category_add.dart';
import 'package:todo_app_provider_learn/widgets/item_card.dart';

class ToDayToDosPage extends StatefulWidget {
  const ToDayToDosPage({Key? key}) : super(key: key);

  @override
  State<ToDayToDosPage> createState() => _ToDayToDosPageState();
}

class _ToDayToDosPageState extends State<ToDayToDosPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<GirdItems>(context, listen: false).intiSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Consumer<GirdItems>(
          builder: ((context, state, child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 2 / 2),
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) {
                    return GridTile(
                        child: ItemCard(
                      item: state.categories[index],
                    ));
                  }),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context, builder: (context) => const AddCategorize());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
