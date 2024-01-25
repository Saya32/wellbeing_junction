class GAD7Question {
  final String id;
  final String question;
  final List<String> options = ["Not at all", "Several days", "More than half the days", "Nearly every day"];
  int selectedOptionIndex = -1;

  GAD7Question({
    required this.id,
    required this.question,
  });
}

class GAD7Model {
  final List<GAD7Question> questions;

  GAD7Model({required this.questions});

  int calculateScore() {
    int totalScore = 0;
    for (var question in questions) {
      if (question.selectedOptionIndex >= 0) {
        totalScore += question.selectedOptionIndex;
      }
    }
    return totalScore;
  }

  String getFeedback() {
    int totalScore = calculateScore();
    if (totalScore >= 0 && totalScore <= 4) {
      return "Minimal anxiety";
    } else if (totalScore >= 5 && totalScore <= 9) {
      return "Mild anxiety";
    } else if (totalScore >= 10 && totalScore <= 14) {
      return "Moderate anxiety";
    } else {
      return "Severe anxiety";
    }
  }
}
