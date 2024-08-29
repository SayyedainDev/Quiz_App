class QuizQuestion {
  QuizQuestion(this.Text, this.Answers);
  final String Text;
  final List<String> Answers;

  List<String> getshuffeldAnswer() {
    final shuffeld_list = List.of(Answers);
    shuffeld_list.shuffle();
    return shuffeld_list;
  }
}
