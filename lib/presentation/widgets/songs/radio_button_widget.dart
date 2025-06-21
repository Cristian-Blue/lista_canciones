import 'package:flutter/material.dart';
import 'package:lista_canciones/models/option_model.dart';

class RadioButton extends StatelessWidget {
  final List<OptionModel> options;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final String? label;
  const RadioButton({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 8),
        ],
        Row(
          children: [
            ...options.map((option) {
              return Row(
                children: [
                  Radio<String>(
                      value: option.value,
                      groupValue: selectedValue,
                      onChanged: onChanged),
                  Text(option.text),
                ],
              );
            }),
          ],
        ),
      ],
    );
  }
}
