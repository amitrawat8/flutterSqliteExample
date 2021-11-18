# flutterSqliteExample
 ```dart
 dependencies:
  sqflite: ^2.0.0+4
  provider:
  

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

```
