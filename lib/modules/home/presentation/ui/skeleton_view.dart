import 'package:flutter/material.dart';

class Skeleton extends StatefulWidget {
  final double height;
  final double width;

  Skeleton({Key? key, this.height = 20, required this.width}) : super(key: key);

  createState() => SkeletonState();
}

class SkeletonState extends State<Skeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation gradientPosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    gradientPosition = Tween<double>(
      begin: -3,
      end: 10,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    )..addListener(() {
        setState(() {});
      });

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        /// carousel
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 15, 5, 4),
          child: Container(
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment(gradientPosition.value, 0),
                    end: Alignment(-1, 0),
                    colors: [Colors.black12, Colors.black26, Colors.black12])),
          ),
        ),

        // index carousel
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 6.0,
            height: 6.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment(gradientPosition.value, 0),
                  end: Alignment(-1, 0),
                  colors: [Colors.black12, Colors.black26, Colors.black12]),
              shape: BoxShape.circle,
            ),
          ),
          Container(
            width: 6.0,
            height: 6.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment(gradientPosition.value, 0),
                  end: Alignment(-1, 0),
                  colors: [Colors.black12, Colors.black26, Colors.black12]),
              shape: BoxShape.circle,
            ),
          )
        ]),

        //list element
        Column(children: [
          ...List.generate(5, (index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 200,
                                height: 10,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment(
                                            gradientPosition.value, 0),
                                        end: const Alignment(-1, 0),
                                        colors: const [
                                      Colors.black12,
                                      Colors.black26,
                                      Colors.black12
                                    ])),
                              ),
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    gradient: LinearGradient(
                                        begin: Alignment(
                                            gradientPosition.value, 0),
                                        end: Alignment(-1, 0),
                                        colors: [
                                          Colors.black12,
                                          Colors.black26,
                                          Colors.black12
                                        ])),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 180,
                        child: ListView.builder(
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 140,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            gradient: LinearGradient(
                                                begin: Alignment(
                                                    gradientPosition.value, 0),
                                                end: const Alignment(-1, 0),
                                                colors: const [
                                                  Colors.black12,
                                                  Colors.black26,
                                                  Colors.black12
                                                ])),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 3),
                                        child: Container(
                                          width: 100,
                                          height: 10,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              gradient: LinearGradient(
                                                  begin: Alignment(
                                                      gradientPosition.value,
                                                      0),
                                                  end: const Alignment(-1, 0),
                                                  colors: const [
                                                    Colors.black12,
                                                    Colors.black26,
                                                    Colors.black12
                                                  ])),
                                        ),
                                      ),
                                      Container(
                                        width: 80,
                                        height: 10,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            gradient: LinearGradient(
                                                begin: Alignment(
                                                    gradientPosition.value, 0),
                                                end: const Alignment(-1, 0),
                                                colors: const [
                                                  Colors.black12,
                                                  Colors.black26,
                                                  Colors.black12
                                                ])),
                                      ),
                                    ]),
                              );
                            }),
                      )
                    ]));
          })
        ])
      ],
    );
  }
}
