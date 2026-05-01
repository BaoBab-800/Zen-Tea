import 'tea_model.dart';
import 'tea_types.dart';

final List<TeaModel> listOfTeas = [
  TeaModel(
    type: TeaType.blackTea,
    imagePath: 'assets/teas/black_tea.jpg',
    storyKey: 'blackTeaStory',
    url: Uri.parse('https://en.wikipedia.org/wiki/Black_tea'),
    timesServed: 0,
    isUnlocked: false,
  ),

  TeaModel(
    type: TeaType.greenTea,
    imagePath: 'assets/teas/green_tea.jpg',
    storyKey: 'greenTeaStory',
    url: Uri.parse('https://en.wikipedia.org/wiki/Green_tea'),
    timesServed: 0,
    isUnlocked: false,
  ),

  TeaModel(
    type: TeaType.earlGreyTea,
    imagePath: 'assets/teas/earl_grey_tea.jpg',
    storyKey: 'earlGreyTeaStory',
    url: Uri.parse('https://en.wikipedia.org/wiki/Earl_Grey_tea'),
    timesServed: 0,
    isUnlocked: false,
  ),

  TeaModel(
    type: TeaType.masalaTea,
    imagePath: 'assets/teas/masala_tea.jpg',
    storyKey: 'masalaTeaStory',
    url: Uri.parse('https://en.wikipedia.org/wiki/Masala_chai'),
    timesServed: 0,
    isUnlocked: false,
  ),

  TeaModel(
    type: TeaType.matchaTea,
    imagePath: 'assets/teas/matcha_tea.jpg',
    storyKey: 'matchaTeaStory',
    url: Uri.parse('https://en.wikipedia.org/wiki/Matcha'),
    timesServed: 0,
    isUnlocked: false,
  ),

  TeaModel(
    type: TeaType.jasmineTea,
    imagePath: 'assets/teas/jasmine_tea.jpg',
    storyKey: 'jasmineTeaStory',
    url: Uri.parse('https://en.wikipedia.org/wiki/Jasmine_tea'),
    timesServed: 0,
    isUnlocked: false,
  ),
];