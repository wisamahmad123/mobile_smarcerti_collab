import 'package:flutter/material.dart';

class UploadBuktiPelatihanBody extends StatelessWidget {
  const UploadBuktiPelatihanBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              child: Text(
            "No Sertifikat",
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
            "Tanggal",
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
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Pilih File",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
        ],
      ),
    );
  }
}
