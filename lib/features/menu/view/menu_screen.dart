import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:hotel_booking/styles/font_styles.dart';


class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool isSwitchOn = false;
  var currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    Color switchColor = isSwitchOn ? Colors.green : Colors.grey;
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 70,
              child: Row(
                children: [
                  SizedBox(width: 20,),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/kerek.jpg'),radius: 30,),
                  SizedBox(width: 20,),
                  Text('${FirebaseAuth.instance.currentUser!.email}', style: kFont18,),

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, bottom: 20,top: 15),
                child: Text('Account',style: kFont24CartBlack,)),
            Container(
              padding: EdgeInsets.only(left: 20,bottom: 15),
              child: SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white
                  ),
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Native Currency", style: kFont18,),
                        SvgPicture.asset('assets/icons/currency.svg',width: 24,height: 24,)

                      ],
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20,bottom: 15),
              child: SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white
                    ),
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Country", style: kFont18,),
                        SvgPicture.asset('assets/icons/kaz.svg',width: 24,height: 24,)
                      ],
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20,bottom: 15),
              child: SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white
                    ),
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Change password", style: kFont18,),
                        SvgPicture.asset('assets/icons/password.svg', height: 24,width: 24,)
                      ],
                    )),
              ),
            ),
            Container(
          padding: EdgeInsets.only(left: 20, bottom: 15),
          child: SizedBox(
            width: 350,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Notifications", style: kFont18),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: switchColor,
                    ),
                    child: CupertinoSwitch(
                      value: isSwitchOn,
                      onChanged: (bool value) {
                        setState(() {
                          isSwitchOn = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
            Container(
                padding:EdgeInsets.only(left: 20,bottom: 20),
                child: Text('General', style: kFont24CartBlack,)),
            Container(
              padding: EdgeInsets.only(left: 20,bottom: 15),
              child: SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white
                    ),
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Support", style: kFont18,),
                        SvgPicture.asset('assets/icons/support.svg',width: 24,height: 24,)
                      ],
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20,bottom: 15),
              child: SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white
                    ),
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Terms of service", style: kFont18,),
                        SvgPicture.asset('assets/icons/terms.svg',width: 24,height: 24,)
                      ],
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20,bottom: 15),
              child: SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white
                    ),
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Invite Friends", style: kFont18,),
                        SvgPicture.asset('assets/icons/invite.svg',width: 24,height: 24,)
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
