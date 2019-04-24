
class Comment{
  final String user;
  final String date;
  final String userImg ;
  final String desc;

  Comment({this.user, this.date, this.userImg, this.desc});
}

final lebronComments = [
  Comment(
    user: 'Papa Gray',
    date: '12th Feb 2019',
    desc: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley',
    userImg: ''
  ),
  Comment(
    user: 'Martin Summers',
    date: '14th Feb 2019',
    desc: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley',
    userImg: ''
  ),
  Comment(
    user: 'Mathilda Glen',
    date: '15th Feb 2019',
    desc: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley',
    userImg: ''
  ),
];

final airmaxComments = lebronComments;
final bladeComments = lebronComments;
final doublesComments = lebronComments;