import router from '@ohos.router'
import KeyWordModel from '../../model/KeyWordModel'

import { KeyWord } from '../../viewmodel/KeyWord'

@Component
export default struct buy_SearchBar {
  @State keywords:KeyWord[]=KeyWordModel.list()

  build() {
    Row({ space: 8 }) {
      Row({space:6}) {
        Image($r('app.media.buy_search'))
          .width(20)
          .interpolation(ImageInterpolation.High)
          .margin({left:10})

        Swiper() {
          ForEach(this.keywords, (item: KeyWord) => {
            Text(item.name).fontSize(16).fontColor($r('app.color.gray'))
          })
        }.autoPlay(true).vertical(true).indicator(false)
        Blank()

        Image($r("app.media.buy_camera"))
          .width(20)
      }
      .layoutWeight(1)


      Row({ space: 8 }) {
        Divider()
          .strokeWidth(1)
          .vertical(true)
          .height(20)
        Text('搜索')
          .fontSize(16)
      }
      .margin({ right: 8 })
    }

    .onClick(() => {
      router.pushUrl(
        {
          url: 'view/buyPage/buy_SearchPage'
        },
        router.RouterMode.Single,
        err => {
          if (err) {
            console.log('errCode: ' + err.code + 'errMsg:' + err.message)
          }
        }
      )
    })
    .width('90%')
    .backgroundColor($r('app.color.searchBarBackground'))
    .height(40)


  }
}