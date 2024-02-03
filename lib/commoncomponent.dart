
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterDropDown extends StatefulWidget {
  const FilterDropDown({super.key});

  @override
  State<FilterDropDown> createState() => _FilterDropDownState();
}

class _FilterDropDownState extends State<FilterDropDown> {
  String selectedBrand = 'Apple';
  bool dropDownShow = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 19),
      child: Column(
        children: [
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Text("Brand", style: GoogleFonts.lato(
                textStyle: const TextStyle(color: Color(0xff0a8523),),
              )),
              IconButton(
                onPressed: () {
                  setState(() {
                    dropDownShow =
                    !dropDownShow;
                  });
                },
                icon: dropDownShow == false
                    ? const Icon(
                  Icons
                      .arrow_drop_up_outlined,
                )
                    : const Icon(
                  Icons
                      .arrow_drop_down_sharp,
                  color:
                  Color(0xff0a8523),
                ),
              ),
            ],
          ),
          if (dropDownShow)
            Column(
              mainAxisAlignment:
              MainAxisAlignment.start,
              children: [
                RadioListTile(
                    title: const Text('Apple'),
                    activeColor:
                    Color(0xff0a8523),
                    value: 'first',
                    groupValue: selectedBrand,
                    onChanged: (value) {
                      setState(() {
                        selectedBrand = value!;
                      });
                    }),
                RadioListTile(
                    activeColor:
                    Color(0xff0a8523),
                    title:
                    const Text('Sony Tv'),
                    value: 'secont',
                    groupValue: selectedBrand,
                    onChanged: (value) {
                      setState(() {
                        selectedBrand = value!;
                      });
                    }),
              ],
            ),
          Container(
            height: 0.25,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
