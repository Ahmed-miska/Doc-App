import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/doctors_list/doctors_shimmer_loading.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/specialization_list/speciality_list_view.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/specialization_list/speciality_shimmer_loading.dart';
import '../../../logic/home_cubit.dart';
import '../../../logic/home_state.dart';

class SpecializationsBlocBuilder extends StatelessWidget {
  const SpecializationsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is SpecializationLoading || current is SpecializationSuccess || current is SpecializationError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationLoading: () => setupLoading(),
          specializationSuccess: (specializationDataList) {
            var specializationList = specializationDataList;
            return setupSuccess(specializationList);
          },
          specializationError: (errorHandler) => setupError(),
          orElse: () => setupLoading(),
        );
      },
    );
  }

  Widget setupLoading() {
    return Expanded(
        child: Column(
      children: [
        const SpecialityShimmerLoading(),
        verticalSpace(8),
        const DoctorsShimmerLoading(),
      ],
    ));
  }

  Widget setupSuccess(speciallizationList) {
    return SpecialityListView(speciallizationDataList: speciallizationList ?? []);
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
