import 'package:flutter/material.dart';
import 'package:iddir_app/core/widgets/button.dart';
import 'package:iddir_app/features/auth/presentation/screens/signin_page.dart';

class ProfileFormPage extends StatelessWidget {
  const ProfileFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CurvedHeader(),
            const SizedBox(height: 25),
            const CustomTextField(labelText: 'Full Name:', placeholder: 'Enter your full name..'),
            const SizedBox(height: 20),

            const CustomTextField(
              labelText: 'Date of Birth:',
              placeholder: 'Enter date of birth..',
            ),
            const SizedBox(height: 20),

            const CustomTextField(
              labelText: 'Address:',
              placeholder: 'Enter your address..',
            ),
            const SizedBox(height: 20),

            const CustomTextField(
              labelText: 'Phone Number:',
              placeholder: 'Enter your phone number..',
            ),
            const SizedBox(height: 20),
            const CustomTextField(labelText: 'Password', placeholder: '**********'),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      CustomButton(label: 'Back', onPressed: ()=>{}, aspectRatioVal: 2, border: true, lablefont: 16,),
                      CustomButton(label: 'Submit', onPressed: ()=>{}, aspectRatioVal: 2, backgroundColor: const Color(0xFF08B9AF), lablefont: 16,) // Teal-ish color from image
                  ],
              ),
            )
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
                'Edit Profile',
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
