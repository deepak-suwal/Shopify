import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/constants/app_colors.dart';
import 'package:styled_widget/styled_widget.dart';

class AddToCartButton extends StatefulWidget {
  final Function() onPressed;

  const AddToCartButton({super.key, required this.onPressed});

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 40,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            color: colorPrimary,
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.remove,
                  color: textColor,
                ),
                onPressed: () {
                  setState(() {
                    if (itemCount > 1) {
                      itemCount--;
                    }
                  });
                },
              ),
              Text(
                itemCount.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              // Display the item count
              IconButton(
                icon: const Icon(
                  Icons.add,
                  color: textColor,
                ),
                onPressed: () {
                  setState(() {
                    itemCount++;
                  });
                },
              ),
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: colorPrimary,
            shadowColor: Colors.grey,
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            minimumSize: const Size(100, 40),
          ),
          onPressed: () {},
          child: const Text(
            'Add to Cart',
            style: TextStyle(color: textColor),
          ),
        )
      ],
    ).padding(all: 12);
  }
}
