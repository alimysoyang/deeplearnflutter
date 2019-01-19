import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

class IOFile {
  String rwfilePath = '';

  void showDir() async {
    print('获取当前运行的脚本文件:${Platform.script.toFilePath()}');
    print('获取当前环境参数:${Platform.environment}');
    print('当前系统:${Platform.operatingSystem}');
    print('当前系统版本号:${Platform.operatingSystemVersion}');
    print('Dart版本号:${Platform.version}');
    print('${Platform.executable}');
    print('${Platform.resolvedExecutable}');

    String tmpath = (await getTemporaryDirectory()).path;
    String documentpath = (await getApplicationDocumentsDirectory()).path;
    String p = Directory.systemTemp.path;

    print('异步获取的临时目录:$tmpath');
    print('文档目录:$documentpath');
    print('同步获取的临时目录:$p');

    if (Platform.isIOS) {
      String docpath = path.join(Directory.systemTemp.parent.path, 'Documents');
      print('同步获取iOS app主目录:$docpath');
      rwfilePath = docpath;
    } else if (Platform.isAndroid) {
      getExternalStorageDirectory().then((Directory directory) {
        String externalpath = directory.path;
        print('SD卡目录:$externalpath');
        rwfilePath = externalpath;
      });
    }
  }

  void _showAndroidFiles(String dir) async {
    // try {
    //   var permission = SimplePermissions.requestPermission(Permission.ReadExternalStorage);
    //   getExternalStorageDirectory().then((Directory file) {
    //     permission.then((PermissionStatus status) {
    //       var count = file.listSync().length;
    //       if (count > 0)
    //       {
    //         file.listSync().forEach((FileSystemEntity entity) {
    //           if (entity is File) {
    //             print('这是文件:${entity.path}');
    //           } else if (entity is Directory) {
    //             print('这是文件夹${entity.path}');
    //             _showAndroidFiles(entity.path);
    //           }
    //         });
    //       }
    //     });
    //   });
    // } catch (e) {
    //   print('Android遍历文件错误:${e.toString()}');
    // }

    // try {
    //   PermissionHandler().requestPermissions([PermissionGroup.storage]).then((Map<PermissionGroup, PermissionStatus> requestResult) {
    //     if (requestResult[PermissionGroup.storage] == PermissionStatus.granted) {
    //       getExternalStorageDirectory().then((Directory file) {
    //         var count = file.listSync().length;
    //         if (count > 0) {
    //           file.listSync().forEach((FileSystemEntity entity) {
    //             if (entity is File) {
    //               print('这是文件:${entity.path}');
    //             } else if (entity is Directory) {
    //               print('这是文件夹${entity.path}');
    //               _showAndroidFiles(entity.path);
    //             }
    //           });
    //         }
    //       });
    //     }
    //   });
    // } catch (e) {
    //   print('Android遍历文件错误:${e.toString()}');
    // }
  }

  void _showiOSFiles(String dir) async {
    try {
      var dirFolder = Directory(dir);
      var dirlist = dirFolder.list();
      await for (FileSystemEntity entity in dirlist) {
        if (entity is File) {
          print('这是文件:${entity.path}');
        } else if (entity is Directory) {
          print('这是文件夹:${entity.path}');
          _showiOSFiles(entity.path);
        }
      }
    } catch (e) {
      print('iOS遍历文件错误:${e.toString()}');
    }
  }

  void startShowAndroid() {
    _showAndroidFiles('');
  }

  void createDir() {
    if (Platform.isIOS) {
      rwfilePath = path.join(Directory.systemTemp.parent.path, 'Documents/testdir');
    } else if (Platform.isAndroid) {
      rwfilePath = path.join(Directory.systemTemp.parent.path, 'testdir');
    }
    Directory dir = Directory(rwfilePath);
    if (!dir.existsSync()) {
      dir.create().then((Directory newDir) {
        print('${newDir.path} 创建成功');
      });
    } else {
      print('${dir.path} 已存在');
    }
  }

  void createDirectory(String dirName) {
    if (Platform.isIOS) {
      rwfilePath = path.join(Directory.systemTemp.parent.path, 'Documents/$dirName');
    } else if (Platform.isAndroid) {
      rwfilePath = path.join(Directory.systemTemp.parent.path, '$dirName');
    }
    print('准备创建目录:$rwfilePath');

    Directory dir = Directory(rwfilePath);
    if (!dir.existsSync()) {
      dir.create().then((Directory newDir) {
        print('${newDir.path} 创建成功');
      });
    } else {
      print('${dir.path} 已存在');
    }
  }

  Future<void> appendWriteFile() async {
    String filePath = '';
    if (Platform.isIOS) {
      filePath = path.join(Directory.systemTemp.parent.path, 'Documents/log.txt');
    } else if (Platform.isAndroid) {
      filePath = path.join(Directory.systemTemp.parent.path, 'log.txt');
    }

    var file = File(filePath);
    var sink = file.openWrite(mode: FileMode.append);
    for (int i = 0; i < 1000;i++) {
      sink.write('$i. File Accessed ${DateTime.now()}\n');
    }
    await sink.flush();
    await sink.close();
  }

  Future<void> appendWriteNewFile(String fileName) async {
    String filePath = '';
    if (Platform.isIOS) {
      filePath = path.join(Directory.systemTemp.parent.path, 'Documents/$fileName');
    } else if (Platform.isAndroid) {
      filePath = path.join(Directory.systemTemp.parent.path, '$fileName');
    }

    var file = File(filePath);
    var sink = file.openWrite(mode: FileMode.append);
    for (int i = 0; i < 1000;i++) {
      sink.write('$i. File Accessed ${DateTime.now()}\n');
    }
    await sink.flush();
    await sink.close();
  }

