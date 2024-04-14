import user_creation from './user_creation'
import user_Header from './user_Header'
import user_info from './user_info'
import user_interaction from './user_interaction'

import user_buyDetail from './user_buyDetail'
import user_order from './user_order'
@Extend(Text)
function light_character() {
  .fontSize(13)
  .fontColor($r('app.color.light_gray'))

}

@Extend(Text)
function normal_character() {
  .fontSize(13)
  .fontColor($r('app.color.light_gray'))

}

@Extend(Text)
function bold_character() {
  .fontSize(13)
  .fontColor($r('app.color.light_gray'))

}

@Component
export default struct userIndex {
  build() {
    Column({ space: 8 }) {
      user_Header()
      // 2.个人信息
      user_info()
      // 3.互动详情
      user_interaction()
      // 4.创作中心
      user_creation()
      // 5.购物相关卡片
      user_buyDetail()
      // 6.订单卡片
      user_order()
      // 7.钱包
      // 8.合作卡片
      // 9.服务卡片
    }
    .justifyContent(FlexAlign.Start)
    .width('97%')
    .height('100%')
    .backgroundColor($r('app.color.user_PageBackground'))

  }
}
