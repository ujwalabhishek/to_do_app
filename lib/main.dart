import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'edit_task_page.dart';
import 'task_model.dart';
import 'task_service.dart';
void main() {
  runApp(MaterialApp(home: TaskListPage()));
}

class TaskListPage extends StatefulWidget {
  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final TaskService taskService = TaskService();

  late Future<List<Task>> _taskListFuture;
  @override
  void initState() {
    super.initState();
    _taskListFuture = taskService.getTasks();
  }

  Future<void> _refreshTaskList() async {
    setState(() {
      _taskListFuture = taskService.getTasks();
    });
  }

  Future<void> _editTask(Task task) async {
    // Open the EditTaskPage as a modal bottom sheet.
    await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return EditTaskPage(task: task);
      },
    );

    // Refresh the task list after editing is done.
    _refreshTaskList();
  }
  Future<void> _deleteTask(Task task) async {
    try {
      // Delete the task using your service.
      setState(()  {
         taskService.deleteTask(task);
      });
    } catch (e) {
      print('Failed to delete task: $e');
      // Handle the error accordingly.
    }
    // Refresh the task list after editing is done.
    _refreshTaskList();
  }

  Future<void> _toggleTaskCompletion(Task task, bool isCompleted) async {
    try {
      // Update the task's completion status using your service.
      setState(() {
        task.isCompleted = isCompleted;
        // Replace the existing task with the updated task.
        // Save the task using the TaskService.
        taskService.updateTask(task);
      });
    } catch (e) {
      print('Failed to update task completion status: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
      ),
      // refresh task list on pull down action
      body: RefreshIndicator(
        onRefresh: _refreshTaskList,
        child: FutureBuilder<List<Task>>(
        future: taskService.getTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final List<Task> tasks = snapshot.data ?? [];
            return tasks.isEmpty
                ? Center(
              child: Text('No tasks found.'),
            )
            : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return Dismissible(
                    key: Key(task.objectId),
                onDismissed: (direction) {
                // Delete the task when swiped away.
                _deleteTask(task);
                },
                background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                Icons.delete,
                color: Colors.white,
                ),
                ),
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(
                      task.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      task.isCompleted ? 'Completed: ${task.description}': task.description,
                      style: TextStyle(
                        color: task.isCompleted ? Colors.green : Colors.red,
                      ),
                    ),
                    onTap: () {
                      // Edit the task when tapped on the card.
                      _editTask(task);
                    },
                  ),
                ),
                );
              },
            );
          }
        },
      ),
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add any action you want when tapping on the FloatingActionButton.
          // For example, navigate to a new page for adding a new task.
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// Example AddTaskPage (replace it with your actual implementation)
class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState()=> _AddTaskPageState();
}
class _AddTaskPageState extends State<AddTaskPage>{
  final TaskService taskService = TaskService();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  bool _isCompleted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Task Title'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Task Description'),
                maxLines: 3, // Allowing multiple lines for the description.
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('Is Completed:'),
                  SizedBox(width: 8),
                  Checkbox(
                    value: _isCompleted,
                    onChanged: (value) {
                      setState(() {
                        _isCompleted = value ?? false;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  // Create a new Task object with the entered details.
                  Task newTask = Task(
                    objectId: '',
                    title: _titleController.text,
                    description: _descriptionController.text,
                    isCompleted: _isCompleted,
                  );

                  // Save the task using the TaskService.
                  await taskService.saveTask(newTask);

                  // Navigate back to the task list page.
                  Navigator.pop(context);
                },
                child: Text('Save Task'),
              ),
            ],
        ),
      ),
    );
  }
}