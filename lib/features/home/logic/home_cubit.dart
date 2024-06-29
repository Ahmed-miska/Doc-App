import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/features/home/data/repos/home_repo.dart';
import '../../../core/networking/api_error_handler.dart';
import '../data/models/specialization_response_model.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<SpecializationsData?>? specializationsList = [];

  void getSpecialization() async {
    emit(const HomeState.specializationLoading());
    final response = await _homeRepo.getSpecialization();
    response.when(success: (specializationsResponseModel) {
      specializationsList = specializationsResponseModel.specializationDataList ?? [];

      // geting the doctors list for first specialization by default
      getDoctorList(specializationId: specializationsList?.first?.id);

      emit(HomeState.specializationSuccess(specializationsList));
    }, failure: (errorHandler) {
      emit(HomeState.specializationError(errorHandler));
    });
  }

  void getDoctorList({required int? specializationId}) async {
    List<Doctors?>? doctorList = getDoctorsListBySpecializationId(specializationId);

    if (!doctorList.isNullOrEmpty()) {
      emit(HomeState.doctorSuccess(doctorList));
    } else {
      emit(HomeState.doctorError(ErrorHandler.handle('No doctor found')));
    }
  }

  ///returns the list of doctors based on specialization id
  getDoctorsListBySpecializationId(specializationId) {
    return specializationsList?.firstWhere((specialization) => specialization?.id == specializationId)?.doctorsList;
  }
}
