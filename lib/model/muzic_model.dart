import 'package:hive/hive.dart';
part 'muzic_model.g.dart';

@HiveType(typeId: 1)
class MuzicModel extends HiveObject {
  MuzicModel({
    this.pid,
    required this.name,
    required this.songId,
  });
  
  @HiveField(2)
  int? pid;

  @HiveField(0)
  String name;

  @HiveField(1)
  List<int> songId;

  add(int id) async {
    songId.add(id);
    await save();
  }

  deleteData(int id) async{
    songId.remove(id);
    await save();
  }

  bool isValueIn(int id) {
    return songId.contains(id);
  }
}
