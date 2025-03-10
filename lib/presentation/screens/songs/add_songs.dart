import 'package:flutter/material.dart';

class AddSongs extends StatefulWidget {
  const AddSongs({super.key});

  @override
  State<AddSongs> createState() => _AddSongsState();
}

class _AddSongsState extends State<AddSongs> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _toneController = TextEditingController();
  final TextEditingController _lyricsController = TextEditingController();

  String? _selectedType;

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      Map<String, String> json = {
        "name": _nameController.text,
        "tone": _toneController.text,
        "lyrics": _lyricsController.text,
        "type": _selectedType ?? ""
      };

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
              TextFormField(
                controller: _toneController,
                decoration:
                    const InputDecoration(labelText: "Tono de la cación"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese el tono de la cación';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: "Tipo de canción"),
                items: const [
                  DropdownMenuItem(
                    value: "Himno",
                    child: Text("Himno"),
                  ),
                  DropdownMenuItem(
                    value: "Coro",
                    child: Text("Coro"),
                  ),
                  DropdownMenuItem(
                    value: "Especial",
                    child: Text("Especial"),
                  )
                ],
                onChanged: (value) => {
                  setState(() {
                    _selectedType = value;
                  })
                },
                validator: (value) {
                  if (value == null) {
                    return 'Seleccione el tipo de canción';
                  }
                  return null;
                },
              ),
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
