import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Helper class for creating custom map markers
class MarkerHelper {
  /// Creates a custom marker icon with flag emoji (no badge)
  static Future<BitmapDescriptor> createCustomMarker({
    required String flag,
    required int userCount, // Kept for compatibility but not used
    Color backgroundColor = Colors.white,
    Color badgeColor = Colors.blue,
  }) async {
    // Create a recorder to draw the marker
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    // Marker size
    const double size = 80.0;
    const double radius = 35.0;

    // Draw outer circle (shadow effect)
    final Paint shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.2)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);
    canvas.drawCircle(
      const Offset(size / 2, size / 2),
      radius + 2,
      shadowPaint,
    );

    // Draw main circle background
    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      const Offset(size / 2, size / 2),
      radius,
      backgroundPaint,
    );

    // Draw border
    final Paint borderPaint = Paint()
      ..color = badgeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;
    canvas.drawCircle(
      const Offset(size / 2, size / 2),
      radius,
      borderPaint,
    );

    // Draw flag emoji (centered)
    final TextPainter flagPainter = TextPainter(
      text: TextSpan(
        text: flag,
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    flagPainter.layout();
    flagPainter.paint(
      canvas,
      Offset(
        (size - flagPainter.width) / 2,
        (size - flagPainter.height) / 2,
      ),
    );

    // Convert to image
    final ui.Picture picture = pictureRecorder.endRecording();
    final ui.Image image = await picture.toImage(size.toInt(), size.toInt());
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List uint8List = byteData!.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(uint8List);
  }

  /// Creates a simple circular marker with flag
  static Future<BitmapDescriptor> createSimpleMarker({
    required String flag,
    Color backgroundColor = Colors.white,
    Color borderColor = Colors.blue,
  }) async {
    const double size = 60.0;
    const double radius = 28.0;

    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    // Shadow
    final Paint shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.15)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);
    canvas.drawCircle(
      const Offset(size / 2, size / 2),
      radius + 1,
      shadowPaint,
    );

    // Background
    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      const Offset(size / 2, size / 2),
      radius,
      backgroundPaint,
    );

    // Border
    final Paint borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;
    canvas.drawCircle(
      const Offset(size / 2, size / 2),
      radius,
      borderPaint,
    );

    // Flag
    final TextPainter flagPainter = TextPainter(
      text: TextSpan(
        text: flag,
        style: const TextStyle(fontSize: 28),
      ),
      textDirection: TextDirection.ltr,
    );
    flagPainter.layout();
    flagPainter.paint(
      canvas,
      Offset(
        (size - flagPainter.width) / 2,
        (size - flagPainter.height) / 2,
      ),
    );

    final ui.Picture picture = pictureRecorder.endRecording();
    final ui.Image image = await picture.toImage(size.toInt(), size.toInt());
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List uint8List = byteData!.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(uint8List);
  }
}

