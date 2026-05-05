import 'tea_model.dart';
import 'tea_types.dart';

final List<TeaModel> listOfTeas = [
  TeaModel(
    type: TeaType.blackTea,
    imagePath: 'assets/teas/black_tea.jpg',
    storyKey: 'blackTeaStory',
    features: TeaFeatures.common,
    url: Uri.parse('https://en.wikipedia.org/wiki/Black_tea'),
    timesServed: 0,
    isUnlocked: false,
  ),

  TeaModel(
    type: TeaType.greenTea,
    imagePath: 'assets/teas/green_tea.jpg',
    storyKey: 'greenTeaStory',
    features: TeaFeatures.common,
    url: Uri.parse('https://en.wikipedia.org/wiki/Green_tea'),
    timesServed: 0,
    isUnlocked: false,
  ),

  TeaModel(
    type: TeaType.earlGreyTea,
    imagePath: 'assets/teas/earl_grey_tea.jpg',
    storyKey: 'earlGreyTeaStory',
    features: TeaFeatures.common,
    url: Uri.parse('https://en.wikipedia.org/wiki/Earl_Grey_tea'),
    timesServed: 0,
    isUnlocked: false,
  ),

  TeaModel(
    type: TeaType.masalaTea,
    imagePath: 'assets/teas/masala_tea.jpg',
    storyKey: 'masalaTeaStory',
    features: TeaFeatures.common,
    url: Uri.parse('https://en.wikipedia.org/wiki/Masala_chai'),
    timesServed: 0,
    isUnlocked: false,
  ),

  TeaModel(
    type: TeaType.matchaTea,
    imagePath: 'assets/teas/matcha_tea.jpg',
    storyKey: 'matchaTeaStory',
    features: TeaFeatures.common,
    url: Uri.parse('https://en.wikipedia.org/wiki/Matcha'),
    timesServed: 0,
    isUnlocked: false,
  ),

  TeaModel(
    type: TeaType.jasmineTea,
    imagePath: 'assets/teas/jasmine_tea.jpg',
    storyKey: 'jasmineTeaStory',
    features: TeaFeatures.common,
    url: Uri.parse('https://en.wikipedia.org/wiki/Jasmine_tea'),
    timesServed: 0,
    isUnlocked: false,
  ),

  TeaModel(
    type: TeaType.oolongTea,
    imagePath: 'assets/teas/oolong_tea.jpg',
    storyKey: 'oolongTeaStory',
    features: TeaFeatures.rare,
    url: Uri.parse('https://en.wikipedia.org/wiki/Oolong'),
    timesServed: 0,
    isUnlocked: false,
  )
];