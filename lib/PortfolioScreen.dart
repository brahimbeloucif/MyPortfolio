import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rive/rive.dart';

import 'glassButton.dart';
import 'portfolioContent.dart';
import 'portfolioDrawer.dart';

class PortfolioScreen extends StatefulWidget {
  @override
  PortfolioScreenState createState() => PortfolioScreenState();
}

// Include PortfolioScreenState class here or in a separate file if it's very large.
class PortfolioScreenState extends State<PortfolioScreen> {
GlobalKey projectsKey = GlobalKey();
  GlobalKey certificatesKey = GlobalKey();
  GlobalKey contactMeKey = GlobalKey();
  ScrollController scrollController = ScrollController();
  bool isGlowing = false;
  late Timer _timer;
  bool showTopButton = false; // To control visibility of the top button

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      setState(() {
        isGlowing = !isGlowing;
      });
    });

    scrollController.addListener(() {
      if (scrollController.offset > 500) {
        if (!showTopButton) {
          setState(() {
            showTopButton = true;
          });
        }
      } else {
        if (showTopButton) {
          setState(() {
            showTopButton = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    scrollController.dispose(); // Dispose the controller
    super.dispose();
  }

  bool isDarkMode = false; // State to track theme status

  void toggleTheme(bool isOn) {
    setState(() {
      isDarkMode = isOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true, // This ensures the body extends behind the AppBar
          appBar: AppBar(
            title: ClipRect(child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50,sigmaY: 50),)),
              backgroundColor: isDarkMode ? Colors.black.withOpacity(0.96) : Colors.white.withOpacity(0.9),// Make the AppBar transparent
            elevation: 0, // Remove shadow
            
          ),

               drawer: PortfolioDrawer(
        onThemeChanged: toggleTheme, // Pass the callback to the drawer
      ),
          body: Stack(
            fit: StackFit.expand,
            children: [
                        RiveAnimation.asset(
              'assets/x.riv',
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0),
              child: Container(
                color: Colors.black.withOpacity(0),
              ),
            ),
 SingleChildScrollView(
              controller: scrollController,
              child: PortfolioContent(
                isGlowing: isGlowing,
                projectsKey: projectsKey,
                certificatesKey: certificatesKey,
                contactMeKey: contactMeKey,
         ) )

            ],
          ),
          floatingActionButton: showTopButton ? _buildFloatingGlassButton(context) : null,
          
       ),
      ),
    );
  }
  Widget _buildFloatingGlassButton(BuildContext context) {
    return GlassButton(
      onPressed: () {
        
        scrollController.animateTo(
          0,
          duration: Duration(seconds: 1),
          curve: Curves.easeOut,
        );
        
      },
      child: Icon(FontAwesomeIcons.arrowUp),
    );
  }
  void scrollToSection(GlobalKey key) {
  final context = key.currentContext;
  if (context != null) {
    Scrollable.ensureVisible(context,
        duration: Duration(seconds: 1), curve: Curves.easeInOut);
  }
}

}
