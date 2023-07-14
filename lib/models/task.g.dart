// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      createdBy: json['createdBy'] as String,
      task: json['task'] as String,
      cost: json['cost'] as int,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'createdBy': instance.createdBy,
      'task': instance.task,
      'cost': instance.cost,
      'status': instance.status,
    };
