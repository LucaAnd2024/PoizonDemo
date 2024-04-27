import router from '@ohos.router'
import promptAction from '@ohos.promptAction'
import KeyWordModel from '../../model/KeyWordModel'
import { KeyWord } from '../../viewmodel/KeyWord'

import GoodInfo from '../../viewmodel/GoodInfo'
import likeItemModel from '../../model/LikeItemModel'
import LikeItem from '../../viewmodel/LikeItem'

import goodInfoModel, { GoodInfoModel } from '../../model/GoodInfoModel'


@Entry
@Component
export default struct buy_searchedGoodPage {
  @State name: string = undefined
  @State keyword: string = ''
  @State Number: String[] = ['0', '1']
  @State GoodsByName: GoodInfo[] = goodInfoModel.getGoodsByName(this.name)
  scroller: Scroller = new Scroller()

  pageTransition() {
    // 定义页面进入时的效果，从左侧滑入，时长为1200ms，无论页面栈发生push还是pop操作均可生效
    PageTransitionEnter({ type: RouteType.None, duration: 1 })
      .slide(SlideEffect.Left)
    // 定义页面退出时的效果，向左侧滑出，时长为1000ms，无论页面栈发生push还是pop操作均可生效
    PageTransitionExit({ type: RouteType.None, duration: 1})
      .slide(SlideEffect.Left)
  }

  aboutToAppear() {
    const params: { name?: string } = router.getParams()
    this.name = params.name
    this.GoodsByName = goodInfoModel.getGoodsByName(this.name)
  }

  aboutToDisappear() {
    this.GoodsByName = goodInfoModel.clearSearchedGoods()
  }

  build() {
    Column() {
      // Row({ space: 4 }) {
      //   Image($r('app.media.buy_arrow')).width(30).onClick(() => {
      //     router.back()
      //   })
      //   Row() {
      //     Search({ placeholder: this.name })
      //       .onChange((value: string) => {
      //         this.keyword = value
      //       })
      //       .layoutWeight(1)
      //       .backgroundColor($r('app.color.searchBarBackground'))
      //       .height(40)
      //       .placeholderColor(Color.Grey)
      //       .placeholderFont({ size: 14, weight: 400 })
      //       .textFont({ size: 14, weight: 400 })
      //
      //
      //     Image($r("app.media.buy_camera"))
      //       .width(18)
      //       .margin({ right: 8 })
      //   }
      //   .backgroundColor($r('app.color.searchBarBackground'))
      //   .layoutWeight(1)
      //
      //   Row({ space: 8 }) {
      //     Text('搜索')
      //       .fontSize(16)
      //       .padding(6)
      //       .onClick(() => {
      //         if (this.keyword === '') {
      //           promptAction.showToast({ message: '请输入您想要的商品名称' })
      //           return
      //         }
      //         router.pushUrl({
      //           url: 'pages/buy_searchedGoodPage',
      //           params: {
      //             name: this.keyword
      //           }
      //         })
      //       })
      //
      //
      //   }
      //   .margin({ right: 8 })
      //
      // }
      // .width('100%')
      // .backgroundColor('#FFF')
      // .padding({ left: 10, right: 10 })
      // .margin({ top: 20 })
      // .width('100%')
      // .height(40)
      Row() {
        Image($r('app.media.buy_arrow')).width(30).onClick(() => {
          router.back()
        })
        Row({ space: 8 }) {
          Row({ space: 6 }) {
            Image($r('app.media.buy_search'))
              .width(20)
              .interpolation(ImageInterpolation.High)
              .margin({ left: 10 })
            Text(`${this.name}`)
            Blank()

            Image($r("app.media.buy_camera"))
              .width(20)
          }
          .backgroundColor($r('app.color.searchBarBackground'))
          .layoutWeight(1)
          .padding(8)

          Text('搜索')
            .fontSize(16)
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
        .height(80)

      }
      .margin({ top: 8 })
      .width('100%')
      .height(80)


      Column() {
        Grid(this.scroller) {
          ForEach(this.GoodsByName, (item: GoodInfo, index: number) => {
            GridItem() {
              GoodList({ item: this.GoodsByName[index] })
            }
          })
        }
        .columnsTemplate('1fr 1fr')
        .width('100%')
        .height('100%')
      }
    }

  }
}

@Component
struct GoodList {
  @ObjectLink item: GoodInfo;

  build() {
    Column() {
      Image(this.item.image)
      Text(this.item.name)
      Row() {
        Text(this.item.price + '元')
        Blank('25')
        Text(this.item.peopleBuy + '人已购')
          .fontSize(16)
      }
    }
    .width(162)
    .onClick(() => {

      router.pushUrl(
        {
          url: 'view/buyPage/buy_buyPage',
          params: { item: this.item, like: this.item.like, MyUrl: 'pages/Index' }

        },
        router.RouterMode.Single,

        err => {
          if (err) {
            console.log('errCode: ' + err.code + 'errMsg:' + err.message)
          }
        }

      )
    })
  }
}