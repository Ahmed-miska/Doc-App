import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/doctor_speciality_list_view.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/doctors_list_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';

class SpecializationAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecializationAndDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is SpecializationLoading || current is SpecializationSuccess || current is SpecializationError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationLoading: () => setupLoading(),
          specializationSuccess: (specializationsResponseModel) {
            var speciallizationList = specializationsResponseModel.specializationDataList;
            return setupSuccess(speciallizationList);
          },
          specializationError: (errorHandler) => setupError(),
          orElse: () => setupLoading(),
        );
      },
    );
  }

  Widget setupLoading() {
    return SizedBox(
      height: 100.h,
      child: const Center(child: CircularProgressIndicator()),
    );
  }

  Widget setupSuccess(speciallizationList) {
    return Expanded(
      child: Column(
        children: [
          DoctorSpecialityListView(speciallizationDataList: speciallizationList ?? []),
          verticalSpace(8),
          DoctorsListView(
            doctorsList: speciallizationList?[1]?.doctorsList,
          ),
        ],
      ),
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
