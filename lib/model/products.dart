class Products {
  String name;
  String description;
  String price;
  String img;
  double rating;

  Products(
      {required this.name,
      required this.description,
      required this.price,
      required this.img,
      required this.rating});
}

var productList = [
  Products(
      name: "White Whale",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent in hendrerit libero. Praesent eros nibh, molestie eleifend nunc eu, commodo hendrerit enim. In non elit est. Morbi sed elementum lacus, id condimentum enim. Praesent pulvinar lectus quis eros porta pellentesque. Duis venenatis ultricies dolor at eleifend. Nunc imperdiet pellentesque nulla, ac congue augue varius sed. Praesent eu metus et nisl rutrum gravida. Sed et nibh enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.",
      price: "Rp 80.000",
      img: 'images/white.jpg',
      rating: 4.4),
  Products(
      name: "Green Around",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent in hendrerit libero. Praesent eros nibh, molestie eleifend nunc eu, commodo hendrerit enim. In non elit est. Morbi sed elementum lacus, id condimentum enim. Praesent pulvinar lectus quis eros porta pellentesque. Duis venenatis ultricies dolor at eleifend. Nunc imperdiet pellentesque nulla, ac congue augue varius sed. Praesent eu metus et nisl rutrum gravida. Sed et nibh enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.",
      price: "Rp 75.000",
      img: 'images/green.jpg',
      rating: 4.8),
  Products(
      name: "Orange Youth",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent in hendrerit libero. Praesent eros nibh, molestie eleifend nunc eu, commodo hendrerit enim. In non elit est. Morbi sed elementum lacus, id condimentum enim. Praesent pulvinar lectus quis eros porta pellentesque. Duis venenatis ultricies dolor at eleifend. Nunc imperdiet pellentesque nulla, ac congue augue varius sed. Praesent eu metus et nisl rutrum gravida. Sed et nibh enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.",
      price: "Rp 78.000",
      img: 'images/orange.jpg',
      rating: 3.8),
  Products(
      name: "Black 3-Sneakers",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent in hendrerit libero. Praesent eros nibh, molestie eleifend nunc eu, commodo hendrerit enim. In non elit est. Morbi sed elementum lacus, id condimentum enim. Praesent pulvinar lectus quis eros porta pellentesque. Duis venenatis ultricies dolor at eleifend. Nunc imperdiet pellentesque nulla, ac congue augue varius sed. Praesent eu metus et nisl rutrum gravida. Sed et nibh enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.",
      price: "Rp 80.000",
      img: 'images/black.jpg',
      rating: 3.1)
];
