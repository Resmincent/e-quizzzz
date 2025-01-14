class QuizQuestions {
  const QuizQuestions({required this.text, required this.answers});

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswer() {
    final shuffledList = List.of(answers);

    shuffledList.shuffle();

    return shuffledList;
  }
}
