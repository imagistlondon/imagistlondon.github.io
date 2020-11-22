// Defined here is the Content
//
// Things such as text and images etc. should be added here and referenced.

import 'dart:collection';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Content {
  static Future<Content> load() async {
    // call
    final String result = (await http.get(
            'https://cors-anywhere.herokuapp.com/http://52.5.4.218/api/getConfig'))
        .body;

    // convert json to map
    final Map map = json.decode(result);

    // init projects
    final List<Project> projects = List();

    // PROJECTS
    if (map['PROJECT-length'] != null) {
      // get length
      final int projectLength = map['PROJECT-length'];

      // loop
      for (int i = 0; i < projectLength; i++) {
        // build prefix
        final String prefix = 'PROJECT-' + i.toString() + '-';

        // init tags
        final List<String> tags = List();

        // load tags
        if (map[prefix + 'TAG-length'] != null) {
          final int tagLength = map[prefix + 'TAG-length'];
          for (int j = 0; j < tagLength; j++) {
            tags.add(map[prefix + 'TAG-' + j.toString() + '-KEY']);
          }
        }

        // init studyImages
        final List<ProjectStudyImage> studyImages = List();

        // load study images
        if (map[prefix + 'STUDY-IMAGE-length'] != null) {
          final int studyImageLength = map[prefix + 'STUDY-IMAGE-length'];
          for (int j = 0; j < studyImageLength; j++) {
            studyImages.add(ProjectStudyImage(
                url: map[prefix + 'STUDY-IMAGE-' + j.toString() + '-URL']));
          }
        }

        // add project
        projects.add(Project(
            key: map[prefix + 'KEY'],
            home: map[prefix + 'HOME'] != null ? map[prefix + 'HOME'] : false,
            showcase: map[prefix + 'SHOWCASE'] != null
                ? map[prefix + 'SHOWCASE']
                : false,
            archive: map[prefix + 'ARCHIVE'] != null
                ? map[prefix + 'ARCHIVE']
                : false,
            title:
                map[prefix + 'TITLE'] != null ? map[prefix + 'TITLE'] : 'Title',
            subtitle: map[prefix + 'SUBTITLE'] != null
                ? map[prefix + 'SUBTITLE']
                : 'Subtitle',
            desc: map[prefix + 'DESC'] != null
                ? map[prefix + 'DESC']
                : 'Description',
            year: map[prefix + 'YEAR'] != null ? map[prefix + 'YEAR'] : '20XX',
            homeImage: map[prefix + 'HOME-IMAGE'] != null
                ? map[prefix + 'HOME-IMAGE']
                : 'assets/placeholder.png',
            showcaseImage: map[prefix + 'SHOWCASE-IMAGE'] != null
                ? map[prefix + 'SHOWCASE-IMAGE']
                : 'assets/placeholder.png',
            archiveImage: map[prefix + 'ARCHIVE-IMAGE'] != null
                ? map[prefix + 'ARCHIVE-IMAGE']
                : 'assets/placeholder.png',
            tagImage: map[prefix + 'TAG-IMAGE'] != null
                ? map[prefix + 'TAG-IMAGE']
                : 'assets/placeholder.png',
            studyImage: map[prefix + 'STUDY-IMAGE'] != null
                ? map[prefix + 'STUDY-IMAGE']
                : 'assets/placeholder.png',
            tags: tags,
            studyImages: studyImages));
      }
    }

    final List<Project> homeProjects =
        projects.where((p) => p.home == true).toList();
    final List<Project> showcaseProjects =
        projects.where((p) => p.showcase == true).toList();
    final List<Project> archiveProjects =
        projects.where((p) => p.archive == true).toList();

    // load tag -> images
    final Set<String> tags = LinkedHashSet();
    final Map<String, Set<String>> tagAssociations = LinkedHashMap();
    final Map<String, Set<String>> tagImages = LinkedHashMap();
    for (final Project project in projects) {
      // skip if no tags
      if (project.tags == null || project.tags.isEmpty) continue;

      // skip also if no image
      if (project.tagImage == null) continue;

      // loop through tags
      for (final String tag in project.tags) {
        // skip if tag not present
        if (tag == null || tag == '') continue;

        // add tag
        tags.add(tag);

        // add empty list for key
        tagAssociations.putIfAbsent(tag, () => new LinkedHashSet());

        // add all other tags as associates
        for (final String _tag in project.tags) {
          if (tag == _tag) continue;
          tagAssociations[tag].add(_tag);
        }

        // add empty list for key
        tagImages.putIfAbsent(tag, () => new LinkedHashSet());

        // add project image thumb
        tagImages[tag].add(project.tagImage);
      }
    }

    return Content(
      LOADING_LINE_1:
          map['LOADING_LINE_1'] != null ? map['LOADING_LINE_1'] : '',
      LOADING_LINE_2:
          map['LOADING_LINE_2'] != null ? map['LOADING_LINE_2'] : '',
      HEADER_WORK: map['HEADER_WORK'] != null ? map['HEADER_WORK'] : 'Work',
      HEADER_STUDIO:
          map['HEADER_STUDIO'] != null ? map['HEADER_STUDIO'] : 'Studio',
      STUDIO_EMAIL: map['STUDIO_EMAIL'] != null ? map['STUDIO_EMAIL'] : 'Email',
      STUDIO_PHONE: map['STUDIO_PHONE'] != null ? map['STUDIO_PHONE'] : 'Phone',
      STUDIO_ADDRESS:
          map['STUDIO_ADDRESS'] != null ? map['STUDIO_ADDRESS'] : 'Address',
      STUDIO_ADDRESS_GOOGLE_MAPS: map['STUDIO_ADDRESS_GOOGLE_MAPS'] != null
          ? map['STUDIO_ADDRESS_GOOGLE_MAPS']
          : 'Google Maps Address',
      STUDIO_INSTAGRAM: map['STUDIO_INSTAGRAM'] != null
          ? map['STUDIO_INSTAGRAM']
          : 'Instagram',
      STUDIO_ABOUT_TITLE: map['STUDIO_ABOUT_TITLE'] != null
          ? map['STUDIO_ABOUT_TITLE']
          : 'About',
      STUDIO_ABOUT_TEXT: map['STUDIO_ABOUT_TEXT'] != null
          ? map['STUDIO_ABOUT_TEXT']
          : 'About Text',
      STUDIO_PROCESS_TITLE: map['STUDIO_PROCESS_TITLE'] != null
          ? map['STUDIO_PROCESS_TITLE']
          : 'Process',
      STUDIO_PROCESS_TEXT: map['STUDIO_PROCESS_TEXT'] != null
          ? map['STUDIO_PROCESS_TEXT']
          : 'Process Text',
      STUDIO_COPYRIGHT_PREFIX: map['STUDIO_COPYRIGHT_PREFIX'] != null
          ? map['STUDIO_COPYRIGHT_PREFIX']
          : 'Copyright ',
      STUDIO_TERMS_LINK_TITLE: map['STUDIO_TERMS_LINK_TITLE'] != null
          ? map['STUDIO_TERMS_LINK_TITLE']
          : 'Terms',
      TERMS: map['TERMS'] != null ? map['TERMS'] : 'Terms',
      PROJECTS: projects,
      KEY_PROJECTS:
          Map.fromIterable(projects, key: (p) => p.key, value: (p) => p),
      PROJECT_KEY_TO_INDEX: Map.fromIterable(
          List.generate(projects.length, (i) => i),
          key: (i) => projects[i].key,
          value: (i) => i),
      HOME_PROJECTS: homeProjects,
      KEY_HOME_PROJECTS:
          Map.fromIterable(homeProjects, key: (p) => p.key, value: (p) => p),
      HOME_PROJECT_KEY_TO_INDEX: Map.fromIterable(
          List.generate(homeProjects.length, (i) => i),
          key: (i) => homeProjects[i].key,
          value: (i) => i),
      SHOWCASE_PROJECTS: showcaseProjects,
      KEY_SHOWCASE_PROJECTS: Map.fromIterable(showcaseProjects,
          key: (p) => p.key, value: (p) => p),
      SHOWCASE_PROJECT_KEY_TO_INDEX: Map.fromIterable(
          List.generate(showcaseProjects.length, (i) => i),
          key: (i) => showcaseProjects[i].key,
          value: (i) => i),
      ARCHIVE_PROJECTS: archiveProjects,
      KEY_ARCHIVE_PROJECTS:
          Map.fromIterable(archiveProjects, key: (p) => p.key, value: (p) => p),
      ARCHIVE_PROJECT_KEY_TO_INDEX: Map.fromIterable(
          List.generate(archiveProjects.length, (i) => i),
          key: (i) => archiveProjects[i].key,
          value: (i) => i),
      TAGS: tags,
      TAG_ASSOCIATIONS: tagAssociations,
      TAG_IMAGES: tagImages,
    );
  }

  final String LOADING_LINE_1;
  final String LOADING_LINE_2;
  final String HEADER_WORK;
  final String HEADER_STUDIO;
  final String STUDIO_EMAIL;
  final String STUDIO_PHONE;
  final String STUDIO_ADDRESS;
  final String STUDIO_ADDRESS_GOOGLE_MAPS;
  final String STUDIO_INSTAGRAM;
  final String STUDIO_ABOUT_TITLE;
  final String STUDIO_ABOUT_TEXT;
  final String STUDIO_PROCESS_TITLE;
  final String STUDIO_PROCESS_TEXT;
  final String STUDIO_COPYRIGHT_PREFIX;
  final String STUDIO_TERMS_LINK_TITLE;
  final String TERMS;
  final List<Project> PROJECTS;
  final Map<String, Project> KEY_PROJECTS;
  final Map<String, int> PROJECT_KEY_TO_INDEX;
  final List<Project> HOME_PROJECTS;
  final Map<String, Project> KEY_HOME_PROJECTS;
  final Map<String, int> HOME_PROJECT_KEY_TO_INDEX;

  final List<Project> SHOWCASE_PROJECTS;
  final Map<String, Project> KEY_SHOWCASE_PROJECTS;
  final Map<String, int> SHOWCASE_PROJECT_KEY_TO_INDEX;

  final List<Project> ARCHIVE_PROJECTS;
  final Map<String, Project> KEY_ARCHIVE_PROJECTS;
  final Map<String, int> ARCHIVE_PROJECT_KEY_TO_INDEX;

  final Set<String> TAGS;
  final Map<String, Set<String>> TAG_ASSOCIATIONS;
  final Map<String, Set> TAG_IMAGES;

  const Content(
      {this.LOADING_LINE_1 = '',
      this.LOADING_LINE_2 = '',
      this.HEADER_WORK = '',
      this.HEADER_STUDIO = '',
      this.STUDIO_EMAIL = '',
      this.STUDIO_PHONE = '',
      this.STUDIO_ADDRESS = '',
      this.STUDIO_ADDRESS_GOOGLE_MAPS = '',
      this.STUDIO_INSTAGRAM = '',
      this.STUDIO_ABOUT_TITLE = '',
      this.STUDIO_ABOUT_TEXT = '',
      this.STUDIO_PROCESS_TITLE = '',
      this.STUDIO_PROCESS_TEXT = '',
      this.STUDIO_COPYRIGHT_PREFIX = '',
      this.STUDIO_TERMS_LINK_TITLE = '',
      this.TERMS = '',
      this.PROJECTS = const [],
      this.KEY_PROJECTS = const {},
      this.PROJECT_KEY_TO_INDEX = const {},
      this.HOME_PROJECTS = const [],
      this.KEY_HOME_PROJECTS = const {},
      this.HOME_PROJECT_KEY_TO_INDEX = const {},
      this.SHOWCASE_PROJECTS = const [],
      this.KEY_SHOWCASE_PROJECTS = const {},
      this.SHOWCASE_PROJECT_KEY_TO_INDEX = const {},
      this.ARCHIVE_PROJECTS = const [],
      this.KEY_ARCHIVE_PROJECTS = const {},
      this.ARCHIVE_PROJECT_KEY_TO_INDEX = const {},
      this.TAGS = const {},
      this.TAG_ASSOCIATIONS = const {},
      this.TAG_IMAGES = const {}});
}

class Project {
  final String key;
  final bool home;
  final bool showcase;
  final bool archive;
  final String title;
  final String subtitle;
  final String desc;
  final String year;
  final String homeImage;
  final String showcaseImage;
  final String archiveImage;
  final String tagImage;
  final String studyImage;
  final List<String> tags;
  final List<ProjectStudyImage> studyImages;

  const Project(
      {this.key,
      this.home = false,
      this.showcase = false,
      this.archive = true,
      this.title = 'Title',
      this.subtitle = 'Subtitle',
      this.desc = 'Description',
      this.year = '2020',
      this.homeImage = 'assets/placeholder.png',
      this.showcaseImage = 'assets/placeholder.png',
      this.archiveImage = 'assets/placeholder.png',
      this.tagImage = 'assets/placeholder.png',
      this.studyImage = 'assets/placeholder.png',
      this.tags = const [],
      this.studyImages = const []});
}

class ProjectStudyImage {
  final String url;

  const ProjectStudyImage({this.url});
}
