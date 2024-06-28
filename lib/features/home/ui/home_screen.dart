import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/home_top_bar.dart';
import 'widgets/doctor_speciality_see_all.dart';
import 'widgets/doctors_blue_container.dart';
import 'widgets/specialization_and_doctors_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [const HomeTopBar(), const DoctorsBlueContainer(), verticalSpace(24), const DoctorSpecialitySeeAll(), verticalSpace(16), const SpecializationAndDoctorsBlocBuilder()],
          ),
        ),
      ),
    );
  }
}
