import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/widgets/search_footer.dart';
import 'package:google_clone/widgets/search_tabs.dart';
import 'package:google_clone/widgets/web/search_header.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //web header
          SearchHeader(),
          //tabs of various searches
          const Padding(
            padding: EdgeInsets.only(left: 150.0),
            child: SearchTabs(),
          ),

          const Divider(
            height: 0,
            thickness: 1,
          ),
          //search results

          //pagination

          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {  },
                  child: const Text(
                    "< Prev",
                    style: TextStyle(
                      fontSize: 15,
                      color: blueColor,
                    ),
                  ),
                ),

                const SizedBox(width: 30,),

                TextButton(
                  onPressed: () {  },
                  child: const Text(
                    "Next >",
                    style: TextStyle(
                      fontSize: 15,
                      color: blueColor,
                    ),
                  ),
                ),
                
              ],
            ),
          ),
          const SizedBox(height: 30,),
                const SearchFooter(),
        ],
      ),
    ));
  }
}
