import 'package:flutter/material.dart';
import 'package:todo/data/model/task_entity.dart';
import 'package:todo/theme/app_theme.dart';

class EventWidget extends StatelessWidget {
  final List<TaskEntity> list = [
    TaskEntity(title: "我的第一个任务", status: 0),
    TaskEntity(title: "我的第二个任务", status: 0),
    TaskEntity(title: "我的第三个任务", status: 0),
    TaskEntity(title: "我的第四个任务", status: 0),
    TaskEntity(title: "我的第五个任务", status: 1),
    TaskEntity(title: "我的第六个任务", status: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            Container(
              decoration: IconDecoration(
                iconSize: 20,
                lineWidth: 1,
                firstData: true,
                lastData: false,
              ),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(offset: Offset(0, 3), color: Color(0x20000000)),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: Icon(
                  Icons.fiber_manual_record,
                  size: 20,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
            Container(width: 80, padding: EdgeInsets.symmetric(horizontal: 8), child: Text('88:00')),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 12),
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x20000000),
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Text('我的第一个'),
                    Text('描述sssx'),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class IconDecoration extends Decoration {
  final double iconSize;
  final double lineWidth;
  final bool firstData;
  final bool lastData;

  IconDecoration(
      {@required this.iconSize, @required this.lineWidth, @required this.firstData, @required this.lastData});
  @override
  BoxPainter createBoxPainter([void Function() onChanged]) {
    return IconLine(iconSize: iconSize, lineWidth: lineWidth, firstData: firstData, lastData: lastData);
  }
}

class IconLine extends BoxPainter {
  final double iconSize;
  final double lineWidth;
  final bool firstData;
  final bool lastData;
  final Paint paintLine;

  IconLine({@required this.iconSize, @required this.lineWidth, @required this.firstData, @required this.lastData})
      : paintLine = Paint()
          ..color = kPrimaryColor
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final leftOffset = Offset(iconSize / 2, offset.dy);
    final double iconSpace = iconSize / 1.5;

    final Offset top = configuration.size.topLeft(Offset(leftOffset.dx, 0.0));
    final Offset centerTop = configuration.size.centerLeft(Offset(leftOffset.dx, leftOffset.dy - iconSpace));
    final Offset centerBottom = configuration.size.centerLeft(Offset(leftOffset.dx, leftOffset.dy + iconSpace));
    final Offset end = configuration.size.bottomLeft(Offset(leftOffset.dx, leftOffset.dy * 2));

    if (!firstData) canvas.drawLine(top, centerTop, paintLine);
    if (!lastData) canvas.drawLine(centerBottom, end, paintLine);
  }
}
