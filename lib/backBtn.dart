import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dialog.dart';
import 'sections.dart';

class backBtn extends StatelessWidget {
// late List<QuizOption> _options
  backBtn(this._context);
  late BuildContext _context = _context;

// late List<QuizOption> _options
  final Sections sections = Sections(
      title: "Zgjidhni",
      sub_title: "grupmoshën tuaj",
      bg: "uploads/images/sections-bg.png");

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              ElevatedButton.icon(
                onPressed: () => Get.back(),
                icon: Image(
                    image: AssetImage("assets/back-btn.png"),
                    width: 42,
                    height: 42),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                ),
              )
            ]),
            Column(children: [
              ElevatedButton.icon(
                onPressed: () => {Get.offAll(sections)},
                icon: Image(
                    image: AssetImage("assets/home-btn.png"),
                    width: 42,
                    height: 42),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                ),
              )
            ]),
          ]),
    );
  }
}
