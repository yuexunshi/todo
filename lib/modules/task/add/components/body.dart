import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/data/model/priority.dart';
import '../add_task_controller.dart';

class Body extends GetView<AddTaskController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            _buildTitleField(
              context,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'More:',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 20,
            ),
            _buildDescriptionField(context),
            SizedBox(
              height: 20,
            ),
            _buildDateTimeField(context),
            SizedBox(
              height: 20,
            ),
            _buildPriorityField(context),
            _buildSubmit(context),
          ],
        ),
      ),
    );
  }

  /// title输入框
  Widget _buildTitleField(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 18),
      validator: (value) =>
          value.trim().isEmpty ? 'Please enter atask title' : null,
      onSaved: controller.saveTitle,
      decoration: InputDecoration(
          labelText: 'Title',
          labelStyle: TextStyle(fontSize: 18),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }

  /// Description输入框
  Widget _buildDescriptionField(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 18),
      onSaved: controller.saveContent,
      maxLines: 6,
      decoration: InputDecoration(
          labelText: 'Description',
          hintText: 'Add description here',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15)))),
    );
  }

  /// 时间选择器
  Widget _buildDateTimeField(BuildContext context) {
    return GetBuilder<AddTaskController>(
      init: controller,
      id: controller.updateDateId,
      builder: (_) {
        print(" _.dateTimeControlle==${_.dateTimeController}");
        return TextFormField(
          readOnly: true,
          onTap: _.handleDatePicker,
          controller: _.dateTimeController,
          style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 18),
          decoration: InputDecoration(
              labelText: 'DateTime',
              labelStyle: TextStyle(fontSize: 18),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        );
      },
    );
  }

  /// 优先级输入框
  Widget _buildPriorityField(BuildContext context) {
    return GetBuilder<AddTaskController>(
      init: controller,
      id: controller.updatePriorityId,
      builder: (_) {
        return DropdownButtonFormField<String>(
          isDense: true,
          icon: Icon(Icons.arrow_drop_down_circle),
          iconSize: 22,
          iconEnabledColor: Theme.of(context).primaryColor,
          style: Theme.of(context).textTheme.subtitle1,
          decoration: InputDecoration(
              labelText: 'Priority',
              labelStyle: TextStyle(fontSize: 18),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          items: prioritiesStr.map((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: priorityColor[prioritiesStr.indexOf(e)])),
            );
          }).toList(),
          value: prioritiesStr[0],
          onChanged: _.changePriority,
        );
      },
    );
  }

  Widget _buildSubmit(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(30)),
      child: FlatButton(
        onPressed: controller.submit,
        child: Text('add task',
            style: Theme.of(context)
                .textTheme
                .button
                .copyWith(color: Colors.white)),
      ),
    );
  }
}
