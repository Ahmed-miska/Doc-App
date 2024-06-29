import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/features/home/logic/home_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/doctors_list/doctors_list_view.dart';

import '../../../logic/home_state.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is DoctorSuccess || current is DoctorError,
      builder: (context, state) {
        return state.maybeWhen(
          doctorSuccess: (doctorsList) {
            return setupSuccess(doctorsList);
          },
          doctorError: (errorHandler) => setupError(),
          orElse: () => Container(),
        );
      },
    );
  }

  Widget setupSuccess(doctorsList) {
    return DoctorsListView(
      doctorsList: doctorsList,
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
