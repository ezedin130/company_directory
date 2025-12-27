import 'package:flutter/material.dart';

import '../widgets/company_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final List<String> companies = const [
    'Google',
    'Apple',
    'Microsoft',
    'Amazon',
    'Meta',
    'Netflix',
    'Tesla',
    'IBM',
    'Intel',
    'Adobe',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Company Directory'),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: companies.length,
          itemBuilder: (BuildContext context, int index) {
            return CompanyCard(
              companyName: companies[index],
            );
          }
      )
    );
  }
}