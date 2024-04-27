import router from '@ohos.router'
import likeItemModel from '../../model/LikeItemModel'
import LikeItem from '../../viewmodel/LikeItem'

@Component
export default struct user_wantPageHeader {

  build() {
    Row() {
      Image($r('app.media.buy_arrow'))
        .width(35)
        .onClick(() => {
          router.back(
            {
              url: 'pages/Index'

            }



          )
        })
      Text('我想要的')
        .fontSize(25)
        .fontWeight(FontWeight.Bolder)

      Blank()
      Image($r('app.media.user_search'))
        .width(20)
      Button({ type: ButtonType.Capsule, stateEffect: true }) {
        Row() {
          Image($r('app.media.tab_buy'))
            .width(20)
            .height(20)
            .fillColor($r('app.color.user_wantPageBuyIcon'))
            .margin({ left: 10 })
          Text('合并下单').fontSize(12).fontColor($r('app.color.Black')).margin({ left: 5, right: 12 })
        }.alignItems(VerticalAlign.Center).width(90).height(30)

      }
      .backgroundColor($r('app.color.user_PageBackground'))
      .borderWidth(0.5)
      .borderColor($r('app.color.light_gray'))
      .height(30)
      .margin({ left: 16 })



    }
    .margin({ top: 20 })
    .width('94%')
  }
}