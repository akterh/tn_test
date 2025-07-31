import 'package:flutter/foundation.dart';

const bool isDev = true;
const bool isAutoFillUpTextField = isDev && kDebugMode;
const bool isAutoFillUpToken = isDev && kDebugMode;

String firstName = isAutoFillUpTextField == true ? 'Salman' : '';
String lastName = isAutoFillUpTextField == true ? 'Ahmed' : '';
String email = isAutoFillUpTextField == true ? 'salman@infodigita.com' : '';
String password = isAutoFillUpTextField == true ? '!1Password' : '';
String otp = isAutoFillUpTextField == true ? '111222' : '';
String username = isAutoFillUpTextField == true ? 'username' : '';
String dob = isAutoFillUpTextField == true ? '2004-11-03' : '';

class Dev {
  static const String accessToken = isAutoFillUpToken
      ? 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3NoaW5lLmRpbm5vdmEuY2gvYXBpL3YyL2F1dGgvcmVnaXN0ZXIiLCJpYXQiOjE3NDE1MDY4MDIsImV4cCI6MTc0MjgwMjgwMiwibmJmIjoxNzQxNTA2ODAyLCJqdGkiOiIxUUpnR2t4T25wUlA1Y3lRIiwic3ViIjoiMTU1IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyIsImlkIjoxNTUsImZ1bGxfbmFtZSI6Ik1kLiBTYWxtYW4gQWhtZWQiLCJzZXR0aW5nc19sYW5ndWFnZSI6ImVuIn0.GW8Wcr5KxX-ziwpPGjohEvfjj1DfR3rD0GD-Uz3GIys'
      : '';

  static final banners = <String>[
    'https://cdn.pixabay.com/photo/2016/03/19/09/42/vintage-1266412_1280.jpg',
    'https://cdn.pixabay.com/photo/2016/09/01/19/53/pocket-watch-1637396_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/06/03/19/19/banner-2369464_1280.jpg',
    'https://cdn.pixabay.com/photo/2015/12/08/08/40/banner-1082646_1280.jpg',
    'https://cdn.pixabay.com/photo/2016/03/27/18/52/flower-1283602_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/10/03/17/53/nature-2813487_1280.jpg',
    'https://cdn.pixabay.com/photo/2022/04/30/19/12/cooking-banner-7166200_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/03/14/16/38/banner-2143659_1280.jpg',
  ];

  static final products = <String>[
    'https://cdn.pixabay.com/photo/2023/10/10/06/41/perfume-8305508_1280.jpg',
    'https://cdn.pixabay.com/photo/2021/08/03/06/47/perfume-6518634_1280.jpg',
    'https://i.pinimg.com/736x/52/30/84/523084487f205c9ed8ad54ec4940afe7.jpg',
    'https://i.pinimg.com/736x/21/52/30/2152300b04eeb18cf3b4c3ca43e64b22.jpg',
    'https://i.pinimg.com/736x/89/42/2f/89422f267f863a2bb710e0ca840a471c.jpg',
    'https://cdn.pixabay.com/photo/2022/09/23/15/33/banana-7474703_1280.jpg',
    'https://i.pinimg.com/736x/25/c1/68/25c16849c02ff022bc2a5b2e473e8819.jpg',
    'https://i.pinimg.com/736x/2f/3c/5e/2f3c5e51e7a38752450b5b1df6ef2564.jpg',
    'https://i.pinimg.com/736x/1a/ea/2e/1aea2ecbf8f68c6694619c0d39415ce1.jpg',
    'https://i.pinimg.com/736x/3a/8f/b7/3a8fb74b01f0171fec89589a667ae5ed.jpg',
    'https://i.pinimg.com/736x/bc/e2/94/bce29443374a8f5746b5048fb7276fbb.jpg',
    'https://i.pinimg.com/736x/48/4a/a8/484aa8cb5a31d3dd22dbff22f2cc973e.jpg',
    'https://i.pinimg.com/736x/f0/51/32/f05132784fa139ac46d34476daad5b53.jpg',
  ];

  static final users = <String>[
    'https://cdn.pixabay.com/photo/2014/04/12/14/59/portrait-322470_1280.jpg',
    'https://cdn.pixabay.com/photo/2015/01/06/16/14/woman-590490_1280.jpg',
    'https://cdn.pixabay.com/photo/2016/01/25/19/48/man-1161337_1280.jpg',
    'https://i.pinimg.com/736x/9f/ba/fb/9fbafbd9ffd07f935fecdf37ccf8850c.jpg',
    'https://i.pinimg.com/736x/28/12/40/2812401f633c9505a751e205ac805e77.jpg',
    'https://i.pinimg.com/736x/76/7c/dc/767cdcf5baa9dcadfc3e574794a74051.jpg',
    'https://i.pinimg.com/736x/76/99/41/7699410b89a40f14844d5c1a4c0e22d2.jpg',
    'https://i.pinimg.com/736x/07/2c/06/072c06cfc34b20f3358cce892a4d73b9.jpg',
  ];
}
