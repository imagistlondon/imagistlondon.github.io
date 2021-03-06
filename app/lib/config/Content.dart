// Defined here is the Content
//
// Things such as text and images etc. should be added here and referenced.

import 'dart:collection';

import 'package:app/util/Video.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Content {
  static Content data = Content();

  static void load() async {
    // call
    final String result = (await http.get(Uri.parse(
        //'http://localhost:3000/api/getConfig'
        'https://admin.imagistlondon.com/api/getConfig'))).body;

    // convert json to map
    final Map map = json.decode(result);

    // init projects
    final List<Project> projects = [];

    // PROJECTS
    if (map['PROJECT-length'] != null) {
      // get length
      final int projectLength = map['PROJECT-length'];

      // loop
      for (int i = 0; i < projectLength; i++) {
        // build prefix
        final String prefix = 'PROJECT-' + i.toString() + '-';

        // init tags
        final List<String> tags = [];

        // load tags
        if (map[prefix + 'TAG-length'] != null) {
          final int tagLength = map[prefix + 'TAG-length'];
          for (int j = 0; j < tagLength; j++) {
            tags.add(map[prefix + 'TAG-' + j.toString() + '-KEY']);
          }
        }

        // homeImageGifDuration
        final String homeImageGifDurationString =
            map[prefix + 'HOME_IMAGE_GIF_DURATION'];
        final int homeImageGifDurationInt = homeImageGifDurationString != null
            ? int.tryParse(homeImageGifDurationString)
            : null;
        final Duration homeImageGifDuration =
            homeImageGifDurationInt != null && homeImageGifDurationInt > 0
                ? Duration(milliseconds: homeImageGifDurationInt)
                : null;

        // showcaseImageGifDuration
        final String showcaseImageGifDurationString =
            map[prefix + 'SHOWCASE_IMAGE_GIF_DURATION'];
        final int showcaseImageGifDurationInt =
            showcaseImageGifDurationString != null
                ? int.tryParse(showcaseImageGifDurationString)
                : null;
        final Duration showcaseImageGifDuration =
            showcaseImageGifDurationInt != null &&
                    showcaseImageGifDurationInt > 0
                ? Duration(milliseconds: showcaseImageGifDurationInt)
                : null;

        // archiveImageGifDuration
        final String archiveImageGifDurationString =
            map[prefix + 'ARCHIVE_IMAGE_GIF_DURATION'];
        final int archiveImageGifDurationInt =
            archiveImageGifDurationString != null
                ? int.tryParse(archiveImageGifDurationString)
                : null;
        final Duration archiveImageGifDuration =
            archiveImageGifDurationInt != null && archiveImageGifDurationInt > 0
                ? Duration(milliseconds: archiveImageGifDurationInt)
                : null;

        // tagImageGifDuration
        final String tagImageGifDurationString =
            map[prefix + 'TAG_IMAGE_GIF_DURATION'];
        final int tagImageGifDurationInt = tagImageGifDurationString != null
            ? int.tryParse(tagImageGifDurationString)
            : null;
        final Duration tagImageGifDuration =
            tagImageGifDurationInt != null && tagImageGifDurationInt > 0
                ? Duration(milliseconds: tagImageGifDurationInt)
                : null;

        // studyImageGifDuration
        final String studyImageGifDurationString =
            map[prefix + 'STUDY_IMAGE_GIF_DURATION'];
        final int studyImageGifDurationInt = studyImageGifDurationString != null
            ? int.tryParse(studyImageGifDurationString)
            : null;
        final Duration studyImageGifDuration =
            studyImageGifDurationInt != null && studyImageGifDurationInt > 0
                ? Duration(milliseconds: studyImageGifDurationInt)
                : null;

        // init studyBlocks
        final Map<String, List<ProjectStudyBlock>> studyBlocks = Map();
        studyBlocks['A'] = [];
        studyBlocks['B'] = [];

        // load study blocks
        for (final String letter in studyBlocks.keys) {
          // pull studyblock ref
          final List<ProjectStudyBlock> studyBlocksX = studyBlocks[letter];

          if (map[prefix + 'STUDY_BLOCK_' + letter + '-length'] != null) {
            final int studyBlockLength =
                map[prefix + 'STUDY_BLOCK_' + letter + '-length'];
            for (int j = 0; j < studyBlockLength; j++) {
              // prefix
              final String blockPrefix =
                  prefix + 'STUDY_BLOCK_' + letter + '-' + j.toString();

              // videoId
              final String videoId = map[blockPrefix + '-VIDEO_ID'] != null &&
                      map[blockPrefix + '-VIDEO_ID'] != ''
                  ? map[blockPrefix + '-VIDEO_ID']
                  : null;

              // videoCinema
              final bool videoCinema =
                  map[blockPrefix + '-VIDEO_CINEMA'] != null &&
                      map[blockPrefix + '-VIDEO_CINEMA'] == true;

              // videoWidthFactor
              final String videoWidthFactorX1 =
                  map[blockPrefix + '-VIDEO_WIDTH_FACTOR_X1'];
              final String videoWidthFactorX2 =
                  map[blockPrefix + '-VIDEO_WIDTH_FACTOR_X2'];
              final String videoWidthFactorX3 =
                  map[blockPrefix + '-VIDEO_WIDTH_FACTOR_X3'];
              final String videoWidthFactorX4 =
                  map[blockPrefix + '-VIDEO_WIDTH_FACTOR_X4'];

              // videoHeightFactor
              final String videoHeightFactorX1_String =
                  map[blockPrefix + '-VIDEO_HEIGHT_FACTOR_X1'];
              final String videoHeightFactorX2_String =
                  map[blockPrefix + '-VIDEO_HEIGHT_FACTOR_X2'];
              final String videoHeightFactorX3_String =
                  map[blockPrefix + '-VIDEO_HEIGHT_FACTOR_X3'];
              final String videoHeightFactorX4_String =
                  map[blockPrefix + '-VIDEO_HEIGHT_FACTOR_X4'];

              // videoHeightFactor
              final double videoHeightFactorX1 =
                  videoHeightFactorX1_String != null
                      ? double.tryParse(videoHeightFactorX1_String)
                      : null;
              final double videoHeightFactorX2 =
                  videoHeightFactorX2_String != null
                      ? double.tryParse(videoHeightFactorX2_String)
                      : null;
              final double videoHeightFactorX3 =
                  videoHeightFactorX3_String != null
                      ? double.tryParse(videoHeightFactorX3_String)
                      : null;
              final double videoHeightFactorX4 =
                  videoHeightFactorX4_String != null
                      ? double.tryParse(videoHeightFactorX4_String)
                      : null;

              // imageMinHeight
              final String imageMinHeightX1 =
                  map[blockPrefix + '-IMAGE_MIN_HEIGHT_X1'];
              final String imageMinHeightX2 =
                  map[blockPrefix + '-IMAGE_MIN_HEIGHT_X2'];
              final String imageMinHeightX3 =
                  map[blockPrefix + '-IMAGE_MIN_HEIGHT_X3'];
              final String imageMinHeightX4 =
                  map[blockPrefix + '-IMAGE_MIN_HEIGHT_X4'];

              // imageMaxHeight
              final String imageMaxHeightX1 =
                  map[blockPrefix + '-IMAGE_MAX_HEIGHT_X1'];
              final String imageMaxHeightX2 =
                  map[blockPrefix + '-IMAGE_MAX_HEIGHT_X2'];
              final String imageMaxHeightX3 =
                  map[blockPrefix + '-IMAGE_MAX_HEIGHT_X3'];
              final String imageMaxHeightX4 =
                  map[blockPrefix + '-IMAGE_MAX_HEIGHT_X4'];

              // widthPercent
              final String widthPercentX1 =
                  map[blockPrefix + '-WIDTH_PERCENT_X1'];
              final String widthPercentX2 =
                  map[blockPrefix + '-WIDTH_PERCENT_X2'];
              final String widthPercentX3 =
                  map[blockPrefix + '-WIDTH_PERCENT_X3'];
              final String widthPercentX4 =
                  map[blockPrefix + '-WIDTH_PERCENT_X4'];

              // minHeight
              final String minHeightX1 = map[blockPrefix + '-MIN_HEIGHT_X1'];
              final String minHeightX2 = map[blockPrefix + '-MIN_HEIGHT_X2'];
              final String minHeightX3 = map[blockPrefix + '-MIN_HEIGHT_X3'];
              final String minHeightX4 = map[blockPrefix + '-MIN_HEIGHT_X4'];

              // maxHeight
              final String maxHeightX1 = map[blockPrefix + '-MAX_HEIGHT_X1'];
              final String maxHeightX2 = map[blockPrefix + '-MAX_HEIGHT_X2'];
              final String maxHeightX3 = map[blockPrefix + '-MAX_HEIGHT_X3'];
              final String maxHeightX4 = map[blockPrefix + '-MAX_HEIGHT_X4'];

              // images
              final List<String> images = [];
              if (map[blockPrefix + '-IMAGE'] != null)
                images.add(map[blockPrefix + '-IMAGE']);
              if (map[blockPrefix + '-IMAGE2'] != null)
                images.add(map[blockPrefix + '-IMAGE2']);
              if (map[blockPrefix + '-IMAGE3'] != null)
                images.add(map[blockPrefix + '-IMAGE3']);

              // imageGifDuration
              final String imageGifDurationString =
                  map[blockPrefix + '-IMAGE_GIF_DURATION'];
              final String image2GifDurationString =
                  map[blockPrefix + '-IMAGE2_GIF_DURATION'];
              final String image3GifDurationString =
                  map[blockPrefix + '-IMAGE3_GIF_DURATION'];
              final int imageGifDurationInt = imageGifDurationString != null
                  ? int.tryParse(imageGifDurationString)
                  : null;
              final int image2GifDurationInt = image2GifDurationString != null
                  ? int.tryParse(image2GifDurationString)
                  : null;
              final int image3GifDurationInt = image3GifDurationString != null
                  ? int.tryParse(image3GifDurationString)
                  : null;
              final Duration imageGifDuration =
                  imageGifDurationInt != null && imageGifDurationInt > 0
                      ? Duration(milliseconds: imageGifDurationInt)
                      : null;
              final Duration image2GifDuration =
                  image2GifDurationInt != null && image2GifDurationInt > 0
                      ? Duration(milliseconds: image2GifDurationInt)
                      : null;
              final Duration image3GifDuration =
                  image3GifDurationInt != null && image3GifDurationInt > 0
                      ? Duration(milliseconds: image3GifDurationInt)
                      : null;
              final List<Duration> imageGifDurations = [
                imageGifDuration,
                image2GifDuration,
                image3GifDuration
              ];

              studyBlocksX.add(ProjectStudyBlock(
                title: map[blockPrefix + '-TITLE'],
                desc: map[blockPrefix + '-DESC'],
                textPosition: map[blockPrefix + '-TEXT_POSITION'],
                textAlignX: map[blockPrefix + '-TEXT_ALIGN_X'],
                textAlignY: map[blockPrefix + '-TEXT_ALIGN_Y'],
                // video
                videoId: videoId,
                videoCinema: videoCinema,
                // videoWidthFactor
                videoWidthFactorX1: videoWidthFactorX1 != null
                    ? double.tryParse(videoWidthFactorX1)
                    : null,
                videoWidthFactorX2: videoWidthFactorX2 != null
                    ? double.tryParse(videoWidthFactorX2)
                    : null,
                videoWidthFactorX3: videoWidthFactorX3 != null
                    ? double.tryParse(videoWidthFactorX3)
                    : null,
                videoWidthFactorX4: videoWidthFactorX4 != null
                    ? double.tryParse(videoWidthFactorX4)
                    : null,
                // videoHeightFactor
                videoHeightFactorX1: videoHeightFactorX1,
                videoHeightFactorX2: videoHeightFactorX2,
                videoHeightFactorX3: videoHeightFactorX3,
                videoHeightFactorX4: videoHeightFactorX4,
                video: videoId != null
                    ? Video(videoId,
                        cinema: videoCinema,
                        heightFactorX1: videoHeightFactorX1,
                        heightFactorX2: videoHeightFactorX2,
                        heightFactorX3: videoHeightFactorX3,
                        heightFactorX4: videoHeightFactorX4)
                    : null,

                // image
                image: map[blockPrefix + '-IMAGE'],
                image2: map[blockPrefix + '-IMAGE2'],
                image3: map[blockPrefix + '-IMAGE3'],
                images: images,

                // imageGifDuration
                imageGifDuration: imageGifDuration,
                image2GifDuration: image2GifDuration,
                image3GifDuration: image3GifDuration,
                imageGifDurations: imageGifDurations,

                // imageMinHeight
                imageMinHeightX1: imageMinHeightX1 != null
                    ? double.tryParse(imageMinHeightX1)
                    : null,
                imageMinHeightX2: imageMinHeightX2 != null
                    ? double.tryParse(imageMinHeightX2)
                    : null,
                imageMinHeightX3: imageMinHeightX3 != null
                    ? double.tryParse(imageMinHeightX3)
                    : null,
                imageMinHeightX4: imageMinHeightX4 != null
                    ? double.tryParse(imageMinHeightX4)
                    : null,
                // imageMaxHeight
                imageMaxHeightX1: imageMaxHeightX1 != null
                    ? double.tryParse(imageMaxHeightX1)
                    : null,
                imageMaxHeightX2: imageMaxHeightX2 != null
                    ? double.tryParse(imageMaxHeightX2)
                    : null,
                imageMaxHeightX3: imageMaxHeightX3 != null
                    ? double.tryParse(imageMaxHeightX3)
                    : null,
                imageMaxHeightX4: imageMaxHeightX4 != null
                    ? double.tryParse(imageMaxHeightX4)
                    : null,
                // widthPercent
                widthPercentX1: widthPercentX1 != null
                    ? double.tryParse(widthPercentX1)
                    : null,
                widthPercentX2: widthPercentX2 != null
                    ? double.tryParse(widthPercentX2)
                    : null,
                widthPercentX3: widthPercentX3 != null
                    ? double.tryParse(widthPercentX3)
                    : null,
                widthPercentX4: widthPercentX4 != null
                    ? double.tryParse(widthPercentX4)
                    : null,
                // minHeight
                minHeightX1:
                    minHeightX1 != null ? double.tryParse(minHeightX1) : null,
                minHeightX2:
                    minHeightX2 != null ? double.tryParse(minHeightX2) : null,
                minHeightX3:
                    minHeightX3 != null ? double.tryParse(minHeightX3) : null,
                minHeightX4:
                    minHeightX4 != null ? double.tryParse(minHeightX4) : null,
                // maxHeight
                maxHeightX1:
                    maxHeightX1 != null ? double.tryParse(maxHeightX1) : null,
                maxHeightX2:
                    maxHeightX2 != null ? double.tryParse(maxHeightX2) : null,
                maxHeightX3:
                    maxHeightX3 != null ? double.tryParse(maxHeightX3) : null,
                maxHeightX4:
                    maxHeightX4 != null ? double.tryParse(maxHeightX4) : null,
              ));
            }
          }
        }

        // add project
        projects.add(Project(
            key: map[prefix + 'KEY'],
            home: map[prefix + 'HOME'] != null && map[prefix + 'HOME'] == true,
            showcase: map[prefix + 'SHOWCASE'] != null &&
                map[prefix + 'SHOWCASE'] == true,
            archive: map[prefix + 'ARCHIVE'] != null &&
                map[prefix + 'ARCHIVE'] == true,
            title:
                map[prefix + 'TITLE'] != null ? map[prefix + 'TITLE'] : 'Title',
            subtitle: map[prefix + 'SUBTITLE'] != null
                ? map[prefix + 'SUBTITLE']
                : 'Subtitle',
            desc: map[prefix + 'DESC'] != null
                ? map[prefix + 'DESC']
                : 'Description',
            year: map[prefix + 'YEAR'] != null ? map[prefix + 'YEAR'] : '20XX',
            // homeImage
            homeImage: map[prefix + 'HOME_IMAGE'] != null
                ? map[prefix + 'HOME_IMAGE']
                : 'assets/placeholder.png',
            homeImageGifDuration: homeImageGifDuration,
            // showcaseImage
            showcaseImage: map[prefix + 'SHOWCASE_IMAGE'] != null
                ? map[prefix + 'SHOWCASE_IMAGE']
                : 'assets/placeholder.png',
            showcaseImageGifDuration: showcaseImageGifDuration,
            // archiveImage
            archiveImage: map[prefix + 'ARCHIVE_IMAGE'] != null
                ? map[prefix + 'ARCHIVE_IMAGE']
                : 'assets/placeholder.png',
            archiveImageGifDuration: archiveImageGifDuration,
            // tagImage
            tagImage: map[prefix + 'TAG_IMAGE'] != null
                ? map[prefix + 'TAG_IMAGE']
                : 'assets/placeholder.png',
            tagImageGifDuration: tagImageGifDuration,
            // studyImage
            studyImage: map[prefix + 'STUDY_IMAGE'] != null
                ? map[prefix + 'STUDY_IMAGE']
                : 'assets/placeholder.png',
            studyImageGifDuration: studyImageGifDuration,
            tags: tags,
            studyBlocks: studyBlocks));
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
    final Map<String, Set<String>> tagAssociations = SplayTreeMap();
    final Map<String, Set<String>> tagImages = SplayTreeMap();
    final Map<String, String> tagImageToKey = SplayTreeMap();
    final Map<String, Duration> tagImageToGifDuration = SplayTreeMap();

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

        // set tagImage -> project key
        tagImageToKey[project.tagImage] = project.key;
        tagImageToGifDuration[project.tagImage] = project.tagImageGifDuration;
      }
    }

    Content.data = Content(
        loaded: true,
        HEADER_WORK: map['HEADER_WORK'] != null ? map['HEADER_WORK'] : 'Work',
        HEADER_STUDIO:
            map['HEADER_STUDIO'] != null ? map['HEADER_STUDIO'] : 'Studio',
        STUDIO_EMAIL:
            map['STUDIO_EMAIL'] != null ? map['STUDIO_EMAIL'] : 'Email',
        STUDIO_PHONE:
            map['STUDIO_PHONE'] != null ? map['STUDIO_PHONE'] : 'Phone',
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
        ARCHIVE_PROJECT_KEY_TO_INDEX: Map.fromIterable(List.generate(archiveProjects.length, (i) => i), key: (i) => archiveProjects[i].key, value: (i) => i),
        TAGS: tags,
        TAG_ASSOCIATIONS: tagAssociations,
        TAG_IMAGES: tagImages,
        TAG_IMAGE_TO_KEY: tagImageToKey,
        TAG_IMAGE_TO_GIF_DURATION: tagImageToGifDuration);

    print('Content.load.done');
  }

  final bool loaded;
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
  final Map<String, Set<String>> TAG_IMAGES;
  final Map<String, String> TAG_IMAGE_TO_KEY;
  final Map<String, Duration> TAG_IMAGE_TO_GIF_DURATION;

  const Content(
      {this.loaded = false,
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
      this.TAG_IMAGES = const {},
      this.TAG_IMAGE_TO_KEY = const {},
      this.TAG_IMAGE_TO_GIF_DURATION = const {}});
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
  final Duration homeImageGifDuration;

  final String showcaseImage;
  final Duration showcaseImageGifDuration;

  final String archiveImage;
  final Duration archiveImageGifDuration;

  final String tagImage;
  final Duration tagImageGifDuration;

  final String studyImage;
  final Duration studyImageGifDuration;

  final List<String> tags;
  final Map<String, List<ProjectStudyBlock>> studyBlocks;

  const Project({
    this.key,
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
    this.homeImageGifDuration = null,
    this.showcaseImageGifDuration = null,
    this.archiveImageGifDuration = null,
    this.tagImageGifDuration = null,
    this.studyImageGifDuration = null,
    this.tags = const [],
    this.studyBlocks = const {},
  });
}

