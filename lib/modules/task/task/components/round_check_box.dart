import 'package:flutter/material.dart';

class RoundCheckBox extends StatefulWidget {
  final bool value;
  final Size size;

  final ValueChanged<bool> onChanged;

  RoundCheckBox({Key key, @required this.value, this.onChanged, this.size = const Size(30, 30)}) : super(key: key);

  @override
  _RoundCheckBoxState createState() => _RoundCheckBoxState();
}

class _RoundCheckBoxState extends State<RoundCheckBox> {
  bool _value;
  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  _changeState() {
    setState(() {
      _value = !_value;
      widget.onChanged?.call(_value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _changeState,
      child: Container(
          width: widget.size.width,
          height: widget.size.height,
          decoration:
              BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Theme.of(context).accentColor, width: 4)),
          child: _value
              ? Padding(
                  padding: EdgeInsets.all(2),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).accentColor,
                    ),
                  ))
              : null),
    );
  }
}
