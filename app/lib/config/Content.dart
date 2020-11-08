// Defined here is the content.
//
// Things such as text and images etc. should be added here and referenced.

class Content {
  ///// LOADING

  // loading page text
  static const String LOADING_LINE_1 =
      'The appartion of these faces in the crowd:';
  static const String LOADING_LINE_2 = 'Petals on a wet, black bough.';

  ///// HEADER

  // The header menu link title for work/projects
  static const String HEADER_WORK = 'Work';

  // The header menu link title for studio
  static const String HEADER_STUDIO = 'Studio';

  ///// STUDIO

  // The studio email address
  static const String STUDIO_EMAIL = 'work@imagistlondon.com';

  // The studio phone number
  static const String STUDIO_PHONE = '+44 (0)20 7650 7819';

  // The studio address
  static const String STUDIO_ADDRESS = '3 Cranmer Road London SW9 6EJ';
  static const String STUDIO_ADDRESS_GOOGLE_MAPS =
      'https://www.google.com/maps/place/3+Cranmer+Rd,+Vassal,+London+SW9+6EJ,+UK';

  // The studio instagram username
  static const String STUDIO_INSTAGRAM = 'imagistlondon';

  // The studio about section
  static const String STUDIO_ABOUT_TITLE = 'About:';
  static const String STUDIO_ABOUT = 'We\'re a small studio. ' +
      'Four designers, one project manager, one strategist. ' +
      'While fully aware that it\'s modish to say so, we\'re more family than colleagues. ' +
      'Quite literally. ' +
      'Two of us are related, three are close friends from childhood and the latest addition just slot right in. ' +
      'One of the benefits that comes with knowign each other so well is that we can be truly ourselves together. ' +
      'If you want to talk about the mrit of identity, try working on a team of size incredibly different individuals who don\'t have to pretend to be anything they\'re not. ' +
      'It can get messy sometimes (as with all families), but everyone has something entirely unique to offer - and the blend of these distinct personalities is magical.';

  // The studio process section
  static const String STUDIO_PROCESS_TITLE = 'Process:';
  static const String STUDIO_PROCESS = 'We\'re passionate, curious and meticulous. ' +
      'We hold ourselves to extremely high standards. ' +
      'We\'re sassy and irreverent (mostly with each other). ' +
      'We laugh - a lot. ' +
      'We care deeply about our clients and take pride in our long-standing relationships with them. ' +
      'We\'re all geeky about the things we love, but respected for it. We have excellent taste. ' +
      'We\'re humble. ' +
      'We travel through design. ' +
      'It allows us to step into so many worlds, to walk in other people\'s shoes and live someone else\'s passions, through our own.';

  // The prefix text for copyright in the footer of the Studio widget
  static const String STUDIO_COPYRIGHT_PREFIX = 'Copyright © ';

  // The Terms & Conditions
  static const String STUDIO_TERMS_TITLE = 'Terms';

  // TERMS

  static const String TERMS =
      'These are the terms. These are the terms. These are the terms. \n\n' +
          'These are the terms. These are the terms. These are the terms. These are the terms. These are the terms. These are the terms. These are the terms. These are the terms. These are the terms. These are the terms. These are the terms. ';

  ///// PROJECTS

