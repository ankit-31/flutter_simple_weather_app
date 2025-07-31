
import 'package:permission_handler/permission_handler.dart';
class PermissionServices{


 Future <bool>askLocationPermission()async{


   var status=Permission.location.request();



    return status.isGranted;

  }

}