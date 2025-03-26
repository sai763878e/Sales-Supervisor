
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';

class AIChatWidget extends StatelessWidget{

  AIChatWidget({super.key, this.message = ""});

    String message;

  @override
  Widget build(BuildContext context) {
    return Container(height:double.infinity,child: AnimatedTextKit(isRepeatingAnimation: false,animatedTexts: [TypewriterAnimatedText(message)]));
  }

}