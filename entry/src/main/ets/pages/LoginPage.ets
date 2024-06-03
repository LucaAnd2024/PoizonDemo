import axios from '@ohos/axios';
import userModel from '../model/UserModel';
import UserInfo from '../viewmodel/UerInfo';
import router from '@ohos.router'


@Entry
@Component
struct LoginPage {
  @State user_name: string = '';
  @State user_password: string = '';
  @State loginMessage: string = '';

  build() {
    Column({ space: 10 }) {
      Image($r('app.media.user_image'))
        .width(100)
      TextInput({ placeholder: '名字' }).margin({ top: 20 })
        .onChange((value) => {
          this.user_name = value
        })
        .placeholderColor($r('app.color.light_gray'))

      TextInput({ placeholder: '密码' }).type(InputType.Password).margin({ top: 20 })
        .onChange((value) => {
          this.user_password = value
        })
        .placeholderColor($r('app.color.light_gray'))
      Row({ space: 20 }) {
        Button('登录')
          .margin({ top: 20 })
          .backgroundColor('#57bfc2')
          .onClick(() => {
            this.handleLogin()
          })
        Button('注册')
          .margin({ top: 20 })

          .onClick(() => {
            this.handleLogin()
          })
      }
      .justifyContent(FlexAlign.SpaceAround)
      .width('100%')

    }.padding(20)
    .height('80%')
    .justifyContent(FlexAlign.Center)

  }

  handleLogin() {
    const user: UserInfo = { user_name: this.user_name, user_password: this.user_password };
    userModel.login(user)
      .then(data => {
        console.log('登录成功', JSON.stringify(data));
        router.pushUrl({ url: 'pages/Index' })
          .then(() => {
            // success
          })
          .catch(err => {
            console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
      })
      .catch(error => {
        console.error('登录失败3:', error);
      });
  }
}

