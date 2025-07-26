import 'package:flutter/material.dart';
import 'package:gallery_app/core/app_color/app_colors.dart';

class ConnectionPanner extends StatelessWidget implements PreferredSizeWidget {
  const ConnectionPanner({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(double.infinity, 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons
                .signal_wifi_statusbar_connected_no_internet_4_sharp,
            color: AppColors.red,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.03,
          ),
          Text(
            "لا يوجد اتصال بالإنترنت",
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 50);
}
