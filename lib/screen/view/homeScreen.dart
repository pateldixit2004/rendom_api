import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rendom_api/screen/provider/rendomprovider.dart';

import '../modal/rendomModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RandomProvider? prividerF;
  RandomProvider? prividerT;

  @override
  void initState() {
    super.initState();
    Provider.of<RandomProvider>(context, listen: false).randomGet();
  }

  @override
  Widget build(BuildContext context) {
    prividerF = Provider.of<RandomProvider>(context, listen: false);
    prividerT = Provider.of<RandomProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Refresh Api"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              child: Column(
                children: [
                  // CachedNetworkImage(
                  //     imageUrl:
                  //         '${prividerF!.randomModel!.results![0].picture!.large}',
                  //   imageBuilder: (context, imageProvider) => Container(
                  //     height: 200,
                  //     width: 400,
                  //     decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //         image: imageProvider
                  //       )
                  //     ),
                  //
                  //   ),
                  //   placeholder: (context, url) => Container(
                  //     height: 200,
                  //     width: 200,
                  //     color: Colors.red,
                  //     child: CircularProgressIndicator(),
                  //   ),
                  //   errorWidget: (context, url, error) => Text('$error'),
                  // )
                ],
              ),
            ),
            // CachedNetworkImage(
            //   // placeholder: (context, url) => const CircularProgressIndicator(),
            //   imageUrl: '${prividerF!.randomModel!.results![0].picture!.large}',
            // ),

            ClipRRect(
              child: CachedNetworkImage(imageUrl: '${prividerF!.randomModel!.results![0].picture!.large}',
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: Image.asset('assets/image/img.png',),
                )

              ),
            ),
            Row(
              children: [
                // child: Image.network('${prividerF!.randomModel!.results![0].picture!.large}',height: 100,width: 100,fit: BoxFit.fill,),
              ],
            ),
            Text("${prividerF!.randomModel!.info!.seed}"),
            tile(
                da: 'id',
                ti: '${prividerF!.randomModel!.results![0].id!.name}'),
            tile(
                da: 'Address',
                ti: '${prividerF!.randomModel!.results![0].location!.country}-${prividerF!.randomModel!.results![0].location!.city}-${prividerF!.randomModel!.results![0].location!.street!.number}'),
            tile(
                da: 'Age',
                ti: ' ${prividerF!.randomModel!.results![0].dob!.age}'),
            tile(
                da: 'Mobile No',
                ti: '${prividerF!.randomModel!.results![0].phone}'),
            tile(
                da: 'Email',
                ti: '${prividerF!.randomModel!.results![0].email}'),
            // tile(),
            // tile(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            prividerF!.randomGet();
          },
          child: Icon(Icons.refresh_rounded),
        ),
      ),
    );
  }

  Widget tile({String? da, String? ti}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$da",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text("$ti"),
        ],
      ),
    );
  }
}
