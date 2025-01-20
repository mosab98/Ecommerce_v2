class CategoryItemModel {
  final String id;
  final String name;
  final String imgUrl;

  CategoryItemModel({
    required this.id,
    required this.name,
    required this.imgUrl,
  });
}

List<CategoryItemModel> dummyCategories = [
  CategoryItemModel(
    id: '1',
    name: 'Shoes',
    imgUrl: 'assets/images/shose.png',
  ),
  CategoryItemModel(
    id: '2',
    name: 'Trousers',
    imgUrl: 'assets/images/trousers.png',
  ),
  CategoryItemModel(
    id: '3',
    name: 'Clothes',
    imgUrl: 'assets/images/clothes.png',
  ),
  CategoryItemModel(
    id: '4',
    name: 'Groceries',
    imgUrl: 'assets/images/groceries.png',
  ),
  CategoryItemModel(
    id: '5',
    name: 'Fruits',
    imgUrl: 'assets/images/fruits.png',
  ),
  CategoryItemModel(
    id: '6',
    name: 'Sweet Shirt',
    imgUrl: 'assets/images/sweet_shirt.png',
  ),
];
