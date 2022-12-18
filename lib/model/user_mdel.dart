class UserModel {
  final String id;
  final String name;
  final String email;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
});

Map<String, dynamic> toJson()=>{
  'userId': id,
  'name':name ,
  'email': email,
};
}
