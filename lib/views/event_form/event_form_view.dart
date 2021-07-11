import 'package:events/classes/time_date.dart';
import 'package:events/constants/colors.dart';
import 'package:events/constants/fonts.dart';
import 'package:events/widgets/dumb_widgets/header_curved.dart';
import 'package:events/widgets/dumb_widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'event_form_view_model.dart';

class EventFormView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EventFormViewModel>.reactive(
      builder: (BuildContext context, EventFormViewModel viewModel, Widget _) {
        return Scaffold(
            backgroundColor: backgroundcolor,
            appBar: AppBar(
                title: Text(
                  "Create Event",
                  style: t1white,
                ),
                centerTitle: true,
                automaticallyImplyLeading: false,
                elevation: 0,
                backgroundColor: backgroundcolor),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: HomeHeader(
                      title: "Details of Event",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 5),
                    child: TextFields(
                      icon: Tab(
                        icon: Icon(Icons.event),
                      ),
                      hintText: "Name of Event",
                      context: context,
                      secureText: false,
                      borderColor: backgroundcolor,
                      focusColor: appColor,
                      onChanged: (String a) {
                        viewModel.name = a;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 5),
                    child: TextFields(
                      icon: Tab(
                        icon: Icon(Icons.tab_outlined),
                      ),
                      hintText: "Type of Event",
                      context: context,
                      secureText: false,
                      borderColor: appColor,
                      focusColor: appColor,
                      onChanged: (String a) {
                        viewModel.type = a;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 5),
                    child: TextFields(
                      icon: Tab(
                        icon: Icon(Icons.location_city_outlined),
                      ),
                      hintText: "Address",
                      context: context,
                      secureText: false,
                      borderColor: backgroundcolor,
                      focusColor: appColor,
                      onChanged: (String a) {
                        viewModel.address = a;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(end: 10, start: 10),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(38)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 8,
                                  offset: Offset(4, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6),
                              child: FlatButton(
                                  child: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.calendarAlt,
                                        color: Colors.grey,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Text(
                                          DateMonthYear(viewModel.startdate)
                                              .toString(),
                                          style: t10appColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () async {
                                    DateTime selectedDate = await viewModel
                                        .selectedDateTimeStart(context);

                                    viewModel.setSelectedDate(
                                        selectedDate: selectedDate);
                                  }),
                            ),
                          ),
                        )),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.only(end: 10, start: 10, top: 5),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(38)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 8,
                                  offset: Offset(4, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6),
                              child: FlatButton(
                                  child: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.clock,
                                        color: Colors.grey,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Text(
                                          (viewModel.starttime.toString()),
                                          style: t10appColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () async {
                                    final selectedTime = await viewModel
                                        .selectedTimeStart(context);

                                    viewModel.setSelectedTime(
                                        selectedTime: selectedTime);
                                  }),
                            ),
                          ),
                        )),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: GestureDetector(
                        onTap: () async {
                          await viewModel.submitForm();
                        },
                        child: ButtonBar(
                          children: [
                            Text("Submit", style: t22white),
                            Icon(
                              FontAwesomeIcons.arrowCircleRight,
                              size: 45,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ));
      },
      viewModelBuilder: () => EventFormViewModel(),
    );
  }
}
