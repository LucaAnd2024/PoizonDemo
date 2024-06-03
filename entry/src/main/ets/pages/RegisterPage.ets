import userModel from '../model/UserModel';
import UserInfo from '../viewmodel/UerInfo';

@Entry
@Component
struct RegisterPage {
  @State user_name: string = '';
  @State user_password: string = '';

  build() {
    Column() {
      TextInput({ placeholder: '输入用户名' }).onChange((value) => this.user_name = value);
      TextInput({ placeholder: '输入密码' }).type(InputType.Password).onChange((value) => this.user_password = value);
      Button('注册').onClick(() => this.handleRegister());
    }
    .padding(20)
  }

  handleRegister() {
    const user: UserInfo = { user_name: this.user_name, user_password: this.user_password };
    userModel.register(user)
      .then(data => console.log('注册成功', JSON.stringify(data)))
      .catch(error => console.error('注册失败', error));
  }
}