  static const List<Project> PROJECTS = [
    Project(
        key: 'hemsley_and_hemsley',
        home: true,
        showcase: true,
        archive: false,
        title: 'Hemsley & Hemsley',
        imageThumb: 'assets/THUMB_HH_1.jpg',
        description: 'Indoi is a new women\'s fashion house, founded by Mallika Chaudhuri. ' +
            'The brand began as a collaboration between Mallika and her aunt, Maheen Khan - a prominent Pakistani fashion designer with over 50 year\'s experience, who is known as the \'Coco Chanel of the East\'.' +
            '\n\nMallika and Maheen are of Iranian descent, with heritage in Burma, India, Pakistan and Bangladesh and the brand name \'Indoi\' comes from an ancient Greek word meaning \'people of the Indus valley\' - the region from which they come. ' +
            'Kindred spirits in family and fashion, they share a vision for Indoi which is inspired by the cultures, stories and relationships they share.',
        studyImages: [
          ProjectStudyImage(url: 'assets/THUMB_HH_1.jpg'),
          ProjectStudyImage(url: 'assets/THUMB_HUN_1.jpg'),
          ProjectStudyImage(url: 'assets/THUMB_STRAZ_1.jpg')
        ],
        tags: [
          'Elegant',
          'Smart'
        ]),
    Project(
        key: 'the_hundred',
        home: true,
        showcase: true,
        archive: false,
        title: 'The Hundred',
        imageThumb: 'assets/THUMB_HUN_1.jpg',
        tags: ['Smart']),
    Project(
        key: 'strazzanti',
        home: true,
        showcase: true,
        archive: false,
        title: 'Strazzanti',
        imageThumb: 'assets/THUMB_STRAZ_1.jpg',
        tags: ['Modern', 'Italian']),
    Project(
        key: 'indoi',
        home: true,
        showcase: true,
        archive: false,
        title: 'Indoi',
        imageThumb: 'assets/THUMB_INDOI_1.jpg',
        description: 'Indoi is a new women\'s fashion house, founded by Mallika Chaudhuri. ' +
            'The brand began as a collaboration between Mallika and her aunt, Maheen Khan - a prominent Pakistani fashion designer with over 50 year\'s experience, who is known as the \'Coco Chanel of the East\'.' +
            '\n\nMallika and Maheen are of Iranian descent, with heritage in Burma, India, Pakistan and Bangladesh and the brand name \'Indoi\' comes from an ancient Greek word meaning \'people of the Indus valley\' - the region from which they come. ' +
            'Kindred spirits in family and fashion, they share a vision for Indoi which is inspired by the cultures, stories and relationships they share.',
        studyImages: [
          ProjectStudyImage(url: 'assets/THUMB_HH_1.jpg'),
          ProjectStudyImage(url: 'assets/THUMB_HUN_1.jpg'),
          ProjectStudyImage(url: 'assets/THUMB_INDOI_1.jpg')
        ],
        tags: [
          'Classic'
        ]),
    Project(
        key: 'nike',
        showcase: true,
        archive: false,
        title: 'Nike',
        imageThumb: 'assets/THUMB_NIKE_1.jpg',
        tags: ['Classic']),
    Project(
        key: 'coal_drops_yard',
        showcase: true,
        archive: false,
        title: 'Coal Drops Yard',
        imageThumb: 'assets/THUMB_CDY_1.jpg',
        tags: []),
    Project(
        key: 'wahaca',
        showcase: true,
        archive: false,
        title: 'Wahaca',
        imageThumb: 'assets/THUMB_WAHACA_1.jpg',
        tags: ['Shop']),
    Project(
        key: 'taskfeed',
        showcase: true,
        archive: false,
        title: 'Taskfeed',
        imageThumb: 'assets/THUMB_TASKFEED_1.jpg',
        tags: ['App']),
    Project(
        key: 'the_barbican',
        showcase: false,
        archive: true,
        title: 'The Barbican',
        subtitle: 'Everything you ever wanted to know',
        year: '2014',
        imageThumb: 'assets/ARCHIVE_BARBICAN_THUMB.gif',
        tags: ['Transportation']),
    Project(
        key: 'b_and_a',
        showcase: false,
        archive: true,
        title: 'B+A',
        subtitle: 'Finding order in the unpredictable',
        year: '2015-',
        imageThumb: 'assets/ARCHIVE_B+A_THUMB.gif',
        tags: ['Marketing']),
    Project(
        key: 'parfin',
        showcase: false,
        archive: true,
        title: 'Parfin',
        subtitle: 'Empowering opportunites',
        year: '2019',
        imageThumb: 'assets/ARCHIVE_PARFIN_THUMB.png',
        tags: []),
    Project(
        key: 'de_la_rue',
        showcase: false,
        archive: true,
        title: 'De La Rue',
        subtitle: 'Complexity simplified',
        year: '2014-',
        imageThumb: 'assets/ARCHIVE_DLR_THUMB.gif',
        tags: []),
    Project(
        key: 'radio_hair_salon_x_redken',
        showcase: false,
        archive: true,
        title: 'Radio Hair Salon x Redken',
        subtitle: 'Blonde, bronde and beyond',
        year: '2018',
        imageThumb: 'assets/ARCHIVE_RADIO_THUMB.png',
        tags: ['New York']),
    Project(
        key: 'sacca',
        showcase: false,
        archive: true,
        title: 'Sacca',
        subtitle: 'Japan in the heart of ibiza',
        year: '2014',
        imageThumb: 'assets/ARCHIVE_SACCA_THUMB.jpg',
        tags: ['London']),
    Project(
        key: 'manifesto',
        showcase: false,
        archive: true,
        title: 'Manifesto',
        subtitle: 'Constructing the modern man',
        year: '2015',
        imageThumb: 'assets/ARCHIVE_MANIFESTO_THUMB.jpg',
        tags: ['Design']),
    Project(
        key: 'artificial_artists',
        showcase: false,
        archive: true,
        title: 'Artifical Artists',
        subtitle: 'Liberating creativty through technology',
        year: '2018',
        imageThumb: 'assets/ARCHIVE_AA_THUMB.jpg',
        tags: ['Retail']),
    Project(
        key: 'radio_hair_salon',
        showcase: false,
        archive: true,
        title: 'Radio Hair Salon',
        subtitle: 'Turn up the volume',
        year: '2014',
        imageThumb: 'assets/ARCHIVE_RADIO_2_THUMB.jpg',
        tags: ['Politics']),
    Project(
        key: 'thomson_and_scott',
        showcase: false,
        archive: true,
        title: 'Thomson & Scott',
        subtitle: 'Pure luxury',
        year: '2018',
        imageThumb: 'assets/ARCHIVE_TS_THUMB.jpg',
        tags: ['Fashion']),
  ];
}

class Project {
  final String key;
  // show in Home
  final bool home;
  // show in Showcase
  final bool showcase;
  // show in Archive
  final bool archive;
  final String title;
  final String subtitle;
  final String year;
  final String imageThumb;
  final String description;
  final List<ProjectStudyImage> studyImages;
  final List<String> tags;

  const Project(
      {this.key,
      this.home = false,
      this.showcase = false,
      this.archive = true,
      this.title = 'Title',
      this.subtitle = 'Subtitle',
      this.year = '2020',
      this.imageThumb,
      this.description = 'Description',
      this.studyImages,
      this.tags});
}

class ProjectStudyImage {
  final String url;

  const ProjectStudyImage({this.url});
}
