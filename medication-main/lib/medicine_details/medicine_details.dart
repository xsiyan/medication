// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:medication/common/Medicine_main.dart';
import 'package:medication/global_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MedicineDetails extends StatefulWidget {
  const MedicineDetails({Key? key}) : super(key: key);

  @override
  State<MedicineDetails> createState() => _MedicineDetailsState();
}

class _MedicineDetailsState extends State<MedicineDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            MainSection(
              medicine: Medicine(
                medicineName: '',
              ),
            ),
            Gap(9),
            ExtendedSection(),
            ButtonDelete(),
          ],
        ),
      ),
    );
  }
}

class MainSection extends StatelessWidget {
  const MainSection({Key? key, this.medicine}) : super(key: key);
  final Medicine? medicine;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(
          'assets/bottle.svg',
          height: 18.h,
          // ignore: deprecated_member_use
          color: Colors.greenAccent,
        ),
        Column(
          children: [
            MainInfoTab(
              FieldInfo: medicine!.medicineName!,
              FieldTitle: 'Medicine Name',
            ),
            Gap(7),
            MainInfoTab(
              FieldInfo: medicine!.dosage == 0
                  ? 'Not Specified'
                  : "${medicine!.dosage} mg",
              FieldTitle: 'Dosage',
            ),
          ],
        ),
      ],
    );
  }
}

class ButtonDelete extends StatelessWidget {
  const ButtonDelete({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalBloc _globalBloc = Provider.of<GlobalBloc>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: SizedBox(
        width: 94.w,
        height: 7.h,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.red.shade500,
            foregroundColor: Colors.black,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            side: BorderSide(
              color: Colors.orange.shade800,
            ),
          ),
          onPressed: () {
            openAlertBox(
              context,
              _globalBloc,
              Medicine(),
            );
          },
          child: Text(
            'Delete',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp,
                ),
          ),
        ),
      ),
    );
  }

  openAlertBox(BuildContext context, GlobalBloc globalbloc, Medicine medicine) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          contentPadding: EdgeInsets.only(
            top: 1.h,
          ),
          title: Text(
            'Delete This Reminder?',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            TextButton(
              onPressed: () {
                globalbloc.removeMedicine(medicine).then((_) {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                });
              },
              child: Text(
                'OK',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class ExtendedSection extends StatelessWidget {
  const ExtendedSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [
        ExtendedInfoTab(
          FieldTitle: 'Medicine Type',
          FieldInfo: 'Pill',
        ),
        ExtendedInfoTab(
          FieldTitle: 'Dose Interval',
          FieldInfo: 'Every 8 Hours | 3 times a day',
        ),
        ExtendedInfoTab(
          FieldTitle: 'Start Time',
          FieldInfo: '2:16PM',
        ),
        ExtendedInfoTab(
          FieldTitle: 'Date',
          FieldInfo: '10/15/23',
        ),
      ],
    );
  }
}

class MainInfoTab extends StatelessWidget {
  const MainInfoTab({
    Key? key,
    required this.FieldInfo,
    required this.FieldTitle,
    this.medicine,
  }) : super(key: key);

  final String FieldTitle;
  final String FieldInfo;
  final Medicine? medicine;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45.w,
      height: 6.5.h,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              FieldTitle,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              FieldInfo,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.green,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w800,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExtendedInfoTab extends StatelessWidget {
  const ExtendedInfoTab(
      {super.key, required this.FieldTitle, required this.FieldInfo});

  final String FieldTitle;
  final String FieldInfo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      height: 10.h,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 1.h),
              child: Text(
                FieldTitle,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              FieldInfo,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.green,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w800,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
// class Medicine{
//   final String? medin
// }