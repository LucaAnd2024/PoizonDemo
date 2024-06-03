import router from '@ohos.router'
import likeItemModel from '../../model/LikeItemModel'
import buy_BottomShoppingCard from './buy_BottomShoppingCard'
import buy_buyPageHeader from './buy_buyPageHeader'
import GoodInfo from '../../viewmodel/GoodInfo'
import ItemInfo from '../../viewmodel/GoodInfo'
import LikeItem from '../../viewmodel/LikeItem'
import GoodInfoModel from '../../model/GoodInfoModel'
import goodInfoModel from '../../model/GoodInfoModel'


@Entry
@Component
struct Buy_buyPage {
  @State Index: number = 0
  @State MyUrl: string = undefined
  @State good: GoodInfo = null
  scroller: Scroller = new Scroller()

  aboutToAppear() {
    const params: {
      Index?: number,
      MyUrl?: string
    } = router.getParams()
    this.Index = params.Index
    this.MyUrl = params.MyUrl
    this.good = goodInfoModel.getGoodById(this.Index)
  }

  build() {
    Column({ space: 6 }) {
      //todo:将代码优化分类
      //1. 标题
      buy_buyPageHeader({ MyUrl: this.MyUrl })

      Scroll(this.scroller) {
        Column({ space: 6 }) {
          // if (this.good.p1 || this.good.p2) {
          //   //2. 照片
          //     //todo:导航点样式
          //     Swiper() {
          //       Image(this.good.p1)
          //         .width('100%')
          //       Image(this.good.p2)
          //         .width('100%')
          //   }
          //
          //   //3. 图片展示
          //   //todo:实现跳转
          //   Row({ space: 8 }) {
          //     Image(this.good.p1)
          //       .width(50)
          //
          //     Image(this.good.p2)
          //       .width(50)
          //
          //   }
          //   .width('94%')
          // } else {
          //     //todo:导航点样式
          //     Image(this.good.image)
          //       .width('100%')
          // }


          //4. 详情价格
          Column() {
            Row() {
              Text(`￥`)
                .fontSize(20)
                .fontWeight(FontWeight.Bold)

              Text(this.good.price + '')
                .fontSize(30)
                .fontWeight(FontWeight.Bold)
            }
            .margin({ top: 10, left: 8 })
            .width('100%')

            Text(this.good.slogan)
              .margin({ top: 10, left: 10 })
              .width('100%')
              .maxLines(2)
              .width('90%')
            Row({ space: 4 }) {
              Image($r('app.media.buy_star'))
                .width(12)

              Image($r('app.media.buy_star'))
                .width(12)

              Image($r('app.media.buy_star'))
                .width(12)

              Image($r('app.media.buy_star'))
                .width(12)

              Image($r('app.media.buy_star'))
                .width(12)

              Text('9.6')
                .fontColor($r('app.color.light_gray'))
            }
            .width('100%')
            .height(30)
            .margin({ top: 10, left: 10 })

            Row() {
              Text('热销榜')
                .fontColor($r('app.color.light_gray'))
                .fontSize(12)
              Image($r('app.media.user_arrow'))
                .width(12)
            }.width('100%')
            .height(30)
            .margin({ top: 10, left: 10 })

          }
          .width('94%')
          .height(170)
          .backgroundColor($r('app.color.White'))
          .margin({ top: 8 })
          .justifyContent(FlexAlign.Start)
          .alignItems(HorizontalAlign.Start)

          //5. 保障
          Column() {

            Row() {
              //todo:完善UI
              Button('服务')
                .fontSize(12)
                .backgroundColor($r('app.color.White'))
                .fontColor($r('app.color.Black'))
                .type(ButtonType.Normal)
                .width(60)
                .size({})

              Text('假一赔十 · 7天无理由退货 · 退换货减免运费 · 逐件查验')
                .fontSize(13)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .maxLines(1)
                .layoutWeight(1)
              Image($r('app.media.user_arrow'))
                .width(12)

            }
            .width('100%')
            .height(30)
            .margin({ top: 10, right: 10 })

            Divider()
              .strokeWidth(0.5)
              .width('90%')
            Row() {
              //todo:完善UI(滚动效果)
              Button('参数')
                .fontSize(12)
                .backgroundColor($r('app.color.White'))
                .fontColor($r('app.color.Black'))
                .type(ButtonType.Normal)
                .width(60)
              Row({ space: 8 }) {
                Text('电池容量\n5600mAh')
                  .fontSize(13)
                Divider()
                  .strokeWidth(0.5)
                  .vertical(true)

                Text('电池容量\n5600mAh')
                  .fontSize(13)
                Divider()
                  .strokeWidth(0.5)
                  .vertical(true)

                Text('电池容量\n5600mAh')
                  .fontSize(13)
                Divider()
                  .strokeWidth(0.5)
                  .vertical(true)


              }
              .layoutWeight(1)


              Image($r('app.media.user_arrow'))
                .width(12)

            }
            .width('100%')
            .height(30)
            .margin({ top: 10, right: 10 })

          }
          .width('94%')
          .height(140)
          .backgroundColor($r('app.color.White'))
          .margin({ top: 8 })

        }.width('100%')
      }
      .scrollable(ScrollDirection.Vertical) // 滚动方向纵向
      .height(700)

      //6. 底部购买栏
      buy_BottomShoppingCard({ Index: this.Index })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.buy_PageBackground'))
  }
}
