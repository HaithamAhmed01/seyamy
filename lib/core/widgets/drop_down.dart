import 'package:flutter/material.dart';

class SimpleDropDown<T> extends StatefulWidget {
  final T? value;
  final List<T> list;
  final String? title;
  final String? hintText;
  final String? labelText;
  final ValueChanged<T?>? onChanged;
  final FormFieldSetter<T> onSaved;
  final FormFieldValidator<T> validator;
  final Widget? prefixIcon;
  final bool isRequired;

  const SimpleDropDown({
    Key? key,
    this.value,
    required this.onChanged,
    this.hintText,
    this.title,
    this.labelText,
    required this.list,
    required this.validator,
    required this.onSaved,
    this.prefixIcon,
    this.isRequired = false,
  }) : super(key: key);

  @override
  State<SimpleDropDown<T>> createState() => _SimpleDropDownState<T>();
}

class _SimpleDropDownState<T> extends State<SimpleDropDown<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: DropdownButtonFormField<T>(
            value: widget.value,
            isExpanded: true,
            onChanged: widget.onChanged,
            validator: widget.validator,
            onSaved: widget.onSaved,
            style: Theme.of(context).textTheme.bodyMedium,
            icon:
                Icon(Icons.arrow_drop_down, size: 24, color: Colors.grey[400]),
            selectedItemBuilder: (context) => widget.list.map(
              (e) {
                return Text(
                  '$e',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 16),
                );
              },
            ).toList(),
            items: widget.list.map((e) {
              final isSelected = e == widget.value;
              return DropdownMenuItem(
                value: e,
                child: Text(
                  '$e',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: isSelected ? FontWeight.bold : null,
                      color: isSelected ? Colors.red : null,
                      fontSize: 14),
                ),
              );
            }).toList(),
            decoration: InputDecoration(
              hintText: widget.hintText,
              labelText: widget.labelText,
              prefixIcon: widget.prefixIcon,
              prefixIconConstraints:
                  const BoxConstraints(maxHeight: 24, maxWidth: 24),
              contentPadding: const EdgeInsets.only(
                  top: 12, bottom: 12, right: 16, left: 10),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(17),
                  topLeft: Radius.circular(17),
                  bottomRight: Radius.circular(17),
                ),
                borderSide: BorderSide(color: Colors.transparent, width: 1.3),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 1.3),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
