class questiondatamodel {
  const questiondatamodel(this.question, this.answers);
  final String question;
  final List<String> answers;

  List<String> getShuffleAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}