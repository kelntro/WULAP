import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';

// ignore: must_be_immutable
class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgHome,
      activeIcon: ImageConstant.imgHome,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgFrame1000002310,
      activeIcon: ImageConstant.imgFrame1000002310,
      type: BottomBarEnum.Frame1000002310,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgFrame1000002311,
      activeIcon: ImageConstant.imgFrame1000002311,
      type: BottomBarEnum.Frame1000002311,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNotification,
      activeIcon: ImageConstant.imgNotification,
      type: BottomBarEnum.Notification,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgSettings,
      activeIcon: ImageConstant.imgSettings,
      type: BottomBarEnum.Settings,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 73.v,
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: bottomMenuList[index].icon,
              height: 48.v,
              width: 50.h,
              color: appTheme.blueGray800,
            ),
            activeIcon: CustomImageView(
              imagePath: bottomMenuList[index].activeIcon,
              height: 48.v,
              width: 50.h,
              color: appTheme.blueGray800,
            ),
            label: '',
          );
        }),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          switch (bottomMenuList[index].type) {
            case BottomBarEnum.Home:
              Navigator.pushReplacementNamed(
                  context, AppRoutes.dashboardPaluwaganScreen);
              break;
            case BottomBarEnum.Frame1000002310:
              Navigator.pushReplacementNamed(context, AppRoutes.buyPage);
              break;
            case BottomBarEnum.Frame1000002311:
              Navigator.pushReplacementNamed(context, AppRoutes.noteScreen);
              break;
            case BottomBarEnum.Notification:
              Navigator.pushReplacementNamed(
                  context, AppRoutes.notificationsScreen);
              break;
            case BottomBarEnum.Settings:
              Navigator.pushReplacementNamed(context, AppRoutes.settingsScreen);
              break;
          }

          widget.onChanged?.call(bottomMenuList[index].type);
        },
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Frame1000002310,
  Frame1000002311,
  Notification,
  Settings,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
