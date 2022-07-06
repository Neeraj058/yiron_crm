class MeetingModel {
  String status;
  List<Data> data;

  MeetingModel({this.status, this.data});

  MeetingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String meetingLogId;
  String geoLocationName;
  String userName;
  String account;
  String accountType;
  String leadType;
  String accountStatus;
  String month;
  String year;
  String date;
  String owner;
  String day;
  String meetingOutcome;
  String city;
  String address;
  String checkInDate;
  String checkInTime;
  String meetingNotHeld;
  String checkOutAddress;
  String checkOutDate;
  String checkOutTime;
  String meetingDuration;
  String momCheck;
  String telephonic;
  String interactionLogId;
  String createdAt;
  String createdBy;
  String lastModifiedBy;
  String updatedOn;
  String accountName;
  String firstName;

  Data(
      {this.meetingLogId,
        this.geoLocationName,
        this.userName,
        this.account,
        this.accountType,
        this.leadType,
        this.accountStatus,
        this.month,
        this.year,
        this.date,
        this.owner,
        this.day,
        this.meetingOutcome,
        this.city,
        this.address,
        this.checkInDate,
        this.checkInTime,
        this.meetingNotHeld,
        this.checkOutAddress,
        this.checkOutDate,
        this.checkOutTime,
        this.meetingDuration,
        this.momCheck,
        this.telephonic,
        this.interactionLogId,
        this.createdAt,
        this.createdBy,
        this.lastModifiedBy,
        this.updatedOn,
        this.accountName,
        this.firstName});

  Data.fromJson(Map<String, dynamic> json) {
    meetingLogId = json['meeting_log_id'];
    geoLocationName = json['geo_location_name'];
    userName = json['user_name'];
    account = json['account'];
    accountType = json['account_type'];
    leadType = json['lead_type'];
    accountStatus = json['account_status'];
    month = json['month'];
    year = json['year'];
    date = json['date'];
    owner = json['owner'];
    day = json['day'];
    meetingOutcome = json['meeting_outcome'];
    city = json['city'];
    address = json['address'];
    checkInDate = json['check_in_date'];
    checkInTime = json['check_in_time'];
    meetingNotHeld = json['meeting_not_held'];
    checkOutAddress = json['check_out_address'];
    checkOutDate = json['check_out_date'];
    checkOutTime = json['check_out_time'];
    meetingDuration = json['meeting_duration'];
    momCheck = json['mom_check'];
    telephonic = json['telephonic'];
    interactionLogId = json['interaction_log_id'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    lastModifiedBy = json['last_modified_by'];
    updatedOn = json['updated_on'];
    accountName = json['account_name'];
    firstName = json['first_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['meeting_log_id'] = this.meetingLogId;
    data['geo_location_name'] = this.geoLocationName;
    data['user_name'] = this.userName;
    data['account'] = this.account;
    data['account_type'] = this.accountType;
    data['lead_type'] = this.leadType;
    data['account_status'] = this.accountStatus;
    data['month'] = this.month;
    data['year'] = this.year;
    data['date'] = this.date;
    data['owner'] = this.owner;
    data['day'] = this.day;
    data['meeting_outcome'] = this.meetingOutcome;
    data['city'] = this.city;
    data['address'] = this.address;
    data['check_in_date'] = this.checkInDate;
    data['check_in_time'] = this.checkInTime;
    data['meeting_not_held'] = this.meetingNotHeld;
    data['check_out_address'] = this.checkOutAddress;
    data['check_out_date'] = this.checkOutDate;
    data['check_out_time'] = this.checkOutTime;
    data['meeting_duration'] = this.meetingDuration;
    data['mom_check'] = this.momCheck;
    data['telephonic'] = this.telephonic;
    data['interaction_log_id'] = this.interactionLogId;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['last_modified_by'] = this.lastModifiedBy;
    data['updated_on'] = this.updatedOn;
    data['account_name'] = this.accountName;
    data['first_name'] = this.firstName;
    return data;
  }
}

