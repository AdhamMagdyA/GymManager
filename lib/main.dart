import 'dart:js';

import 'package:flutter/material.dart';
import 'package:gym_project/experimenting_image_picker.dart';
import 'package:gym_project/my_image_picker_2.dart';
import 'package:gym_project/screens/Events/event-details.dart';
import 'package:gym_project/screens/Events/event-form.dart';
import 'package:gym_project/screens/Events/events-list.dart';
import 'package:gym_project/screens/Feedbacks/feedback-form.dart';
import 'package:gym_project/screens/Invitations/invitation-form.dart';
import 'package:gym_project/screens/Invitations/invitation-list.dart';
import 'package:gym_project/screens/Supplements/supplement-form.dart';
import 'package:gym_project/screens/Supplements/supplement-grid-view.dart';
import 'package:gym_project/screens/admin/memberships/memberships_list.dart';
import 'package:gym_project/screens/announcements/add-announcement-screen.dart';
import 'package:gym_project/screens/announcements/announcements-screen.dart';
import 'package:gym_project/screens/coach/coach-profile.dart';
import 'package:gym_project/screens/coach/coach-tabs-screen.dart';
import 'package:gym_project/screens/coach/exercises/create-exercise.dart';
import 'package:gym_project/screens/coach/exercises/edit-exercise.dart';
import 'package:gym_project/screens/coach/exercises/exercises_screen.dart';
import 'package:gym_project/screens/coach/groups/create-group.dart';
import 'package:gym_project/screens/coach/groups/edit-group.dart';
import 'package:gym_project/screens/coach/groups/view-groups.dart';
import 'package:gym_project/screens/coach/private%20sessions/create-private-session.dart';
import 'package:gym_project/screens/coach/private%20sessions/edit-private-session.dart';
import 'package:gym_project/screens/coach/sets/create-set.dart';
import 'package:gym_project/screens/coach/sets/edit-set.dart';
import 'package:gym_project/screens/coach/sets/view-sets.dart';
import 'package:gym_project/screens/common/grid_view.dart';
import 'package:gym_project/screens/common/login-screen.dart';
import 'package:gym_project/screens/common/tabs-screen.dart';
import 'package:gym_project/screens/admin/admin_home_page.dart';
import 'package:gym_project/screens/admin/branches/branch_details.dart';
import 'package:gym_project/screens/admin/branches/branches_list.dart';
import 'package:gym_project/screens/admin/branches/create_branch.dart';
import 'package:gym_project/screens/admin/branches/edit_branch.dart';
import 'package:gym_project/screens/admin/classes/class_details.dart';
import 'package:gym_project/screens/admin/classes/classes_list.dart';
import 'package:gym_project/screens/admin/classes/create_class.dart';
import 'package:gym_project/screens/admin/classes/edit_class.dart';
import 'package:gym_project/screens/admin/equipment/create_equipment.dart';
import 'package:gym_project/screens/admin/equipment/edit_equipment.dart';
import 'package:gym_project/screens/admin/equipment/equipment_details.dart';
import 'package:gym_project/screens/admin/equipment/equipment_list.dart';
import 'package:gym_project/screens/admin/memberships/create_membership.dart';
import 'package:gym_project/screens/admin/memberships/edit_membership.dart';
import 'package:gym_project/screens/admin/memberships/membership_details.dart';
import 'package:gym_project/screens/admin/nutritionist_sessions/create_Nutrisionist_Session.dart';
import 'package:gym_project/screens/admin/nutritionist_sessions/edit_nutrionist_session.dart';
import 'package:gym_project/screens/admin/nutritionist_sessions/nutritionist_sessions_list.dart';
import 'package:gym_project/screens/admin/users/create_user.dart';
import 'package:gym_project/screens/admin/users/edit_user.dart';
import 'package:gym_project/screens/admin/users/user_details.dart';
import 'package:gym_project/screens/admin/util-screen.dart';
import 'package:gym_project/screens/coach/coach-tabs-screen.dart';
import 'package:gym_project/screens/nutritionist/items_screen.dart';
import 'package:gym_project/screens/member/view-private-sessions.dart';
import 'package:gym_project/screens/my_choosing_gridview_screen.dart';
import 'package:gym_project/screens/member/training-mode/training_mode_exercise_screen.dart';
import 'package:gym_project/screens/member/training-mode/training_mode_overview_screen.dart';
import 'package:gym_project/screens/nutritionist/meals-screen.dart';
import 'package:gym_project/screens/nutritionist/plans-screen.dart';
import 'package:gym_project/screens/nutritionist/util-screen.dart';
import 'package:gym_project/screens/questions/add-question-screen.dart';
import 'package:gym_project/screens/questions/questions-screen.dart';
import 'package:gym_project/screens/questions/single-question.dart';
import 'package:gym_project/widget/providers/user.dart';
import 'package:provider/provider.dart';
import 'package:gym_project/screens/my_choosing_gridview_screen.dart';

