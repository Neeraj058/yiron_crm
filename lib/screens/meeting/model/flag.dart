class FlagCheck {
  CheckinFlag checkinFlag;

  FlagCheck({this.checkinFlag});

  FlagCheck.fromJson(Map<String, dynamic> json) {
    checkinFlag = json['checkin_flag'] != null
        ? new CheckinFlag.fromJson(json['checkin_flag'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.checkinFlag != null) {
      data['checkin_flag'] = this.checkinFlag.toJson();
    }
    return data;
  }
}

class CheckinFlag {
  String checkinFlag;

  CheckinFlag({this.checkinFlag});

  CheckinFlag.fromJson(Map<String, dynamic> json) {
    checkinFlag = json['checkin_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['checkin_flag'] = this.checkinFlag;
    return data;
  }
}

