import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  String? _description, _title, _category, _url, _location;
  String? filename;
  int currentCategoryIndex = 0;
  File? image;
  List<String> categories = [
    "Business",
    "Entertainment",
    "Environment",
    "Food",
    "Health",
    "Politics",
    "Science",
    "Sports",
    "Technology",
    "Top",
    "World"
  ];

  Future<File?> onAddPhotopressed() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );
    if (result == null) return null;

    File selectedFile = File(result.files.single.path!);
    setState(() {
      var lastSeperator =
          selectedFile!.path.lastIndexOf(Platform.pathSeparator);
      filename = selectedFile.path.substring(lastSeperator + 1);
    });

    return selectedFile;
  }

  Future<StreamedResponse> submitSubscription(
      {File? file, String? filename, String? token}) async {
    ///MultiPart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("http://hacknich.pythonanywhere.com/login/news-create"),
    );
    Map<String, String> headers = {
      "Authorization": "Token ${GetStorage().read('token')}",
      "Content-type": "multipart/form-data"
    };
    request.files.add(
      http.MultipartFile(
        'images',
        file!.readAsBytes().asStream(),
        file.lengthSync(),
        filename: filename,
        contentType: MediaType('image', 'jpeg'),
      ),
    );
    request.headers.addAll(headers);
    request.fields.addAll({
      "post_user": "1",
      "source": locationController.text,
      "description": descriptionController.text,
      "content": categories[currentCategoryIndex],
      "title": titleController.text
    });
    print("request: " + request.toString());
    var res = await request.send();
    print("This is response:" + res.toString());
    var response = jsonDecode(await res.stream.bytesToString());
    Dialog successDialog = Dialog(
      backgroundColor: Color(0xff1a1a1a),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.46365)), //this right here
      child: Container(
        height: 257.0,
        width: 351.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Align(
                  alignment: Alignment(0.85, 0),
                  child: SvgPicture.asset(
                    "assets/illustrations/x.svg",
                    color: Color(0xff565656),
                    width: 16.42,
                    height: 16.42,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7.0),
              child: SvgPicture.asset(
                "assets/illustrations/submitted.svg",
                width: 48.53,
                height: 44.17,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 22.0),
              child: Text(
                'News submitted successfully!!',
                style: GoogleFonts.ptSans(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1)),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.only(top: 22.0),
                child: Container(
                  height: 35,
                  width: 154,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Center(
                      child: Text(
                    "Back To Home",
                    style: GoogleFonts.ptSans(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1)),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    Dialog errorDialog = Dialog(
      backgroundColor: Color(0xff1a1a1a),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.46365)), //this right here
      child: Container(
        height: 257.0,
        width: 351.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Align(
                  alignment: Alignment(0.85, 0),
                  child: SvgPicture.asset(
                    "assets/illustrations/x.svg",
                    color: Color(0xff565656),
                    width: 16.42,
                    height: 16.42,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7.0),
              child: Image.asset(
                "assets/illustrations/close-red.png",
                width: 48.53,
                height: 44.17,
                color: Color(0xffff3232),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 22.0),
              child: Text(
                'News not submitted successfully!!',
                style: GoogleFonts.ptSans(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 12.0),
              child: Text(
                'Hate Speech Detected: ${response["Hate Speech Detected"]}',
                style: GoogleFonts.ptSans(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1)),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.only(top: 22.0),
                child: Container(
                  height: 35,
                  width: 154,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Center(
                      child: Text(
                    "Back To Home",
                    style: GoogleFonts.ptSans(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1)),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    if (res.statusCode == 200) {
      titleController.clear();
      descriptionController.clear();
      locationController.clear();
      categoryController.clear();
      urlController.clear();
      filename = null;
      image = null;
      showDialog(context: context, builder: (context) => successDialog);
    } else if (res.statusCode == 201) {
      showDialog(context: context, builder: (context) => errorDialog);
    }
    print(response);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1a1a1a),
      appBar: AppBar(
        backgroundColor: Color(0xff565656),
        title: Text(
          'Add a News Post',
          style: GoogleFonts.ptSans(
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  style: GoogleFonts.ptSans(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1)),
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    hintStyle: GoogleFonts.ptSans(
                        textStyle: const TextStyle(
                            color: Color(0xffbebebe),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1)),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(

                          // color: formKey.currentState!.validate()
                          //     ? R.colors.blue
                          //     : R.colors.red),
                          color: Colors.red),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                  onSaved: (value) => _description = value!,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLines: 5,
                  style: GoogleFonts.ptSans(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1)),
                  controller: descriptionController,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    hintStyle: GoogleFonts.ptSans(
                        textStyle: const TextStyle(
                            color: Color(0xffbebebe),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1)),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(

                          // color: formKey.currentState!.validate()
                          //     ? R.colors.blue
                          //     : R.colors.red),
                          color: Colors.red),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                  onSaved: (value) => _title = value!,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: locationController,
                  style: GoogleFonts.ptSans(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1)),
                  decoration: InputDecoration(
                    hintText: 'Location',
                    hintStyle: GoogleFonts.ptSans(
                        textStyle: const TextStyle(
                            color: Color(0xffbebebe),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1)),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(

                          // color: formKey.currentState!.validate()
                          //     ? R.colors.blue
                          //     : R.colors.red),
                          color: Colors.red),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a Location';
                    }
                    return null;
                  },
                  onSaved: (value) => _category = value!,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text('Select Category: ',
                        style: GoogleFonts.ptSans(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    DropdownButton(
                        elevation: 2,
                        dropdownColor: Color(0xff1a1a1a),
                        value: currentCategoryIndex,
                        items: [
                          DropdownMenuItem(
                            value: 0,
                            child: Text(
                              'Buisness',
                              style: GoogleFonts.ptSans(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1),
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 1,
                            child: Text(
                              'Entertainment',
                              style: GoogleFonts.ptSans(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1),
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text(
                              'Environment',
                              style: GoogleFonts.ptSans(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1),
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 3,
                            child: Text(
                              'Food',
                              style: GoogleFonts.ptSans(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1),
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 4,
                            child: Text(
                              'Health',
                              style: GoogleFonts.ptSans(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1),
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 5,
                            child: Text(
                              'Politics',
                              style: GoogleFonts.ptSans(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1),
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 6,
                            child: Text(
                              'Science',
                              style: GoogleFonts.ptSans(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1),
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 7,
                            child: Text(
                              'Sports',
                              style: GoogleFonts.ptSans(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1),
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 8,
                            child: Text(
                              'Technology',
                              style: GoogleFonts.ptSans(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1),
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 9,
                            child: Text(
                              'Top',
                              style: GoogleFonts.ptSans(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1),
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 10,
                            child: Text(
                              'World',
                              style: GoogleFonts.ptSans(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1),
                              ),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            currentCategoryIndex = value!;
                          });
                        }),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: urlController,
                  style: GoogleFonts.ptSans(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1)),
                  decoration: InputDecoration(
                    hintText: 'Url',
                    hintStyle: GoogleFonts.ptSans(
                        textStyle: const TextStyle(
                            color: Color(0xffbebebe),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1)),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(

                          // color: formKey.currentState!.validate()
                          //     ? R.colors.blue
                          //     : R.colors.red),
                          color: Colors.red),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a Url';
                    }
                    return null;
                  },
                  onSaved: (value) => _location = value!,
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () async {
                    image = await onAddPhotopressed();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: 'Add Attachment ',
                            style: GoogleFonts.ptSans(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1)),
                          ),
                          TextSpan(
                            text: '*',
                            style: GoogleFonts.ptSans(
                                textStyle: const TextStyle(
                                    color: Color(0xffff3232),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1)),
                          )
                        ])),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: DottedBorder(
                              color: Color(0xff565656),
                              borderType: BorderType.RRect,
                              radius: Radius.circular(8),
                              dashPattern: [5, 3],
                              strokeWidth: 1,
                              child: Container(
                                  height: 150,
                                  width: MediaQuery.of(context).size.width - 60,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (image != null)
                                          Image.file(
                                            image!,
                                            height: 200,
                                          ),
                                      ],
                                    ),
                                  ))),
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () async {
                          await submitSubscription(
                              file: image, filename: filename);
                        },
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color(0xffff3232),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              'Submit',
                              style: GoogleFonts.ptSans(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