import 'screens/common/ProfilePage.dart';
import 'screens/member/home-screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => User()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '': (context) => AdminHomePage(),
        // user routes
        '/user-details': (context) => UserDetails(),
        '/create-user': (context) => CreateUserForm(),
        '/edit-user': (context) => EditUserForm(),
        //branches routes
        'branches-list': (context) => BranchesList(),
        '/branch-details': (context) => BranchDetails(),
        '/create-branch': (context) => CreateBranchForm(),
        '/edit-branch': (context) => EditBranchForm(),
        //membership routes
        '/memberships-list': (context) => MembershipsList(),
        '/membership-details': (context) => MembershipDetails(),
        '/create-membership': (context) => CreateMembership(),
        '/edit-membership': (context) => EditMembership(),
        //Classes routes
        '/class-list': (context) => ClassesList(),
        '/class-details': (context) => ClassDetails(),
        '/create-class': (context) => CreateClassForm(),
        '/edit-class': (context) => EditClass(),
        //nutritionist-session routes
        '/nutritionist-session-list': (context) => NutritionistSessionsList(),
        '/create-nutritionist-session': (context) =>
            NutrisionistSessionCreate(),
        '/edit-nutritionist-session': (context) => EditNutrionistSession(),
        //Equipment routes
        '/equipment-list': (context) => EquipmentList(),
        '/equipment-details': (context) => EquipmentDetails(),
        '/create-equipment': (context) => CreateEquipmentForm(),
        '/edit-equipment': (context) => EditEquipmentForm(),

        '/nutritionist-sessions-list': (context) => NutritionistSessionsList(),

        //Events routes
        '/events': (context) => EventListView(),
        '/create-event': (context) => EventForm(),
        '/edit-event': (context) => EventForm(),

        //supplements routes
        '/supplements': (context) => SupplementList(),
        '/create-supplement': (context) => SupplementForm(),
        '/edit-supplement': (context) => SupplementForm(),

        '/invite': (context) => InvitationForm(),
        '/feedback': (context) => FeedbackForm(),
        '/invitations': (context) => InvitationList(),

        //questions&answers routes
        '/questions': (context) => QuestionsScreen(),
        '/add-question': (context) => AddQuestionScreen(),
        '/question-answers': (context) => SingleQuestionScreen(),

        //announcements routes
        '/announcements': (context) => AnnouncementsScreen(),
        '/create-announcement': (context) => AddAnnouncementScreen(),

        //coach profile
        '/coach/profile': (context) => CoachProfile(),
        // '/coach/schedule': (context) => CoachSchedule(),
        // exercises
        ExercisesScreen.routeName: (context) => ExercisesScreen(false),
        //exercises routes
        '/exercises': (context) => ExercisesScreen(false),
        '/exercises/index': (context) => ExercisesScreen(true),
        // '/create-exercise': (context) => CreateExerciseForm(),
        // '/edit-exercise': (context) => EditExerciseForm(),

        //sets routes
        '/sets': (context) => ViewSetsScreen(false),
        // '/create-set': (context) => CreateSetForm(),
        // '/edit-set': (context) => EditSetForm(set),

        //groups routes
        '/groups': (context) => ViewGroupsScreen(false),
        // '/create-group': (context) => CreateGroupForm(),
        // '/edit-group': (context) => EditGroupForm(),

        //private session routes
        '/private-sessions': (context) => ViewPrivateSessionsScreen(),
        // '/create-private-session': (context) => CreatePrivateSessionForm(),
        // '/edit-private-session': (context) => EditPrivateSessionForm(),

        //items routes
        '/items': (context) => ItemsScreen(false),
        // '/create-item': (context) => CreateItemForm(),
        // '/edit-item': (context) => EditItemForm()

        //meals routes
        '/meals': (context) => MealsViewScreen(),
        // '/create-meal': (context) => CreateMealForm(),
        // '/edit-meal': (context) => EditMealForm(),

        //plans routes
        '/plans': (context) => PlansViewScreen(),
        // '/create-plan': (context) => CreatePlanForm(),
        // '/edit-plan': (context) => EditPlanForm(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Gym',
      theme: ThemeData(
          primaryColor: Color(0xFFFFCE2B),
          //primaryColor: Color(0xff0082CD),
          //primaryColorDark: Color(0xff0082CD),
          accentColor: Color(0xFFFFCE2B),
          scaffoldBackgroundColor: Colors.black,
          canvasColor: Colors.white,
          fontFamily: "ProximaNova",
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
            headline1: TextStyle(color: Colors.white),
            headline2: TextStyle(color: Colors.white),
            headline3: TextStyle(color: Colors.white),
            headline4: TextStyle(color: Colors.white),
            headline5: TextStyle(color: Colors.white),
            headline6: TextStyle(color: Colors.white),
          )),
    );
  }
}
