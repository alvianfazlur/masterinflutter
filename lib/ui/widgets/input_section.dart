import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:flutter/material.dart';

class InputSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Full Name"),
                SizedBox(
                  height: 6,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Masukkan Nama Lengkap",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(defaultRadius)
                      ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                      borderSide: BorderSide(
                        color: primaryColor
                      )
                    )
                  ),
                ),
                SizedBox(height: 20,),
                Text("Email Address"),
                SizedBox(
                  height: 6,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Masukkan Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(defaultRadius)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(defaultRadius),
                          borderSide: BorderSide(
                              color: primaryColor
                          )
                      )
                  ),
                ),
                SizedBox(height: 20,),
                Text("Password"),
                SizedBox(
                  height: 6,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Masukkan Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(defaultRadius)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(defaultRadius),
                          borderSide: BorderSide(
                              color: primaryColor
                          )
                      )
                  ),
                ),
                SizedBox(height: 20,),
                Text("Hobby"),
                SizedBox(
                  height: 6,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Hobby",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(defaultRadius)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(defaultRadius),
                          borderSide: BorderSide(
                              color: primaryColor
                          )
                      )
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  width: double.infinity,
                  height: 55,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(defaultRadius))),
                    onPressed: () {},
                    child: Text(
                      'Get Started',
                      style: whiteTextStyle.copyWith(
                          fontWeight: medium, fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
