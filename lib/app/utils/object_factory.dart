import '/app/work_areas/admin_role/admin_main_work_area.dart';
import '/app/work_areas/student_role/student_main_work_area.dart';

class ObjectFactory {
  static final Map<Type, dynamic Function()> _constructors = {
    StudentMainWorkArea: () => StudentMainWorkArea(),
    AdminMainWorkArea: () => AdminMainWorkArea(),
  };

  static T createInstance<T>() {
    var constructor = _constructors[T];
    if (constructor != null) {
      return constructor() as T;
    } else {
      throw Exception('Type $T is not registered in the factory.');
    }
  }
}
