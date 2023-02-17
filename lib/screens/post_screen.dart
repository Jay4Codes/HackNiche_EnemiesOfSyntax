import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _description, _title, _category, _url, _location;
  String? filename;

  File? image;

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
    // submitSubscription();
    return selectedFile;
  }

  Future<int> submitSubscription(
      {File? file, String? filename, String? token}) async {
    ///MultiPart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("http://hacknich.pythonanywhere.com/login/news-create"),
    );
    Map<String, String> headers = {
      "Authorization": "Bearer $token",
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
    request.fields
        .addAll({"name": "test", "email": "test@gmail.com", "id": "12345"});
    print("request: " + request.toString());
    var res = await request.send();
    print("This is response:" + res.toString());
    return res.statusCode;
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
                      return 'Please enter a description';
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
                      return 'Please enter a title';
                    }
                    return null;
                  },
                  onSaved: (value) => _title = value!,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
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
                      return 'Please enter a category';
                    }
                    return null;
                  },
                  onSaved: (value) => _category = value!,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Category',
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
                      return 'Please enter a URL';
                    }
                    return null;
                  },
                  onSaved: (value) => _url = value!,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
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
                      return 'Please enter a location';
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
