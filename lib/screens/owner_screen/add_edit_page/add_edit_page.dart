// ignore_for_file: must_be_immutable, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/data/add_edit/add_edit_model/main_playground_model.dart';
import 'package:sportify/data/add_edit/add_edit_model/sub_playground_model.dart';
import 'package:sportify/screens/owner_screen/owner_home/owner_home.dart';
import 'package:sportify/screens/shared_functions/signup_functions.dart';
import 'package:sportify/utilities/colors/utilities.dart';
import 'package:sportify/utilities/fonts/fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';
import '../../../data/add_edit/bloc/add_edit_bloc.dart';
import 'package:shimmer/shimmer.dart';

class AddEditPage extends StatefulWidget {
  final bool isEdit;
  SubPlaygroundModel? playground;
  AddEditPage({super.key, required this.isEdit, this.playground});

  @override
  State<AddEditPage> createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  String generateUID() {
    const uuid = Uuid();
    return uuid.v4();
  }

  int indexSelectedOfType = -1;
  String? numberOfPlaygruond;
  String? price;
  String? type;
  String? playgroundUID;
  String? image;
  String? size;

  bool changeButtonColor = false;
  int indexOfStep = 0;
  int currentPhase = 0;
  bool canPress = false;
  bool confirmButton = false;
  bool allPhasesCompleted = false;

  TextEditingController _numberOfPlayground = TextEditingController();
  TextEditingController _playgroundPriceController = TextEditingController();
  List<String> playgroundType = ["football", "basketball", "tennis", "padel"];
  bool typeSelect = false;
  int selectedIndexType = -1;
  bool chooseFootball = false;
  bool selected5x5 = false;
  bool selected6x6 = false;

  @override
  void initState() {
    if (widget.isEdit) {
      _numberOfPlayground =
          TextEditingController(text: widget.playground!.playgroundNumber);
      _playgroundPriceController =
          TextEditingController(text: widget.playground!.playgroundPrice);
      size = widget.playground!.playgroundSize;
      image = widget.playground!.playgroundImage;
      playgroundUID = widget.playground!.playgroundUID;

      type = widget.playground!.playgroundType;
    }

    super.initState();
  }

  // List<String> playgroundSize = ['5x5', '6x6'];
  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;

    double boxWidth = pageWidth * 0.8;
    double boxHeight = pageHeight * 0.68;

