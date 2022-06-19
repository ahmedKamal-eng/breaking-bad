
class Character{
  late int charId;
  late List<dynamic> jobs;
  late String name;
  late String image;
  late String nickName;
  late String statusIfDeadOrAlive;
  late List<dynamic> appearanceOfSeasons;
  late String actorName;
  late String categoryForTwoSeries;
  late List<dynamic> betterCallSaulAppearance;

   Character.fromJson(Map<String,dynamic> json)
   {
    charId= json["char_id"];
    jobs=json['occupation'];
    name=json['name'];
    image=json['img'];
    nickName= json['nickname'];
    statusIfDeadOrAlive=json['status'];
    appearanceOfSeasons=json['appearance'];
    actorName=json['portrayed'];
    categoryForTwoSeries=json['category'];
    betterCallSaulAppearance=json['better_call_saul_appearance'];
   }
}