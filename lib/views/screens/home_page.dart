import 'package:final_gallery_app/Controller/Helper/api_helper.dart';
import 'package:final_gallery_app/Model/imageModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controller/Provider/theme_Provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<ImageModel>?> _status = Image_api.image_api.feach_Data("popular");
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        title: Text("Gallery App",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 30,letterSpacing: 2),),
        centerTitle: true,
        // backgroundColor: Colors.lightBlue.shade100,
        actions: [
          IconButton(
            icon: Icon(
              Icons.light_mode_outlined,
            ),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).chnageTheme();
            },
          ),
        ],

      ),
      
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onSubmitted: (val){
                  setState(() {
                    _status = Image_api.image_api.feach_Data(val);
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Search"),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: FutureBuilder(
              future: _status,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("ERROR : ${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  List<ImageModel>? Data = snapshot.data?.cast<ImageModel>();
                  return GridView.builder(
                    itemCount: Data?.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Image.network(
                              '${Data?[i].largeImageURL}',
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      });
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