    return BlocProvider(
      create: (context) => AddEditBloc(),
      child: BlocConsumer<AddEditBloc, AddEditState>(
        listener: (context, state) {
          if (state is PickedImageState) {
            image = state.image;
            print(image);
          }
          if (state is LoadingImageState) {
            Container(
                width: pageWidth * 0.55,
                height: pageHeight * 0.18,
                decoration: BoxDecoration(
                  border: Border.all(color: mMainColor, width: 3),
                ),
                child: Shimmer.fromColors(
                  baseColor: canNotChang,
                  highlightColor: canNotChang,
                  child: Container(
                    color: Colors.white,
                  ),
                ));
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
              elevation: 0,
              backgroundColor: mMainColor,
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: pageWidth * 0.85),
                  child: indexOfStep == 0
                      ? CircleAvatar(
                          backgroundColor: white,
                          child: IconButton(
                              onPressed: () {
                                SharedFunction
                                    .navigatorPushAndRemoveUntilFunction(
                                        context, OwnerHomePage(isOwner: true));
                              },
                              icon: const Icon(
                                Icons.close,
                                color: mMainColor,
                              )),
                        )
                      : CircleAvatar(
                          backgroundColor: white,
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  indexOfStep--;
                                });
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: mMainColor,
                              )),
                        ),
                )
              ],
            ),
            backgroundColor: mMainColor,
            body: Stack(
              children: [
                Container(
                  width: pageWidth,
                  height: pageHeight * 0.1,
                  color: mMainColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: pageWidth * 0.05,
                        ),
                        child: Text.rich(
                          TextSpan(
                            text: widget.isEdit
                                ? "Edit Playground"
                                : "Add Playground",
                            style: appBarFont,
                            children: <TextSpan>[
                              TextSpan(
                                  text: '\nAdd your available playground ',
                                  style: subAppText),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: pageHeight * 0.02),
                  child: Center(
                    child: Container(
                        width: boxWidth,
                        height: boxHeight,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                            color: white),
                        child: indexOfStep == 0
                            ? stepOneWidget()
                            : indexOfStep == 2
                                ? thirdStepWidget()
                                : type == "football"
                                    ? stepTwoWidget(context)
                                    : comingSoonWidget()),
                  ),
                ),
                Positioned(
                    top: pageHeight * 0.76,
                    left: pageWidth * 0.36,
                    child: GestureDetector(
                      onTap: () {
                        if (canPress || confirmButton) {
                          setState(() {
                            if (indexOfStep < 3) {
                              indexOfStep++;
                              canPress = false;
                            }
                          });
                        } else {
                          Fluttertoast.showToast(
                            msg: indexSelectedOfType > -1
                                ? "missing data,Please fill all fields"
                                : "Please choose Type",
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 1,
                            backgroundColor: mMainColor,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                        if (indexOfStep == 3) {
                          String playgroundUID = generateUID();
                          SubPlaygroundModel newPlaygroundModel =
                              SubPlaygroundModel(
                                  playgroundNumber: numberOfPlaygruond!,
                                  playgroundType: type!,
                                  playgroundPrice:
                                      _playgroundPriceController.text,
                                  playgroundSize: size!,
                                  playgroundImage: image!,
                                  playgroundUID: playgroundUID,
                                  playgroundAvailability: true);
                          BlocProvider.of<AddEditBloc>(context).add(
                              AddPlaygroundEvent(
                                  playgroundModel: newPlaygroundModel));
                        }
                      },
                      child: Container(
                        width: pageWidth * 0.3,
                        height: pageHeight * 0.059,
                        decoration: BoxDecoration(
                            color: (canPress ||
                                    confirmButton ||
                                    (indexOfStep == 0 &&
                                        indexSelectedOfType > -1))
                                ? mPrimaryColor
                                : canNotChang,
                            borderRadius: BorderRadius.circular(24)),
                        child: Column(
                          children: [
                            Text(
                              indexOfStep == 0
                                  ? "Next"
                                  : indexOfStep == 1
                                      ? "Preview"
                                      : "Confirm",
                              style: appBarFont,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: 6.5,
                                    height: 6.5,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: indexOfStep == 0
                                            ? mMainColor
                                            : white)),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                    width: 6.5,
                                    height: 6.5,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: indexOfStep == 1
                                            ? mMainColor
                                            : white)),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                    width: 6.5,
                                    height: 6.5,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: indexOfStep == 2
                                            ? mMainColor
                                            : white))
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget stepOneWidget() {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;

    double boxWidth = pageWidth * 0.8;
    double boxHeight = pageHeight * 0.68;
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: SizedBox(
        width: boxWidth * 0.9,
        height: boxHeight * 0.9,
        child: ListView.builder(
          itemCount: playgroundType.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: pageHeight * 0.011,
                  right: pageWidth * 0.04,
                  left: pageWidth * 0.04),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    indexSelectedOfType = index;
                    type = playgroundType[indexSelectedOfType];
                    canPress = true;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: indexSelectedOfType == index
                        ? Border.all(color: green, width: 10)
                        : null,
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/${playgroundType[index]}.jpg",
                        ),
                        fit: BoxFit.cover),
                  ),
                  width: boxWidth * 0.7,
                  height: boxHeight * 0.22,
                  child: Align(
                      child: Container(
                    width: 340,
                    height: 180,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        stops: [2.5, 2.5, 2.5],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          const Color.fromARGB(255, 127, 127, 127)
                              .withAlpha(100),
                          const Color.fromARGB(255, 127, 127, 127)
                              .withAlpha(100),
                          const Color.fromARGB(255, 127, 127, 127)
                              .withAlpha(100),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          playgroundType[index],
                          style: appBarFont,
                        ),
                      ),
                    ),
                  )),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget stepTwoWidget(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;

    double boxWidth = pageWidth * 0.8;
    double boxHeight = pageHeight * 0.68;
    return SizedBox(
      width: boxWidth,
      height: boxHeight,
      child: Stepper(
        currentStep: currentPhase,
        onStepTapped: (value) {
          setState(() {
            currentPhase = value;
          });
        },
        controlsBuilder: (context, details) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: pageWidth * 0.07, right: pageWidth * 0.03),
                  child: GestureDetector(
                    onTap: () {
                      if (image != null) {
                        changeButtonColor = true;
                      }
                      setState(() {
                        if (currentPhase < 3) {
                          currentPhase++;
                          numberOfPlaygruond = _numberOfPlayground.text;
                        }
                        if (_numberOfPlayground.text != '' &&
                            size != null &&
                            _playgroundPriceController.text != '' &&
                            image != null) {
                          setState(() {
                            canPress = true;
                            confirmButton = true;
                          });
                        }
                      });
                    },
                    child: Visibility(
                      visible: currentPhase <= 3,
                      child: Container(
                        width: pageWidth * 0.22,
                        height: pageHeight * 0.05,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: (changeButtonColor && currentPhase == 3)
                                ? canNotChang
                                : mMainColor),
                        child: Center(
                          child: Text(
                            currentPhase == 3 ? 'Save' : 'Continue',
                            style: continueButtonFont,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: currentPhase > 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (currentPhase > 0) {
                          currentPhase--;
                          changeButtonColor = false;
                        } else {
                          null;
                        }
                      });
                    },
                    child: Container(
                      width: pageWidth * 0.2,
                      height: pageHeight * 0.046,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: mPrimaryColor),
                      child: Center(
                        child: Text(
                          'Back',
                          style: backButtonFont,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        steps: [
          Step(
            isActive: (currentPhase > 0 && _numberOfPlayground.text != ''),
            state: _numberOfPlayground.text != ''
                ? StepState.complete
                : StepState.indexed,
            title: const Text("Playground Number"),
            content: SizedBox(
              width: boxWidth * 0.6,
              height: boxHeight * 0.11,
              child: TextField(
                controller: _numberOfPlayground,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter a Number',
                  helperText: 'Required *',
                  hintText: '1', // Optional hint text
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
                // You can specify more properties like onChanged, controller, etc.
              ),
            ),
          ),
          Step(
              isActive: (currentPhase > 1 && size != null),
              state: size != null ? StepState.complete : StepState.indexed,
              title: const Text("Playground Size"),
              content: SizedBox(
                width: 170,
                height: 100,
                child: Padding(
                  padding: EdgeInsets.only(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected5x5 = true;
                            selected6x6 = false;
                            size = '5x5';
                          });
                        },
                        child: Container(
                          width: pageWidth * 0.2,
                          height: pageHeight * 0.1,
                          decoration: BoxDecoration(
                              color: selected5x5 ? mPrimaryColor : mMainColor,
                              shape: BoxShape.circle),
                          child: Center(
                            child: Text(
                              "5 x 5",
                              style: appBarFont,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected6x6 = true;
                            selected5x5 = false;
                            size = '6x6';
                          });
                        },
                        child: Container(
                          width: pageWidth * 0.2,
                          height: pageHeight * 0.1,
                          decoration: BoxDecoration(
                              color: selected6x6 ? mPrimaryColor : mMainColor,
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
              )),
          Step(
            isActive:
                (currentPhase > 2 && _playgroundPriceController.text != ''),
            state: _playgroundPriceController.text != ''
                ? StepState.complete
                : StepState.indexed,
            title: const Text("Playground Price"),
            content: SizedBox(
              width: boxWidth * 0.6,
              height: boxHeight * 0.11,
              child: TextField(
                controller: _playgroundPriceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter a Price ',
                  helperText: "Required, Price per hour *",
                  hintText: '15.0 JD', // Optional hint text
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
                // You can specify more properties like onChanged, controller, etc.
              ),
            ),
          ),
          Step(
              isActive: (currentPhase > 3 && image != null),
              state: image != null ? StepState.complete : StepState.indexed,
              title: const Text("Playground Number"),
              content: SizedBox(
                width: 170,
                height: 150,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: pageWidth * 0.05,
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: pageWidth * 0.55,
                        height: pageHeight * 0.18,
                        decoration: BoxDecoration(
                            border: Border.all(color: mMainColor, width: 3)),
                        child: image == null
                            ? Padding(
                                padding: EdgeInsets.only(
                                  top: pageHeight * 0.04,
                                ),
                                child: const Text('Not Choosing \nimage !',
                                    textAlign: TextAlign.center),
                              )
                            : Padding(
                                padding:
                                    EdgeInsets.only(top: pageHeight * 0.007),
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
                      GestureDetector(
                        onTap: () => BlocProvider.of<AddEditBloc>(context)
                            .add(ChoosingImageEvent()),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: pageHeight * 0.015),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: pageWidth * 0.24,
                              height: pageHeight * 0.04,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9),
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
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget thirdStepWidget() {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;

    double boxWidth = pageWidth * 0.8;
    double boxHeight = pageHeight * 0.68;
    return SizedBox(
      width: pageWidth * 0.9,
      height: boxHeight * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: pageWidth * 0.1),
            child: Text(
              "Your Playground information",
              style: infoTitleFont,
            ),
          ),
          Image.network(
            image!,
            width: boxWidth * 0.7,
            height: pageHeight * 0.3,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "playground Number : $numberOfPlaygruond",
                  style: backButtonFont,
                ),
                Text(
                  "playground Size : $size",
                  style: backButtonFont,
                ),
              ],
            ),
          ),
          Text(
            "Playground Price: ${_playgroundPriceController.text} \$",
            style: backButtonFont,
          )
        ],
      ),
    );
  }

  Widget comingSoonWidget() {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;

    double boxWidth = pageWidth * 0.8;
    double boxHeight = pageHeight * 0.68;
    return Container(
      width: boxWidth * 0.8,
      height: boxHeight * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/ComingSoon.png',
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
