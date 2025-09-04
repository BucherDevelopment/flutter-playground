import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/providers/tasks_provider.dart';

class NewTaskScreen extends ConsumerStatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends ConsumerState<NewTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? selectedDate;

  void _saveTask() {
    if (_formKey.currentState!.validate()) {
      final taskName = _taskController.text.trim();
      final description = _descriptionController.text.trim();
      ref
          .read(tasksProvider.notifier)
          .addTask(taskName, description, selectedDate ?? DateTime.now());
      Navigator.pop(context);
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              child: Text(
                'Neue Aufgabe hinzufügen',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),

            const SizedBox(height: 20),
            TextFormField(
              controller: _taskController,
              decoration: const InputDecoration(labelText: 'Aufgabenname'),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Bitte gib einen Namen für die Aufgabe ein';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Beschreibung'),
              maxLines: 3,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Bitte gib eine Beschreibung für die Aufgabe ein';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => _selectDate(context),
                  icon: const Icon(Icons.calendar_today),
                ),
                SizedBox(
                  height: 20,
                  child: Text(
                    selectedDate != null
                        ? 'Fälligkeitsdatum: ${DateFormat('dd.MM.yyyy').format(selectedDate!)}'
                        : 'Kein Fälligkeitsdatum ausgewählt',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveTask,
              child: const Text('Speichern'),
            ),
          ],
        ),
      ),
    );
  }
}
