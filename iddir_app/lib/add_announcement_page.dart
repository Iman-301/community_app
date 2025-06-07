import 'package:flutter/material.dart';
import 'package:iddir_app/core/widgets/button.dart';
import 'package:iddir_app/features/auth/presentation/screens/signin_page.dart';

class AddAnnouncementPage extends StatelessWidget {
  const AddAnnouncementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CurvedHeader(),
            const SizedBox(height: 25),
            const CustomTextField(
              labelText: 'Title:',
              placeholder: 'Enter the title..',
            ),
            const SizedBox(height: 20),

            const CustomTextField(
              labelText: 'Date:',
              placeholder: 'Enter the date of the announcement..',
            ),
            const SizedBox(height: 20),

            const CustomTextField(
              labelText: 'Address:',
              placeholder: 'Enter your address..',
            ),
            const SizedBox(height: 20),

            const CustomTextField(
              labelText: 'Location:',
              placeholder: 'Enter the location..',
            ),
            const SizedBox(height: 20),

            // Multiline Description Field
            SizedBox(
              width: 345,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontFamily: 'Instrument Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Color(0xFF011815),
                      height: 1.0,
                      letterSpacing: 0.0,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText: 'Enter description...',
                      hintStyle: const TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        height: 1.0,
                        letterSpacing: 0.0,
                        color: Color(0x80000000),
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          color: Color(0x6E000000),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          color: Color(0xFF000000),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Upload Image Section
            SizedBox(
              width: 345,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Upload Image',
                    style: TextStyle(
                      fontFamily: 'Instrument Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Color(0xFF011815),
                      height: 1.0,
                      letterSpacing: 0.0,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black.withOpacity(0.4)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Tap to upload image',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            CustomButton(label: 'Add Announcement',backgroundColor: Color(0xFF08B9AF), onPressed: () {}, aspectRatioVal:4, lablefont:16),
            const SizedBox(height:20)
          ],
        ),
      ),
    );
  }
}

class CurvedHeader extends StatelessWidget {
  const CurvedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TopCurveClipper(),
      child: Container(
        height: 200, // Adjust as needed
        color: const Color(0xFFEBF0F0), // Teal-ish color from image
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 16),
          child: Row(
            children: [
              const Icon(Icons.arrow_back, color: Colors.black, size: 28),
              const SizedBox(width: 12),
              const Text(
                'Announcement details',
                style: TextStyle(
                  fontFamily: 'Instrument Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height - 40); // Start down from top-left

    // Make the curve start lower and rise to the right side
    path.quadraticBezierTo(
      size.width * 0.05,
      size.height + 20, // Control point (swollen left)
      size.width * 0.5,
      size.height - 10, // Mid point (smoother center)
    );

    path.quadraticBezierTo(
      size.width * 0.95,
      size.height - 50, // Control point (gentle right)
      size.width,
      size.height - 20, // End at top-right
    );

    path.lineTo(size.width, 0); // Top-right corner
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
