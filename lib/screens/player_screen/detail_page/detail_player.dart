import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:sportify/utilities/colors/utilities.dart';
import 'package:time_range/time_range.dart';

import '../../../data/add_edit/add_edit_model/playground_model.dart';
import '../../../utilities/fonts/fonts.dart';

class DetailPlayer extends StatefulWidget {
  // final PlaygroundInfo playground;
  final bool isOwner;
  const DetailPlayer({super.key, required this.isOwner});

  @override
  State<DetailPlayer> createState() => _DetailPlayerState();
}

class _DetailPlayerState extends State<DetailPlayer> {
  String dateOfBooking = "";
  String fromTime = "";
  String toTime = "";

  final _defaultTimeRange = TimeRangeResult(
    const TimeOfDay(hour: 14, minute: 00),
    const TimeOfDay(hour: 15, minute: 00),
  );
  TimeRangeResult? _timeRange;
  bool selectDate = false;
  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: white,
          height: pageHeight,
          width: pageWidth,
          child: Stack(
            children: [
              SizedBox(
                width: pageWidth,
                height: pageHeight * 0.34,
                child: Image.asset('assets/images/stadium.jpg'),
                // child: Image.network(widget.playground.playgroundImage),
              ),
              Positioned(
                top: pageHeight * 0.06,
                left: pageWidth * 0.04,
                child: SizedBox(
                  width: pageWidth * 0.08,
                  height: pageHeight * 0.04,
                  child: CircleAvatar(
                    backgroundColor: white,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: mMainColor,
                        size: 17,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: pageWidth * 0.05,
                top: pageHeight * 0.01,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: pageHeight * 0.25,
                  ),
                  child: Container(
                    width: pageWidth * 0.9,
                    height: pageHeight * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: white,
                      border: Border.all(
                        color: Colors.black.withOpacity(0.1), // Border color
                        width: 2.0, // Border width
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: pageHeight * 0.01,
                          left: pageWidth * 0.09,
                          child: Text(
                            'Fcb',
                            style: cardText,
                          ),
                        ),
                        Positioned(
                          left: pageWidth * 0.3,
                          child: IconButton(
                            icon: const Icon(
                              Icons.info,
                              color: Colors.cyan,
                              size: 18,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Positioned(
                          top: pageHeight * 0.015,
                          right: pageWidth * 0.04,
                          child: SizedBox(
                            width: pageWidth * 0.08,
                            height: pageHeight * 0.04,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black
                                      .withOpacity(0.1), // Grey border color
                                  width: 2.0, // Border width
                                ),
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors
                                    .white, // Set your background color here
                                child: Center(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.phone,
                                      color: Colors.green,
                                      size: 13,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: pageHeight * 0.049,
                          left: pageWidth * 0.09,
                          child: Text(
                            'football',
                            style: homeSizeFont,
                          ),
                        ),
                        Positioned(
                          left: pageWidth * 0.05,
                          top: pageHeight * 0.068,
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.star,
                              color: mPrimaryColor,
                              size: 15,
                            ),
                            label: Text('4.0', style: homeText4),
                          ),
                        ),
                        Positioned(
                          top: pageHeight * 0.086,
                          right: pageWidth * 0.30,
                          child: Text(
                            'Price',
                            style: homePriceFont,
                          ),
                        ),
                        Positioned(
                          top: pageHeight * 0.11,
                          right: pageWidth * 0.31,
                          child: Text(
                            '\$20',
                            style: homeText3,
                          ),
                        ),
                        Positioned(
                          top: pageHeight *
                              0.09, // Use the same top position as the second Text widget
                          right: (pageWidth * 0.21 + pageWidth * 0.28) /
                              2, // Calculate the horizontal center
                          child: Container(
                            width:
                                1.0, // Line thickness (this will make it vertical)
                            height: pageHeight *
                                0.04, // Adjust the height as needed
                            color:
                                Colors.black.withOpacity(0.4), // Line color
                          ),
                        ),
                        Positioned(
                          top: pageHeight * 0.086,
                          right: pageWidth * 0.13,
                          child: Text(
                            'Size',
                            style: homePriceFont,
                          ),
                        ),
                        Positioned(
                          top: pageHeight * 0.11,
                          right: pageWidth * 0.13,
                          child: Text(
                            '5X5',
                            style: homeText3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: pageHeight * 0.42,
                child: SizedBox(
                  width: pageWidth,
                  height: pageHeight * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          top: 4,
                        ),
                        child: Text(
                          'Playgrounds',
                          style: cardText2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: pageHeight * 0.16,
                          width:
                              double.infinity, // Adjust the height as needed
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Container(
                                  color: mMainColor,
                                  width: pageWidth * 0.3,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: pageHeight * 0.1,
                                        width: pageWidth * 0.21,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/stadium.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Playground1',
                                        style: homeText4,
                                      ),
                                      Text(
                                        '5X5',
                                        style: homeSizeFont,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
               Positioned(
                top: pageHeight * 0.634,
                child: SizedBox(
                  width: pageWidth,
                  height: pageHeight * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          top: 4,
                        ),
                        child: Text(
                          'Date',
                          style: cardText2,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: pageHeight * 0.02),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              DatePicker(
                                DateTime.now(),
                                initialSelectedDate: DateTime.now(),
                                selectionColor: mMainColor,
                                selectedTextColor: mPrimaryColor,
                                onDateChange: (date) {
                                  // New date selected
                                  setState(() {
                                    // selectedValue = date;

                                    List<String> splitDate =
                                        date.toString().split(' ');
                                    dateOfBooking = splitDate[0];
                                    print(dateOfBooking);
                                    selectDate = true;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: selectDate,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    top: pageHeight * 0.03,
                                    left: pageWidth * 0.06),
                                child: Text(
                                  'Time',
                                  style:cardText2,
                                ),
                              ),
                              const SizedBox(height: 20),
                              TimeRange(
                                fromTitle: const Text(
                                  'FROM',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: dark,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                toTitle: const Text(
                                  'TO',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: dark,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                titlePadding: 50,
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: dark,
                                ),
                                activeTextStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: mPrimaryColor,
                                ),
                                borderColor: dark,
                                activeBorderColor: dark,
                                backgroundColor: Colors.transparent,
                                activeBackgroundColor: mMainColor,
                                firstTime:
                                    const TimeOfDay(hour: 8, minute: 00),
                                lastTime:
                                    const TimeOfDay(hour: 20, minute: 00),
                                initialRange: _timeRange,
                                timeStep: 30,
                                timeBlock: 30,
                                onRangeCompleted: (range) => setState(() {
                                  _timeRange = range;
                                  fromTime =
                                      _timeRange!.start.format(context);
                                  toTime = _timeRange!.end.format(context);
                                  print("ftom:  $fromTime  -to :  $toTime");
                                }),
                                onFirstTimeSelected: (startHour) {},
                              ),
                              const SizedBox(height: 30),
                              if (_timeRange != null)
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 50),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                          'Book From-To: ${_timeRange!.start.format(context)} - ${_timeRange!.end.format(context)}',
                                          style: timelineBookFont),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              

            ],
          ),
        ),
      ),
    );
  }
}
