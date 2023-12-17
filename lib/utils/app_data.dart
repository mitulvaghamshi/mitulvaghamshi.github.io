import 'package:flutter/material.dart';

typedef Deux = ({String url, String value});

typedef Cinq = ({
  String url,
  String name,
  String year,
  String major,
  String address,
});

@immutable
mixin AppData {
  static String get introText => _introText;
  static String get wesBadgeUrl => _wesBadgeUrl;
  static String get wesReportUrl => _wesReportUrl;
  static String get githubApiUrl => _githubApiUrl;

  static Iterable<Deux> get socialLinks => _socialLinks;
  static Iterable<Deux> get footerLinks => _footerLinks;
  static Iterable<Cinq> get educationLinks => _educationLinks;

  static String buildSVG({
    required final Color color,
    required final String pathData,
  }) {
    final hexColor = color.value.toRadixString(16).substring(2);

    return '<svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">'
        '<path fill="#$hexColor" d="$pathData"/></svg>';
  }
}

const _githubApiUrl = 'https://api.github.com/users/mitulvaghamshi/repos';

const _wesBadgeUrl =
    'https://www.credly.com/badges/b78c680a-1a8b-49df-a97d-cf08ef481db9';

const _wesReportUrl =
    'https://badges.wes.org/Evidence?type=ca&i=3794f10a-19b3-47f0-82bd-393315bc6584';

// Seeking a challenging role in a growth-oriented environment to leverage my expertise in Computer Programming, Data Analysis, and Project Management.  Eager to learn, adaptable, and a proven problem-solver.
const _introText = '''
Software developer with expertise in CS and software engineering principles.
Proficient in various programming languages and committed to writing clean, well-documented code.
Passionate about staying current with industry trends and driving innovation.
Eager to collaborate and contribute to successful projects.''';

const _socialLinks = [
  (
    url: 'mailto:mitulvaghmashi@gmail.com',
    value:
        'M24 5.5v13.9c0 .9-.7 1.6-1.6 1.6h-3.9v-9.3l-6.5 5-6.5-5V21H1.6A1.6 1.6 0 0 1 0 19.4v-14c0-2 2.3-3.1 4-2l1.5 1.2 6.5 5 6.5-5 1.6-1.1c1.6-1.2 3.9 0 3.9 2z',
  ),
  (
    url: 'https://github.com/mitulvaghamshi',
    value:
        'M12 .3a12 12 0 0 0-3.8 23.4c.6.1.8-.3.8-.6v-2c-3.3.7-4-1.6-4-1.6-.6-1.4-1.4-1.8-1.4-1.8-1-.7.1-.7.1-.7 1.2 0 1.9 1.2 1.9 1.2 1 1.8 2.8 1.3 3.5 1 0-.8.4-1.3.7-1.6-2.7-.3-5.5-1.3-5.5-6 0-1.2.5-2.3 1.3-3.1-.2-.4-.6-1.6 0-3.2 0 0 1-.3 3.4 1.2a11.5 11.5 0 0 1 6 0c2.3-1.5 3.3-1.2 3.3-1.2.6 1.6.2 2.8 0 3.2a4 4 0 0 1 1.3 3.2c0 4.6-2.8 5.6-5.5 5.9.5.4.9 1 .9 2.2v3.3c0 .3.1.7.8.6A12 12 0 0 0 12 .3',
  ),
  (
    url: 'https://www.linkedin.com/in/mitulvaghamshi',
    value:
        'M20.4 20.5H17v-5.6c0-1.3 0-3-1.9-3-1.8 0-2 1.4-2 2.9v5.7H9.3V9h3.4v1.6c.5-1 1.6-1.9 3.4-1.9 3.6 0 4.2 2.4 4.2 5.5v6.3zm-15-13a2 2 0 1 1 0-4.2 2 2 0 0 1 0 4.1zm1.7 13H3.6V9H7v11.5zM22.2 0H1.8C.8 0 0 .8 0 1.7v20.6c0 1 .8 1.7 1.8 1.7h20.4c1 0 1.8-.8 1.8-1.7V1.7c0-1-.8-1.7-1.8-1.7z',
  ),
  (
    url: 'https://api.whatsapp.com/send?phone=12899330783',
    value:
        'm17.5 14.4-2-1c-.3 0-.5-.1-.7.2l-1 1.1c-.1.2-.3.3-.6.1-.3-.1-1.3-.5-2.4-1.5a9 9 0 0 1-1.7-2c-.1-.3 0-.5.2-.6l.4-.6c.2-.1.2-.3.3-.5v-.5L9 7c-.2-.6-.4-.5-.6-.5h-.6a1 1 0 0 0-.8.4c-.2.3-1 1-1 2.5 0 1.4 1 2.8 1.2 3 .2.2 2.1 3.2 5.1 4.5l1.7.6a4 4 0 0 0 1.9.2c.5-.1 1.7-.8 2-1.5.2-.7.2-1.2.1-1.4l-.5-.3M12 21.8a9.9 9.9 0 0 1-5-1.4l-.3-.2-3.8 1 1-3.7-.2-.3a9.9 9.9 0 0 1-1.5-5.3 9.9 9.9 0 0 1 16.8-7 9.8 9.8 0 0 1 3 7 10 10 0 0 1-10 9.9m8.5-18.3A11.8 11.8 0 0 0 12 0 12 12 0 0 0 1.7 17.8L.1 24l6.3-1.7a11.9 11.9 0 0 0 5.6 1.5 12 12 0 0 0 12-11.9 11.8 11.8 0 0 0-3.5-8.4Z',
  ),
  (
    url: 'tel:12899330783',
    value:
        'M7.7 1.2A1.9 1.9 0 0 0 5.5 0L1.4 1A1.9 1.9 0 0 0 0 3a21 21 0 0 0 21 21 2 2 0 0 0 1.8-1.4l1.1-4.1a1.9 1.9 0 0 0-1-2.2l-4.6-2a1.9 1.9 0 0 0-2.1.6l-2 2.3a15.9 15.9 0 0 1-7.4-7.5L9 7.8c.6-.5.8-1.4.5-2.1L7.7 1.2zm0 0',
  ),
];

const _resume = 'https://mitulvaghamshi.github.io/resume';

const _footerLinks = [
  (url: '$_resume/resume.pdf', value: 'Download Resume'),
  (url: _resume, value: 'See Html Version'),
  (url: '$_resume/policy.html', value: 'Privacy Policy'),
];

const _educationLinks = [
  (
    url: 'https://www.mohawkcollege.ca',
    name: 'Mohawk College of Applied Arts & Technology',
    year: 'Jan 2020 - Dec 2021 - (2yr)',
    major: 'Post Secondary Diploma in Software Support',
    address: 'Hamilton, Ontario, Canada',
  ),
  (
    url: 'https://www.aij.ind.in',
    name: 'Amrut Institute of Science & Engineering',
    year: 'Jun 2014 - May 2017 - (3yr)',
    major: 'Advanced Diploma in Computer Engineering',
    address: 'Junagadh, Gujarat, India',
  )
];
