import 'package:android_intent_plus/android_intent.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'contact.dart';
import 'glassButton.dart';

var subStyle = TextStyle(
  fontFamily: 'SFR',
  fontSize: 18
);
var titlStyle = TextStyle(
  fontFamily: 'SFR',
  fontSize: 34,
  fontWeight: FontWeight.w900
);
var content = TextStyle(
  fontFamily: 'SFR',
  fontSize: 18,
  fontWeight: FontWeight.w400
);

// ignore: must_be_immutable
class PortfolioContent extends StatelessWidget {

  List<Map<String, String>> projects = [
  {
    'title': 'Tic Tac Toe',
    'imageUrl': 'assets/xo.png',
    'link': '',
  },
  {
    'title': 'Weather App',
    'imageUrl': 'assets/wapp.png',
    'link': '',
  },
  {
    'title': 'Login UI',
    'imageUrl': 'assets/login.png',
    'link': '',
  },
  {
    'title': 'News App',
    'imageUrl': 'assets/news.png',
    'link': '',
  },

];
  List<Map<String, String>> Certificates= [
  {
    'title': 'Google Marketing',
    'imageUrl': 'assets/diplomes/googleMarketing.jpg',
    'link': 'https://drive.google.com/u/0/uc?id=1NxYehZtPf5Y3yw3Z1Hbjr4pkh_2ZvZCT&export=download',
  },
  {
    'title': 'Google GADS',
    'imageUrl': 'assets/diplomes/GADS.jpg',
    'link': 'https://drive.google.com/file/d/1_9NJbR2ePBvP7eTXMewsgRjs5l51OJqB/view?usp=drive_link',
  },
  {
    'title': 'Html With Coder Shyar Academy',
    'imageUrl': 'assets/diplomes/coderShyar.jpg',
    'link': 'https://drive.google.com/file/d/1HIRjISVN-z2xShhtjUoimIt_MkUdoGtg/view?usp=sharing',
  },
 
  {
    'title': 'Exel by Udemy',
    'imageUrl': 'assets/diplomes/UdemyExel.jpg',
    'link': 'https://drive.google.com/file/d/1347eVbaSF4U4Ci1FQrGSbOh1sp3-238a/view?usp=sharing',
  },
  {
    'title': 'Html By ma3aref',
    'imageUrl': 'assets/diplomes/maaref.jpg',
    'link': 'https://drive.google.com/file/d/1HyWfTfeK0-O2bKhI_7hxE6bImitjSe4F/view?usp=drive_link',
  },
  
];


  final bool isGlowing;

  PortfolioContent({
    Key? key,
    required this.isGlowing,
    required this.projectsKey,
    required this.certificatesKey,
    required this.contactMeKey,
  }) : super(key: key);
  
GlobalKey projectsKey = GlobalKey();
GlobalKey certificatesKey = GlobalKey();
GlobalKey contactMeKey = GlobalKey();



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:80.0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: isGlowing
                    ? [
                        BoxShadow(
                          color: Colors.transparent,
                          spreadRadius: 15,
                          blurRadius: 30,
                        ),
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.7),
                          spreadRadius: 15,
                          blurRadius: 30,
                        ),
                      ]
                    : [],
               
              ),
              child: Center(
                child: CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage('assets/profile_picture.jpg'),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),


         AnimatedTextKit(
              animatedTexts: [
                
                TypewriterAnimatedText('BRAHIM BELOUCIF',textStyle: titlStyle,speed: Duration(milliseconds:100 )),
                TypewriterAnimatedText('Android', cursor: '|',textStyle: TextStyle(color: Colors.red,
                fontFamily: 'SFR',
                fontSize: 29,
                )
                ),
                
                TypewriterAnimatedText('Flutter Apps',
                    cursor: '<|>',textStyle: TextStyle(color:  Colors.blue,
                fontFamily: 'SFR',
                fontSize: 29,
                fontWeight: FontWeight.w400
                )),
                TypewriterAnimatedText('and Coffe',
                    cursor: '☕',
                    textStyle: TextStyle(
                fontFamily: 'SFR',
                fontSize: 29,
                )),
                TypewriterAnimatedText('BRAHIM BELOUCIF',textStyle: titlStyle, cursor: '</>'),
              ],
              
            ),
         
          SizedBox(height: 16),
          Container(
child: 
Text(
  '''
 Hi , Im Brahim Beloucif, computer science student at Mohammed Khider University, Biskra.
Passionate about technology and innovation, I have a keen interest in Android development. 
As a beginner in this field,I'am eager to expand my skills and knowledge. 
My academic background in computer science has provided me with a solid foundation, and I am committed to leveraging
this to excel in Android development. I am enthusiastic about opportunities where I can contribute and further
develop my technical abilities.
  ''',style:content ,)
          ),
         SizedBox(height: 16),
         GlassButton(
          child: Text('Download CV',style: subStyle,),
  
  onPressed: () {
 _downloadCV();
 },

         ),
Text('',
            key: projectsKey,

          ),
          SizedBox(height: 40),
          Text(
                   
            'Projects',
            style: titlStyle
          ),
          SizedBox(height:12),
          
          Container(
            // key: projectsKey,
            height: 160, // Adjust the height as needed
            child: ListView.builder(
                  padding: EdgeInsets.zero,

              scrollDirection: Axis.horizontal,
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
         switch (index) {
           case 0:
             openApp('project');
             break;
           case 1:
             openApp('weather_app');
             break;
           case 2:
             openApp('firebase_auth');
             break;
           case 3:
             openApp('news_cloud');
            
             
             break;

           default:
         }

                  },
                  
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              projects[index]['imageUrl']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 12,),
                        Text(projects[index]['title']!,style: subStyle,),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Add your project content here
          Text('',
                                  key: certificatesKey,

          ),
          SizedBox(height: 100),
          Text(

            'Certificates',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
                    SizedBox(height: 16),

          
                    Container(
            height: 300, // Adjust the height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                {
                       var url = Certificates[index]['link'];
              launchUrl(
                Uri.parse(url!),
                mode: LaunchMode.inAppBrowserView,
              );
                 }

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              Certificates[index]['imageUrl']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                                     SizedBox(height: 12),

                        Text(Certificates[index]['title']!,style: subStyle,),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // SizedBox(height: 24),
          // Text(
          //   'Contact Me',
          //   style: TextStyle(
          //     fontSize: 20,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          //
         SizedBox(height: 120),
         
          Text(
            'Contact Me',
            style: titlStyle
          ),
          
          
          Container(
            key :contactMeKey,
            child: ContactForm()), //
        ],
      ),
    );
  
  }

}

   void _downloadCV() async {
    const link = 'https://drive.google.com/file/d/1YOorCwH82JjFCtW_0yevuBkMh_Zl5zz2/view?usp=sharing';
              launchUrl(
                Uri.parse(link),
                mode: LaunchMode.inAppBrowserView,
              );
}    Future<void> openApp(String packageName) async {
    final intent = AndroidIntent(
      action: 'action_view',
      package: 'com.example.$packageName',
      componentName: 'com.example.$packageName.MainActivity',
    );
    await intent.launch();
  }