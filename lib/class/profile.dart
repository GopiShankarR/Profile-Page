class Profile {
  final ProfileInfo profileInfo;
  final ContactInformation contactInformation;
  final List<EducationInformation> educationInformation;
  final List<String> imagesInformation;
  final List<ProjectInformation> projectInformation;
  Profile(this.profileInfo, this.contactInformation, this.educationInformation, this.imagesInformation, this.projectInformation);
}

class ProfileInfo {
  final String name;
  final String study;
  final String institute;
  ProfileInfo(this.name, this.study, this.institute);
}

class ContactInformation {
  final String phoneNumber;
  final String email;
  final String address;

  ContactInformation(this.phoneNumber, this.email, this.address);
}

class EducationInformation {
  final String course;
  final String coursePlace;
  final String duration;
  final String gpa;

  EducationInformation(this.course, this.coursePlace, this.duration, this.gpa);
}

class ProjectInformation {
  final String description;
  final String bulletin1;
  final String bulletin2;
  final String duration;

  ProjectInformation(this.description, this.bulletin1, this.bulletin2, this.duration);
}