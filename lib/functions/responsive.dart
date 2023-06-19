import 'package:flutter/cupertino.dart';

enum DeviceSize {
  small,
  large
}

DeviceSize getDeviceSize(BuildContext context){
  if(MediaQuery.of(context).size.height <= 680){
        return DeviceSize.small;
  }
  else{
        return DeviceSize.large;
  }
}

bool isSmallDevice(BuildContext context){
  return getDeviceSize(context) == DeviceSize.small;

}