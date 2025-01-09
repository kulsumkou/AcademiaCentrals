import 'package:academia_centrals/AppAssets/app_assets.dart';
import 'package:academia_centrals/Widgets/scholarship_card.dart';
import 'package:flutter/material.dart';

class ExploreTabs extends StatelessWidget {
  const ExploreTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> scholarships = [
      {
        'imageAsset': AppAssets.feature1,
        'scholarships': 'Medhaavi Engineering \nScholarship',
        'eligibility': 'Up to INR 1,00,000/-',
        'description':
            'This scholarship is for the top 10% of engineering students. is a CSR initiative of LIC Housing Finance Limited (LIC HFL) to support the education of underprivileged students in India. The scholarship programme aims to empower lower-income group students who are pursuing studies from Class 11 to postgraduation. Under this scholarship programme, students will receive financial assistance of up to INR 25,000 as per their level of education. Incorporated in 1989, LIC Housing Finance Ltd. (LICHFL) is one of the largest Housing Finance Companies in India with a key objective of providing long term finance to individuals for the purchase or construction of house/flat for residential purposes in India. LIC HFL also provides ',
      },
      {
        'imageAsset': AppAssets.feature3,
        'scholarships': 'National Merit\n Scholarship',
        'eligibility': 'Up to INR 50,000/-',
        'description':
            'Available for students pursuing higher education in India.  is a CSR initiative of LIC Housing Finance Limited (LIC HFL) to support the education of underprivileged students in India. The scholarship programme aims to empower lower-income group students who are pursuing studies from Class 11 to postgraduation. Under this scholarship programme, students will receive financial assistance of up to INR 25,000 as per their level of education. Incorporated in 1989, LIC Housing Finance Ltd. (LICHFL) is one of the largest Housing Finance Companies in India with a key objective of providing long term finance to individuals for the purchase or construction of house/flat for residential purposes in India. LIC HFL also provides ',
      },
      {
        'imageAsset': AppAssets.feature2,
        'scholarships': 'Postgraduate Science\n Scholarship',
        'eligibility': 'Up to INR 75,000/-',
        'description':
            'This scholarship supports postgraduate students in sciences.  is a CSR initiative of LIC Housing Finance Limited (LIC HFL) to support the education of underprivileged students in India. The scholarship programme aims to empower lower-income group students who are pursuing studies from Class 11 to postgraduation. Under this scholarship programme, students will receive financial assistance of up to INR 25,000 as per their level of education. Incorporated in 1989, LIC Housing Finance Ltd. (LICHFL) is one of the largest Housing Finance Companies in India with a key objective of providing long term finance to individuals for the purchase or construction of house/flat for residential purposes in India. LIC HFL also provides ',
      },
    ];

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: scholarships.length,
      itemBuilder: (BuildContext context, int index) {
        final scholarship = scholarships[index];
        return ScholarshipCard(
          imageAsset: scholarship['imageAsset']!,
          scholarships: scholarship['scholarships']!,
          eligibility: scholarship['eligibility']!,
          description: scholarship['description']!,
        );
      },
    );
  }
}
