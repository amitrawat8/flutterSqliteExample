// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_pdf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataPdf _$DataPdfFromJson(Map<String, dynamic> json) {
  return DataPdf(
    id: json['id'] as int?,
    title: json['title'] as String?,
    file: json['file'] as String?,
    file_type: json['file_type'] as String?,
    filepath: json['filepath'] as String?,
    ImageUrl: json['ImageUrl'] as String?,
  );
}

Map<String, dynamic> _$DataPdfToJson(DataPdf instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'file': instance.file,
      'file_type': instance.file_type,
      'filepath': instance.filepath,
      'ImageUrl': instance.ImageUrl,
    };
