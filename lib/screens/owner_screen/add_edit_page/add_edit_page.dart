import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/data/add_edit/add_edit_model/playground_model.dart';
import 'package:sportify/screens/owner_screen/owner_home/owner_home.dart';
import 'package:sportify/screens/shared_functions/signup_functions.dart';
import 'package:sportify/utilities/colors/utilities.dart';
import 'package:sportify/utilities/fonts/fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';
import 'package:time_range/time_range.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import '../../../data/add_edit/bloc/add_edit_bloc.dart';

class AddEditPage extends StatefulWidget {
  final bool isEdit;
  PlaygroundInfo? playground;
  AddEditPage({super.key, required this.isEdit, this.playground});

  @override
  State<AddEditPage> createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  String generateUID() {
    const uuid = Uuid();
    return uuid.v4();
  }

  String dateOfBooking = "";
  String fromTime = "";
  String toTime = "";

  final _defaultTimeRange = TimeRangeResult(
    const TimeOfDay(hour: 14, minute: 00),
    const TimeOfDay(hour: 15, minute: 00),
  );
  TimeRangeResult? _timeRange;
  bool selectDate = false;

  final _formKey = GlobalKey<FormState>();

  TextEditingController _playgroundNameController = TextEditingController();
  TextEditingController _playgroundPriceController = TextEditingController();
  TextEditingController _playgroundSizeController = TextEditingController();
  List<String> playgroundType = [
    "football",
    "basketball",
    "tennis",
    "volleyball",
    "padel"
  ];
  String? selectTypeOfPlayground;
  bool typeSelect = false;
  int selectedIndexType = -1;
  bool chooseFootball = false;
  bool selected5x5 = false;
  bool selected6x6 = false;
  String? image;

  void initState() {
    _timeRange = _defaultTimeRange;

    if (widget.isEdit) {
      _playgroundNameController =
          TextEditingController(text: widget.playground!.playgroundName);
      _playgroundPriceController =
          TextEditingController(text: widget.playground!.playgroundPrice);
      selectSize = widget.playground!.playgroundSize;
      image = widget.playground!.playgroundImage;
      playgroundUID = widget.playground!.playgroundUID;
      dateOfBooking = widget.playground!.date;
      fromTime = widget.playground!.fromTime;
      toTime = widget.playground!.toTime;
      selectTypeOfPlayground = widget.playground!.playgroundType;
    }

    super.initState();
  }

