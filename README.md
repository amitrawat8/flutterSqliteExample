# Flutter Sqlite Example
 ```dart
 
 => pubspec.yaml
 dependencies:
  sqflite: 
  provider:
  json_annotation:
  
  dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: any  
  json_serializable: 
  
  => for auto generating the data.g.dart file use command in terminal :
   1. flutter pub get
   2. flutter pub run build_runner build
  

  => Example to use the Sqlite Database :

    DataPdf datapdf=DataPdf();
    datapdf.id=5;
    datapdf.title="pdf";
    datapdf.file="pdf";
    datapdf.file_type="pdf";
    datapdf.filepath="pdf";
    datapdf.ImageUrl="pdf";

   SQLiteDbProvider.db.insert(datapdf);
    SQLiteDbProvider.db.getProductById(5).then((value) => {
      print("data fetch"),
      //print(value),
      print(value!.file_type)
    });
    
 SQLiteDbProvider.db.uidExists(1).then((value) => {
      print("data fetch"),
      print(value!)
    });
    
     SQLiteDbProvider.db.getAllPdfDownload().then((value) => {
         List<DataPdf>? datapdf = value;
          
        });

```
