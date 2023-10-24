import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController mycontroller;

  const CustomAppBar({
    Key? key,
    required this.titleappbar,
    this.onPressedSearch,
    this.onChanged,
    required this.mycontroller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(top: 10),
      child: Row(children: [
        Expanded(
          flex: 6,
          child: TextFormField(
            controller: mycontroller,
            onChanged: onChanged,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              prefixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: onPressedSearch,
              ),
              hintText: titleappbar,
              hintStyle: const TextStyle(fontSize: 18),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: IconButton(
            onPressed: onPressedSearch,
            icon: Icon(
              Icons.favorite_border_outlined,
              size: 25,
              color: Colors.grey[600],
            ),
          ),
        )
      ]),
    );
  }
}
