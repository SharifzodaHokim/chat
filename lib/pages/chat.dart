import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  bool a = true;
  List cnt = [];
  TextEditingController controller = TextEditingController();
  int s = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(23),
              height: 100,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black, width: 1)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Row(children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundImage: AssetImage(
                          "images/Ellipse 11.png",
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [
                          Text(
                            "Hokim",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Online",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                    ]),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone_outlined,
                        size: 23,
                        color: Color(0xff25D366),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.videocam_outlined,
                        size: 23,
                        color: Color(0xff25D366),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.stacked_bar_chart,
                        size: 23,
                        color: Color(0xff25D366),
                      )
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/image 1.png"),fit: BoxFit.cover),
                  ),
                  height: 620,
                  child: ListView.builder(
                      itemCount: cnt.length,
                      itemBuilder: (context, index) {
                        return Slidable(
                        child:   Row(
                               mainAxisAlignment: MainAxisAlignment.end,                                      
                          children: [
                            Container(
                                  margin: EdgeInsets.only( bottom: 15),
                                  width: 200,
                                  height: 40,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    cnt[index],
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color(0xff25D366),
                                  ),
                                ),
                          ],
                        ),
                          startActionPane: ActionPane(
                            motion: StretchMotion(),
                          
                          children: [
                          SlidableAction(
                            onPressed: (context) {
                              setState(() {
                            cnt.removeAt(index);
                              });
                            },
                          borderRadius: BorderRadius.circular(50),
                              backgroundColor: Color(0xFFFE4A49),
                                          foregroundColor: Colors.white,
                                          icon: Icons.delete,
                                          label: 'Delete',
                    
                          )
                          ]
                          ), 
                                                
                        );
                        
                      }),
                ),
              ],
            ),
            Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/image 1.png"),fit: BoxFit.cover),
                ),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            s++;
                          });
                          setState(() {
                            cnt.add(controller.text);
                          });
                          setState(() {
                            controller.clear();
                          });
                          setState(() {
                            if (s == 1) {
                              s = 0;
                            }
                          });
                        },
                        icon: Icon(
                          Icons.send,
                          size: 30,
                          color: Colors.blue,
                        )),
                    hintText: "massege",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
