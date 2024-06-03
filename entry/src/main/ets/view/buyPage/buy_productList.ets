import router from '@ohos.router'
import GoodInfoModel from '../../model/GoodInfoModel'
import goodInfoModel from '../../model/GoodInfoModel'
import ItemInfoModel from '../../model/GoodInfoModel'
import likeItemModel from '../../model/LikeItemModel'
import GoodInfo from '../../viewmodel/GoodInfo'
import ItemInfo from '../../viewmodel/GoodInfo'


@Component
export default struct buy_productList {
  @State Number: String[] = ['0', '1']
  scroller: Scroller = new Scroller()
  @State GoodsByAxios: GoodInfo[] = goodInfoModel.list();

  build() {
    Column() {

      // 1)分类文本
      //todo:优化代码
      Stack() {
        Tabs() {
          TabContent() {
            //商品展示页
            this.TabContentBuilder(GoodInfoModel.list())
          }.tabBar('推荐')

          TabContent() {
            this.TabContentBuilder(GoodInfoModel.list())
          }.tabBar('书籍')

          TabContent() {
            this.TabContentBuilder(GoodInfoModel.list())
          }.tabBar('数码')


          TabContent() {
            Text('前方的区域，以后再来探索吧')
              .fontSize(16)
          }.tabBar('女装')

          TabContent() {
            this.TabContentBuilder(GoodInfoModel.list())
          }.tabBar('衣服')

          TabContent() {
            Text('手机')
              .fontSize(16)
          }.tabBar('手机')

          TabContent() {
            Text('鞋子')
              .fontSize(16)
          }.tabBar('潮服')

          TabContent() {
            Text('手机')
              .fontSize(16)
          }.tabBar('  ')

          TabContent() {
            Text('手机')
              .fontSize(16)
          }.tabBar('  ')

          TabContent() {
            Text('手机')
              .fontSize(16)
          }.tabBar('  ')

        }
        .barMode(BarMode.Scrollable)
        .barPosition(BarPosition.Start)
        .layoutWeight(1)
        .width('100%')
        .height('80%')

        // 2）分类按钮
        //todo:点击跳转功能
        Row() {
          Button({ type: ButtonType.Normal, stateEffect: true }) {
            Row() {
              Image($r('app.media.buy_productCategory')).width(20).height(20).margin({ left: 12 })
              Text('分类').fontSize(12).fontColor($r('app.color.Black')).margin({ left: 5, right: 12 })
            }.alignItems(VerticalAlign.Center)
          }
          .backgroundColor($r('app.color.start_window_background'))
          .height(40)
          .position({ x: 300, y: 8 })
        }

      }
    }

    .height('100%')
    .width('94%')
  }

  @Builder
  TabContentBuilder(items: GoodInfo[]) {
    // Grid(this.scroller) {
    //   ForEach(items, (item: GoodInfo, index: number) => {
    //     GridItem() {
    //       GoodList({ item: items[index] })
    //     }
    //   })
    // }
    // .columnsTemplate('1fr 1fr')
    // .width('100%')
    // .height('100%')
    Grid(this.scroller) {
      ForEach(this.GoodsByAxios, (item: GoodInfo, index: number) => {
        GridItem() {
          Column() {
            Image("https://dummyimage.com/400x400")// 直接加载网络地址，请填写一个具体的网络图片地址
              .alt($r('app.media.app_icon'))// 使用alt，在网络图片加载成功前使用占位图
              .width(100)
              .height(100)
            Text(item.product_name)
              .fontSize(22)
            Text(item.price + '元')
          }
          .width('100%')
          .height('100%')
        }
      })
    }
    .columnsTemplate('1fr 1fr')
    .width('100%')
    .height('100%')


  }
}

// @Component
// struct GoodList {
//   @ObjectLink item: GoodInfo;
//
//   build() {
//     Column() {
//       Image(this.item.image)
//       Text(this.item.product_name)
//       Text(this.item.price + '元')
//     }
//     .width(162)
//     .onClick(() => {
//
//       router.pushUrl(
//         {
//           url: 'view/buyPage/buy_buyPage',
//           params: { Index: this.item.id, MyUrl: 'pages/Index' }
//
//         },
//         router.RouterMode.Single,
//
//         err => {
//           if (err) {
//             console.log('errCode: ' + err.code + 'errMsg:' + err.message)
//           }
//         }
//
//       )
//     })
//   }
// }





