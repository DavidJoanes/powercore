import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../components/input_fields.dart';
import '../../controllers/constants.dart';

class EnterPowercellID extends StatefulWidget {
  const EnterPowercellID({
    super.key,
    required this.formKey,
    required this.powercellIDController,
    required this.fontStyle1b,
  });
  final Key formKey;
  final TextEditingController powercellIDController;
  final TextStyle fontStyle1b;

  @override
  State<EnterPowercellID> createState() => _EnterPowercellIDState();
}

class _EnterPowercellIDState extends State<EnterPowercellID> {
  final constantValues = Get.find<Constants>();
  var userInfo = GetStorage();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // widget.powercellIDController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.15,
            ),
            Text(
              "Enter your Powercell ID",
              style: widget.fontStyle1b,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            NumberFieldA(
              controller: widget.powercellIDController,
              keyboardType: TextInputType.number,
              width: size.width * 0.9,
              title: "Powercell ID",
              maxLength: 8,
              enabled: true,
            ),
            SizedBox(
              height: size.height * 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
