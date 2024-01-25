class DASS21Question {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final String question;
  List<Option> options;
  Map<String, bool>
      category; // 's' for stress, 'a' for anxiety, 'd' for depression
  int selectedOptionIndex;

  DASS21Question(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.description,
      required this.question,
      required this.options,
      required this.category,
      required this.selectedOptionIndex});
}

class Option {
  final String text;
  final Map<String, int>
      points; // 's' for stress, 'a' for anxiety, 'd' for depression

  Option({
    required this.text,
    required this.points,
  });
}

class DASS21Model {
  final List<DASS21Question> questions;

  DASS21Model({required this.questions});

  Map<String, int> calculateScores() {
    Map<String, int> scores = {"s": 0, "a": 0, "d": 0};
    for (var question in questions) {
      if (question.selectedOptionIndex >= 0) {
        scores[question.category.keys.first] =
            (scores[question.category] ?? 0) + question.selectedOptionIndex;
      }
    }
    return scores;
  }

  Map<String, String> getFeedback() {
    Map<String, int> scores = calculateScores();
    Map<String, String> feedback = {
      "s": "Normal",
      "a": "Normal",
      "d": "Normal",
    };

    if (scores["s"] != null) {
      if (scores["s"]! >= 14) {
        feedback["s"] = "Severe";
      } else if (scores["s"]! >= 10) {
        feedback["s"] = "Moderate";
      } else if (scores["s"]! >= 8) {
        feedback["s"] = "Mild";
      }
    }

    if (scores["a"] != null) {
      if (scores["a"]! >= 20) {
        feedback["a"] = "Severe";
      } else if (scores["a"]! >= 15) {
        feedback["a"] = "Moderate";
      } else if (scores["a"]! >= 8) {
        feedback["a"] = "Mild";
      }
    }

    if (scores["d"] != null) {
      if (scores["d"]! >= 21) {
        feedback["d"] = "Severe";
      } else if (scores["d"]! >= 15) {
        feedback["d"] = "Moderate";
      } else if (scores["d"]! >= 8) {
        feedback["d"] = "Mild";
      }
    }

    return feedback;
  }
}
