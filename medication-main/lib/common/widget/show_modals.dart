import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:medication/common/widget/text_field.dart';
import 'package:medication/constants/app_style.dart';
import 'package:medication/common/select_time_widget.dart';
import 'package:medication/common/select_date_widget.dart';
import 'package:medication/model/todo_model.dart';
import 'package:medication/provider/date_time_provider.dart';
import 'package:medication/provider/todo_service_provider.dart';

class AddNewTaskModals extends StatelessWidget {
  AddNewTaskModals({
    Key? key,
  }) : super(key: key);

  final systolicPressure = TextEditingController();
  final diastolicPressure = TextEditingController();
  final descriptionController = TextEditingController();

  ElevatedButton createButton(
      {required String label, required VoidCallback onPressed}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            label == 'Cancel' ? Colors.white : Colors.blue.shade800,
        foregroundColor:
            label == 'Cancel' ? Colors.blue.shade800 : Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: BorderSide(color: Colors.blue.shade800),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: double.infinity,
            child: Text(
              'New Task Todo',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Divider(
            thickness: 1.2,
            color: Colors.grey.shade200,
          ),
          const Gap(12),
          Text('Systolic Pressure', style: AppStyle.headingOne),
          const Gap(10),
          TextFieldWidget(
            maxLine: 1,
            hintText: 'Add Systolic Pressure.',
            txtController: systolicPressure,
          ),
          const Gap(12),
          Text('Diastolic Pressure', style: AppStyle.headingOne),
          const Gap(10),
          TextFieldWidget(
            maxLine: 1,
            hintText: 'Add Diastolic Pressure.',
            txtController: diastolicPressure,
          ),
          const Gap(12),
          Text('Note', style: AppStyle.headingOne),
          const Gap(10),
          TextFieldWidget(
            maxLine: 5,
            hintText: 'Description.',
            txtController: descriptionController,
          ),
          const Gap(12),
          const Gap(25),
          Row(
            children: [
              Expanded(
                child: createButton(label: 'Cancel', onPressed: () {}),
              ),
              const Gap(25),
              Expanded(
                child: Consumer(
                  builder: (context, ref, child) {
                    return createButton(
                      label: 'Create',
                      onPressed: () {
                        ref.watch(serviceProvider).addNewTask(TodoModel(
                              systolic: systolicPressure.text,
                              diastolic: diastolicPressure.text,
                              description: descriptionController.text,
                              dateTask: ref.read(dateProvider),
                              timeTask: ref.read(timeProvider),
                            ));
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}




// onPressed: () {
//                     ref.watch(serviceProvider).addNewTask(TodoModel(
//                           systolic: systolicPressure.text,
//                           diastolic: diastolicPressure.text,
//                           description: descriptionController.text,
//                           dateTask: ref.read(dateProvider).state,
//                           timeTask: ref.read(timeProvider).state,
//                         ));
//                   },