import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'portfolioContent.dart';


class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _key = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key, 
      child: Column(
      children: [TextField(
          controller: _nameController,
          decoration: InputDecoration(labelText: 'Your Name'),
        ),
        SizedBox(height: 8),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(labelText: 'Your Email'),
        ),
        SizedBox(height: 8),
        TextField(
          controller: _messageController,
          decoration: InputDecoration(labelText: 'Your Message'),
          keyboardType: TextInputType.multiline,
          maxLines: null,
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            _key.currentState!.save();
            // Implement your logic to handle the form submission
            print('Name: ${_nameController.text}');
            print('Email: ${_emailController.text}');
            print('Message: ${_messageController.text}');
          },
                     

          child: Text('Send Message',style: subStyle),
        ),
          SizedBox(height: 12),

        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(FontAwesomeIcons.github,size: 35),
                onPressed: () => _launchURL('https://github.com/brahimbeloucif'),
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.whatsapp,size: 35),
                onPressed: () => _launchURL('https://wa.me/+213668377010'),
              ),
               
              IconButton(
                icon: Icon(FontAwesomeIcons.telegram,size: 35),
                onPressed: () => _launchURL('https://t.me/brahim_beloucif'),
              ),
               IconButton(
      icon: Icon(FontAwesomeIcons.linkedinIn, size: 35),
      onPressed: () => _launchURL('https://www.linkedin.com/in/brahim-beloucif-636257214?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app'),
    ),
                SizedBox(height: 20),
              // Add more icons as needed
            ],
          ),
        ],
    ));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }
  
  
}

 void _launchURL(String url) async {
    
     launchUrl(
                Uri.parse(url),
                mode: LaunchMode.inAppBrowserView,
              );
  }