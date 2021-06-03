import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TexFieldFocus extends StatefulWidget {
  const TexFieldFocus({Key key}) : super(key: key);

  @override
  _TexFieldFocusState createState() => _TexFieldFocusState();
}

class _TexFieldFocusState extends State<TexFieldFocus> {
  TextEditingController _controller = new TextEditingController();
  FocusNode _focusNode = new FocusNode();
  bool visivility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blue,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: Visibility(
                child: Container(
                  height: 40,
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {
                            visivility = false;
                          },
                          icon: Icon(Icons.device_unknown)),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.dialer_sip)),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.e_mobiledata)),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.h_mobiledata))
                    ],
                  ),
                ),
              ),
            ),

            // Positioned(
            //   bottom: 80,
            //   child: RaisedButton(
            //     onPressed: () {
            //       _showMyDialog();
            //       _focusNode.unfocus();
            //     },
            //     child: Text("Show Botton"),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

abstract class KeyboardHiderMixin {
  void hideKeyboard({
    BuildContext context,
    bool hideTextInput = true,
    bool requestFocusNode = true,
  }) {
    if (hideTextInput) {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    }
    if (context != null && requestFocusNode) {
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }
}
