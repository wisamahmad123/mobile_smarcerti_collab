import 'package:flutter/material.dart';

class UploadPelatihanBody extends StatelessWidget {
  const UploadPelatihanBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: Text(
                "Nama Pelatihan",
                style: TextStyle(color: Color(0xFF375E97), fontSize: 17),
              )),
              TextField(
                obscureText: false,
                autocorrect: false,
                showCursor: true,
                cursorColor: Color(0xFF375E97),

                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.number,
                // textCapitalization: TextCapitalization.words,

                style: TextStyle(color: Color(0xFF375E97), fontSize: 17),

                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFFACACAC),
                  )),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFFACACAC),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: Text(
                "Nama Vendor",
                style: TextStyle(color: Color(0xFF375E97), fontSize: 17),
              )),
              TextField(
                obscureText: false,
                autocorrect: false,
                showCursor: true,
                cursorColor: Color(0xFF375E97),

                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.text,
                // textCapitalization: TextCapitalization.words,

                style: TextStyle(color: Color(0xFF375E97), fontSize: 17),

                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFFACACAC),
                  )),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFFACACAC),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: Text(
                "Waktu",
                style: TextStyle(color: Color(0xFF375E97), fontSize: 17),
              )),
              TextField(
                obscureText: false,
                autocorrect: false,
                showCursor: true,
                cursorColor: Color(0xFF375E97),

                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.datetime,
                // textCapitalization: TextCapitalization.words,

                style: TextStyle(color: Color(0xFF375E97), fontSize: 17),

                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFFACACAC),
                  )),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFFACACAC),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: Text(
                "Lokasi",
                style: TextStyle(color: Color(0xFF375E97), fontSize: 17),
              )),
              TextField(
                obscureText: false,
                autocorrect: false,
                showCursor: true,
                cursorColor: Color(0xFF375E97),

                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.text,
                // textCapitalization: TextCapitalization.words,

                style: TextStyle(color: Color(0xFF375E97), fontSize: 17),

                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFFACACAC),
                  )),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFFACACAC),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: Text(
                "Biaya",
                style: TextStyle(color: Color(0xFF375E97), fontSize: 17),
              )),
              TextField(
                obscureText: false,
                autocorrect: false,
                showCursor: true,
                cursorColor: Color(0xFF375E97),

                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.number,
                // textCapitalization: TextCapitalization.words,

                style: TextStyle(color: Color(0xFF375E97), fontSize: 17),

                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFFACACAC),
                  )),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFFACACAC),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: Text(
                "level Pelatihan",
                style: TextStyle(color: Color(0xFF375E97), fontSize: 17),
              )),
              TextField(
                obscureText: false,
                autocorrect: false,
                showCursor: true,
                cursorColor: Color(0xFF375E97),

                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.text,
                // textCapitalization: TextCapitalization.words,

                style: TextStyle(color: Color(0xFF375E97), fontSize: 17),

                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFFACACAC),
                  )),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFFACACAC),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: Text(
                "Jenis Bidang",
                style: TextStyle(color: Color(0xFF375E97), fontSize: 17),
              )),
              TextField(
                obscureText: false,
                autocorrect: false,
                showCursor: true,
                cursorColor: Color(0xFF375E97),

                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.text,
                // textCapitalization: TextCapitalization.words,

                style: TextStyle(color: Color(0xFF375E97), fontSize: 17),

                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFFACACAC),
                  )),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFFACACAC),
                  )),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Pilih File",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(350, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Color(0xFFEF5428)),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        height: 525,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "Cancel",
              style: TextStyle(
                  color: Color(0xFFEF5428),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            style: OutlinedButton.styleFrom(
                side: BorderSide(color: Color(0xFFEF5428)),
                minimumSize: Size(120, 50),
                maximumSize: Size(120, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Save",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            style: ElevatedButton.styleFrom(
                minimumSize: Size(120, 50),
                maximumSize: Size(120, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                backgroundColor: Color(0xFFEF5428)),
          )
        ],
      )
    ]);
  }
}
