import 'package:floor/floor.dart';
import '../modeles/Task.dart';

@dao
abstract class TaskDao{
  @insert
  Future<int> inserTask(Task task);

  @Query("SELECT * FROM Task")
  Future<List<Task>> getTasks();

  @Query("DELETE FROM TASK WHERE id = :id")
  Future<Task?> deleteTask(int id);

}

