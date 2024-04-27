import router from '@ohos.router'
import GoodInfo from '../../viewmodel/GoodInfo'
import ItemInfo from '../../viewmodel/GoodInfo'

@Component
export default struct buy_buyPageHeader {
  @Prop MyUrl: string

  build() {
    Row({ space: 14 }) {
      Image($r("app.media.buy_arrow"))
        .width(28)
        .onClick(() => {
          if (this.MyUrl.startsWith('pages')) {
            router.back()
          } else {
            router.back(
              {
                url: this.MyUrl
              }

            )
          }


        })
      Blank()

      Image($r('app.media.buy_sell'))
        .width(28)
      Image($r('app.media.buy_WeChat'))
        .width(28)
      Text('···')
        .fontSize(16)
        .fontWeight(FontWeight.Bolder)
    }
    .width('100%')
    .height(60)
    .padding(16)

  }
}