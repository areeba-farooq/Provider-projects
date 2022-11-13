import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:im_stepper/stepper.dart';
import 'package:provider/provider.dart';
import 'package:provider_projects/state.dart';

enum Gender { male, female }

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<AppState>(
      builder: (context, providerValue, child) {
        switch (providerValue.activeIndex) {
          case 0:
            return const PersonalDetails();
          case 1:
            return const EducationForm();
          case 2:
            return const ExperienceDetails();

          default:
            return const PersonalDetails();
        }
      },
    ));
  }
}

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({Key? key}) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  GlobalKey<FormState> basicFormKey = GlobalKey<FormState>();
  Gender _site = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, providerValue, child) {
        return SafeArea(
          child: Form(
              key: basicFormKey,
              child: ListView(
                  padding: const EdgeInsets.all(
                    15.0,
                  ),
                  children: [
                    IconStepper(
                      activeStep: providerValue.activeIndex,
                      stepRadius: 18,
                      lineLength: 80,
                      enableNextPreviousButtons: false,
                      activeStepColor: Colors.blueAccent,
                      icons: const [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.edit_rounded,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.badge_sharp,
                          color: Colors.white,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Name",
                      ),
                      validator: RequiredValidator(
                        errorText: "Required *",
                      ),
                    ),
                    TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Email",
                        ),
                        validator: MultiValidator([
                          RequiredValidator(
                            errorText: "Required *",
                          ),
                          EmailValidator(
                            errorText: "Not Valid Email",
                          ),
                        ])),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Password",
                      ),
                      validator: MinLengthValidator(
                        6,
                        errorText: "Min 6 characters required",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    ListTile(
                      title: const Text('Male'),
                      leading: Radio(
                        value: Gender.male,
                        groupValue: _site,
                        onChanged: (Gender? value) {
                          setState(() {
                            _site = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Female'),
                      leading: Radio(
                        value: Gender.female,
                        groupValue: _site,
                        onChanged: (Gender? value) {
                          setState(() {
                            _site = value!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            if (basicFormKey.currentState?.validate() ??
                                false) {
                              providerValue.changeStep(1);
                            }
                          },
                          child: const Text(
                            "Next",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          )),
                    )
                  ])),
        );
      },
    );
  }
}

class ExperienceDetails extends StatefulWidget {
  const ExperienceDetails({Key? key}) : super(key: key);

  @override
  State<ExperienceDetails> createState() => _ExperienceDetailsState();
}

class _ExperienceDetailsState extends State<ExperienceDetails> {
  bool? _value = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: ((context, providerValue, child) {
        return SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(
              15.0,
            ),
            children: [
              IconStepper(
                enableStepTapping: false,
                activeStep: providerValue.activeIndex,
                stepRadius: 18,
                lineLength: 80,
                enableNextPreviousButtons: false,
                activeStepColor: Colors.blueAccent,
                icons: const [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.edit_rounded,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.badge_sharp,
                    color: Colors.white,
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Job Title",
                ),
                validator: RequiredValidator(
                  errorText: "Required *",
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Company Name",
                ),
                validator: RequiredValidator(
                  errorText: "Required *",
                ),
              ),
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Company website",
                  ),
                  validator: MultiValidator([
                    RequiredValidator(
                      errorText: "Required *",
                    ),
                    EmailValidator(errorText: "not valid")
                  ])),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Year",
                ),
                validator: RequiredValidator(
                  errorText: "Required *",
                ),
              ),
              ListTile(
                title: const Text("Currently working"),
                leading: Checkbox(
                  activeColor: Colors.green,
                  value: _value,
                  onChanged: (bool? value) {
                    setState(() {
                      _value = value;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      providerValue.changeStep(2);
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    )),
              )
            ],
          ),
        );
      }),
    );
  }
}

class EducationForm extends StatefulWidget {
  const EducationForm({Key? key}) : super(key: key);

  @override
  State<EducationForm> createState() => _EducationFormState();
}

class _EducationFormState extends State<EducationForm> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: ((context, providerValue, child) {
        return SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(
              15.0,
            ),
            children: [
              IconStepper(
                enableStepTapping: false,
                activeStep: providerValue.activeIndex,
                stepRadius: 18,
                lineLength: 80,
                enableNextPreviousButtons: false,
                activeStepColor: Colors.blueAccent,
                icons: const [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.edit_rounded,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.badge_sharp,
                    color: Colors.white,
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Institute Name",
                ),
                validator: RequiredValidator(
                  errorText: "Required *",
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Enter your Field",
                ),
                validator: RequiredValidator(
                  errorText: "Required *",
                ),
              ),
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Year of passing",
                  ),
                  validator: MultiValidator([
                    RequiredValidator(
                      errorText: "Required *",
                    ),
                  ])),
              const SizedBox(
                height: 12.0,
              ),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      providerValue.changeStep(2);
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    )),
              )
            ],
          ),
        );
      }),
    );
  }
}
