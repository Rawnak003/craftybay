import 'package:flutter/material.dart';
import '../../../../../../../core/constants/colors.dart';
import '../../../../../../../core/constants/strings.dart';



class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {
        //TODO: Perform search action here
      },
      decoration: InputDecoration(
        hintText: AppStrings.search,
        filled: true,
        fillColor: AppColor.lightGreyColor,
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none,),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none,),
        errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12,),
      ),
    );
  }
}