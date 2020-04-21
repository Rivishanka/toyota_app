class CarPopularity{
  final String colorVal;
  final int taskVal;
  final String taskDetails;

  CarPopularity(this.colorVal, this.taskVal, this.taskDetails);

  CarPopularity.fromMap(Map<String, dynamic> map)
  : assert(map['taskVal'] != null), assert(map['colorVal'] != null), assert(map['taskDetails'] != null),
  taskVal = map['taskVal'],
        colorVal = map['colorVal'],
        taskDetails = map['taskDetails'];

  @override
  String toString() => "Record<$taskVal:$colorVal:$taskDetails>";


}