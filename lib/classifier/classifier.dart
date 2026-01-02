import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;
import 'classifier_category.dart';
import 'classifier_model.dart';

typedef ClassifierLabels = List<String>;


class Classifier {
  final ClassifierLabels _labels;
  final ClassifierModel _model;

  Classifier._({
    required ClassifierLabels labels,
    required ClassifierModel model,
  })  : _labels = labels,
        _model = model;

  static Future<Classifier?> loadWith({
    required String labelsFileName,
    required String modelFileName,
  }) async {
    try {
      final labels = await _loadLabels(labelsFileName);
      final model = await _loadModel(modelFileName);
      return Classifier._(labels: labels, model: model);
    } catch (e, s) {
      debugPrint("Classifier init error: $e");
      debugPrintStack(stackTrace: s);
      return null;
    }
  }

  static Future<ClassifierModel> _loadModel(String modelFileName) async {
    final interpreter = await Interpreter.fromAsset(modelFileName);

    return ClassifierModel(
      interpreter: interpreter,
      inputShape: interpreter.getInputTensor(0).shape,
      outputShape: interpreter.getOutputTensor(0).shape,
      inputType: interpreter.getInputTensor(0).type,
      outputType: interpreter.getOutputTensor(0).type,
    );
  }

  static Future<ClassifierLabels> _loadLabels(String fileName) async {
    final raw = await rootBundle.loadString(fileName);
    return raw
        .split('\n')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
  }

  void close() => _model.interpreter.close();

  ClassifierCategory predict(img.Image image) {
    final input = _preProcess(image);

    final output = List.filled(_model.outputShape.reduce((a, b) => a * b), 0.0)
        .reshape(_model.outputShape);

    _model.interpreter.run(input, output);

    final results = <ClassifierCategory>[];

    for (int i = 0; i < _labels.length; i++) {
      results.add(ClassifierCategory(_labels[i], output[0][i]));
    }

    results.sort((a, b) => b.score.compareTo(a.score));
    return results.first;
  }

  List<List<List<List<double>>>> _preProcess(img.Image image) {
    final size = _model.inputShape[1];

    // Resize image
    final resized = img.copyResize(image, width: size, height: size);

    // Normalize image
    final input = List.generate(
      1,
          (_) => List.generate(
        size,
            (y) => List.generate(
          size,
              (x) {
            final pixel = resized.getPixel(x, y);

            final r = img.getRed(pixel);
            final g = img.getGreen(pixel);
            final b = img.getBlue(pixel);

            return [
              (r - 127.5) / 127.5,
              (g - 127.5) / 127.5,
              (b - 127.5) / 127.5,
            ];
          },
        ),
      ),
    );

    return input;
  }
}
