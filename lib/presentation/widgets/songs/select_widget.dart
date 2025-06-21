import 'package:flutter/material.dart';
import 'package:lista_canciones/models/option_model.dart';

class SelectWidget extends StatelessWidget {
  final List<OptionModel> options;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final String title;
  const SelectWidget({
    super.key,
    required this.title,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(labelText: title),
      items: [
        ...options.map((option) {
          return DropdownMenuItem(
            value: option.value,
            child: Text(option.text),
          );
        })
      ],
      onChanged: onChanged,
      validator: (value) {
        if (value == null) {
          return 'Seleccione el tipo de canción';
        }
        return null;
      },
    );
  }
}
