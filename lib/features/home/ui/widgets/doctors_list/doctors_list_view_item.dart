import 'package:flutter/widgets.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/models/specialization_response_model.dart';

class DoctorSpecialityListViewItem extends StatelessWidget {
  final Doctors? doctorModel;
  const DoctorSpecialityListViewItem({super.key, this.doctorModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              width: 110.w,
              height: 120.h,
              'https://static.zerochan.net/Hisoka.Morow.1024.2765398.webp',
              fit: BoxFit.fill,
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorModel?.name ?? 'Doctor Name',
                  style: TextStyles.font18DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(5),
                Text(
                  '${doctorModel?.degree} | `${doctorModel?.phone}',
                  style: TextStyles.font12GrayMedium,
                ),
                verticalSpace(5),
                Text(
                  doctorModel?.email ?? 'Doctor Email',
                  style: TextStyles.font12GrayMedium,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
