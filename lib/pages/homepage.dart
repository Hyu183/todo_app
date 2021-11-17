import 'package:flutter/material.dart';

import 'package:todo_app/dto/todo_dto.dart';

import 'package:todo_app/pages/today_list.dart';

import 'package:todo_app/widgets/add_todo.dart';
import 'package:todo_app/widgets/category_tile.dart';

class Homepage extends StatelessWidget {
  static const routeName = '/';
  final int countAll;
  final int countToday;
  final int countUpcoming;
  final Function(TodoDTO) addTodoHandler;
  final bool isLoading;
  const Homepage(
      {Key? key,
      required this.countAll,
      required this.countToday,
      required this.countUpcoming,
      required this.addTodoHandler,
      required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_rounded,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings_outlined,
            ),
          )
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              width: double.infinity,
              color: const Color(0xfff7f2f2),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CategoryTile(
                            title: 'All',
                            iconData: Icons.access_alarm,
                            onTapHandler: () {},
                            count: countAll),
                        const Divider(
                          color: Colors.grey,
                          thickness: 1,
                          indent: 60,
                        ),
                        CategoryTile(
                            title: 'Today',
                            iconData: Icons.access_alarm,
                            onTapHandler: () {
                              Navigator.of(context)
                                  .pushNamed(TodayList.routeName);
                            },
                            count: countToday),
                        const Divider(
                          color: Colors.grey,
                          thickness: 1,
                          indent: 60,
                        ),
                        CategoryTile(
                            title: 'Upcoming',
                            iconData: Icons.access_alarm,
                            onTapHandler: () {},
                            count: countUpcoming),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () => showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          )),
          isScrollControlled: true,
          builder: (ctx) {
            return Padding(
              padding:
                  EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
              child: AddTodo(
                addTodoHandler: addTodoHandler,
              ),
            );
          },
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
