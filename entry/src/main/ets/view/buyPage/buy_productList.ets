import router from '@ohos.router'
import GoodInfoModel from '../../model/GoodInfoModel'
import ItemInfoModel from '../../model/GoodInfoModel'
import likeItemModel from '../../model/LikeItemModel'
import GoodInfo from '../../viewmodel/GoodInfo'
import ItemInfo from '../../viewmodel/GoodInfo'


@Component
export default struct buy_productList {
  @State Number: String[] = ['0', '1']
  scroller: Scroller = new Scroller()

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
            Text('占位符')
              .fontSize(16)
          }.tabBar('占位符')

        }
        .barMode(BarMode.Scrollable)
        .barPosition(BarPosition.Start)
        .layoutWeight(1)
        .width('100%')
        .height('80%')

        // 2）分类按钮
        //todo:点击跳转功能
        Button({ type: ButtonType.Normal, stateEffect: true }) {
          Row() {
            Image($r('app.media.buy_productCategory')).width(20).height(20).margin({ left: 12 })
            Text('分类').fontSize(12).fontColor($r('app.color.Black')).margin({ left: 5, right: 12 })
          }.alignItems(VerticalAlign.Center)
        }
        .backgroundColor($r('app.color.start_window_background'))
        .width(90)
        .height(40)
        .position({ x: 255, y: 8 })

      }
    }

    .height('100%')
    .width('90%')
  }

  @Builder
  TabContentBuilder(items: GoodInfo[]) {
    Grid(this.scroller) {
      ForEach(items, (item: GoodInfo, index: number) => {
        GridItem() {
          GoodList({ item: items[index] })
        }
      })
    }
    .columnsTemplate('1fr 1fr')
    .width('100%')
    .height('100%')


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
          params: { Index: this.item.id, MyUrl: 'pages/Index' }

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





