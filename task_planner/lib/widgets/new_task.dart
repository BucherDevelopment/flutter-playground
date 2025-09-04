import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_planner/models/task.dart';
import 'package:task_planner/providers/tasks_provider.dart';

class NewTask extends ConsumerStatefulWidget {
  const NewTask({super.key});
  @override
  ConsumerState<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends ConsumerState<NewTask> {
  final _formKey = GlobalKey<FormState>();

  var _enteredTitle = '';
  var _enteredDescription = '';
  Priority chosenPrio = Priority.medium;

  void _saveTask() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      debugPrint(chosenPrio.toString());

      ref
          .read(tasksProvider.notifier)
          .addTask(_enteredTitle, _enteredDescription, chosenPrio);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Add new Task',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 12),
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length < 5) {
                    return 'Please enter valid title (>5 characters)';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredTitle = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 5,

                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length < 10) {
                    return 'Please enter valid description (>10 characters)';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredDescription = value!;
                },
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: 'Priority'),
                value: chosenPrio,
                items:
                    Priority.values
                        .map(
                          (prio) => DropdownMenuItem(
                            value: prio,
                            child: Text(prio.name),
                          ),
                        )
                        .toList(),
                onChanged: (newVal) {
                  chosenPrio = newVal ?? Priority.medium;
                },
              ),
              SizedBox(height: 12),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel'),
                    ),
                    SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: _saveTask,

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),

                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
