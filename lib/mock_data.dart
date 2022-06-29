import 'dart:math' as math;

import 'package:flutter/material.dart';

const String mockText =
    '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec interdum, dolor eu mollis blandit, justo felis tincidunt felis, nec ullamcorper enim libero quis dui. Nullam pellentesque ligula vel velit rhoncus rutrum. Nulla malesuada ipsum lobortis pellentesque suscipit. Duis bibendum tortor quis turpis varius, eget lacinia nisi facilisis. Donec et est lorem. Sed maximus vel mi at auctor. Phasellus in massa commodo, pulvinar ex nec, viverra turpis. Nulla in venenatis metus, egestas varius odio. Nullam maximus ligula pellentesque, porttitor urna et, ullamcorper leo. Ut vitae cursus nisi. Ut sollicitudin augue justo, a tempor nulla suscipit in. Etiam auctor porttitor enim, blandit rutrum neque molestie ac. Vestibulum ornare feugiat orci a sollicitudin. Nam rutrum enim imperdiet, porttitor magna eget, venenatis felis. Duis tellus sem, viverra vel turpis nec, tristique luctus risus. Ut lacinia felis a ipsum tincidunt, condimentum mattis leo maximus. Fusce laoreet velit et luctus vestibulum. Donec sit amet feugiat turpis. Donec nisl erat, sollicitudin eget luctus at, commodo condimentum sem. Mauris eget enim neque. Integer quis leo at sapien venenatis hendrerit. Integer dolor quam, sollicitudin vitae tristique quis, eleifend a neque. Curabitur rutrum nulla id dignissim aliquet. Morbi gravida libero non tellus dapibus sollicitudin. Integer ac neque velit. Praesent diam nunc, interdum sed lacinia eu, congue quis orci.''';

class MockData {
  MockData._();

  static Image get ranImage => Image.network('https://picsum.photos/${[
        500,
        700,
        1000
      ].elementAt(math.Random().nextInt(2))}/${[
        500,
        700,
        1000
      ].elementAt(math.Random().nextInt(2))}');

  static const String title = 'Lorem Ipsum';

  static String get shortText => mockText.split('.').first;

  static String get midText => mockText.split('.').sublist(0, 2).join('.');

  static String get longText =>
      '${mockText.split('.').sublist(0, 3).join('.')}\n\n${mockText.split('.').sublist(3, 5).join('.').trim()}';
}
