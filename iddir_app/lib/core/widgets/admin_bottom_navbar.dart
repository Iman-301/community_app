import 'package:flutter/material.dart';

class AdminBottomNavBar extends StatelessWidget {
  const AdminBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 9),
      color: const Color(0xFF08B9AF),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          AdminNavItem(
            icon: Icons.group_outlined,
            label: 'Members',
          ),
          AdminNavItem(
            icon: Icons.check_circle_outline,
            label: 'Approvals',
          ),
          AdminNavItem(
            icon: Icons.account_balance_wallet_outlined,
            label: 'Finance',
          ),
          AdminNavItem(
            icon: Icons.announcement_outlined,
            label: 'Announcements',
          ),
        ],
      ),
    );
  }
}

class AdminNavItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const AdminNavItem({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.black),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Instrument Sans',
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
