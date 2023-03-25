import 'package:flutter/material.dart';
import 'package:quiz_tpm/Data/game_store.dart';
import 'package:quiz_tpm/Pages/halaman_detail.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Halaman Utama'),
            backgroundColor: Colors.black,
          ),
          body: GridView.count(
              crossAxisCount: 2,
              children:
                List.generate(gameList.length, (index){
                  final GameStore game = gameList[index];
                  return Container(
                    padding: EdgeInsets.all(5),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HalamanDetail(game: game)
                            )
                        );
                      },
                      child: Column(
                        children: [
                          Image.network(
                            game.imageUrls[0],
                            height: 230,
                            fit: BoxFit.fill,
                          ),
                          Container(
                            color: Colors.black,
                            width: MediaQuery.of(context).size.width,
                            height: 79,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(game.name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18
                                    ),
                                  ),
                                ),
                                Text(game.price,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })
          ),
        ),
    );
  }
}
