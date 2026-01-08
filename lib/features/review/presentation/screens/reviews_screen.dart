import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';
import 'create_review_screen.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  static const String name = "/reviews";

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text("Reviews")),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ReviewCard(
                    reviewText: "Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator",
                    name: 'Md Shafin',
                  );
                },
              ),
            ),
          ),
          Container(
            padding: .all(16),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withAlpha(50),
              borderRadius: .only(
                topRight: .circular(16),
                topLeft: .circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Reviews (1000)",
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: .w400,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                FloatingActionButton(
                  backgroundColor: AppColors.themeColor,
                  shape: RoundedRectangleBorder(borderRadius: .circular(50)),
                  onPressed: () {
                    Navigator.pushNamed(context, CreateReviewScreen.name);
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    fontWeight: .bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String name;
  final String reviewText;

  const ReviewCard({super.key, required this.name, required this.reviewText});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      // Subtle shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      color: Colors.white,
      shadowColor: AppColors.themeColor.withAlpha(50),
      margin: const EdgeInsets.only(bottom: 16),
      // Space between cards
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row: Avatar and Name
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.grey.withAlpha(40),
                  child: Icon(
                    Icons.person_outline_outlined,
                    size: 20,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withAlpha(155),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Review Body Text
            Text(
              reviewText,
              textAlign: .justify,
              style: TextStyle(
                fontSize: 14,
                height: 1.4, // Line height for better readability
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
