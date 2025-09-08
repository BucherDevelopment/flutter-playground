import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galery_app/models/picture_element.dart';
import 'package:galery_app/providers/pictures_provider.dart';

class NewPictureDialog extends ConsumerStatefulWidget {
  final PictureElement? initialPicture;
  const NewPictureDialog({super.key, this.initialPicture});

  @override
  ConsumerState<NewPictureDialog> createState() => _NewPictureDialogState();
}

class _NewPictureDialogState extends ConsumerState<NewPictureDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _descController;
  String randomSeed = DateTime.now().millisecondsSinceEpoch.toString();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(
      text: widget.initialPicture?.title ?? '',
    );
    _descController = TextEditingController(
      text: widget.initialPicture?.description ?? '',
    );
    randomSeed =
        widget.initialPicture?.randomSeed ??
        DateTime.now().millisecondsSinceEpoch.toString();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  static final submitButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.deepPurple,
    foregroundColor: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
  );

  void _regenerateImage() {
    setState(() {
      randomSeed = DateTime.now().millisecondsSinceEpoch.toString();
    });
  }

  void _saveForm() {
    final isValid = _formKey.currentState?.validate();
    if (isValid == null || !isValid) {
      return;
    }
    _formKey.currentState?.save();

    final newPicture = PictureElement(
      id:
          widget.initialPicture?.id ??
          DateTime.now().millisecondsSinceEpoch.toString(),
      title: _titleController.text,
      description: _descController.text,
      randomSeed: randomSeed,
      isFavorite: widget.initialPicture?.isFavorite ?? false,
    );
    if (widget.initialPicture == null) {
      ref.read(picturesProvider.notifier).addPicture(newPicture);
    } else {
      ref.read(picturesProvider.notifier).editPicture(newPicture);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: 600, maxHeight: 800),
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              widget.initialPicture != null ? 'Bild bearbeiten' : 'Neues Bild',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            SizedBox(height: 16),
            Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://picsum.photos/seed/$randomSeed/300/300.jpg',
                  fit: BoxFit.cover,
                  height: 300,
                  width: 300,
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: submitButtonStyle,
              onPressed: _regenerateImage,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Regenerate Image'),
                  SizedBox(width: 8),
                  Icon(Icons.refresh),
                ],
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a title.';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _descController,
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    style: submitButtonStyle,
                    onPressed: _saveForm,
                    child: Text('Add Picture'),
                  ),
                ],
              ),
            ),

            // TextFormField(
            //   decoration: InputDecoration(labelText: 'Description'),
            // ),
          ],
        ),
      ),
    );
  }
}
