

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalenderUtils{

  static const  standardDDMMYYYYDP= "dd-MM-yyyy";
  static const  standardYYYYMMDDDP= "yyyy-MM-dd";
  static const  previewDDMMMYYYYDP= "dd MMM yyyy";
  static const  previewDDMMMYYYYHHMMSSDP= "yyyy-MM-dd HH:mm:ss";

  static const  timeHHMMSS= "HH:mm:ss";

  static DateTime getDate (String pattern,String date){
    return DateFormat(pattern).parse(date);
  }
  static TimeOfDay getTime (String pattern,String time){
    return TimeOfDay(hour: DateFormat(pattern).parse(time).hour,minute: DateFormat(pattern).parse(time).minute);
  }
}