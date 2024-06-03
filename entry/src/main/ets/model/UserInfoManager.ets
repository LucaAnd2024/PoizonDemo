class UserInfoManager {
  saveUserInfo(user_id, user_name, token) {
    AppStorage.SetOrCreate('user_id', user_id)
    AppStorage.SetOrCreate('user_name', user_name);
    AppStorage.SetOrCreate('token', token);

  }

  getUserInfo() {
    return {
      user_id: AppStorage.Get('user_id'),
      user_name: AppStorage.Get('user_name'),
      token: AppStorage.Get('token')
    };
  }
  clearUserInfo() {
    AppStorage.Delete('user_id');
    AppStorage.Delete('user_name');
    AppStorage.Delete('token');
  }
}
const  userInfoManager = new UserInfoManager();
export default userInfoManager as UserInfoManager;


