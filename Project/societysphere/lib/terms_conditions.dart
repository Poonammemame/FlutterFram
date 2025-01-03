import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsOfServicePage extends StatefulWidget {
  @override
  _TermsOfServicePageState createState() => _TermsOfServicePageState();
}

class _TermsOfServicePageState extends State<TermsOfServicePage> {
  bool isTermsAccepted = false;
  bool isPrivacyAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[50]!, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 8.0,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.description,
                              size: 60,
                              color: Colors.blue,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Terms and Conditions',
                              style: GoogleFonts.quicksand(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[900],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Update 23/11/2024',
                              style: GoogleFonts.quicksand(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    buildSectionContainer("1. Acceptance of Terms",
                        "By accessing or using Society Sphere, you agree to these terms and conditions and our Privacy Policy. If you do not agree, you may not use the app."),
                    buildSectionContainer(
                        "2. User Account and Responsibilities",
                        "You must provide accurate information when creating an account. You are responsible for maintaining the confidentiality of your login credentials. Do not use the app for unlawful purposes."),
                    buildSectionContainer("3. Use of the App",
                        "The app facilitates society-related tasks such as announcements, visitor management, maintenance payments, and complaints. Users must not upload content that is offensive or violates any law."),
                    buildSectionContainer("4. Payment and Transactions",
                        "All payments made via the app must follow society's rules. Society Sphere is not responsible for errors or disputes arising from financial transactions."),
                    buildSectionContainer("5. Community Guidelines",
                        "Respect others within the platform. Harassment, abuse, or discrimination of any kind is prohibited."),
                    buildSectionContainer("6. Data Privacy",
                        "Your data will be used as outlined in our Privacy Policy. Sensitive information, such as payment details, is encrypted and securely stored."),
                    buildSectionContainer("7. Intellectual Property",
                        "All content within the app, including logos, designs, and features, is the property of Society Sphere. Unauthorized use or duplication is prohibited."),
                    buildSectionContainer("8. Limitation of Liability",
                        "Society Sphere is not responsible for any loss, damage, or inconvenience caused by misuse of the app or technical errors."),
                    buildSectionContainer("9. Termination of Services",
                        "We reserve the right to terminate accounts that violate these terms. Users may terminate their account by contacting support."),
                    buildSectionContainer("10. Modifications to Terms",
                        "Society Sphere reserves the right to update these terms at any time. Users will be notified of significant changes."),
                    buildSectionContainer("11. Dispute Resolution",
                        "Any disputes arising from the use of the app shall be resolved through arbitration or as per local governing laws."),
                    buildSectionContainer("12. Contact Information",
                        "If you have questions, please contact us at:\nEmail: support@societysphere.com\nPhone: 9645852321"),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 8.0,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  CheckboxListTile(
                    title: Text(
                      "I agree with the Terms and Conditions",
                      style: GoogleFonts.quicksand(),
                    ),
                    value: isTermsAccepted,
                    onChanged: (value) {
                      setState(() {
                        isTermsAccepted = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text(
                      "I agree with the Privacy Policy",
                      style: GoogleFonts.quicksand(),
                    ),
                    value: isPrivacyAccepted,
                    onChanged: (value) {
                      setState(() {
                        isPrivacyAccepted = value!;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          "ThankYou!You have accepted terms and conditions",
                          style: GoogleFonts.quicksand(),
                        )));
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          'Decline',
                          style: GoogleFonts.quicksand(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: (isTermsAccepted && isPrivacyAccepted)
                            ? () {
                                // Handle acceptance
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          'Accept',
                          style: GoogleFonts.quicksand(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionContainer(String title, String content) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.quicksand(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: GoogleFonts.quicksand(
              fontSize: 14,
              color: Colors.black,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
