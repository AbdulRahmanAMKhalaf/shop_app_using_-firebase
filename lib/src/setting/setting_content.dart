import 'package:shop_app/shared/cores/utils/parallel_tool.dart';
import 'package:shop_app/src/bloc/auth/auth_bloc.dart';
import 'package:shop_app/src/bloc/home/home_bloc.dart';

class SettingContent extends StatelessWidget {
  const SettingContent({super.key});

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = context.read();
    HomeBloc homeBloc = context.watch();
    LocalizationBloc bloc = context.read();
    LocalizationBloc blocListener = context.watch();
    return homeBloc.state is! GeTDataSuccessfully
        ? Center(
            child: CircularProgressIndicator(
              color: AppColors.mainColor,
            ),
          )
        : ListView(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            children: [
              Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.deepOrange, Colors.grey.shade200]),
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Row(
                children: [
                  Text(
                    'Personal Info',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18.px,
                        fontWeight: FontWeight.w800),
                  ),
                 /* const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: Colors.black,
                        size: 25.px,
                      ))*/
                ],
              ),
              SizedBox(
                height: 1.h,
              ),

              /// ----------- Name ------------ ///
              Container(
                padding: EdgeInsets.all(3.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.px),
                    color: Colors.grey.shade200),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 25.px,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Expanded(
                      child: Text(
                        homeBloc.userModel!.name,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 17.px),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),

              /// ----------- Domain ------------ ///
              Container(
                padding: EdgeInsets.all(3.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.px),
                    color: Colors.grey.shade200),
                child: Row(
                  children: [
                    Icon(
                      Icons.business_center_outlined,
                      color: Colors.black,
                      size: 25.px,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      homeBloc.userModel!.work,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 17.px),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),

              /// ----------- Email ------------ ///
              Container(
                padding: EdgeInsets.all(3.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.px),
                    color: Colors.grey.shade200),
                child: Row(
                  children: [
                    Icon(
                      Icons.email_outlined,
                      color: Colors.black,
                      size: 25.px,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      homeBloc.userModel!.email,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 17.px),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),

              /// ----------- Phone Number ------------ ///
              Container(
                padding: EdgeInsets.all(3.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.px),
                    color: Colors.grey.shade200),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.black,
                      size: 25.px,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      homeBloc.userModel!.phoneNumber,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 17.px),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                'Preferences',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.px,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 1.h,
              ),

              /// ----------- Language ------------ ///
              Row(
                children: [
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 3.w, horizontal: 5.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.px),
                          color: Colors.grey.shade200),
                      child: Row(
                        children: [
                          Icon(
                            Icons.language,
                            color: Colors.black,
                            size: 25.px,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            'Language',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                                fontSize: 18.px),
                          )
                        ],
                      )),
                  SizedBox(
                    width: 2.w,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(3.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.px),
                          color: Colors.grey.shade200),
                      child: DropdownButton(
                        isDense: true,
                        isExpanded: true,
                        borderRadius: BorderRadius.circular(30.px),
                        value:blocListener.lang=='ar'? 2:1,
                        underline: const SizedBox(),
                        items: [
                          DropdownMenuItem(
                            value: 1,
                            child: Text(
                              'English',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15.px),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text(
                              'Arabic',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15.px),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          bloc.add(ChangeLanguageEvent());
                          if (value == 1) {
                            value = 2;
                          } else {
                            value = 1;
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),

              /// ----------- Theme ------------ ///
              Row(
                children: [
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 3.w, horizontal: 5.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.px),
                          color: Colors.grey.shade200),
                      child: Row(
                        children: [
                          Icon(
                            Icons.light_mode,
                            color: Colors.black,
                            size: 25.px,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            'Theme',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                                fontSize: 18.px),
                          )
                        ],
                      )),
                  SizedBox(
                    width: 2.w,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(3.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.px),
                          color: Colors.grey.shade200),
                      child: DropdownButton(
                        isDense: true,
                        isExpanded: true,
                        borderRadius: BorderRadius.circular(30.px),
                        value: 1,
                        underline: const SizedBox(),
                        items: [
                          DropdownMenuItem(
                            value: 1,
                            child: Text(
                              'Light',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15.px),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text(
                              'Dark',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15.px),
                            ),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),

              /// ----------- Notification ------------ ///
              Row(
                children: [
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 3.w, horizontal: 5.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.px),
                          color: Colors.grey.shade200),
                      child: Row(
                        children: [
                          Icon(
                            Icons.notifications_none_outlined,
                            color: Colors.black,
                            size: 25.px,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            'Notification',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                                fontSize: 18.px),
                          )
                        ],
                      )),
                  SizedBox(
                    width: 2.w,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(3.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.px),
                          color: Colors.grey.shade200),
                      child: DropdownButton(
                        isDense: true,
                        isExpanded: true,
                        borderRadius: BorderRadius.circular(30.px),
                        value: 2,
                        underline: const SizedBox(),
                        items: [
                          DropdownMenuItem(
                            value: 1,
                            child: Text(
                              'On',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15.px),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text(
                              'Off',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15.px),
                            ),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                'Others',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.px,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 1.h,
              ),

              /// ----------- FAQ ------------ ///
              ClipRRect(
                borderRadius: BorderRadius.circular(25.px),
                child: ExpansionTile(
                  collapsedBackgroundColor: Colors.grey.shade200,
                  title: Row(
                    children: [
                      Icon(
                        Icons.help,
                        color: Colors.black,
                        size: 25.px,
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        'FAQ',
                        style: TextStyle(
                            fontSize: 18.px,
                            color: Colors.black,
                            fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                  backgroundColor: Colors.white,
                  children: [
                   /* Text(
                      'FAQ Data',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        fontSize: 18.px,
                      ),
                    ),
                    Text(
                      'FAQ Data',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        fontSize: 18.px,
                      ),
                    ),
                    Text(
                      'FAQ Data',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        fontSize: 18.px,
                      ),
                    ),
                    Text(
                      'FAQ Data',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        fontSize: 18.px,
                      ),
                    ),*/
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),

              /// ----------- History ------------ ///
              Container(
                  padding: EdgeInsets.all(3.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.px),
                      color: Colors.grey.shade200),
                  child: Row(
                    children: [
                      Icon(
                        Icons.history,
                        color: Colors.black,
                        size: 25.px,
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        'History',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                            fontSize: 18.px),
                      )
                    ],
                  )),
              SizedBox(
                height: 3.h,
              ),
              CustomButton(
                borderRadius: 20,
                onPressed: () {
                  authBloc.add(LogOutEvent());
                },
                isText: true,
                text: 'Log Out',
                color: AppColors.mainColor,
              ),
              VerticalSpacing(
                height: 4,
              ),
            ],
          );
  }
}
