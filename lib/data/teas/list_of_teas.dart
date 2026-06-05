import 'tea_model.dart';
import 'tea_types.dart';

final List<TeaModel> listOfTeas = [
  // Common
  TeaModel(
    type: TeaType.blackTea,
    imagePath: 'assets/teas/black_tea.jpg',
    features: TeaFeatures.common,
    country: TeaCountries.china,
    url: Uri.parse('https://en.wikipedia.org/wiki/Black_tea'),
    timesServed: 0,
    isUnlocked: false,
  ),

  TeaModel(
    type: TeaType.greenTea,
    imagePath: 'assets/teas/green_tea.jpg',
    features: TeaFeatures.common,
    country: TeaCountries.china,
    url: Uri.parse('https://en.wikipedia.org/wiki/Green_tea'),
    timesServed: 0,
    isUnlocked: false,
  ),

  TeaModel(
    type: TeaType.earlGreyTea,
    imagePath: 'assets/teas/earl_grey_tea.jpg',
    features: TeaFeatures.common,
    country: TeaCountries.unitedKingdom,
    url: Uri.parse('https://en.wikipedia.org/wiki/Earl_Grey_tea'),
    timesServed: 0,
    isUnlocked: false,
  ),

  TeaModel(
    type: TeaType.masalaTea,
    imagePath: 'assets/teas/masala_tea.jpg',
    features: TeaFeatures.common,
    country: TeaCountries.india,
    url: Uri.parse('https://en.wikipedia.org/wiki/Masala_chai'),
    timesServed: 0,
    isUnlocked: false,
  ),

  TeaModel(
    type: TeaType.matchaTea,
    imagePath: 'assets/teas/matcha_tea.jpg',
    features: TeaFeatures.common,
    country: TeaCountries.japan,
    url: Uri.parse('https://en.wikipedia.org/wiki/Matcha'),
    timesServed: 0,
    isUnlocked: false,
  ),

  TeaModel(
    type: TeaType.jasmineTea,
    imagePath: 'assets/teas/jasmine_tea.jpg',
    features: TeaFeatures.common,
    country: TeaCountries.china,
    url: Uri.parse('https://en.wikipedia.org/wiki/Jasmine_tea'),
    timesServed: 0,
    isUnlocked: false,
  ),

  TeaModel(
    type: TeaType.hibiscusTea,
    imagePath: 'assets/teas/hibiscus_tea.jpg',
    features: TeaFeatures.common,
    country: TeaCountries.egypt,
    url: Uri.parse('https://en.wikipedia.org/wiki/Hibiscus'),
    timesServed: 0,
    isUnlocked: false,
  ),

  TeaModel(
    type: TeaType.whiteTea,
    imagePath: 'assets/teas/white_tea.jpg',
    features: TeaFeatures.common,
    country: TeaCountries.china,
    url: Uri.parse('https://en.wikipedia.org/wiki/White_tea'),
    timesServed: 0,
    isUnlocked: false,
  ),

  TeaModel(
    type: TeaType.mintTea,
    imagePath: 'assets/teas/mint_tea.jpg',
    features: TeaFeatures.common,
    country: TeaCountries.morocco,
    url: Uri.parse('https://en.wikipedia.org/wiki/Mint_tea_(herbal_tea)'),
    timesServed: 0,
    isUnlocked: false,
  ),

  TeaModel(
    type: TeaType.chamomileTea,
    imagePath: 'assets/teas/chamomile_tea.jpg',
    features: TeaFeatures.common,
    country: TeaCountries.egypt,
    url: Uri.parse('https://en.wikipedia.org/wiki/Chamomile'),
    timesServed: 0,
    isUnlocked: false,
  ),

  TeaModel(
    type: TeaType.aniseTea,
    imagePath: 'assets/teas/anise_tea.jpg',
    features: TeaFeatures.common,
    country: TeaCountries.egypt,
    url: Uri.parse('https://en.wikipedia.org/wiki/Anise'),
    timesServed: 0,
    isUnlocked: false,
  ),

  // Rare
  TeaModel(
    type: TeaType.oolongTea,
    imagePath: 'assets/teas/oolong_tea.jpg',
    features: TeaFeatures.rare,
    country: TeaCountries.china,
    url: Uri.parse('https://en.wikipedia.org/wiki/Oolong'),
    timesServed: 0,
    isUnlocked: false,
  ),

  TeaModel(
    type: TeaType.rooibosTea,
    imagePath: 'assets/teas/rooibos_tea.jpg',
    features: TeaFeatures.rare,
    country: TeaCountries.southAfrica,
    url: Uri.parse('https://en.wikipedia.org/wiki/Rooibos'),
    timesServed: 0,
    isUnlocked: false,
  ),

  TeaModel(
    type: TeaType.puerhTea,
    imagePath: 'assets/teas/puerh_tea.jpg',
    features: TeaFeatures.rare,
    country: TeaCountries.china,
    url: Uri.parse('https://en.wikipedia.org/wiki/Pu%27er_tea'),
    timesServed: 0,
    isUnlocked: false,
  ),

  TeaModel(
    type: TeaType.senchaTea,
    imagePath: 'assets/teas/sencha_tea.jpg',
    features: TeaFeatures.rare,
    country: TeaCountries.japan,
    url: Uri.parse('https://en.wikipedia.org/wiki/Sencha'),
    timesServed: 0,
    isUnlocked: false,
  ),
];