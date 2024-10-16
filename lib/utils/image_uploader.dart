import 'dart:async';
import 'dart:html';
import 'dart:typed_data';

Future<Uint8List> imageUploader() {
  final completer = Completer<Uint8List>();
//method to load image and update `uploadedImage`

  InputElement uploadInput = FileUploadInputElement() as InputElement;
  uploadInput.click();

  uploadInput.onChange.listen((e) {
    // read file content as dataURL
    final files = uploadInput.files;
    if (files != null && files.length == 1) {
      final file = files[0];
      FileReader reader = FileReader();

      reader.readAsArrayBuffer(file);
      reader.onLoadEnd.listen((loaded) {
        completer.complete(reader.result as Uint8List);
      });

      reader.onError.listen(
        (event) => completer.completeError(event),
      );
    }
  });

  return completer.future;
}
