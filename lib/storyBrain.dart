import 'story.dart';

class StoryBrain {
  int _storyNum = 0;

  List<Story> _storyData = [
    Story(
        t1: "At the edge of a forgotten forest, beneath the veil of twilight, lies a crossroads obscured by ancient shadows. Here, where the paths diverge, destiny beckons with whispered secrets, offering two choices that will shape the course of your journey.",
        c1: "Follow the leftward path.",
        c2: "Venture along the rightward trail."),
    // Choice 1: Follow the leftward path.
    Story(
        t1: "With cautious steps, you tread the leftward path, the rustle of leaves beneath your feet harmonizing with the murmurs of the forest. In a secluded glade, bathed in moonlight, an enigmatic figure awaits, cloaked in mystery and draped in shadows.",
        c1: "Approach the figure and heed its cryptic words.",
        c2: "Ignore the figure and continue your journey."),
    // Option 1: Approach the figure and heed its cryptic words.
    Story(
      t1: "Drawn by curiosity, you approach the mysterious figure, its eyes gleaming with ancient knowledge. It offers a cryptic prophecy, foretelling of trials and tribulations, yet promising great rewards to those who dare to embrace their destiny.",
      c1: "",
      c2: "",
    ),
    // Option 2: Ignore the figure and continue your journey.
    Story(
      t1: "With resolve in your heart, you choose to ignore the mysterious figure, pressing onward with determination. Though its words linger in the recesses of your mind, you remain steadfast in your quest, undeterred by the veiled warnings of fate.",
      c1: "",
      c2: "",
    ),
    // Choice 2: Venture along the rightward trail.
    Story(
        t1: "Embracing the unknown you set forth upon the rightward trail guided by the ethereal glow that dances among the trees. In a clearing bathed in starlight you encounter a shimmering pool its surface reflecting the myriad hues of the night sky.",
        c1: "Peer into the depths of the pool and seek its wisdom.",
        c2: "Pass by the pool and continue your journey."),
    // Option 1: Peer into the depths of the pool and seek its wisdom.
    Story(
        t1: "With a sense of reverence, you gaze into the depths of the shimmering pool, where ripples of insight reveal glimpses of the past, present, and future. Within its watery embrace, you find clarity and understanding, as the mysteries of the cosmos unfold before your eyes.",
        c1: "",
        c2: ""),
    // Option 2: Pass by the pool and continue your journey.
    Story(
        t1: "Resisting the allure of the mysterious pool, you choose to press onward, your focus unwavering as you navigate the winding paths of the forest. Though the whispers of the night beckon you to linger, you remain steadfast in your pursuit, determined to carve your own path through the enigmatic depths of the crossroads.",
        c1: "",
        c2: ""),
  ];

  void nextStory(int choiceNum) {
    Map<int, Map<int, int>> storyMap = {
      0: {1: 1, 2: 4},
      1: {1: 2, 2: 3},
      4: {1: 5, 2: 6}
    };

    if (storyMap.containsKey(_storyNum)) {
      Map<int, int> choices = storyMap[_storyNum]!;
      if (choices.containsKey(choiceNum)) {
        _storyNum = choices[choiceNum]!;
      }
    } else {
      resetStory();
    }
  }

  void resetStory() {
    _storyNum = 0;
  }

  String getStoryText() {
    return _storyData[_storyNum].storyText;
  }

  String getChoice1() {
    return _storyData[_storyNum].choice1;
  }

  String getChoice2() {
    return _storyData[_storyNum].choice2;
  }
}
