import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dialog.dart';

class menu extends StatelessWidget {
// late List<QuizOption> _options
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
      child: Column(
        children: [
          GestureDetector(
              child: Container(
                height: 40,
                width: 45,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/menu-icon.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              onTap: () => {
                    showDialog(
                      context: context,
                      builder: (ctx) => PlaceholderDialog(
                        icon: Container(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            child: Image(
                                image: AssetImage('assets/close-icon.png')),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ),
                        title: 'Save Failed',
                        message:
                            'An error occurred when attempt to save the message',
                        actions: [],
                      ),
                    )
                  })
        ],
      ),
    );
  }
}
