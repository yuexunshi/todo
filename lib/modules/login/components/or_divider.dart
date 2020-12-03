import 'package:flutter/material.dart';
import 'package:todo/theme/app_theme.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          _buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text("OR", style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600)),
          ),
          _buildDivider(),
        ],
      ),
    );
  }

  Widget _buildDivider() => Expanded(
        child: Divider(
          color: Color(0xFFD9D9D9),
          height: 1.5,
        ),
      );
}
