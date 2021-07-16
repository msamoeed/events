import 'package:events/constants/colors.dart';
import 'package:events/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'profile_screen_view_model.dart';

class ProfileScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileScreenViewModel>.reactive(
      builder:
          (BuildContext context, ProfileScreenViewModel viewModel, Widget _) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: appColor,
              centerTitle: true,
              title: Text(
                "Profile",
                style: t1white,
              ),
            ),
            body: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                        child: Image.network(
                      viewModel.getProfilePicture(),
                      height: 95,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: viewModel.img == null
                          ? Text(
                              'No image selected.',
                              style: t1,
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: ScreenUtil().setHeight(250),
                                  width: ScreenUtil().setWidth(350),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Image.file(viewModel.img)),
                            ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      viewModel.getImageFromCamera();
                    },
                    icon: Icon(FontAwesomeIcons.camera),
                    label: Text('Select Profile Picture'),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      viewModel.changeProfilePicture();
                    },
                    icon: Icon(FontAwesomeIcons.upload),
                    label: Text('Upload'),
                  )
                ],
              ),
            ));
      },
      viewModelBuilder: () => ProfileScreenViewModel(),
    );
  }
}
