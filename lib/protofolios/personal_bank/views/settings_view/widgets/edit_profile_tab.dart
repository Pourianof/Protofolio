import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/helpers/validators.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/user.dart';
import 'package:my_portfolio/protofolios/personal_bank/providers/user_provider.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_styles.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/settings_view/widgets/setting_field.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/settings_view/widgets/setting_field_wrap.dart';
import 'package:my_portfolio/protofolios/personal_bank/views/settings_view/widgets/settings_full_field_form.dart';
import 'package:my_portfolio/utils/image_uploader.dart';
import 'package:my_portfolio/utils/number_form_field.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:provider/provider.dart';

class EditProfileTab extends StatefulWidget {
  const EditProfileTab({super.key});

  @override
  State<EditProfileTab> createState() => _EditProfileTabState();
}

class _EditProfileTabState extends State<EditProfileTab>
    with UserProfileStateHolder {
  final GlobalKey<FormState> _formGK = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        userData ??= userProvider.holdData;

        return Form(
          key: _formGK,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileAvatar(
                    image: userData!.avatar,
                    onNewAvatar: (newAvatar) {
                      setState(() {
                        updateUserData(
                            userData!.copyWith(newAvatar: newAvatar));
                      });
                    },
                  ),
                  const SizedBox(
                    width: AppStyles.mainViewPadding,
                    height: AppStyles.mainViewPadding,
                  ),
                  Expanded(
                    child: ProfileEditor(
                      formState: this,
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formGK.currentState!.validate()) {
                    _formGK.currentState!.save();
                    userProvider.updateHoldData(userData!);
                  }
                },
                child: Text("ذخیره"),
              )
            ],
          ),
        );
      },
    );
  }
}

class ProfileEditor extends StatefulWidget {
  final UserProfileStateHolder formState;
  const ProfileEditor({
    super.key,
    required this.formState,
  });

  @override
  State<ProfileEditor> createState() => _ProfileEditorState();
}

class _ProfileEditorState extends State<ProfileEditor> {
  @override
  Widget build(BuildContext context) {
    final user = widget.formState.userData!;
    return SettingsFullFieldForm(
      rows: [
        SettingFieldWrap(
          fields: [
            SettingField(
              title: "نام شما",
              initialValue: user.name,
              onSave: (val) => widget.formState.updateUserData(
                user.copyWith(newName: val),
              ),
              minLength: 4,
            ),
            SettingField(
              title: "نام کاربری",
              initialValue: user.username,
              minLength: 4,
              onSave: (val) => widget.formState.updateUserData(
                user.copyWith(newUsername: val),
              ),
            ),
          ],
        ),
        SettingFieldWrap(
          fields: [
            SettingField(
              onValidate: (val) => emailValidator(val!),
              title: "ایمیل",
              initialValue: user.email,
              onSave: (val) => widget.formState.updateUserData(
                user.copyWith(newEmail: val),
              ),
            ),
            SettingField(
              title: "تاریخ تولد",
              field: TapRegion(
                onTapInside: (e) async {
                  final pickedDate = await showPersianDatePicker(
                    context: context,
                    initialDate: Jalali.now(),
                    firstDate: Jalali(1300),
                    lastDate: Jalali.now(),
                    confirmText: "ثبت",
                    cancelText: "لغو",
                  );
                  if (pickedDate != null) {
                    final newBD = pickedDate.toDateTime();
                    if (newBD.compareTo(user.birthday) != 0) {
                      setState(() {
                        widget.formState.updateUserData(
                          user.copyWith(newBirthday: newBD),
                        );
                      });
                    }
                  }
                },
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        key: ObjectKey(user.birthday),
                        readOnly: true,
                        initialValue:
                            Jalali.fromDateTime(user.birthday).formatFullDate(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SettingFieldWrap(
          fields: [
            SettingField(
              title: "آدرس فعلی",
              initialValue: user.presentAddress,
              onSave: (val) => widget.formState.updateUserData(
                user.copyWith(newPresentAddress: val),
              ),
            ),
            SettingField(
              title: "آدرس دائمی",
              initialValue: user.permanentAddress,
              onSave: (val) => widget.formState.updateUserData(
                user.copyWith(newPermanentAddress: val),
              ),
            ),
          ],
        ),
        SettingFieldWrap(
          fields: [
            SettingField(
              title: "شهر",
              initialValue: user.city,
              onSave: (val) => widget.formState.updateUserData(
                user.copyWith(newCity: val),
              ),
              minLength: 3,
            ),
            SettingField(
              title: "کد پستی",
              field: NumberFormField(
                initialValue: '${user.postalCode}',
                validator: (val) => minLengthStringValidator(
                  val ?? '',
                  label: 'کد پستی',
                  minLength: 4,
                ),
                onSaved: (val) => widget.formState.updateUserData(
                  user.copyWith(
                    newPostalCode: int.tryParse(val!),
                  ),
                ),
                keyboardType: TextInputType.number,
                numberType: NumberType.positiveInt,
              ),
            ),
          ],
        ),
        SettingFieldWrap(
          fields: [
            SettingField(
              title: "کشور",
              initialValue: user.country,
              onSave: (val) => widget.formState.updateUserData(
                user.copyWith(newCountry: val),
              ),
              minLength: 3,
            ),
          ],
        )
      ],
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  final ImageProvider image;
  final void Function(ImageProvider newAvatar) onNewAvatar;
  const ProfileAvatar(
      {super.key, required this.image, required this.onNewAvatar});

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapInside: (event) async {
        final newImageBytes = await imageUploader();
        onNewAvatar(MemoryImage(newImageBytes));
      },
      child: CircleAvatar(
        radius: 65,
        backgroundImage: image,
      ),
    );
  }
}
