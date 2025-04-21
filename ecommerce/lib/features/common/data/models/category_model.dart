// {
// "_id": "67cd33432e43d538695ea4bc",
// "title": "New Category",
// "slug": "new-qqqcas",
// "description": "cat description",
// "icon": "https://cdn.ostad.app/public/upload/2023-06-22T06-40-41.054Z-code-box-line.png",
// "parent": null,
// "createdAt": "2025-03-09T06:20:51.097Z",
// "updatedAt": "2025-03-09T06:20:51.097Z",
// "__v": 0
// },

class CategoryModel {
  final String id;
  final String title;
  final String slug;
  final String description;
  final String icon;

  CategoryModel(
      {required this.id,
      required this.title,
      required this.slug,
      required this.description,
      required this.icon});

  factory CategoryModel.fromJson(Map<String, dynamic> jsonData) {
    return CategoryModel(
      id: jsonData['_id'],
      title: jsonData['title'],
      slug: jsonData['slug'],
      description: jsonData['description'],
      icon: jsonData['icon'],
    );
  }
}
