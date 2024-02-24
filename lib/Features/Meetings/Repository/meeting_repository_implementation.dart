import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:zoom_clone/Features/Authentication/Repository/auth_repository_implementation.dart';
import 'package:zoom_clone/Features/Meetings/Repository/meeting_repository.dart';

class MeetingRepositoryImplementation implements MeetingRepository {
  final AuthRepositoryImplementation _authRepositoryImplementation =
      AuthRepositoryImplementation();
  final JitsiMeet jitsiMeet = JitsiMeet();

  @override
  void createMeeting(String roomName) async {
    try {
      var options = JitsiMeetConferenceOptions(
        room: roomName,
        configOverrides: {
          "startWithAudioMuted": true,
          "startWithVideoMuted": true,
        },
        userInfo: JitsiMeetUserInfo(
          displayName: _authRepositoryImplementation.user.displayName,
          email: _authRepositoryImplementation.user.email,
          avatar: _authRepositoryImplementation.user.photoURL,
        ),
      );
      await jitsiMeet.join(options);
    } catch (e) {
      print("Error starting meeting: $e");
      throw e;
    }
  }
}
