import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:musicia/view/search/search_list.dart';

import '../../controller/search_controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final searchController = context.watch<SearchScreenController>();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/bg.jpg'), fit: BoxFit.fill),
      ),
      child:  Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
             const  Divider(),
               Row(
                children: [
                  IconButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
                  Expanded(child: SearchBar(searchController: searchController,)),
                ],
               ),
                 const  Divider(),
             const  Expanded(child:  SearchList()),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.searchController,
  });

  final SearchScreenController searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: const EdgeInsets.fromLTRB(20, 8, 10, 2),
       height: 50,
       width: 350,
       child: CupertinoSearchTextField(
         borderRadius: const BorderRadius.all(Radius.circular(25)),
         
         style: const TextStyle(
           
           fontFamily: 'UbuntuCondensed',
           color: Color.fromARGB(255, 0, 0, 0),
           fontSize: 18,
         ),
         prefixIcon: const Icon(
           Icons.search,
         ),
         backgroundColor: Colors.white,
         onChanged: (value) => searchController.search(value),
       ),
       );
  }
}
