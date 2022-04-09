import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:form_validator_app/services/note.dart';

class NoteList extends StatefulWidget {
  NoteList({Key? key}) : super(key: key);

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  late List<Note> datas = [];
  List colorData = [
    {"color": Color(0xffff6968)},
    {"color": Color(0xff7a54ff)},
    {"color": Color(0xffff8f61)},
    {"color": Color(0xff2ac3ff)},
    {"color": Color(0xff5a65ff)},
    {"color": Color(0xff96da45)},
  ];

  final Helper helps = Helper();
  var deletes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'NOTES',
          style: TextStyle(
            letterSpacing: 2,
            color: Colors.blue,
            fontSize: 27,
          ),
        ),
        shadowColor: Colors.transparent,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              List<Note> data = await helps.getDatabase();
              setState(() {
                datas = data;
              });
            },
            icon: Icon(Icons.refresh_rounded),
            color: Colors.blue,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            scrollDirection: Axis.horizontal,
            reverse: true,
            itemCount: datas.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/show', arguments: {
                    'title': datas[index].title,
                    'subtitle': datas[index].subtitle,
                    'author': datas[index].author,
                    'text': datas[index].text,
                    'color': colorData[index],
                    'id': datas[index].id,
                    'delete': deletes,
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Card(
                    color: colorData[index]['color'],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Text(
                                datas[index].author,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 63, 14, 14),
                                  fontSize: 17,
                                ),
                              )),
                              IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      deletes = helps.deleteNote(
                                          datas[index], datas[index].id);
                                    });
                                  },
                                  icon: Icon(Icons.delete))
                            ],
                          ),
                          Expanded(
                            child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  datas[index].title,
                                  style: TextStyle(
                                    letterSpacing: 2,
                                    color: Colors.white,
                                    fontSize: 27,
                                  ),
                                )),
                          ),
                          Container(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                datas[index].subtitle,
                                style: TextStyle(
                                  letterSpacing: 2,
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
