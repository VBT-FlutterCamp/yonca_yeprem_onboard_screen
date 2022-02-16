class OnboardModel {
  String title;
  String description;
  String image;
  OnboardModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

List<OnboardModel> onboardItems = [
  OnboardModel(
      title: 'Symptoms of Covid-19',
      description:
          'COVID-19 afects different people in different ways. Most infected people will develop miid to moderote illness.',
      image: 'assets/images/symptoms.png'),
  OnboardModel(
      title: 'COVID-19 Information',
      description:
          'Most people who fall sick with COVID-19 will experience miid to moderote symptoms.',
      image: 'assets/images/info.png'),
  OnboardModel(
      title: 'Just Stay at Home',
      description:
          'Stay at home the to self quarantine ourself from Covid-19, hopefully everything gonna be fine soon.',
      image: 'assets/images/stay_home.png')
];
