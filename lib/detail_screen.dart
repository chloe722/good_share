import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String store;
  final String remainNumber;
  final String countDown;
  final String logo;


  DetailScreen({this.store, this.remainNumber, this.countDown, this.logo});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image(
                        image: NetworkImage('https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                        child: Text('${widget.remainNumber} left ', style: TextStyle(color: Colors.red[300],fontSize: 20.0)),
                      )
                    ],
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.21,
                    right: MediaQuery.of(context).size.width * 0.1,
                    child: Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(fit: BoxFit.cover,
                              image: AssetImage(widget.logo))
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer non enim fringilla, sagittis ipsum sit amet, blandit velit. Vivamus quis arcu dictum leo accumsan feugiat. Maecenas sagittis egestas purus. Mauris cursus laoreet pellentesque. Mauris a tincidunt urna, in luctus diam. Duis finibus eros quis tristique blandit. Cras vel mi auctor, rutrum metus ut, volutpat arcu. Nam convallis aliquet nisi, vitae pulvinar enim semper in. Quisque porta urna at dui dapibus, id vehicula odio viverra. Donec cursus tempor blandit.\n Nam dui nulla, vulputate id congue ac, hendrerit a nisi. Praesent feugiat quis eros vitae convallis.\n Nam tincidunt mauris sodales nulla viverra sodales. Quisque ac nisi dignissim, congue magna vitae, dapibus neque. Nunc elementum sapien vitae arcu pulvinar tincidunt.')),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer non enim fringilla, sagittis ipsum sit amet, blandit velit. Vivamus quis arcu dictum leo accumsan feugiat. Maecenas sagittis egestas purus. Mauris cursus laoreet pellentesque. Mauris a tincidunt urna, in luctus diam. Duis finibus eros quis tristique blandit. Cras vel mi auctor, rutrum metus ut, volutpat arcu. Nam convallis aliquet nisi, vitae pulvinar enim semper in. Quisque porta urna at dui dapibus, id vehicula odio viverra. Donec cursus tempor blandit.\n Nam dui nulla, vulputate id congue ac, hendrerit a nisi. Praesent feugiat quis eros vitae convallis.\n Nam tincidunt mauris sodales nulla viverra sodales. Quisque ac nisi dignissim, congue magna vitae, dapibus neque. Nunc elementum sapien vitae arcu pulvinar tincidunt.')),
                  ],
                ),
              ),

              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: RaisedButton(
                      splashColor: Colors.white,
                      color: Colors.green[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: (){
                        //TODO go to purchase page
                      },
                      child: Text('Purchase', style: TextStyle(
                        color: Colors.white
                      ),),
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
