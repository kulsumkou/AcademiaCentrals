// ignore_for_file: file_names

import 'dart:io';

import 'package:academia_centrals/AppColors/app_colors.dart';
import 'package:academia_centrals/Widgets/app_text.dart';
import 'package:academia_centrals/Widgets/dotted_container.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadDocuments extends StatefulWidget {
  const UploadDocuments({super.key});

  @override
  State<UploadDocuments> createState() => _UploadDocumentsState();
}

class _UploadDocumentsState extends State<UploadDocuments> {
  XFile? _qualificationImage;
  XFile? _otherEducationImage;
  XFile? _casteImage;
  XFile? _incomeImage;
  XFile? _utilityImage;
  XFile? _otherAddressImage;

  Future<void> _pickImage(Function(XFile?) setImage) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      setImage(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppText(
            text: 'Proof of Education',
            fontWeight: FontWeight.w300,
            fontSize: 20,
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  DottedContainer(
                    color: AppColors.lightTextColor,
                    strokeWidth: 5.0,
                    gap: 12.0,
                    borderRadius: BorderRadius.circular(10),
                    child: GestureDetector(
                      onTap: () => _pickImage((image) {
                        _qualificationImage = image;
                      }),
                      child: Container(
                        width: 80,
                        height: 80,
                        color: Colors.transparent,
                        child: _qualificationImage == null
                            ? const Center(
                                child: Icon(
                                  Icons.add,
                                  color: AppColors.lightTextColor,
                                  size: 35,
                                ),
                              )
                            : Image.file(
                                File(_qualificationImage!.path),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const AppText(
                    text: 'Qualification \nCertificate*',
                    fontSize: 10,
                  ),
                ],
              ),
              const SizedBox(width: 60),
              Column(
                children: [
                  DottedContainer(
                    color: AppColors.lightTextColor,
                    strokeWidth: 5.0,
                    gap: 12.0,
                    borderRadius: BorderRadius.circular(10),
                    child: GestureDetector(
                      onTap: () => _pickImage((image) {
                        _otherEducationImage = image;
                      }),
                      child: Container(
                        width: 80,
                        height: 80,
                        color: Colors.transparent,
                        child: _otherEducationImage == null
                            ? const Center(
                                child: Icon(
                                  Icons.add,
                                  color: AppColors.lightTextColor,
                                  size: 35,
                                ),
                              )
                            : Image.file(
                                File(_otherEducationImage!.path),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const AppText(
                    text: 'Other',
                    fontSize: 10,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const AppText(
            text: 'Proof of Economic Background',
            fontWeight: FontWeight.w300,
            fontSize: 20,
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  DottedContainer(
                    color: AppColors.lightTextColor,
                    strokeWidth: 5.0,
                    gap: 12.0,
                    borderRadius: BorderRadius.circular(10),
                    child: GestureDetector(
                      onTap: () => _pickImage((image) {
                        _casteImage = image;
                      }),
                      child: Container(
                        width: 80,
                        height: 80,
                        color: Colors.transparent,
                        child: _casteImage == null
                            ? const Center(
                                child: Icon(
                                  Icons.add,
                                  color: AppColors.lightTextColor,
                                  size: 35,
                                ),
                              )
                            : Image.file(
                                File(_casteImage!.path),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const AppText(
                    text: 'Caste Certificate*',
                    fontSize: 10,
                  ),
                ],
              ),
              const SizedBox(width: 60),
              Column(
                children: [
                  DottedContainer(
                    color: AppColors.lightTextColor,
                    strokeWidth: 5.0,
                    gap: 12.0,
                    borderRadius: BorderRadius.circular(10),
                    child: GestureDetector(
                      onTap: () => _pickImage((image) {
                        _incomeImage = image;
                      }),
                      child: Container(
                        width: 80,
                        height: 80,
                        color: Colors.transparent,
                        child: _incomeImage == null
                            ? const Center(
                                child: Icon(
                                  Icons.add,
                                  color: AppColors.lightTextColor,
                                  size: 35,
                                ),
                              )
                            : Image.file(
                                File(_incomeImage!.path),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const AppText(
                    text: 'Income Certificate*',
                    fontSize: 10,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const AppText(
            text: 'Proof of Address',
            fontWeight: FontWeight.w300,
            fontSize: 20,
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  DottedContainer(
                    color: AppColors.lightTextColor,
                    strokeWidth: 5.0,
                    gap: 12.0,
                    borderRadius: BorderRadius.circular(10),
                    child: GestureDetector(
                      onTap: () => _pickImage((image) {
                        _utilityImage = image;
                      }),
                      child: Container(
                        width: 80,
                        height: 80,
                        color: Colors.transparent,
                        child: _utilityImage == null
                            ? const Center(
                                child: Icon(
                                  Icons.add,
                                  color: AppColors.lightTextColor,
                                  size: 35,
                                ),
                              )
                            : Image.file(
                                File(_utilityImage!.path),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const AppText(
                    text: 'Utility/Water Bill*',
                    fontSize: 10,
                  ),
                ],
              ),
              const SizedBox(width: 60),
              Column(
                children: [
                  DottedContainer(
                    color: AppColors.lightTextColor,
                    strokeWidth: 5.0,
                    gap: 12.0,
                    borderRadius: BorderRadius.circular(10),
                    child: GestureDetector(
                      onTap: () => _pickImage((image) {
                        _otherAddressImage = image;
                      }),
                      child: Container(
                        width: 80,
                        height: 80,
                        color: Colors.transparent,
                        child: _otherAddressImage == null
                            ? const Center(
                                child: Icon(
                                  Icons.add,
                                  color: AppColors.lightTextColor,
                                  size: 35,
                                ),
                              )
                            : Image.file(
                                File(_otherAddressImage!.path),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const AppText(
                    text: 'Other',
                    fontSize: 10,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