  void rewriteFile() {
    String filePath = '';
    if (Platform.isIOS) {
      filePath = path.join(Directory.systemTemp.parent.path, 'Documents/log1.txt');
    } else if (Platform.isAndroid) {
      filePath = path.join(Directory.systemTemp.parent.path, 'log1.txt');
    }

    try {
      var file = File(filePath);
      for (int i = 9999;i < 100000;i++) {
        file.writeAsStringSync('$i, File Accessed ${DateTime.now()}\n');
      }
      print('写文件完成');
    } catch (e) {
      print('写文件错误:${e.toString()}');
    }
  }

  void rewriteNewFile(String fileName) {
    String filePath = '';
    if (Platform.isIOS) {
      filePath = path.join(Directory.systemTemp.parent.path, 'Documents/$fileName');
    } else if (Platform.isAndroid) {
      filePath = path.join(Directory.systemTemp.parent.path, '$fileName');
    }

    try {
      var file = File(filePath);
      for (int i = 9999;i < 100000;i++) {
        file.writeAsStringSync('$i, File Accessed ${DateTime.now()}\n');
      }
      print('写文件完成');
    } catch (e) {
      print('写文件错误:${e.toString()}');
    }
  }

  void readAsLinesFile() {
    String filePath = '';
    if (Platform.isIOS) {
      filePath = path.join(Directory.systemTemp.parent.path, 'Documents/log.txt');
    } else if (Platform.isAndroid) {
      filePath = path.join(Directory.systemTemp.parent.path, 'log.txt');
    }

    try {
      var file = File(filePath);
      List<String> contents = file.readAsLinesSync();
      print('文件大小:${file.lengthSync()}');
      print('文件最后访问日期:${file.lastAccessedSync()}');
      print('文件最后修改日期:${file.lastModifiedSync()}');
      print('文件内容行数:${contents.length}');
      print('文件内容如下:\n');
      print('$contents');
    } catch (e) {
      print('读取文件失败:${e.toString()}');
    }
  }

  void readAsBytesFile() {
    String filePath = '';
    if (Platform.isIOS) {
      filePath = path.join(Directory.systemTemp.parent.path, 'Documents/log.txt');
    } else if (Platform.isAndroid) {
      filePath = path.join(Directory.systemTemp.parent.path, 'log.txt');
    }
    try {
      var file = File(filePath);
      List<int> bytes = file.readAsBytesSync();
      print('16进制文件显示内容:\n');
      for (int b in bytes) {
        print('${b.toRadixString(16)} ');
      }
    } catch (e) {
      print('读取文件失败:${e.toString()}');
    }
  }

  void readStreamFile() async {

  }

  void copyFile() {
    String filePath = '';
    String newFilePath = '';
    if (Platform.isIOS) {
      filePath = path.join(Directory.systemTemp.parent.path, 'Documents/log.txt');
      newFilePath = path.join(Directory.systemTemp.parent.path, 'Documents/newlog.txt');
    } else if (Platform.isAndroid) {
      filePath = path.join(Directory.systemTemp.parent.path, 'log.txt');
      newFilePath = path.join(Directory.systemTemp.parent.path, 'newlog.txt');
    }

    try {
      var file = File(filePath);
      if (file.existsSync())
      {
        file.copy(newFilePath).then((File newFile) {
          print('文件拷贝完成，新文件:${newFile.path}');
        });
        // file.copySync(newFilePath);
      } else {
        print('文件不存在，无法拷贝');
      }
    } catch (e) {
      print('拷贝文件失败:${e.toString()}');
    }
  }

  void renameFile() {
    String filePath = '';
    String newNameFilePath = '';
    if (Platform.isIOS) {
      filePath = path.join(Directory.systemTemp.parent.path, 'Documents/log.txt');
      newNameFilePath = path.join(Directory.systemTemp.parent.path, 'Documents/newnamelog.txt');
    } else if (Platform.isAndroid) {
      filePath = path.join(Directory.systemTemp.parent.path, 'log.txt');
      newNameFilePath = path.join(Directory.systemTemp.parent.path, 'newnamelog.txt');
    }

    try {
      var file = File(filePath);
      if (file.existsSync()) {
        // file.rename(newNameFilePath).then((File newFile) {
        // });
        file.renameSync(newNameFilePath);
        print('文件重命名成功');
      } else {
        print('文件不存在，无法重命名');
      }
    } catch (e) {
      print('重命名文件失败:${e.toString()}');
    }
  }

  void deleteFile() {
    String filePath = '';
    if (Platform.isIOS) {
      filePath = path.join(Directory.systemTemp.parent.path, 'Documents/newnamelog.txt');
    } else if (Platform.isAndroid) {
      filePath = path.join(Directory.systemTemp.parent.path, 'newnamelog.txt');
    }

    try {
      var file = File(filePath);
      if (file.existsSync()) {
        file.delete().then((FileSystemEntity entity) {
          print('文件已删除');
        });
      }
    } catch (e) {
      print('文件删除失败:${e.toString()}');
    }
  }

  void deleteTheFile(String fileName) {
    String filePath = '';
    if (Platform.isIOS) {
      filePath = path.join(Directory.systemTemp.parent.path, 'Documents/$fileName');
    } else if (Platform.isAndroid) {
      filePath = path.join(Directory.systemTemp.parent.path, '$fileName');
    }

    try {
      var file = File(filePath);
      if (file.existsSync()) {
        file.delete().then((FileSystemEntity entity) {
          print('文件已删除');
        });
      }
    } catch (e) {
      print('文件删除失败:${e.toString()}');
    }
  }
}