  // List<String> playgroundSize = ['5x5', '6x6'];
  String? selectSize;
  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => AddEditBloc(),
      child: BlocConsumer<AddEditBloc, AddEditState>(
        listener: (context, state) {
          if (state is PickedImageState) {
            image = state.image;
            print(image);
          }
          if (state is LoadingState) {
            const Center(
              child: CircularProgressIndicator(
                color: mMainColor,
              ),
            );
          }
          if (state is AddedPlaygroundState) {
            Fluttertoast.showToast(
              msg: "The Playground is added successfully",
              toastLength: Toast.LENGTH_SHORT,
              timeInSecForIosWeb: 1,
              backgroundColor: mMainColor,
              textColor: Colors.white,
              fontSize: 16.0,
            );

            SharedFunction.navigatorPushAndRemoveUntilFunction(
                context, OwnerHomePage(isOwner: true));
          }
          if (state is EditPlaygroundSuccessfully) {
            Fluttertoast.showToast(
              msg: "The Playground is Edited successfully",
              toastLength: Toast.LENGTH_SHORT,
              timeInSecForIosWeb: 1,
              backgroundColor: mMainColor,
              textColor: Colors.white,
              fontSize: 16.0,
            );

            SharedFunction.navigatorPushAndRemoveUntilFunction(
                context, OwnerHomePage(isOwner: true));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                backgroundColor: mMainColor,
                title: widget.isEdit
                    ? const Text('Edit Playground')
                    : const Text('Add Playground')),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: pageHeight * 0.01,
                          ),
                          Padding(
                            padding: EdgeInsets.all(pageHeight * 0.02),
                            child: TextFormField(
                              controller: _playgroundNameController,
                              validator: (value) =>
                                  value!.isEmpty ? "Enter a car name!" : null,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                labelText: "Playground Name",
                                labelStyle: const TextStyle(
                                  color: mMainColor,
                                ),
                                isDense: true,
                                prefixIcon: const Icon(
                                  Icons.stadium_rounded,
                                  color: mMainColor,
                                ),
                              ),
                              keyboardType: TextInputType.name,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onSaved: (value) {
                                _playgroundNameController.text = value!;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(pageHeight * 0.02),
                            child: TextFormField(
                              controller: _playgroundPriceController,
                              validator: (value) =>
                                  value!.isEmpty ? "Enter a car Price !" : null,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                labelText: "Playground Price",
                                labelStyle: const TextStyle(
                                  color: mMainColor,
                                ),
                                isDense: true,
                                prefixIcon: const Icon(
                                  Icons.attach_money_rounded,
                                  color: mMainColor,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onSaved: (value) {
                                _playgroundPriceController.text = value!;
                              },
                            ),
                          ),
                          Text(
                            'Type of playground :',
                            style: typeOfPlaygroundText,
                          ),
                          Padding(
                            padding: EdgeInsets.all(pageHeight * 0.013),
                            child: SizedBox(
                              height: pageHeight * 0.13,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: playgroundType.length,
                                itemBuilder: (context, indexOfType) {
                                  return GestureDetector(
                                    onTap: () {
                                      typeSelect = true;

                                      setState(() {
                                        if (playgroundType[indexOfType] ==
                                            "football") {
                                          chooseFootball = true;
                                        } else {
                                          chooseFootball = false;
                                        }
                                        selectedIndexType = indexOfType;

                                        selectTypeOfPlayground =
                                            playgroundType[indexOfType];
                                      });
                                    },
                                    child: selectedIndexType == indexOfType
                                        ? Padding(
                                            padding: EdgeInsets.only(
                                                left: pageWidth * 0.02,
                                                right: pageWidth * 0.02),
                                            child: Stack(
                                              children: [
                                                Column(
                                                  children: [
                                                    ClipOval(
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        width: 70,
                                                        height: 70,
                                                        margin: const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 4),
                                                        child: Center(
                                                          child: Image.asset(
                                                            'assets/images/${playgroundType[indexOfType]}.jpg',
                                                            fit: BoxFit.cover,
                                                            width: 100,
                                                            height: 70,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      playgroundType[
                                                          indexOfType],
                                                      style:
                                                          typeOfPlaygroundText,
                                                    )
                                                  ],
                                                ),
                                                Positioned(
                                                    left: pageWidth * 0.14,
                                                    bottom: pageHeight * 0.075,
                                                    child: const SizedBox(
                                                      width: 20,
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            Colors.green,
                                                        child: Icon(Icons.check,
                                                            size: 20,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          )
                                        : Padding(
                                            padding: EdgeInsets.only(
                                                left: pageWidth * 0.02,
                                                right: pageWidth * 0.02),
                                            child: Column(
                                              children: [
                                                ClipOval(
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    width: 70,
                                                    height: 70,
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 4),
                                                    child: Center(
                                                      child: Image.asset(
                                                        'assets/images/${playgroundType[indexOfType]}.jpg',
                                                        fit: BoxFit.cover,
                                                        width: 100,
                                                        height: 70,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  playgroundType[indexOfType],
                                                  style: typeOfPlaygroundText,
                                                )
                                              ],
                                            ),
                                          ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Visibility(
                            visible: chooseFootball,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: pageHeight * 0.003,
                                  bottom: pageHeight * 0.02),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: pageWidth * 0.2,
                                    right: pageWidth * 0.2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selected5x5 = true;
                                          selected6x6 = false;
                                          selectSize = '5x5';
                                        });
                                      },
                                      child: Container(
                                        width: pageWidth * 0.23,
                                        height: pageHeight * 0.13,
                                        decoration: BoxDecoration(
                                            color: selected5x5
                                                ? mPrimaryColor
                                                : mMainColor,
                                            shape: BoxShape.circle),
                                        child: Center(
                                          child: Text(
                                            "5 x 5",
                                            style: sizeOfPlaygroundFont,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selected6x6 = true;
                                          selected5x5 = false;
                                          selectSize = '6x6';
                                        });
                                      },
                                      child: Container(
                                        width: pageWidth * 0.23,
                                        height: pageHeight * 0.13,
                                        decoration: BoxDecoration(
                                            color: selected6x6
                                                ? mPrimaryColor
                                                : mMainColor,
                                            shape: BoxShape.circle),
                                        child: Center(
                                          child: Text(
                                            "6 x 6",
                                            style: sizeOfPlaygroundFont,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: pageWidth * 0.05,
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  width: pageWidth * 0.55,
                                  height: pageHeight * 0.18,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: mMainColor, width: 3)),
                                  child: image == null
                                      ? Padding(
                                          padding: EdgeInsets.only(
                                            top: pageHeight * 0.04,
                                          ),
                                          child: const Text(
                                              'Not Choosing \nimage !',
                                              textAlign: TextAlign.center),
                                        )
                                      : Padding(
                                          padding: EdgeInsets.only(
                                              top: pageHeight * 0.007),
                                          child: Align(
                                            alignment: Alignment.topCenter,
                                            child: SizedBox(
                                              width: 150,
                                              height: 120,
                                              child: Image.network(
                                                image!,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ),
                                ),
                                Positioned(
                                  top: pageHeight * 0.133,
                                  left: pageWidth * 0.15,
                                  child: GestureDetector(
                                    onTap: () =>
                                        BlocProvider.of<AddEditBloc>(context)
                                            .add(ChoosingImageEvent()),
                                    child: Container(
                                      width: pageWidth * 0.24,
                                      height: pageHeight * 0.04,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9),
                                          color: mMainColor),
                                      child: Center(
                                        child: Text(
                                          widget.isEdit
                                              ? 'Change Image'
                                              : 'Choose Image',
                                          style: chooseImageText,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
                                      left: pageWidth * 0.05),
                                  child: Text(
                                    'Opening Times',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: dark),
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
                          GestureDetector(
                            onTap: () async {
                              _handelAddOrEditModel();
                              _handelValidation();
                              PlaygroundInfo newPlaygroundModel =
                                  _handelAddOrEditModel();
                              if (widget.isEdit) {
                                BlocProvider.of<AddEditBloc>(context).add(
                                    EditPlaygroundEvent(
                                        newPlaygroundModel:
                                            newPlaygroundModel));
                              } else {
                                BlocProvider.of<AddEditBloc>(context).add(
                                    AddPlaygroundEvent(
                                        playgroundModel: newPlaygroundModel));
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: pageHeight * 0.05),
                              child: Container(
                                width: pageWidth * 0.5,
                                height: pageHeight * 0.05,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    color: mMainColor),
                                child: widget.isEdit
                                    ? Center(
                                        child: Text('Confirm all Edit',
                                            style: addEditText))
                                    : Center(
                                        child: Text('Add Playground',
                                            style: addEditText)),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: widget.isEdit,
                            child: GestureDetector(
                              onTap: () async {
                                SharedFunction.navigatorPopFunction(context);
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.only(top: pageHeight * 0.005),
                                child: Container(
                                    width: pageWidth * 0.5,
                                    height: pageHeight * 0.05,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(11),
                                        color: mPrimaryColor),
                                    child: Center(
                                        child: Text('cancel',
                                            style: cancelButtomFont))),
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String? playgroundUID;
  PlaygroundInfo _handelAddOrEditModel() {
    String playgroundUID = generateUID();

    PlaygroundInfo playgroundModel = PlaygroundInfo(
        playgroundName: _playgroundNameController.text,
        playgroundType: selectTypeOfPlayground!,
        playgroundPrice: _playgroundPriceController.text,
        playgroundSize: selectSize!,
        playgroundImage: image!,
        playgroundAvailability: true,
        playgroundUID: playgroundUID,
        date: dateOfBooking,
        fromTime: fromTime,
        toTime: toTime);
    return playgroundModel;
  }

  void _handelValidation() {
    _formKey.currentState!.validate();
    _formKey.currentState!.save();
  }
}
