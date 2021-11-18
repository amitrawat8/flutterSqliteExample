import 'package:json_annotation/json_annotation.dart';

/**
 * Created by Amit Rawat on 11/18/2021.
 */
part 'data_pdf.g.dart';

@JsonSerializable()
class DataPdf {
  int? id;

  String? title;

  String? file;

  String? file_type;

  String? filepath;

  String? ImageUrl;

  static final columns = [
    "id",
    "title",
    "file",
    "file_type",
    "Imagepath",
    "ImageUrl"
  ];

  DataPdf(
      {this.id,
      this.title,
      this.file,
      this.file_type,
      this.filepath,
      this.ImageUrl});

  factory DataPdf.fromJson(Map<String, dynamic> json) =>
      _$DataPdfFromJson(json);

  Map<String, dynamic> toJson() => _$DataPdfToJson(this);
}
