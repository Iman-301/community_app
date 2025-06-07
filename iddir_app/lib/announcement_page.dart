import 'package:flutter/material.dart';
import 'package:iddir_app/core/widgets/bottom_navbar.dart';

class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CurvedHeader(),
            const SizedBox(height: 25),
            const EventCard(),
            const SizedBox(height: 15),
            const EventCard2(),
            const SizedBox(height: 15),
            const EventCard3(),

          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
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
                'Announcements',
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

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: 395,
        height: 351,
        decoration: BoxDecoration(
          color: const Color(0xFFEBF0F0), // #E8E8E8AD
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color(0x40000000), // #00000040
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Stack(
          children: [
            // Top left date/time label
            Positioned(
              top: 19,
              left: 15,
              child: Container(
                width: 356,
                height: 16,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'DECEMBER 16, 9:10 PM',
                      style: TextStyle(
                        fontFamily: 'Product Sans',
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        letterSpacing:
                            1.0, // Flutter's letterSpacing is in logical pixels
                        color: Color(0xFF022F2A),
                        height: 1.0,
                      ),
                    ),
                    SizedBox(width: 5), // Space between text and circle

                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: const Color(
                          0xFFFB0000,
                        ), // Teal-ish color from image
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Center title text
            Positioned(
              top: 45,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: const Text(
                    'Funeral Service',
                    style: TextStyle(
                      fontFamily: 'Instrument Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                      height: 1.0,
                      letterSpacing: 0,
                      color: Color(0xFF022F2A),
                    ),
                  ),
                ),
              ),
            ),

            // Row with image and info box
            Positioned(
              top: 100,
              left: 25,
              child: Row(
                children: [
                  // Image placeholder
                  Container(
                    width: 163,
                    height: 167,
                    color: Color(
                      0xFFE8E8E8,
                    ).withOpacity(0.68), // Replace with actual image
                    child: Image.asset(
                      'assets/images/profile.png',
                      height: 167,
                      width: 163,
                    ),
                  ),
                  const SizedBox(width: 13),

                  // Info container
                  Container(
                    width: 171,
                    height: 182,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          '10 Jan 2023',
                          style: TextStyle(
                            fontFamily: 'Instrument Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            height: 1.0,
                            letterSpacing: 0,
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          'Shiromeda church',
                          style: TextStyle(
                            fontFamily: 'Instrument Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            height: 1.0,
                            letterSpacing: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Dropdown icon
            Positioned(
              top: 237,
              left: 267,
              child: Container(
                width: 36,
                height: 22,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 1,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 238, 236, 236),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventCard2 extends StatelessWidget {
  const EventCard2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: 395,
        decoration: BoxDecoration(
          color: const Color(0xFFEBF0F0),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color(0x40000000),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top date/time
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'DECEMBER 16, 9:10 PM',
                  style: TextStyle(
                    fontFamily: 'Product Sans',
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    letterSpacing: 1.0,
                    color: Color(0xFF022F2A),
                    height: 1.0,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Title
              Center(
                child: Text(
                  'MONTHLY GATHERING',
                  style: TextStyle(
                    fontFamily: 'Instrument Sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                    height: 1.0,
                    letterSpacing: 0,
                    color: Color(0xFF022F2A),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 30),

              // Paragraph container (auto-height)
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(12),
                child: const Text(
                  'We gather to discuss about annual payment. All members are requested to pay their respects and participate in the service.',
                  style: TextStyle(
                    fontFamily: 'Instrument Sans',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    height: 1.4,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class EventCard3 extends StatelessWidget {
  const EventCard3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: 395,
        decoration: BoxDecoration(
          color: const Color(0xFF367B36).withOpacity(0.8), // Light green background
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color(0x40000000),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top date/time
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'DECEMBER 16, 9:10 PM',
                      style: TextStyle(
                        fontFamily: 'Product Sans',
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        letterSpacing: 1.0,
                        color: Colors.white,
                        height: 1.0,
                      ),
                    ),
                    Text(
                      'Notice',
                      style: TextStyle(
                        fontFamily: 'Product Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                        letterSpacing: 1.0,
                        color: Color(0xFFC31D1D),
                        height: 1.0,
                      ),
                                          )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Title
              Center(
                child: Text(
                  'MONTHLY GATHERING',
                  style: TextStyle(
                    fontFamily: 'Instrument Sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                    height: 1.0,
                    letterSpacing: 0,
                    color: Color(0xFF022F2A),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 30),

              // Paragraph container (auto-height)
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(12),
                child: const Text(
                  'We ask you kindly to pay 200 birr for your monthly fee in a week, if you pass the due date 50 additional fee is required',
                  style: TextStyle(
                    fontFamily: 'Instrument Sans',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    height: 1.4,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



