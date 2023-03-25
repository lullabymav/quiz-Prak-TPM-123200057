import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_tpm/Data/game_store.dart';
import 'package:url_launcher/url_launcher.dart';

class HalamanDetail extends StatefulWidget {
  final GameStore game;
  const HalamanDetail({Key? key, required this.game}) : super(key: key);

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  bool isLove = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.game.name),
            backgroundColor: Colors.black,
            actions: [
              IconButton(
                  onPressed: (){
                    isLove = true;
                  },
                  icon: new Icon(
                    Icons.favorite,
                    color: Colors.white,))
            ],
          ),
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/3,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index){
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.network(widget.game.imageUrls[index]),
                        ),
                      );
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,0,6),
                      child: Text("About",
                        style: TextStyle(
                            fontSize: 20,
                        ),
                      ),
                    ),
                    Text(widget.game.about,
                      textAlign: TextAlign.justify,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical : 6.0),
                                child: Text(widget.game.name,
                                  style: TextStyle(
                                    fontSize: 24
                                  ),),
                              ),
                              Text('Release Date : ${widget.game.releaseDate}'),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4.0),
                                child: Text('Tags : \n ${widget.game.tags}',
                                  textAlign: TextAlign.center
                                ),
                              ),
                              Text('Reviews : \n ${widget.game.reviewAverage} of ${widget.game.reviewCount}',
                                textAlign: TextAlign.center
                              ),
                            ],
                          ),
                          Text(widget.game.price,
                            style: TextStyle(
                                fontSize: 24
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: (){
                      _launchURL(widget.game.imageUrls);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    child: Text("Buy")
                ),
              )
            ],
          ),
        ),
    );
  }
}

_launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
