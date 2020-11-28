import 'package:flutter/material.dart';
import 'package:telegram_design/ui/shared/export.dart';
import 'package:intl/intl.dart' as intl;

class AutoDir extends StatefulWidget {
  final String text;
  final Widget child;
  final void Function(bool isRTL) onDirectionChange;

  AutoDir({@required this.text, @required this.child, this.onDirectionChange});

  @override
  _AutoDirState createState() => _AutoDirState();
}

class _AutoDirState extends State<AutoDir> {
  String text;
  Widget childWidget;

  @override
  Widget build(BuildContext context) {
    text = widget.text;
    childWidget = widget.child;
    return Directionality(
      textDirection: isRTL(text)
          ? (text == '' ? TextDirection.rtl : TextDirection.rtl)
          : (text.isNotEmpty ? TextDirection.ltr : TextDirection.rtl),
      child: childWidget,
    );
  }

  // @override
  // void didUpdateWidget(AutoDir oldWidget) {
  //   if (isRTL(oldWidget.text) != isRTL(widget.text)) {
  //     if (widget.onDirectionChange != null)
  //       WidgetsBinding.instance.addPostFrameCallback(
  //         (_) => widget.onDirectionChange(
  //           isRTL(widget.text),
  //         ),
  //       );
  //   }
  //   super.didUpdateWidget(oldWidget);
  // }

  bool isRTL(String text) {
    print('RTL');
    return intl.Bidi.detectRtlDirectionality(text);
  }
}
