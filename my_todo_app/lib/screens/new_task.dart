import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todo_app/providers/tasks_provider.dart';

class NewTaskScreen extends ConsumerStatefulWidget {
  const NewTaskScreen({super.key});

  @override
  ConsumerState<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends ConsumerState<NewTaskScreen> {
  final _formKey = GlobalKey<FormState>();

  var _enteredTitle = '';
  var _enteredDescription = '';

  void _saveForm() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    ref
        .read(tasksProvider.notifier)
        .addTask(_enteredTitle, _enteredDescription);
    _formKey.currentState!.reset();
    Navigator.of(context).pop();
    print('$_enteredTitle, $_enteredDescription');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add new Task')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 4) {
                    return 'Please enter a title (>4 characters)';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredTitle = value!;
                },
              ),
              TextFormField(
                maxLines: 3,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 4) {
                    return 'Please enter a Description (>4 characters)';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredDescription = value!;
                },
              ),

              ElevatedButton(onPressed: _saveForm, child: Text('Add Task')),
            ],
          ),
        ),
      ),
    );
  }
}
