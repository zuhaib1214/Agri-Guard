import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class ScanController extends GetxController {
  // File? _pickedImage;
  final ImagePicker _imagePicker = ImagePicker();
  ImagePicker get imagePicker => _imagePicker;

  // String? imagePath;
  // img.Image? image;
  // Map<String, double>? classification;
  File? _imageFile;
  File? get imageFile => _imageFile;

  Interpreter? _interpreter;
  Map<String, dynamic>? _predictionDetails;
  Map<String, dynamic>? get predictionDetails => _predictionDetails;

  List<String> imageLabels = [];

  final _imageLabeler = ImageLabeler(
      options: ImageLabelerOptions(
    confidenceThreshold: 0.5,
  ));

  bool cameraIsAvailable = Platform.isAndroid || Platform.isIOS;
  String percentage = '', name = '';
  List<String> plantDetectionList = [
    'leaf',
    'leaves',
    'plant',
    'Plant',
    'plants',
    'foliage',
    'vegetation',
    'Vegetable',
    'vegetable',
    'wool',
    'Wool',
    'greenery',
    'tree',
    'shrub',
    'grass',
    'flower',
    'blossom',
    'stem',
    'potato',
    'potato plant',
    'Agri Guard',
    'crop',
    'farm',
    'garden',
    'pattern',
    'agriculture',
    'insect'
  ];

  @override
  void onInit() {
    loadModel();

    super.onInit();
  }

  Future<List<String>> objectDetectionsMethod(File image) async {
    final InputImage inputImage = InputImage.fromFile(image);
    try {
      final List<ImageLabel> labels =
          await _imageLabeler.processImage(inputImage);
      List<String> labelsText = [];
      for (ImageLabel label in labels) {
        final String text = label.label;
        final double confidence = label.confidence;
        labelsText.add('$text: ${(confidence * 100).toStringAsFixed(2)}%');
      }

      _imageFile = File(image.path);
      return labelsText;
    } catch (e) {
      log("Error processing image: $e");
      return ["other"];
    }
  }

  Uint8List preprocessImage(img.Image image) {
    final resizedImage = img.copyResize(image, width: 256, height: 256);

    // Preprocess the resized image
    final int width = resizedImage.width;
    final int height = resizedImage.height;
    final inputArray = Float32List(width * height * 3);
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        final pixelIndex = (y * width + x) * 3;
        final pixel = resizedImage.getPixel(x, y);
        inputArray[pixelIndex] = pixel.r.toDouble();
        inputArray[pixelIndex + 1] = pixel.g.toDouble();
        inputArray[pixelIndex + 2] = pixel.b.toDouble();
      }
    }

    return inputArray.buffer.asUint8List();
    // return resizedImage.getBytes();
  }

  Future<void> performInference(File imageFile) async {
    if (_interpreter == null) return;

    // Read the image file and convert it to an image
    final image = img.decodeImage(await imageFile.readAsBytes());

    // Preprocess the image and convert it to a NumPy array
    final preprocessedImage = preprocessImage(image!);

    // Run inference on the model
    final outputBuffer =
        Float32List(15 * 1); // Create output buffer with correct shape [15, 1]

    // Reshape the output buffer to match the expected shape [1, 3]
    final reshapedOutputBuffer = outputBuffer.reshape([1, 15]);

    _interpreter!
        .run(preprocessedImage.buffer.asUint8List(), reshapedOutputBuffer);

    // Find the index with the highest probability
    int maxIndex = 0;
    double maxProbability = 0.0;
    for (int i = 0; i < 15; i++) {
      if (reshapedOutputBuffer[0][i] > maxProbability) {
        maxIndex = i;
        maxProbability = reshapedOutputBuffer[0][i];
      }
    }

    /// [60,87,99,66,55]
    // Map index to label
    String predictionLabel = '';
    switch (maxIndex) {
      case 0:
        predictionLabel = 'Pepper__bell___Bacterial_spot';
        break;
      case 1:
        predictionLabel = 'Pepper__bell___healthy';
        break;
      case 2:
        predictionLabel = 'Potato___Early_blight';
        break;
      case 3:
        predictionLabel = 'Potato___Late_blight';
        break;
      case 4:
        predictionLabel = 'Potato___healthy';
        break;
      case 5:
        predictionLabel = 'Tomato_Bacterial_spot';
        break;
      case 6:
        predictionLabel = 'Tomato_Early_blight';
        break;
      case 7:
        predictionLabel = 'Tomato_Late_blight';
        break;
      case 8:
        predictionLabel = 'Tomato_Leaf_Mold';
        break;
      case 9:
        predictionLabel = 'Tomato_Septoria_leaf_spot';
        break;
      case 10:
        predictionLabel = 'Tomato_Spider_mites_Two_spotted_spider_mite';
        break;
      case 11:
        predictionLabel = 'Tomato__Target_Spot';
        break;
      case 12:
        predictionLabel = 'Tomato__Tomato_YellowLeaf__Curl_Virus';
        break;
      case 13:
        predictionLabel = 'Tomato__Tomato_mosaic_virus';
        break;
      case 14:
        predictionLabel = 'Tomato_healthy';
        break;
      default:
        predictionLabel = 'Unknown';
    }

    log("output of the image is $predictionLabel");
    log("output of the image confidence is is ${(maxProbability * 100).toStringAsFixed(2)}");
    _predictionDetails = {
      'predictionPercentage': (maxProbability * 100).toStringAsFixed(2),
      'predictionLabel': predictionLabel,
    };
    update();
  }

  Future<void> loadModel() async {
    ///image konc di? sai hogya? healty image may late blight kah rha

    final interpreterOptions = InterpreterOptions();
    // Add any interpreter options if needed

    // Load the model from assets
    _interpreter = await Interpreter.fromAsset(
      'assets/model/tf_lite_vegetable.tflite',
      options: interpreterOptions,
    );
  }

  Future<void> getImageAndPredict(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);
      _predictionDetails = null; // Clear previous prediction details
      bool foundPotatoLabel = false;
      if (_imageFile != null) {
        imageLabels = await objectDetectionsMethod(_imageFile!);
        for (String label in imageLabels) {
          log("labels of image $label");
          String labelWithoutConfidence =
              label.split(':')[0].trim().toLowerCase();
          log("labelWithoutConfidence $labelWithoutConfidence");
          if (plantDetectionList.contains(labelWithoutConfidence)) {
            log("output ${plantDetectionList.contains(labelWithoutConfidence)}");
            foundPotatoLabel = true;
            await performInference(_imageFile!);
            update();
            break;
          }
        }
        if (!foundPotatoLabel) {
          // Show a dialog indicating that the correct image needs to be selected
          showDialog(
            barrierDismissible: false,
            context: Get.context!, // Assuming you have access to the context
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Incorrect Image'),
                content: const Text(
                    'Please select an image with plant-related labels.'),
                actions: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
        update();
      }

      log('Performed inference');
    }
  }

  @override
  void dispose() {
    _imageLabeler.close();
    _interpreter?.close();
    super.dispose();
  }
}
