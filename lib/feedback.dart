import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:velocity_x/velocity_x.dart';

class MyFeedback extends StatefulWidget {
  @override
  _MyFeedbackState createState() => _MyFeedbackState();
}

class _MyFeedbackState extends State<MyFeedback> {
  double rating = 0;
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Title(
                color: Colors.red,
                child: _controller.value.text.isEmpty
                    ? "FeedBack".text.xl4.make()
                    : Text("${_controller.value.text}")),
            Center(
              child: SmoothStarRating(
                starCount: 5,
                size: 30,
                color: Colors.red,
                borderColor: Colors.red,
                onRated: (value) {
                  setState(() {
                    rating = value;
                    print("Rating is : $rating");
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                controller: _controller,
                minLines: 2,
                maxLines: 10,
                maxLength: 800,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintText: "Enter your Feed back here...",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))))),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _controller.notifyListeners();
                  });
                },
                child: "Submit".text.make())
          ],
        ),
      ),
    );
  }
}
