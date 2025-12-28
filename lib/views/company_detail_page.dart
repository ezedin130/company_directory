import 'package:flutter/material.dart';
import '../model/company.dart';

class CompanyDetailPage extends StatelessWidget {
  final Company company;

  const CompanyDetailPage({
    super.key,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(company.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(company.logo),
              ),
            ),
            const SizedBox(height: 24),

            _buildInfoTile('CEO', company.ceoName),
            _buildInfoTile('Industry', company.industry),
            _buildInfoTile('Employees', company.employeeCount.toString()),
            _buildInfoTile('Market Cap', _formatMarketCap(company.marketCap)),
            _buildInfoTile('Domain', company.domain),
            _buildInfoTile('Address', company.address),
            _buildInfoTile('ZIP Code', company.zip),
            _buildInfoTile('Country', company.country),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
          const Divider(height: 20),
        ],
      ),
    );
  }

  String _formatMarketCap(int value) {
    if (value >= 1000000000) {
      return '\$${(value / 1000000000).toStringAsFixed(2)}B';
    } else if (value >= 1000000) {
      return '\$${(value / 1000000).toStringAsFixed(2)}M';
    }
    return '\$$value';
  }
}
