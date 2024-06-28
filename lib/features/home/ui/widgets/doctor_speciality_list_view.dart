import 'package:flutter/material.dart';

import 'package:flutter_complete_project/features/home/ui/widgets/doctors_speciality_list_view_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/specialization_response_model.dart';

class DoctorSpecialityListView extends StatelessWidget {
  final List<SpecializationsData?> speciallizationDataList;
  const DoctorSpecialityListView({super.key, required this.speciallizationDataList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: speciallizationDataList.length,
        itemBuilder: (context, index) {
          return DoctorsSpecialityListViewItem(
            itemIndex: index,
            specializationsData:speciallizationDataList[index] ,
            ) 
          ;
        },
      ),
    );
  }
}
