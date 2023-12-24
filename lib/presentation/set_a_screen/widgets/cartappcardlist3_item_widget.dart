import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/set_a_screen/widgets/menu.dart';
import 'package:wulap_application/presentation/set_a_screen/widgets/updateRowScreen.dart';

class Cartappcardlist3ItemWidget extends StatefulWidget {
  final VoidCallback? onTapImgOverflowMenu;

  Cartappcardlist3ItemWidget({
    Key? key,
    this.onTapImgOverflowMenu,
  }) : super(key: key);

  @override
  _Cartappcardlist3ItemWidgetState createState() =>
      _Cartappcardlist3ItemWidgetState();
}

class _Cartappcardlist3ItemWidgetState
    extends State<Cartappcardlist3ItemWidget> {
  // Assuming you have a variable to hold the data model in your widget
  // Replace YourWidgetDataModel with the actual type you are using
  RowData yourWidgetDataModel = RowData(
      name: 'Initial Lechon',
      description: 'Initial Crispy Skin',
      imagePath: 'assets/images/img_ellipse_46_100x106');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 22.v,
      ),
      decoration: AppDecoration.fillPurpleA700.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder30,
      ),
      child: Row(
        children: [
          Container(
            height: 68.v,
            width: 77.h,
            padding: EdgeInsets.symmetric(
              horizontal: 13.h,
              vertical: 6.v,
            ),
            decoration: AppDecoration.outlineGrayC.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder20,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imageNotFound,
              height: 50.v,
              width: 49.h,
              radius: BorderRadius.circular(
                25.h,
              ),
              alignment: Alignment.topCenter,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.h,
              bottom: 26.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Use data from yourWidgetDataModel here
                Text(
                  yourWidgetDataModel.name,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 3.v),
                // Use data from yourWidgetDataModel here
                Text(
                  yourWidgetDataModel.description,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Spacer(),
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle the selected option (e.g., update or delete)
              if (value == 'update') {
                updateRow(context);
              } else if (value == 'delete') {
                deleteRow(context);
              }
            },
            itemBuilder: (BuildContext context) {
              return ['Update', 'Delete'].map((String choice) {
                return PopupMenuItem<String>(
                  value: choice.toLowerCase(),
                  child: Text(choice),
                );
              }).toList();
            },
            child: CustomImageView(
              // Use data from yourWidgetDataModel here
              imagePath: ImageConstant.imgOverflowMenu,
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.only(
                top: 22.v,
                right: 9.h,
                bottom: 22.v,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void updateRow(BuildContext context) async {
    // Navigate to UpdateRowScreen and await the result
    var updatedData = await Navigator.push<RowData>(
      context,
      MaterialPageRoute(builder: (context) => UpdateRowScreen()),
    );

    // Check if updatedData is not null and update the content
    if (updatedData != null) {
      // Update the content in Cartappcardlist3ItemWidget using updatedData
      setState(() {
        yourWidgetDataModel = updatedData;
      });

      // You can print the updatedData for demonstration purposes
      print('Updated Data: ${updatedData.name}, ${updatedData.description}');
    }
  }

  void deleteRow(BuildContext context) {
    print('Row deleted!');

    // You can remove the row from the list or perform other delete logic here
    // For this example, let's show a confirmation dialog before deleting
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Deletion"),
          content: Text("Are you sure you want to delete this row?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Perform delete logic here
                // For now, let's print a message
                print('Row deleted!');
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
