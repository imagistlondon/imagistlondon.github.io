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
