class Story {
  String storyText;
  String choice1;
  String choice2;
  String choice3;
  Story({this.storyText, this.choice1, this.choice2, this.choice3});

}
class Logic {
  int storyLevel = 0;
  List<Story> storyDB = [

    Story(storyText: 'Your family is in need of money', choice1: "Look Out for a job", choice2: 'Continue your studies and do a part-time job', choice3: 'Ignore your family problem'
    ),
    Story(storyText: 'What kind of job you want', choice1: "Ignore the job", choice2: 'Do a bad job with more salary.', choice3: 'Do a good job with less salary'
    ),
    Story(storyText: 'You are not responsible person',
        choice1: "Restart",
        choice2: '',
        choice3: ''
    ),
    Story(storyText: 'You are not honest person',
        choice1: "Restart",
        choice2: '',
        choice3: ''
    ),
    Story(storyText: 'This is a great option which benefit both your parents and you. ',
        choice1: "Restart",
        choice2: '',
        choice3: ''
    ),
  ];

List getStory() {
  return [storyDB[storyLevel].storyText, storyDB[storyLevel].choice1, storyDB[storyLevel].choice2, storyDB[storyLevel].choice3];

}

void nextStory(int choice) {
  if (choice == 1 && storyLevel == 0) {
    storyLevel = 1;
  } else if (choice == 2 && storyLevel == 0) {
    storyLevel = 4;
  } else if (choice == 3 && storyLevel == 0) {
    storyLevel = 2;
  }else if (choice == 1 && storyLevel == 1) {
    storyLevel = 2;
  }else if (choice == 2 && storyLevel == 1) {
    storyLevel = 3;
  }else if (choice == 3 && storyLevel == 1) {
    storyLevel = 4;
  } else if (storyLevel >= 2) {
    restartGame();
  }

}
void restartGame() {
  storyLevel = 0;
}
bool isVisible() {
  if (storyLevel >= 2) {
    return false;
  } else {
    return true;
  }
}
}