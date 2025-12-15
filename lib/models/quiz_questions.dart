class QuizQuestions {
  QuizQuestions(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> shuffledAnswers(){
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;  
  }
}