import 'package:crafty_bay/features/review/presentation/screens/reviews_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/extensions/localization_extension.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});

  static const String name = "/create-review";

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Review"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              SizedBox(height: 16,),
              TextFormField(
                autovalidateMode: .onUserInteraction,
                textInputAction: .next,
                decoration: InputDecoration(
                  hintText: context.localizations.firstName,
                ),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return context.localizations.cannotBeEmpty;
                  }
                  return null;
                },
              ),
              TextFormField(
                autovalidateMode: .onUserInteraction,
                textInputAction: .next,
                decoration: InputDecoration(
                  hintText: context.localizations.lastName,
                ),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return context.localizations.cannotBeEmpty;
                  }
                  return null;
                },
              ),
              TextFormField(
                maxLines: 10,
                autovalidateMode: .onUserInteraction,
                textInputAction: .done,
                decoration: InputDecoration(
                  hintText: context.localizations.writeReview,
                ),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return context.localizations.cannotBeEmpty;
                  }
                  return null;
                },
              ),
              FilledButton(onPressed: (){
                Navigator.pushNamed(context, ReviewsScreen.name);
              }, child: Text("Submit")),
            ],
          ),
        ),
      ),
    );
  }
}