class ProjectStudyBlock {
  final String title;
  final String desc;
  final String textPosition;
  final String textAlignX;
  final String textAlignY;

  final String videoId;
  final bool videoCinema;
  final double videoWidthFactorX1;
  final double videoWidthFactorX2;
  final double videoWidthFactorX3;
  final double videoWidthFactorX4;

  final double videoHeightFactorX1;
  final double videoHeightFactorX2;
  final double videoHeightFactorX3;
  final double videoHeightFactorX4;
  final Video video;

  final String image;
  final String image2;
  final String image3;
  final Duration imageGifDuration;
  final Duration image2GifDuration;
  final Duration image3GifDuration;
  final List<String> images;
  final List<Duration> imageGifDurations;

  final double imageMinHeightX1;
  final double imageMinHeightX2;
  final double imageMinHeightX3;
  final double imageMinHeightX4;

  final double imageMaxHeightX1;
  final double imageMaxHeightX2;
  final double imageMaxHeightX3;
  final double imageMaxHeightX4;

  final double widthPercentX1;
  final double widthPercentX2;
  final double widthPercentX3;
  final double widthPercentX4;

  final double minHeightX1;
  final double minHeightX2;
  final double minHeightX3;
  final double minHeightX4;

  final double maxHeightX1;
  final double maxHeightX2;
  final double maxHeightX3;
  final double maxHeightX4;

