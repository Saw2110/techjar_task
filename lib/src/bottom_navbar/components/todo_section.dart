import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techjar_task/core/core.dart';

import '../bottom_navbar.dart';

class ToDosSection extends StatelessWidget {
  const ToDosSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavBarProvider = context.watch<BottomNavBarProvider>();
    return ListView.builder(
      itemCount: bottomNavBarProvider.todoList.length,
      itemBuilder: (BuildContext context, int index) {
        var todoInfo = bottomNavBarProvider.todoList[index];
        return ToDoInfoSection(todoInfo: todoInfo);
      },
    );
  }
}

class ToDoInfoSection extends StatelessWidget {
  final TodoModel todoInfo;
  final void Function(bool?)? onChanged;

  const ToDoInfoSection({super.key, required this.todoInfo, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(todoInfo.title, style: context.kBoldSubTitleText),
          8.yGap,
          Row(
            children: [
              Checkbox(
                value: todoInfo.completed,
                onChanged: onChanged,
              ),
              Text(
                todoInfo.completed ? "Task already completed" : "Pending",
                style: context.kSubTitleText.copyWith(
                  color: todoInfo.completed ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ).paddingAll(20.0),
    );
  }
}
