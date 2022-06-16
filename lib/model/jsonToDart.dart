class post {
  // "postId": 1,
  // "id": 1,
  // "name": "id labore ex et quam laborum",
  // "email": "Eliseo@gardner.biz",
  // "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"

  final int postId, id;
  final String name, email, body;

  post(
      {required this.postId,
      required this.id,
      required this.name,
      required this.email,
      required this.body});

  factory post.jsonToDart(Map json) {
    return post(
        postId: json['postId'],
        id: json['id'],
        name: json['name'],
        email: json['email'],
        body: json['body']);
  }
}
