import 'package:flutter/material.dart';
import '../app_color.dart';
import '../app_string.dart';
import '../responsive.dart';
import 'app_size.dart';

class Aboutinputfield extends StatefulWidget {
  final TextEditingController abouting_controller;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  const Aboutinputfield({super.key, required this.abouting_controller, this.onChanged, this.onTap});

  @override
  State<Aboutinputfield> createState() => _AboutinputfieldState();
}

class _AboutinputfieldState extends State<Aboutinputfield> {
  int charCount = 0; int maxLength = 100;

  @override
  void initState() {
    super.initState();
    widget.abouting_controller.addListener(() {
      setState(() {
        charCount = widget.abouting_controller.text.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    final responsivetext = responsive_text(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppString.About_You, style: TextStyle(fontSize: responsivetext.value, color: AppColor.other_text_color)),
        SizedBox(height: size.height / 80),
        SizedBox(
          height: size.height / 6.5,
          child: Stack(
            children: [
              TextField(
                onChanged: widget.onChanged,
                onTap: widget.onTap,
                cursorColor: AppColor.white_color,
                controller: widget.abouting_controller,
                maxLines: 100, maxLength: maxLength,
                style: TextStyle(color: AppColor.white_color, fontSize: responsivetext.value),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: size.width / 15, horizontal: size.width / 15),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.textfield_color_2), borderRadius: BorderRadius.circular(size.width / 30)),
                  disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.textfield_color_2), borderRadius: BorderRadius.circular(size.width / 30)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.textfield_color_2), borderRadius: BorderRadius.circular(size.width / 30)),
                  counterText: '',
                ),
              ),
              Positioned(bottom: 8, right: 12, child: Text('$charCount/$maxLength', style: TextStyle(color: Colors.grey[400], fontSize: size.width / 35))),
            ],
          ),
        ),
      ],
    );
  }
}

Widget inputfield({void Function(String)? onChanged, void Function()? onTap, required BuildContext context, required String hintText, required String text, required TextEditingController controller}) {
  final size = AppSize(context);
  final responsivetext = responsive_text(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(text, style: TextStyle(color: AppColor.other_text_color, fontSize: responsivetext.value)),
      SizedBox(height: size.height / 80),
      TextField(
        onChanged: onChanged,
        onTap: onTap,
        cursorColor: AppColor.white_color,
        controller: controller,
        style: TextStyle(fontSize: responsivetext.value, color: AppColor.white_color),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: AppColor.gray_color, fontSize: responsivetext.value),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(size.width / 30), borderSide: BorderSide(color: AppColor.textfield_color_2)),
          disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(size.width / 30), borderSide: BorderSide(color: AppColor.textfield_color_2)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(size.width / 30), borderSide: BorderSide(color: AppColor.textfield_color_2)),
        ),
      ),
      SizedBox(height: size.height / 50),
    ],
  );
}
