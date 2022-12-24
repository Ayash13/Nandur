class Plant {
  final int plantId;
  late final int price;
  final String size;
  final double rating;

  final String category;
  final String plantName;
  final String imageURL;
  bool isFavorated;
  final String decription;
  bool isSelected;

  Plant(
      {required this.plantId,
      required this.price,
      required this.category,
      required this.plantName,
      required this.size,
      required this.rating,
      required this.imageURL,
      required this.isFavorated,
      required this.decription,
      required this.isSelected});

  //List of Plants data
  static List<Plant> plantList = [
    Plant(
        plantId: 0,
        price: 800000,
        category: 'Pupuk',
        plantName: 'Meroke Kalinitra',
        size: '25 kg',
        rating: 4.5,
        imageURL: 'assets/images/pkn.png',
        isFavorated: false,
        decription:
            'Pupuk berbentuk kristal putih bersih dengan Nitrogen (N) dan Kalium (K) larut air, menjadi pilihan yang sesuai untuk tanaman hortikultura secara luas. Bentuknya kristal,sehingga kelarutan di air sangat cepat.',
        isSelected: false),
    Plant(
        plantId: 1,
        price: 600000,
        category: 'Pupuk',
        plantName: 'Meroke Fitoflex',
        size: '25 kg',
        rating: 4.5,
        imageURL: 'assets/images/pmf.png',
        isFavorated: false,
        decription:
            'Cocok digunakan untuk berbagai tanaman hortikultura, seperti misalnya tanaman pangan, perkebunan, sayuran, buah – buahan, dll.',
        isSelected: false),
    Plant(
        plantId: 2,
        price: 7000,
        category: 'Benih',
        plantName: 'Tomat',
        size: '25 g',
        rating: 4.5,
        imageURL: 'assets/images/btomat.jpg',
        isFavorated: false,
        decription:
            'Dikemas dengan baik sehingga tidak tembus sinar matahari, benih tetap kering, dan bisa bertahan lebih. Benih sudah diuji coba kualitasnya dengan daya kecambah berkisar antara 85%-95%.',
        isSelected: false),
    Plant(
        plantId: 3,
        price: 7000,
        category: 'Benih',
        plantName: 'Cabai',
        size: '25 g',
        rating: 4.5,
        imageURL: 'assets/images/bcabai.jpg',
        isFavorated: false,
        decription:
            'Dikemas dengan baik sehingga tidak tembus sinar matahari, benih tetap kering, dan bisa bertahan lebih. Benih sudah diuji coba kualitasnya dengan daya kecambah berkisar antara 85%-95%.',
        isSelected: false),
  ];

  get quantity => 0;

  int qty = 0;

  get plantText => null;

  //Get the favorated items
  static List<Plant> getFavoritedPlants() {
    List<Plant> _travelList = Plant.plantList;
    return _travelList.where((element) => element.isFavorated == true).toList();
  }

  //Get the cart items
  static List<Plant> addedToCartPlants() {
    List<Plant> _selectedPlants = Plant.plantList;
    return _selectedPlants
        .where((element) => element.isSelected == true)
        .toList();
  }
}
