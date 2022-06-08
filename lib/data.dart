

import 'product.dart';

class AppData {
  static List<Product> medicine = [
    Product(
        id:1,
        name: 'Gummy',
        price: "240.0",
        isSelected: true,
        isliked: false,
        image:  "assets/PNG-images-Medications-19png.png",
        category: "Vitamin Pills"),
    Product(
        id:2,
        name: 'Natrol',
        price: "220.0",
        isliked: false,
        isSelected: true,
        image: 'assets/PNG-images-Medications-21png.png',
        category: "Stress & Anixety"),
    Product(
        id:1,
        name: ' Fast & Up',
        price: "200.0",
        isSelected: true,
        isliked: false,
        image: 'assets/PNG-images-Medications-20png.png',
        category: "Stress Relief"),

  ];
  static List<Product> fistAids = [
    Product(
        id:1,
        name: 'AMS Pharmecy',
        price: "1200",
        isSelected: true,
        isliked: false,
        image:  'assets/pharmecy.jpg',
        category: "Delhi"),
    Product(
        id:2,
        name: 'A.I.S Pharma',
        price: "2000",
        isliked: false,
        isSelected: true,
        image: 'assets/pharmecy1.jpg',
        category: "Noida"),
    Product(
        id:1,
        name: 'Sanjavini Pharma',
        price: "1000",
        isSelected: true,
        isliked: false,
        image: 'assets/pharmecy2.jpg',
        category: "Chennai"),


  ];
  static List<Product> emergency = [
    Product(
        id:1,
        name: 'APK Hospital',
        price: "1300",
        isSelected: true,
        isliked: false,
        image:  'assets/hospital11.jpg',
        category: "Delhi"),
    Product(
        id:2,
        name: 'AsK Hospital',
        price: "1290",
        isliked: false,
        isSelected: true,
        image: 'assets/hospital12.jpg',
        category: "Chennai"),
    Product(
        id:1,
        name: 'Sanjivni Hospital',
        price: "1100",
        isSelected: true,
        isliked: false,
        image: 'assets/hospital13.jpg',
        category: "Hedrabad"),


  ];

  static List<Product> findDoctor = [
    Product(
        id:1,
        name: 'Anikta Verma',
        price: "1100",
        isSelected: true,
        isliked: false,
        image:  'assets/Doctor12.png',
        category: "Nuro Surgen"),
    Product(
        id:2,
        name: 'Aisha Gupta',
        price: "1200",
        isliked: false,
        isSelected: true,
        image: 'assets/Doctor14.png',
        category: "Heart Surgen"),
    Product(
        id:1,
        name: 'Richa Denial',
        price: "1000",
        isSelected: true,
        isliked: false,
        image: 'assets/Doctor13.png',
        category: "Dentist"),

  ];

  static List<String> listOfLikes = [
    "240",
    "190",
    "200",
    "240",
    "190",
    "220 ",
    "240",
    "240",
    "190",
    "432",
    "190",
    "200",
    "190",






  ];
  static String description = "Clean lines, versatile and timeless—the people shoe returns with the Nike Air Max 90. Featuring the same iconic Waffle sole, stitched overlays and classic TPU accents you come to love, it lets you walk among the pantheon of Air. ßNothing as fly, nothing as comfortable, nothing as proven. The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU details. Classic colours celebrate your fresh look while Max Air cushioning adds comfort to the journey.";
}
