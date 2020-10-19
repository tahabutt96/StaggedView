class Tag {
  String name;
  int id;
  String img;

  Tag(this.name, this.id,this.img);

  factory Tag.fromJson(dynamic json) {
    return Tag(json['name'] as String, json['id'] as int,json['img'] as String);
  }

  @override
  String toString() {
    return '{ ${this.name}, ${this.id} , ${this.img} }';
  }
}