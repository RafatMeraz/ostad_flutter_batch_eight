import 'package:ecommerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.sizes, required this.onChange});

  final List<String> sizes;
  final Function(String) onChange;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  String? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Size', style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600
        ),),
        const SizedBox(height: 8),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.sizes.length,
            itemBuilder: (context, index) {
              String size = widget.sizes[index];
              return GestureDetector(
                onTap: () {
                  selectedColor = size;
                  widget.onChange(selectedColor!);
                  setState(() {});
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: selectedColor == size ? AppColors.themeColor : null,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  margin: const EdgeInsets.only(right: 8),
                  alignment: Alignment.center,
                  child: Text(size, style: TextStyle(
                    color: selectedColor == size ? Colors.white : null,
                  ),),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