  final bool hasTitle;
  final bool hasDesc;
  final bool hasText;
  final bool hasFullText;

  final bool hasVideo;
  final bool hasImage;
  final bool hasImage2;
  final bool hasMultiImages;

  final bool hasMedia;
  final bool hasContent;
  final bool hasFullContent;

  final TextAlign textAlign;

  final CrossAxisAlignment textAlignCrossX;
  final CrossAxisAlignment textAlignCrossY;

  const ProjectStudyBlock({
    this.title,
    this.desc,
    this.textPosition,
    this.textAlignX,
    this.textAlignY,
    this.videoId,
    this.videoCinema,
    this.videoWidthFactorX1,
    this.videoWidthFactorX2,
    this.videoWidthFactorX3,
    this.videoWidthFactorX4,
    this.videoHeightFactorX1,
    this.videoHeightFactorX2,
    this.videoHeightFactorX3,
    this.videoHeightFactorX4,
    this.video,
    this.image,
    this.image2,
    this.image3,
    this.imageGifDuration,
    this.image2GifDuration,
    this.image3GifDuration,
    this.images,
    this.imageGifDurations,
    this.imageMinHeightX1,
    this.imageMinHeightX2,
    this.imageMinHeightX3,
    this.imageMinHeightX4,
    this.imageMaxHeightX1,
    this.imageMaxHeightX2,
    this.imageMaxHeightX3,
    this.imageMaxHeightX4,
    this.widthPercentX1,
    this.widthPercentX2,
    this.widthPercentX3,
    this.widthPercentX4,
    this.minHeightX1,
    this.minHeightX2,
    this.minHeightX3,
    this.minHeightX4,
    this.maxHeightX1,
    this.maxHeightX2,
    this.maxHeightX3,
    this.maxHeightX4,
  })  :
        //
        hasTitle = title != null && title != "",
        hasDesc = desc != null && desc != "",
        hasText =
            // hasTitle
            (title != null && title != "") ||
                // hasDesc
                (desc != null && desc != ""),
        hasFullText =
            // hasTitle
            (title != null && title != "") &&
                // hasDesc
                (desc != null && desc != ""),

