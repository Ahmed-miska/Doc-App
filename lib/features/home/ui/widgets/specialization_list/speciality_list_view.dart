import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_complete_project/features/home/ui/widgets/specialization_list/speciality_list_view_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/specialization_response_model.dart';
import '../../../logic/home_cubit.dart';

class SpecialityListView extends StatefulWidget {
  final List<SpecializationsData?> speciallizationDataList;
  const SpecialityListView({super.key, required this.speciallizationDataList});

  @override
  State<SpecialityListView> createState() => _SpecialityListViewState();
}

class _SpecialityListViewState extends State<SpecialityListView> {
  var selectedSpeciallizationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.speciallizationDataList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSpeciallizationIndex = index;
              });
              context.read<HomeCubit>().getDoctorList(specializationId: widget.speciallizationDataList[index]!.id);
            },
            child: SpecialityListViewItem(            
              specializationsData: widget.speciallizationDataList[index],
              itemIndex: index,
              selectedIndex: selectedSpeciallizationIndex,
            ),
          );
        },
      ),
    );
  }
}
