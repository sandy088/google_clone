import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/services/api_services.dart';
import 'package:google_clone/widgets/search_footer.dart';
import 'package:google_clone/widgets/search_tabs.dart';
import 'package:google_clone/widgets/web/search_header.dart';
import 'package:google_clone/widgets/web/search_result_component.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
          FutureBuilder(
            future: ApiService().fetchData(queryTerm: "weboking"),
            
            builder: (BuildContext context, AsyncSnapshot snapshot ){
              if(snapshot.hasData){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 150, top: 12),
                      child:  Text("About ${snapshot.data?['searchInformation']['formattedTotalResults']} results (${snapshot.data?['searchInformation']['formattedSearchTime']} seconds)",
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color(0xFF70757a),),
                    ),
                    ),
                    ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data?['items'].length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: size.width <= 768 ? 10 : 150,
                                    top: 10),
                                child: SearchResultCompnent(
                                  linkToGo: snapshot.data?['items'][index]
                                      ['link'],
                                  link: snapshot.data?['items'][index]
                                      ['formattedUrl'],
                                  text: snapshot.data?['items'][index]['title'],
                                  desc: snapshot.data?['items'][index]
                                      ['snippet'],
                                ),
                              );
                            },
                          ),
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            ),


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
