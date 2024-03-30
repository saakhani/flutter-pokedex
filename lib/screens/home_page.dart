import 'package:classwork/provider/todo_provider';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TodoProvider>(context, listen: false).getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Api"),
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<TodoProvider>(
          builder: (context, value, child) {
            if (value.isLoading){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final todos = value.todos;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index){
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child

                )
              },
            );
          },
          ) ,
        ),
    )
  }
}
