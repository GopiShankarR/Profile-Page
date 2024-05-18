import 'package:cs442_mp1/class/profile.dart';
import 'package:flutter/material.dart';

void main() {
  ProfileInfo profileInfo = ProfileInfo("GOPI SHANKAR RAVADY", "Graduate Student", "Illinois Institute of Technology");
  ContactInformation contactInformation = ContactInformation("+1 (312)593-3314", "gravady@hawk.iit.edu", "2951 S King Drive, Apt 817, Chicago, IL 60616");
  List<EducationInformation> educationInformation = [
    EducationInformation("Master's in Computer Science", "Illinois Institute of Technology", "Aug 2023 - Present", "0.0 GPA"),
    EducationInformation("Bachelor of Technology", "Coimbatore Institute of Technology", "Aug 2017 - May 2021", "3.4 GPA"),
  ];
  List<String> imagesInformation = [
    'assets/images/c++.png',
    'assets/images/js.jpg',
    'assets/images/ror.jpg',
    'assets/images/flutter.png',
    'assets/images/nest.jpg',
    'assets/images/nodejs.png'
  ];
  List<ProjectInformation> projectInformation = [
    ProjectInformation("Mental Stability Recognition in Speech through Emotion", "To detect the mental stability of a person through Analysis of Emotions by extracting relevant features from speech", "Feature Extraction using MLP classifier", "July 2019 - April 2021"),
    ProjectInformation("Public Emergency Response System", "To alert and aides the public to respond spontaneously for urgent medical care to reduce the impact caused by delay of care", "Developed an app using Android Studio", "Jan 2020"),
  ];

  Profile profile = Profile(profileInfo, contactInformation, educationInformation, imagesInformation, projectInformation);

  runApp(MaterialApp(
    home: MyWidget(profile: profile),
  ));
}

class MyWidget extends StatelessWidget {
  final Profile profile;
  const MyWidget({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profile Page'),
          actions: const [
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 25,
                // Border radius
                backgroundImage: AssetImage("assets/images/my_pic.jpg"),
              ),
            ), 
          ]
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.topCenter,
                      child: CircleAvatar(
                            radius: 60,
                            // Border radius
                            backgroundImage: AssetImage('assets/images/my_pic.jpg'),
                            ),
                  ), 
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            profile.profileInfo.name, 
                            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                            )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(height: 25),
                          Text(
                              profile.profileInfo.study,
                              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(height: 25),
                          Text(
                              profile.profileInfo.institute,
                              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  const Icon(IconData(0xe4a2, fontFamily: 'MaterialIcons'), size: 15,),
                  const SizedBox(width: 5),
                  Text(
                    profile.contactInformation.phoneNumber,
                    style: const TextStyle(fontSize: 15, fontFamily: AutofillHints.telephoneNumber),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                 children: [
                  const Icon(IconData(0xe22a, fontFamily: 'MaterialIcons'), size: 15,),
                  const SizedBox(width: 5),
                  Text(
                    profile.contactInformation.email,
                    style: const TextStyle(fontSize: 15, fontFamily: AutofillHints.email),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: [
                const Icon(IconData(0xe318, fontFamily: 'MaterialIcons'), size: 15),
                const SizedBox(width: 5),
                Text(
                    profile.contactInformation.address,
                    style: const TextStyle(fontSize: 15, fontFamily: AutofillHints.addressCityAndState),
                  )
                ],
              ),
              const SizedBox(height: 15),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            textBaseline: TextBaseline.alphabetic,
            children: [
              const Row(
                children: [
                  Text(
                    "EDUCATION",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ]
              ),
              const Divider(color: Colors.black,),
              const SizedBox(height: 10),
              for(EducationInformation education in profile.educationInformation)
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        education.course,
                        style: const TextStyle(fontWeight: FontWeight.bold)
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(education.coursePlace),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        education.duration, 
                        style: const TextStyle(fontSize: 11)
                      ), 
                      const Spacer(), 
                      Text(education.gpa, style: const TextStyle(fontSize: 11),)
                    ],
                  ),
                const SizedBox(height: 10),
                ],
              )
            ],
          ),
          const SizedBox(height: 15,),
          Container(
            child: 
              Column(
                children: [
                  const Row(
                    children: [
                      Text(
                        "SKILLS",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.black,),
                  GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    crossAxisCount: 3,
                    childAspectRatio: 0.75,
                    children: <Widget>[
                      for(String image1 in profile.imagesInformation)
                      Container(
                        child: Image.asset(image1),
                      ),
                    ],
                  )
                ],
              ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  const Row(
                    children: [
                      Text("PROJECTS",
                      style: TextStyle(fontWeight: FontWeight.bold),),
                    ]
                  ),
                  const Divider(color: Colors.black,),
                  const SizedBox(height: 10),
                    for(ProjectInformation project in profile.projectInformation)
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(project.description,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                          '\u2022',
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.55,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child:
                            Text(
                              project.bulletin1,
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                height: 1.55,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                          '\u2022',
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.55,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child:
                            Text(
                              project.bulletin2,
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                height: 1.55,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                          child:
                            Text(project.duration, style: TextStyle(fontSize: 11)),
                          )
                        ]
                      ),
                    const SizedBox(height: 10),
                    ],
                  )
                ]
              ),
            ],   
          ),
        ),
      ),
    );
  }
}