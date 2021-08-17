import 'package:flutter/material.dart';
import 'package:stage2_input_displayapp/functions/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// Define a corresponding State class
class _HomeScreenState extends State<HomeScreen> {
  // Create text controllers.
  //We will use them to retrieve the value in TextFields
  final firstnameController = TextEditingController();
  final secondnameController = TextEditingController();
  final emailController = TextEditingController();

  // Clean up the controller when the widget is disposed.
  @override
  void dispose() {
    firstnameController.dispose();
    secondnameController.dispose();
    emailController.dispose();

    super.dispose();
  }

  //Custom Text Field Widget To Take Inputs
  Widget _customTextField({required controller, required hintText}) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.greenAccent,
              width: 3.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.greenAccent,
              width: 3.0,
            ),
          ),
          labelText: hintText,
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  //SHOW DIALOG
  //THIS IS WHERE I DISPLAY THE USERS INPUT USING A SHOW DAILOUG
  _showInputSummary() {
    return showDialog(
      barrierColor: Colors.greenAccent,
      context: context,
      builder: (context) {
        return AlertDialog(
          //SHOW DAILOGUE CONTENT
          scrollable: true,

          content: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(
              maxHeight: 300,
              maxWidth: 500,
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                RichText(
                  maxLines: 3,
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    children: [
                      TextSpan(
                        text: 'Full Name : ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                          text:
                              '${firstnameController.text} ${secondnameController.text}'),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                RichText(
                  maxLines: 3,
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    children: [
                      TextSpan(
                        text: 'Email : ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: '${emailController.text}'),
                    ],
                  ),
                ),
                Spacer(),
                // When the user presses the button, show an alert dialog containing
                // the summary of the text that the user has entered into the text fields.
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    primary: Colors.greenAccent.shade700,
                    onSurface: Colors.white,
                    onPrimary: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 200,
                    padding: EdgeInsets.symmetric(
                      // horizontal: 20,
                      vertical: 5,
                    ),
                    child: Text(
                      'Yeah That\'s Correct!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HNG Input Displayer'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Container(
            // height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // alignment: Alignment.center,
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.height / 1,
            ),
            padding: const EdgeInsets.all(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Enter Details',
                  style: TextStyle(fontSize: 25),
                ),
                _customTextField(
                  controller: firstnameController,
                  hintText: 'FIRST NAME',
                ),
                _customTextField(
                  controller: secondnameController,
                  hintText: 'SECOND NAME',
                ),
                _customTextField(
                  controller: emailController,
                  hintText: 'YOUR EMAIL',
                ),

                SizedBox(height: 50),

                //The Display Button
                //On Tap it displays an Alert Dialogue that Summarizes Your Input
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onSurface: Colors.white,
                    onPrimary: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    _showInputSummary();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Text(
                      'Display Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),

                Text(
                  'Project Made Possible By',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 20),

                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Utils.openLink('https://hng.tech/'),
                      child: Image(
                        image: AssetImage(
                          'assets/hng.jpg',
                        ),
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () => Utils.openLink('https://zuri.team/'),
                      child: Image(
                        image: AssetImage(
                          'assets/zuri.png',
                        ),
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () => Utils.openLink('https://ingressive.org/'),
                      child: Image(
                        image: AssetImage(
                          'assets/i4g.png',
                        ),
                        fit: BoxFit.contain,
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
