import 'package:bumper_demo/shared/app_color.dart';
import 'package:bumper_demo/shared/app_text_style.dart';
import 'package:bumper_demo/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

enum ProfileCompleteProgress { firstStep, secondStep, lastStep }

class ProfileComplete extends StatelessWidget {
  ProfileComplete({Key? key}) : super(key: key);

  final firstStepFormKey = GlobalKey<FormState>();
  final secondStepFormKey = GlobalKey<FormState>();
  final lastStepFormKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final streetController = TextEditingController();
  final cityController = TextEditingController();
  final zipController = TextEditingController();

  final profileCompleteProgress = ProfileCompleteProgress.firstStep.obs;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: MediaQuery.of(context).padding.top),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopAction(),
          _buildInputForms(),
          const Spacer(),
          _buildBottomAction(),
        ],
      ),
    );
  }

  Widget _buildTopAction() {
    return Obx(
      () => Visibility(
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        visible:
            profileCompleteProgress.value != ProfileCompleteProgress.firstStep,
        child: TextButton(
          onPressed: () {
            switch (profileCompleteProgress.value) {
              case ProfileCompleteProgress.secondStep:
                streetController.clear();
                cityController.clear();
                zipController.clear();
                profileCompleteProgress.value =
                    ProfileCompleteProgress.firstStep;
                break;
              case ProfileCompleteProgress.lastStep:
                emailController.clear();
                phoneController.clear();
                profileCompleteProgress.value =
                    ProfileCompleteProgress.secondStep;
                break;
              default:
            }
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildInputForms() {
    return Obx(() {
      switch (profileCompleteProgress.value) {
        case ProfileCompleteProgress.firstStep:
          return _buildFirstStep();
        case ProfileCompleteProgress.secondStep:
          return _buildSecondStep();
        case ProfileCompleteProgress.lastStep:
          return _buildLastStep();
        default:
          return const SizedBox();
      }
    });
  }

  Widget _buildBottomAction() {
    return Center(
      child: Obx(
        () => TextButton(
          onPressed: () {
            switch (profileCompleteProgress.value) {
              case ProfileCompleteProgress.firstStep:
                profileCompleteProgress.value =
                    ProfileCompleteProgress.secondStep;
                break;
              case ProfileCompleteProgress.secondStep:
                profileCompleteProgress.value =
                    ProfileCompleteProgress.lastStep;
                break;
              default:
            }
          },
          child: Text(
            profileCompleteProgress.value == ProfileCompleteProgress.lastStep
                ? 'Submit'
                : 'Continue',
            style: const TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
      ),
    );
  }

  Widget _buildFirstStep() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Please tell us your name',
            style: TextStyle(color: Colors.white, fontSize: 28.0),
          ),
          const Text(
            'People use their real name in Bumper',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          Form(
            key: firstStepFormKey,
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: firstNameController,
                  style: AppTextStyle.normalRegular14,
                  decoration: getInputOutlineDecoration('Firstname'),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: lastNameController,
                  style: AppTextStyle.normalRegular14,
                  decoration: getInputOutlineDecoration('Lastname'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecondStep() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Please tell us your address',
            style: TextStyle(color: Colors.white, fontSize: 28.0),
          ),
          const Text(
            'We need your address information for investment',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          Form(
            key: secondStepFormKey,
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: streetController,
                  style: AppTextStyle.normalRegular14,
                  decoration: getInputOutlineDecoration('Street'),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: cityController,
                  style: AppTextStyle.normalRegular14,
                  decoration: getInputOutlineDecoration('City'),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: zipController,
                  style: AppTextStyle.normalRegular14,
                  decoration: getInputOutlineDecoration('Zipcode'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLastStep() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Please tell us your contact',
            style: TextStyle(color: Colors.white, fontSize: 28.0),
          ),
          const Text(
            'Enter your email and phone number',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          Form(
            key: lastStepFormKey,
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: emailController,
                  style: AppTextStyle.normalRegular14,
                  decoration: getInputOutlineDecoration('Email address'),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: phoneController,
                  style: AppTextStyle.normalRegular14,
                  decoration: getInputOutlineDecoration('Phone number'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
