

  String DateMonthYear(DateTime now){


    String Dm= "";
    String weekday = "";
    int day = now.day;
    int month = now.month;
    int year = now.year;

    if (month == 1){
      Dm = "January";
    }
    else if (month == 2){
      Dm  = "Feburary";
    }
    else if (month == 3){
      Dm  = "March";
    }
    else if (month == 4){
      Dm  = "April";
    }
    else if (month == 5){
      Dm  = "May";
    }
    else if (month == 6){
      Dm  = "June";
    }
    else if (month == 7){
      Dm  = "July";
    }
    else if (month == 8){
      Dm  = "Augest";
    }
    else if (month == 9){
      Dm  = "September";
    }
    else if (month == 10){
      Dm  = "October";
    }
    else if (month == 11){
      Dm  = "November";
    }
    else {

      Dm  = "December";

    }

    Dm = " $day " + Dm +   " $year"  ;

    return Dm;


  }