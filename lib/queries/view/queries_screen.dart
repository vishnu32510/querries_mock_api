import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_api/queries/bloc/queries_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QueriesScreen extends StatelessWidget {
  static const String routeName = '/queriesScreen';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => QueriesScreen());
  }

  const QueriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.person_outline,
          color: Colors.black54,
          size: 30,
        ),
        actions: [
          Icon(
            Icons.settings,
            color: Colors.black54,
            size: 30,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.search,
            color: Colors.black54,
            size: 30,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (_) => QueriesBloc()..add(QueriesFetched()),
        child: BlocBuilder<QueriesBloc, QueriesState>(
          builder: (context, state) {
            print(state.queriesStatus);
            if (state.queriesStatus == QueriesStatus.Loading) {
              return Center(
                child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 2,
                    child: Lottie.asset(
                        "assets/lottie/lf30_editor_p75ue1ra.json")),
              );
            }
            if (state.queriesStatus == QueriesStatus.Failure) {
              return Center(
                child: Container(
                    alignment: Alignment.center,
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 2,
                    child: Lottie.asset("assets/lottie/9195-error.json")),
              );
            }
            return Container(
              color: Colors.white,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          child: Text(
                            "My Queries",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height - 125,
                          child: ListView.builder(
                              itemCount: state.queries.length,
                              itemBuilder: (context, index) {
                                String comments =
                                    state.queries[index].comments.toString();
                                String queryText =
                                    state.queries[index].queryText.toString();
                                String date = DateFormat('MMM dd, yyyy').format(
                                    DateFormat("dd.mm.yyyy").parse(
                                        state.queries[index].date.toString()));
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  margin: const EdgeInsets.only(
                                      top: 20, left: 20, right: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 0,
                                          blurRadius: 10),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        queryText,
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.comment,
                                            color: Colors.black26,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                              child: Text(
                                            comments,
                                            style:
                                                TextStyle(color: Colors.black),
                                          )),
                                          Text(
                                            date,
                                            style: TextStyle(
                                                color: Colors.black26),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 20, left: 60, right: 60),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black38,
                              spreadRadius: 0,
                              blurRadius: 10),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: BottomNavigationBar(
                          currentIndex: 0,
                          selectedItemColor: Colors.black54,
                          unselectedItemColor: Colors.black45,
                          showSelectedLabels: false,
                          showUnselectedLabels: false,
                          // type: BottomNavigationBarType.shifting,
                          items: [
                            BottomNavigationBarItem(
                              icon: Icon(
                                Icons.home,
                                color: Colors.black54,
                              ),
                              label: "Home",
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(
                                Icons.comment,
                                color: Colors.black54,
                              ),
                              label: "Queries",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.only(left: 40, bottom: 30),
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          onPressed: () {},
          // elevation: 0,
          backgroundColor: Colors.black,
          foregroundColor: Colors.black,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
