import 'package:flutter/material.dart';
import 'package:iddir_app/core/widgets/admin_bottom_navbar.dart';

class EventApprovalPage extends StatelessWidget {
  const EventApprovalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CurvedHeader(),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(20),
            child: Column(
              children: [
                CustomApprovalCard(
                  name: 'Besufekad Tadesse',
                  service: 'Funeral Service',
                  amount: 'ETB 5,000',
                  showButtons: true,
                ),
                SizedBox(height: 20),
                CustomApprovalCard(
                  name: 'Selam Fekadu',
                  service: 'Wedding Service',
                  amount: 'ETB 5,000',
                  showButtons: true,
                ),
                SizedBox(height: 20),
                CustomApprovalCard(
                  name: 'Besufekad Tadesse',
                  service: 'Funeral Service',
                  amount: 'ETB 5,000',
                  showButtons: false,
                ),
                SizedBox(height: 20),
                CustomApprovalCard(
                  name: 'Selam Fekadu',
                  service: 'Wedding Service',
                  amount: 'ETB 5,000',
                  showButtons: false,
                ),
              ],
            ),)
          ],
        ),
      ),

      bottomNavigationBar: AdminBottomNavBar(),
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
                'Event Request',
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

class CustomApprovalCard extends StatelessWidget {
  final String name;
  final String service;
  final String amount;
  final bool showButtons;

  const CustomApprovalCard({
    super.key,
    required this.name,
    required this.service,
    required this.amount,
    this.showButtons = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 408,
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(102, 116, 114, 114), // #00000040
            blurRadius: 10,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontFamily: 'Instrument Sans',
              fontWeight: FontWeight.w600,
              fontSize: 24,
              height: 1.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            service,
            style: const TextStyle(
              fontFamily: 'Instrument Sans',
              fontWeight: FontWeight.w400,
              fontSize: 20,
              height: 1.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            amount,
            style: const TextStyle(
              fontFamily: 'Instrument Sans',
              fontWeight: FontWeight.w400,
              fontSize: 20,
              height: 1.0,
              color: Colors.black,
            ),
          ),
          if (showButtons) ...[
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 146,
                  height: 36,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF08B9AF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text(
                      'Approve',
                      style: TextStyle(
                        fontFamily: 'Instrument Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 146,
                  height: 36,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00524D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text(
                      'Reject',
                      style: TextStyle(
                        fontFamily: 'Instrument Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
