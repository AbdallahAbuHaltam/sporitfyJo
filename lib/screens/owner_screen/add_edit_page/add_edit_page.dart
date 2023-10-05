import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/data/add_edit/add_edit_bloc/add_edit_bloc.dart';
import 'package:sportify/data/add_edit/add_edit_model/playground_model.dart';
import 'package:sportify/utilities/colors/utilities.dart';
import 'package:sportify/utilities/fonts/fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddEditPage extends StatefulWidget {
  bool isEdit;
  AddEditPage({super.key, required this.isEdit});

  @override
  State<AddEditPage> createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  TextEditingController _playgroundNameController = TextEditingController();
  TextEditingController _playgroundPriceController = TextEditingController();
  TextEditingController _playgroundSizeController = TextEditingController();

  List<String> playgroundSize = ['5x5', '6x6'];
  String selectSize = '5x5';
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          keyboardType: TextInputType.name,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onSaved: (value) {
                            _playgroundPriceController.text = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: pageHeight * 0.001, bottom: pageHeight * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: pageWidth * 0.4,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: pageWidth * 0.05),
                                child: DropdownMenu<String>(
                                  controller: _playgroundSizeController,
                                  label: const Text('Playground Size',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  initialSelection: selectSize,
                                  onSelected: (String? value) {
                                    setState(() {
                                      _playgroundSizeController.text = value!;
                                    });
                                  },
                                  dropdownMenuEntries: playgroundSize
                                      .map<DropdownMenuEntry<String>>(
                                          (String value) {
                                    return DropdownMenuEntry<String>(
                                        value: value, label: value);
                                  }).toList(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: pageWidth * 0.05),
                              child: Stack(
                                children: [
                                  Container(
                                    width: pageWidth * 0.4,
                                    height: pageHeight * 0.15,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: mSecondaryColor),
                                    child: image == null
                                        ? Text('Not Choosing image !')
                                        : Align(
                                            alignment: Alignment.topCenter,
                                            child: SizedBox(
                                              width: 100,
                                              height: 80,
                                              child: Image.file(
                                                image!,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                  ),
                                  Positioned(
                                    top: pageHeight * 0.1,
                                    left: pageWidth * 0.09,
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
                                            'Choose Image',
                                            style: chooseImageText,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        _handelAddOrEditModel;
                      },
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
                                child:
                                    Text('Add Playground', style: addEditText)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  File? image;
  PlaygroundInfo _handelAddOrEditModel() {
    PlaygroundInfo playgroundModel = PlaygroundInfo(
        playgroundName: _playgroundNameController.text,
        playgroundPrice: _playgroundPriceController.text,
        playgroundSize: _playgroundSizeController.text,
        playgroundImage: image.toString(),
        playgroundAvailability: true);
    return playgroundModel;
  }
}
