import 'package:flutter/material.dart';
import 'package:todo_app_provider_learn/Screens/monthtodospage.dart';
import 'package:todo_app_provider_learn/Screens/todaytodospage.dart';
import 'package:todo_app_provider_learn/Screens/weektodospage.dart';
import 'package:todo_app_provider_learn/constants/app_color_constants.dart';
import 'package:todo_app_provider_learn/constants/app_text_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          bottom: const TabBar(
            labelColor: AppColorConstants.purple,
            unselectedLabelColor: AppColorConstants.white,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                color: AppColorConstants.white),
            tabs: [
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(AppTextConstants.todayTabController),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(AppTextConstants.monthTabController),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(AppTextConstants.weekTabController),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          ToDayToDosPage(),
          WeekToDoPage(),
          MonthToDosPage(),
        ]),
      )),
    );
  }
}