        //
        //
        hasVideo = videoId != null && videoId != "",
        hasImage = image != null && image != "",
        hasImage2 = image2 != null && image2 != "",
        hasMultiImages =
            // hasImage
            (image != null && image != "") &&
                // hasImage2
                (image2 != null && image2 != ""),
        //
        hasMedia =
            // hasVideo
            (videoId != null && videoId != "") ||
                // hasImage
                (image != null && image != ""),
        //
        hasContent =
            // hasText
            ((title != null && title != "") || (desc != null && desc != "")) ||
                // hasImage
                (image != null && image != "") ||
                // hasVideo
                (videoId != null && videoId != ""),
        hasFullContent =
            // hasText
            ((title != null && title != "") || (desc != null && desc != "")) &&
                // hasMedia
                ((videoId != null && videoId != "") ||
                    (image != null && image != "")),

        // textAlign
        textAlign = (textAlignX == 'CENTER' || textAlignX == 'center')
            ? TextAlign.center
            : (textAlignX == 'END' || textAlignX == 'end')
                ? TextAlign.right
                : TextAlign.left,

        // figure out text align
        textAlignCrossX = (textAlignX == 'CENTER' || textAlignX == 'center')
            ? CrossAxisAlignment.center
            : (textAlignX == 'END' || textAlignX == 'end')
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,

        // figure out text align vertical
        textAlignCrossY = (textAlignY == 'CENTER' || textAlignY == 'center')
            ? CrossAxisAlignment.center
            : (textAlignY == 'END' || textAlignY == 'end')
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start;
}
