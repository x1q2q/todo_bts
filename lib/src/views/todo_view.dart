import 'package:flutter/material.dart';
import 'package:todo_bts/src/services/todo_repositories.dart';
import 'package:todo_bts/src/viewmodels/loading_notifier.dart';
import 'package:todo_bts/src/views/widgets/index.dart';
import 'package:todo_bts/src/utils/index.dart';
import 'package:todo_bts/src/viewmodels/todo_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:todo_bts/src/models/todo.dart';
import 'package:todo_bts/src/models/item.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final provider = Provider.of<TodoRepositories>(context, listen: false);
      final todoController = Provider.of<TodoViewmodel>(context, listen: false);
      await provider.getTodo(Core.token).then((val) {
        todoController.setTodo(val);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final todoController = Provider.of<TodoViewmodel>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          title: Text('Todo Checklist BTS', style: AppStyles.wRegular(20)),
          backgroundColor: AppColors.primary,
        ),
        body: SafeArea(
            child: RefreshIndicator(
                    backgroundColor: Colors.teal,
                    color: Colors.white,
                    strokeWidth: 2.0,
                    onRefresh: () async {},
                    child: ScrollConfiguration(
                        behavior: const ScrollBehavior(),
                        child: todoController.isLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.teal))
                            : !todoController.hasError
                                ? _buildTodos(context, todoController.todos)
                                : Column(
                                    children: <Widget>[
                                      Text("Error: ${todoController.errorMsg}"),
                                      const SizedBox(height: 10),
                                      ElevatedButton(
                                          onPressed: () async {},
                                          child: const Text('Refresh Token'))
                                    ],
                                  )))
                .addPd(all: 10)),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final todoController =
                Provider.of<TodoViewmodel>(context, listen: false);
            // todoController.addTodo();
          },
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.add),
        ));
  }

  Widget _buildTodos(BuildContext context, List<Todo>? data) {
    return ListView.separated(
        itemCount: data!.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) => AppStyles.yGapSm,
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (BuildContext context, int index) {
          Todo item = data[index];
          List<Item> itemDetail = item.items;
          List<String> itemString = itemDetail.map((el) => el.name).toList();
          String content = itemString.join(',').toString();
          return CardTile(
              height: 60,
              widget: _buildContentTile(context, item),
              onTap: () async {
                await UIHelper.modalDialog(
                    context: context, title: 'Todo Detail', content: content);
              });
        });
  }

  Widget _buildContentTile(BuildContext context, Todo item) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              child: Text(
            item.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.primLight(16),
          )),
          Text(' ${item.items.length} items'),
          SizedBox(width: 8)
        ]);
  }
}
