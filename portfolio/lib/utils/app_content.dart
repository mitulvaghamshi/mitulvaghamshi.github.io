import 'package:flutter/material.dart';

typedef UrlPair = ({String url, String value});

typedef EduPair = ({
  String url,
  String name,
  String year,
  String major,
  String address,
});

@immutable
mixin AppContent {
  static String get introText => _introText;
  static String get wesBadgeUrl => _wesBadgeUrl;
  static String get wesReportUrl => _wesReportUrl;
  static String get githubApiUrl => _githubApiUrl;

  static Iterable<UrlPair> get socialLinks => _socialLinks;
  static Iterable<UrlPair> get footerLinks => _footerLinks;
  static Iterable<EduPair> get educationLinks => _educationLinks;

  static String buildSVG({required Color color, required String data}) =>
      '<svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">'
      '<path fill="#${color.toARGB32().toRadixString(16).substring(2)}" '
      'd="$data"/></svg>';
}

const _githubApiUrl = 'https://api.github.com/users/mitulvaghamshi/repos';

const _wesBadgeUrl =
    'https://www.credly.com/badges/b78c680a-1a8b-49df-a97d-cf08ef481db9';

const _wesReportUrl =
    'https://badges.wes.org/Evidence?type=ca&i=3794f10a-19b3-47f0-82bd-393315bc6584';

const _introText =
    '''Software Developer with 4+ years of hands-on experience in cross-platform development, backend engineering, and technical support. Strong grounding in object-oriented programming, clean code principles, and modern development frameworks. Known for delivering scalable solutions, resolving complex technical issues, and collaborating effectively in agile environments. Passionate about innovation, continuous learning, and creating user-centric applications.''';

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
    url: 'https://discord.com/users/768229336053973043',
    value:
        'M20.317 4.3698a19.7913 19.7913 0 00-4.8851-1.5152.0741.0741 0 00-.0785.0371c-.211.3753-.4447.8648-.6083 1.2495-1.8447-.2762-3.68-.2762-5.4868 0-.1636-.3933-.4058-.8742-.6177-1.2495a.077.077 0 00-.0785-.037 19.7363 19.7363 0 00-4.8852 1.515.0699.0699 0 00-.0321.0277C.5334 9.0458-.319 13.5799.0992 18.0578a.0824.0824 0 00.0312.0561c2.0528 1.5076 4.0413 2.4228 5.9929 3.0294a.0777.0777 0 00.0842-.0276c.4616-.6304.8731-1.2952 1.226-1.9942a.076.076 0 00-.0416-.1057c-.6528-.2476-1.2743-.5495-1.8722-.8923a.077.077 0 01-.0076-.1277c.1258-.0943.2517-.1923.3718-.2914a.0743.0743 0 01.0776-.0105c3.9278 1.7933 8.18 1.7933 12.0614 0a.0739.0739 0 01.0785.0095c.1202.099.246.1981.3728.2924a.077.077 0 01-.0066.1276 12.2986 12.2986 0 01-1.873.8914.0766.0766 0 00-.0407.1067c.3604.698.7719 1.3628 1.225 1.9932a.076.076 0 00.0842.0286c1.961-.6067 3.9495-1.5219 6.0023-3.0294a.077.077 0 00.0313-.0552c.5004-5.177-.8382-9.6739-3.5485-13.6604a.061.061 0 00-.0312-.0286zM8.02 15.3312c-1.1825 0-2.1569-1.0857-2.1569-2.419 0-1.3332.9555-2.4189 2.157-2.4189 1.2108 0 2.1757 1.0952 2.1568 2.419 0 1.3332-.9555 2.4189-2.1569 2.4189zm7.9748 0c-1.1825 0-2.1569-1.0857-2.1569-2.419 0-1.3332.9554-2.4189 2.1569-2.4189 1.2108 0 2.1757 1.0952 2.1568 2.419 0 1.3332-.946 2.4189-2.1568 2.4189Z',
  ),
  (
    url: 'https://api.whatsapp.com/send?phone=919725930783',
    value:
        'm17.5 14.4-2-1c-.3 0-.5-.1-.7.2l-1 1.1c-.1.2-.3.3-.6.1-.3-.1-1.3-.5-2.4-1.5a9 9 0 0 1-1.7-2c-.1-.3 0-.5.2-.6l.4-.6c.2-.1.2-.3.3-.5v-.5L9 7c-.2-.6-.4-.5-.6-.5h-.6a1 1 0 0 0-.8.4c-.2.3-1 1-1 2.5 0 1.4 1 2.8 1.2 3 .2.2 2.1 3.2 5.1 4.5l1.7.6a4 4 0 0 0 1.9.2c.5-.1 1.7-.8 2-1.5.2-.7.2-1.2.1-1.4l-.5-.3M12 21.8a9.9 9.9 0 0 1-5-1.4l-.3-.2-3.8 1 1-3.7-.2-.3a9.9 9.9 0 0 1-1.5-5.3 9.9 9.9 0 0 1 16.8-7 9.8 9.8 0 0 1 3 7 10 10 0 0 1-10 9.9m8.5-18.3A11.8 11.8 0 0 0 12 0 12 12 0 0 0 1.7 17.8L.1 24l6.3-1.7a11.9 11.9 0 0 0 5.6 1.5 12 12 0 0 0 12-11.9 11.8 11.8 0 0 0-3.5-8.4Z',
  ),
  (
    url: 'tel:12899330783',
    value:
        'M7.7 1.2A1.9 1.9 0 0 0 5.5 0L1.4 1A1.9 1.9 0 0 0 0 3a21 21 0 0 0 21 21 2 2 0 0 0 1.8-1.4l1.1-4.1a1.9 1.9 0 0 0-1-2.2l-4.6-2a1.9 1.9 0 0 0-2.1.6l-2 2.3a15.9 15.9 0 0 1-7.4-7.5L9 7.8c.6-.5.8-1.4.5-2.1L7.7 1.2zm0 0',
  ),
  // (
  //   url: 'https://www.linkedin.com/in/mitulvaghamshi',
  //   value:
  //       'M20.4 20.5H17v-5.6c0-1.3 0-3-1.9-3-1.8 0-2 1.4-2 2.9v5.7H9.3V9h3.4v1.6c.5-1 1.6-1.9 3.4-1.9 3.6 0 4.2 2.4 4.2 5.5v6.3zm-15-13a2 2 0 1 1 0-4.2 2 2 0 0 1 0 4.1zm1.7 13H3.6V9H7v11.5zM22.2 0H1.8C.8 0 0 .8 0 1.7v20.6c0 1 .8 1.7 1.8 1.7h20.4c1 0 1.8-.8 1.8-1.7V1.7c0-1-.8-1.7-1.8-1.7z',
  // ),
];

const _host = 'https://mitulvaghamshi.github.io';

const _footerLinks = [
  (url: '$_host/resume/resume.pdf', value: 'Download resume'),
  (url: '$_host/resume' /*      */, value: 'Html version'),
  (url: '$_host/resume/policy.html', value: 'Privacy policy'),
];

const _educationLinks = [
  (
    url: 'https://www.mohawkcollege.ca',
    name: 'Mohawk College',
    year: 'Jan 2020 - Dec 2021 - (2yr)',
    major: 'Computer System Technician',
    address: 'Hamilton, Ontario, Canada',
  ),
  (
    url: 'https://www.aij.ind.in',
    name: 'Amrut Institute',
    year: 'Jun 2014 - May 2017 - (3yr)',
    major: 'Diploma in Computer Engineering',
    address: 'Junagadh, Gujarat, India',
  ),
];
