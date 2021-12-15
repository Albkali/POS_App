import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/utils/string_utils.dart';
import 'package:pos/utils/utils.dart';

class LinkPage extends StatelessWidget {
  const LinkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.customAppBar(text: UtilStrings.smartX,icon: Icons.info_outlined),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: 'User Name',
                  hintText: 'Company Credential',
                ),
              ),
            ),
            const Gap(40),
            Container(
              height: 40,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child:
                  Utils.regularHeadingText(text: 'Save', color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }


}
