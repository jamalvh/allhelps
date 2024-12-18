import 'package:allhelps/filter_model.dart';
import 'package:allhelps/search_model.dart';
import 'package:flutter/material.dart';

class SearchOptions extends StatefulWidget {
  final List<String> searches;
  final Function(String) updateResults;
  final SearchModel searchModel;
  const SearchOptions(
      {super.key,
      required this.searches,
      required this.updateResults,
      required this.searchModel});

  @override
  State<SearchOptions> createState() => _SearchOptionsState();
}

class _SearchOptionsState extends State<SearchOptions> {
  FilterModel filterModel = FilterModel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.98,
        child: ListView.builder(
          itemBuilder: (context, index) {
            String filename =
                filterModel.getTopLevelImage(widget.searches.elementAt(index));
            return ListTile(
              title: TextButton(
                onPressed: () {
                  for (var location in widget.searchModel.locations) {
                    location.clearDistance();
                  }
                  filterModel.setChosenFilter(widget.searches.elementAt(index));
                  widget.updateResults(filterModel.chosenFilter);
                  Navigator.pushNamed(context, '/help');
                },
                child: Row(children: [
                  FutureBuilder<bool>(
                    future: filterModel.assetExists(filename),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return snapshot.data == true
                            ? Image.asset(
                                filename,
                                width: 20,
                                height: 20,
                              )
                            : Container();
                      } else {
                        return Container();
                      }
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    filterModel.searches.elementAt(index),
                    style: const TextStyle(fontSize: 14),
                  ),
                ]),
              ),
            );
          },
          itemCount: widget.searches.length,
        ));
  }
}
