class User {
  User({
    required this.name,
    required this.handle,
    this.isFollowing = false,
  });

  final String name;
  final String handle;
  bool isFollowing;

  void toggleFollowing() {
    isFollowing = !isFollowing;
  }
}
