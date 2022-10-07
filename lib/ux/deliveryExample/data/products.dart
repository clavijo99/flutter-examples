class IngredientsProduct {
  const IngredientsProduct(
    this.name,
    this.image,
  );
  final String name;
  final String image;
}

class Product {
  Product(
    this.name,
    this.description,
    this.price,
    this.qualification,
    this.image,
    this.ingredients,
    this.ilove,
  );
  final String name;
  final String description;
  final double price;
  final double qualification;
  final String image;
  bool ilove = false;
  final List<IngredientsProduct> ingredients;
}

final List<Product> products = [
  Product(
    'Sushi2Go',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
    25.00,
    3.8,
    'assets/images/hotate.png',
    [const IngredientsProduct('Salmon', 'assets/images/salmon.png')],
    false,
  ),
  Product(
      'Sushi2Go',
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      30.00,
      4.8,
      'assets/images/sushi.png',
      [
        const IngredientsProduct('Salmon', 'assets/images/salmon.png'),
        const IngredientsProduct('Salmon', 'assets/images/salmon.png'),
        const IngredientsProduct('Salmon', 'assets/images/salmon.png'),
      ],
      false),
  Product(
    'Sushi2Go',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
    25.00,
    3.8,
    'assets/images/hotate.png',
    [const IngredientsProduct('Salmon', 'assets/images/salmon.png')],
    false,
  ),
  Product(
      'Sushi2Go',
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      30.00,
      4.8,
      'assets/images/sushi.png',
      [
        const IngredientsProduct('Salmon', 'assets/images/salmon.png'),
        const IngredientsProduct('Salmon', 'assets/images/salmon.png'),
        const IngredientsProduct('Salmon', 'assets/images/salmon.png'),
      ],
      false),
  Product(
    'Sushi2Go',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
    25.00,
    3.8,
    'assets/images/hotate.png',
    [const IngredientsProduct('Salmon', 'assets/images/salmon.png')],
    false,
  ),
  Product(
      'Sushi2Go',
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      30.00,
      4.8,
      'assets/images/sushi.png',
      [
        const IngredientsProduct('Salmon', 'assets/images/salmon.png'),
        const IngredientsProduct('Salmon', 'assets/images/salmon.png'),
        const IngredientsProduct('Salmon', 'assets/images/salmon.png'),
      ],
      false),
];
