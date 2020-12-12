import 'package:flutter/material.dart';
import 'package:todo/r.dart';

class ProfilePage extends StatelessWidget {
  final List<String> imgs = [
    R.assetsImagesGetx1,
    R.assetsImagesGetx2,
    R.assetsImagesGetx3,
    R.assetsImagesGetx4
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              R.assetsImagesProfile,
              fit: BoxFit.cover,
              width: size.width,
              height: size.height,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 16,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                margin: EdgeInsets.all(0),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 4,
                child: Container(
                  height: size.height * 0.45,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 12,
                              ),
                              child: Center(
                                child: Text(
                                  "ANDROID",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 12,
                              ),
                              child: Center(
                                child: Text(
                                  "WEB",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 12,
                              ),
                              child: Center(
                                child: Text(
                                  "FLUTTER",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Asi",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Programmer",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "I am a developer Advocate for material-components at hangzhou",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "GetX",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: 160,
                          child: ListView.builder(
                              padding: EdgeInsets.all(8),
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: imgs.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    height: 160,
                                    width: 110,
                                    margin: EdgeInsets.symmetric(horizontal: 4),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(imgs[index]),
                                        )));
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
