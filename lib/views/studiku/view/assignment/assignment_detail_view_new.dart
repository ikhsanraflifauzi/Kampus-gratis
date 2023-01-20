import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/studiku/assignment_controller.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';
import 'package:kampus_gratis/widgets/primary_button.dart';
import 'package:kampus_gratis/widgets/scaffold.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:url_launcher/url_launcher.dart';

class AssignmentDetailView extends GetView<AssignmentController> {
  const AssignmentDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    var quillEditor = QuillEditor(
      controller: controller.quillController,
      scrollController: ScrollController(),
      scrollable: true,
      focusNode: controller.focusNode,
      autoFocus: false,
      readOnly: false,
      placeholder: 'Tulis jawab Disini',
      expands: false,
      padding: const EdgeInsets.all(8.0),
    );
    return KGScaffold(
      appBar: const KGAppBar(
          backButton: true, title: 'Detail Tugas', withIconKG: true),
      body: controller.obx(
        (data) => SingleChildScrollView(
          controller: null,
          child: Column(
            children: [
              Container(
                width: Get.width,
                height: 90,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ]),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data!.assignment!.content!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      Row(
                        children: [
                          Text(data.assignment!.lecturer!.user!.fullName!),
                          Text(
                            '${data.assignment!.lecturer!.title}',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(19.0),
                child: Column(
                  children: [
                    Container(
                      height: 135,
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: Colors.white12,
                          border: Border.all(color: const Color(0xffD9D9D9)),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: ListView(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Tugas :',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    data.assignment!.description!,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 100,
                                    child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: data
                                          .assignment!.fileAssignment!.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return ListTile(
                                          onTap: () async {
                                            Get.snackbar(
                                              'Sedang Download',
                                              'Mohon Tunggu',
                                            );
                                            await controller.downloadDocument(
                                                '${data.assignment?.fileAssignmentLink}');
                                          },
                                          leading: Image.asset(
                                            'assets/icons/iconFile.png',
                                            scale: 3,
                                          ),
                                          title: Text(
                                            data.assignment!.fileAssignment!,
                                            maxLines: 1,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Batas pengumpulan Tugas :',
                          style: TextStyle(fontSize: 12),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${data.assignment!.deadline}',
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Obx(() => controller.canEdit.value
                        ? Column(
                            children: [
                              Container(
                                height: 300,
                                padding: const EdgeInsets.all(5),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: const Color(0xffD9D9D9),
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    QuillToolbar.basic(
                                      controller: controller.quillController,
                                      showBackgroundColorButton: false,
                                      showCenterAlignment: false,
                                      showClearFormat: false,
                                      showCodeBlock: false,
                                      showColorButton: false,
                                      showDirection: false,
                                      showDividers: false,
                                      showFontFamily: false,
                                      showHeaderStyle: false,
                                      showInlineCode: false,
                                      showJustifyAlignment: false,
                                      showLeftAlignment: false,
                                      showLink: false,
                                      showListCheck: false,
                                      showQuote: false,
                                      showRedo: false,
                                      showRightAlignment: false,
                                      showSearchButton: false,
                                      showStrikeThrough: false,
                                      showUndo: false,
                                      showFontSize: false,
                                      showSmallButton: true,
                                      showAlignmentButtons: false,
                                      showIndent: false,
                                      toolbarIconAlignment: WrapAlignment.start,
                                      toolbarSectionSpacing: 1,
                                      toolbarIconSize: 26,
                                      customButtons: const [],
                                    ),
                                    quillEditor,
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 150),
                                child: Text(
                                  'Unggah file : Max size 2 mb',
                                  style: TextStyle(
                                      fontSize: 12, fontFamily: 'Montserrat'),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Image.asset(
                                      'assets/icons/fileattachmentlink.png',
                                      height: 40,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.pickFile();
                                    },
                                    child: Image.asset(
                                      'assets/icons/fileattachment.png',
                                      height: 40,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              Divider(
                                thickness: 10,
                                color: Colors.grey.shade200,
                              ),
                              const SizedBox(
                                height: 21,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 150),
                                child: Text(
                                  'Jawaban Terkirim',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff383838)),
                                ),
                              ),
                            ],
                          )),
                    const SizedBox(
                      height: 21,
                    ),
                    Obx(() => controller.fileName.value != ''
                        ? ListTile(
                            onTap: () => controller.openFile(),
                            leading: Image.asset('assets/icons/iconFile.png',
                                height: 24.0, fit: BoxFit.fitHeight),
                            title: Text(
                              controller.fileName.value,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: TextButton(
                                onPressed: () {
                                  controller.removeFile();
                                },
                                child: const Text(
                                  'Hapus',
                                  style: TextStyle(color: Colors.red),
                                )),
                          )
                        : const SizedBox()),
                    Obx(() => !(controller.canEdit.value)
                        ? controller.filenameFromAPI.value != ''
                            ? controller.fileName.value != ''
                                ? const SizedBox()
                                : Column(
                                    children: [
                                      ListTile(
                                        onTap: () => launchUrl(
                                            Uri.parse(data
                                                .studentsWork!
                                                .activityDetail!
                                                .fileAssignmentLink!),
                                            mode:
                                                LaunchMode.externalApplication),
                                        leading: Image.asset(
                                            'assets/icons/iconFile.png',
                                            height: 24.0,
                                            fit: BoxFit.fitHeight),
                                        title: Text(
                                          controller.filenameFromAPI.value,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        trailing: TextButton(
                                            onPressed: () {
                                              controller.canEdit.value = true;
                                            },
                                            child: Text(
                                              'Edit',
                                              style: TextStyle(
                                                  color:
                                                      ColorConstants.mainBlue),
                                            )),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 63),
                                        child: Row(
                                          children: [
                                            Text(
                                              '${data.studentsWork!.status}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Icon(
                                              Icons.check_circle_rounded,
                                              color: Colors.grey,
                                              size: 13,
                                            ),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            Text(
                                              '${data.studentsWork!.activityDetail!.dateSubmit}',
                                              style: const TextStyle(
                                                  color: Color(0xff3AAA35)),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                            : const SizedBox()
                        : const SizedBox()),
                    const SizedBox(
                      height: 40,
                    ),
                    Obx(() => controller.canEdit.value
                        ? Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 50, right: 50),
                              child: PrimaryButton(
                                label: 'Kirim',
                                color: const Color(0xff106FA4),
                                onPressed: () {
                                  controller.submitStudentWork();
                                },
                              ),
                            ),
                          )
                        : const SizedBox()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
