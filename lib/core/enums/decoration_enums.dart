import 'package:flutter/cupertino.dart';

enum ContainerDecorations { gameThumbnail }

extension ContainerDecorationsExtention on ContainerDecorations {
  BoxDecoration decoration(DecorationImage image) =>
      BoxDecoration(borderRadius: BorderRadius.circular(10), image: image);
}
