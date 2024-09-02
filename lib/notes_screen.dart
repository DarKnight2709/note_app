import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'note_model.dart';
import 'add_note_screen.dart';
import 'theme_model.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          Consumer<ThemeModel>(
            builder: (context, themeModel, child) {
              return IconButton(
                icon: Icon(themeModel.isDark ? Icons.dark_mode : Icons.light_mode),
                onPressed: () {
                  themeModel.toggleTheme();
                },
              );
            },
          ),
        ],
      ),
      body: Consumer<NotesModel>(
        builder: (context, notesModel, child) {
          return ListView.builder(
            itemCount: notesModel.notes.length,
            itemBuilder: (context, index) {
              final note = notesModel.notes[index];
              return ListTile(
                title: Text(note.title),
                subtitle: Text(note.content),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    notesModel.deleteNote(note.id);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddNoteScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
