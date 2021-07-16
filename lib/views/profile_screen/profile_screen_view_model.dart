import 'dart:io';

import 'package:events/core/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:events/core/logger.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileScreenViewModel extends BaseViewModel {
  Logger log;
  var auth = FirebaseAuth.instance;
  final _firebaseStorage = FirebaseStorage.instance;
  var dialogService = locator<DialogService>();

  final picker = ImagePicker();
  File img;
  var putCmd;
  var downloadUrl;

  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      img = File(pickedFile.path);
      notifyListeners();
    } else {
      print('No image selected.');
    }
  }

  changeProfilePicture() async {
    putCmd = await _firebaseStorage
        .ref()
        .child('userProfilePicture')
        .child("/" + auth.currentUser.uid)
        .putFile(img);

    downloadUrl = await putCmd.ref.getDownloadURL();
    auth.currentUser.updatePhotoURL(downloadUrl);
    // dialogService.showDialog(
    //     title: "Picture Updated", buttonTitle: "Ok", cancelTitle: "Cancel");
  }

  String getProfilePicture() {
    if (auth.currentUser.photoURL == null) {
      return 'https://image.flaticon.com/icons/png/512/149/149071.png';
    } else {
      return auth.currentUser.photoURL;
    }
  }

  ProfileScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
