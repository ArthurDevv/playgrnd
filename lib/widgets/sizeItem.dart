import 'package:flutter/material.dart';

class SizeItem extends StatefulWidget {
  @override
  _SizeItemState createState() => _SizeItemState();
}

class _SizeItemState extends State<SizeItem> {
  List<int> sizeList = [7, 8, 9, 10];
  int currentSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: sizeList.map((item) {
            int index = sizeList.indexOf(item);
            return GestureDetector(
              onTap: () {
                setState(() {
                  currentSizeIndex = index;
                });
              },
              child: sizeItem(item, currentSizeIndex == index, context),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget sizeItem(int size, bool isSelected, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).accentColor : Colors.grey[600],
          boxShadow: [
            BoxShadow(
              color:
                  isSelected ? Colors.black.withOpacity(0.5) : Colors.black12,
              offset: Offset(0.0, 10.0),
              blurRadius: 10.0,
            ),
          ],
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Center(
          child: Text(
            size.toString(),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
