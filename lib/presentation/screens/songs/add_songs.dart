import 'package:flutter/material.dart';
import 'package:lista_canciones/models/song_model.dart';
import 'package:lista_canciones/presentation/widgets/songs/radio_button_widget.dart';
import 'package:lista_canciones/models/option_model.dart';
import 'package:lista_canciones/presentation/widgets/songs/select_widget.dart';
import 'package:lista_canciones/core/services/song_services.dart';

class AddSongs extends StatefulWidget {
  const AddSongs({super.key});

  @override
  State<AddSongs> createState() => _AddSongsState();
}

class _AddSongsState extends State<AddSongs> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lyricsController = TextEditingController();

  String? _selectedType;
  String? _selectedTone;

  final List<OptionModel> options = [
    OptionModel(text: 'C', value: 'C'),
    OptionModel(text: 'Db', value: 'Db'),
    OptionModel(text: 'D', value: 'D'),
    OptionModel(text: 'Eb', value: 'Eb'),
    OptionModel(text: 'E', value: 'E'),
    OptionModel(text: 'F', value: 'F'),
    OptionModel(text: 'Gb', value: 'Gb'),
    OptionModel(text: 'G', value: 'G'),
    OptionModel(text: 'Ab', value: 'Ab'),
    OptionModel(text: 'A', value: 'A'),
    OptionModel(text: 'Bb', value: 'Bb'),
    OptionModel(text: 'B', value: 'B'),
  ];
  final List<OptionModel> optionsType = [
    OptionModel(text: 'Himno', value: 'Himno'),
    OptionModel(text: 'Coro', value: 'Coro'),
    OptionModel(text: 'Especial', value: 'Especial'),
  ];

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      Map<String, String> json = {
        "name": _nameController.text,
        "tone": _selectedTone ?? '',
        "lyrics": _lyricsController.text,
        "type": _selectedType ?? ""
      };
      SongModel song = SongModel(
          name: _nameController.text,
          tone: _selectedTone ?? '',
          lyrics: _lyricsController.text,
          type: _selectedType ?? '');
      SongService songService = SongService();
      await songService.saveSong(song);

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Formulario enviado")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Por favor, complete los campos")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration:
                    const InputDecoration(labelText: "Nombre de la cación"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese el nombre de la cación';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              SelectWidget(
                  title: 'Tono de la cación',
                  options: options,
                  selectedValue: _selectedTone,
                  onChanged: (value) => setState(() {
                        _selectedTone = value;
                      })),
              const SizedBox(
                height: 10.0,
              ),
              RadioButton(
                  label: "Seleccione tipo",
                  options: optionsType,
                  selectedValue: _selectedType,
                  onChanged: (value) => setState(() {
                        _selectedType = value;
                      })),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _lyricsController,
                maxLines: 5,
                decoration:
                    const InputDecoration(labelText: "Letra de la cación"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese la letra de la cación';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _submitForm,
                  icon: const Icon(Icons.save),
                  label: const Text("Guardar"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
