import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_provider_learn/constants/app_text_constants.dart';
import 'package:todo_app_provider_learn/models/item.dart';
import 'package:todo_app_provider_learn/provider/grid_items_provider.dart';

class AddCategorize extends StatefulWidget {
  const AddCategorize({Key? key}) : super(key: key);

  @override
  State<AddCategorize> createState() => _AddCategorizeState();
}

class _AddCategorizeState extends State<AddCategorize> {
  late SharedPreferences sharedPreferences;
  final categorizeController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<GirdItems>(context, listen: false).intiSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(AppTextConstants.addCategory),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      )),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        TextFormField(
          validator: (value) {
            if (value == '') {
              return "Title can't be empty!";
            }
            return null;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Title',
          ),
          autofocus: true,
          controller: categorizeController,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: () {
              Item item = Item(title: categorizeController.text);
              Provider.of<GirdItems>(context, listen: false)
                  .addCategorize(item);
              Navigator.pop(context);
            },
            child: const Text(AppTextConstants.addCategory),
          ),
        )
      ]),
    );
  }
}
