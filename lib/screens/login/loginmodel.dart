class LoginModel {
  String status;
  Data data;

  LoginModel({this.status, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  String userId;
  String sessUsertype;
  String sessUser;
  String sessEmailId;
  String sessFullName;

  Data(
      {this.userId,
        this.sessUsertype,
        this.sessUser,
        this.sessEmailId,
        this.sessFullName});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    sessUsertype = json['sess_usertype'];
    sessUser = json['sess_user'];
    sessEmailId = json['sess_email_id'];
    sessFullName = json['sess_full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['sess_usertype'] = this.sessUsertype;
    data['sess_user'] = this.sessUser;
    data['sess_email_id'] = this.sessEmailId;
    data['sess_full_name'] = this.sessFullName;
    return data;
  }
}

