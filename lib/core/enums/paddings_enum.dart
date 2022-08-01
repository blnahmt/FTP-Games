import 'package:flutter/cupertino.dart';

enum ProjectPaddings {
  lowAll,
}

extension ProjectPaddingsExtention on ProjectPaddings {
  EdgeInsets get value => const EdgeInsets.all(8);
}
