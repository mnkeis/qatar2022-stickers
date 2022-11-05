import 'package:flutter/material.dart';

class StickerView extends StatelessWidget {
  const StickerView({
    required this.count,
    required this.index,
    required this.countBox,
    this.color = Colors.green,
    this.teamCode,
    this.increment,
    this.decrement,
    super.key,
  });

  final int count;
  final int index;
  final int countBox;
  final Color color;
  final String? teamCode;
  final VoidCallback? increment;
  final VoidCallback? decrement;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final textStyle =
        teamCode == null ? textTheme.titleLarge : textTheme.titleSmall;
    final text = teamCode != null ? '$teamCode $index' : '$index';
    final size = teamCode == null ? 50.0 : 60.0;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(6),
          child: InkWell(
            onTap: increment,
            onLongPress: decrement,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 3,
                  )
                ],
                color: count > 0 ? color : Colors.grey,
              ),
              height: size,
              width: size,
              child: Center(
                child: Text(
                  text,
                  style: textStyle?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        if (count > countBox)
          Container(
            height: 20,
            width: 20,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.amber,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 3,
                )
              ],
            ),
            child: Center(child: Text('$count')),
          ),
      ],
    );
  }
}
