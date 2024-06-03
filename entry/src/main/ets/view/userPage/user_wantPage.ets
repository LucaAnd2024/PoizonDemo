import router from '@ohos.router'
import user_wantPageHeader from './user_wantPageHeader'
import ItemInfo from '../../viewmodel/GoodInfo'
import LikeItem from '../../viewmodel/LikeItem'
import likeItemModel, { delCart, delCartById } from '../../model/LikeItemModel'
import GoodInfoModel from '../../model/GoodInfoModel'
import GoodInfo from '../../viewmodel/GoodInfo'


@Entry
@Component
struct user_wantPage {

  @State LikeItems: LikeItem[] = likeItemModel.list()
  onPageShow() {
    this.LikeItems = likeItemModel.list()
    console.log('!'+this.LikeItems.length)
  }


  build() {
    Column({ space: 12 }) {
      //1.标题
      user_wantPageHeader()
      //2.商品
      WantItem({ LikeItems: this.LikeItems })


    }
    .width('100%')
    .backgroundColor($r('app.color.buy_PageBackground'))
    .height('100%')

  }

}

@Component
struct WantItem {



  @Link LikeItems: LikeItem[]

  build() {

    List() {
      ForEach(this.LikeItems, (item: LikeItem,index:number) => {
        ListItem() {
          // if (item.like) {
          //   Row() {
          //
          //
          //     Image(item.image)
          //       .width(100)
          //       .borderWidth(0.3)
          //       .borderColor($r('app.color.light_gray'))
          //       .margin({ right: 8, left: 8 })
          //     Column() {
          //       //
          //       // Text(item.slogan)
          //       //   .margin({ top: 8, left: 10 })
          //       //   .width('100%')
          //       //   .maxLines(2)
          //       //   .margin({ top: 18, left: 8, right: 8 })
          //       //   .fontSize(14)
          //       //   .height('40%')
          //
          //
          //       Row() {
          //         Image($r('app.media.app_icon'))
          //           .width(22)
          //         Text(`￥`)
          //           .fontSize(18)
          //           .fontWeight(FontWeight.Bold)
          //
          //         Text(item.price + '')
          //           .fontSize(25)
          //           .fontWeight(FontWeight.Bold)
          //       }
          //
          //       .width('100%')
          //       .layoutWeight(1)
          //
          //     }
          //     .width('70%')
          //     .height('100%')
          //
          //   }
          //   .height(140)
          //   .backgroundColor($r('app.color.White'))
          //   .width('100%')
          //   .onClick(() => {
          //
          //     router.pushUrl(
          //       {
          //         url: 'view/buyPage/buy_buyPage',
          //         params: { item: item as ItemInfo, MyUrl: 'view/userPage/user_wantPage' }
          //       },
          //       router.RouterMode.Single,
          //       err => {
          //         if (err) {
          //           console.log('errCode: ' + err.code + 'errMsg:' + err.message)
          //         }
          //       }
          //     )
          //   })
          // }

        }
        .swipeAction({ end:this.itemEnd(index)})

      })
    }
  }
  @Builder itemEnd(index) {
    Row () {
      Button("删除")
        .width(60)
        .height(140)
        .backgroundColor($r('app.color.user_wantDel'))
        .type(ButtonType.Normal)
        .onClick(()=>{
          delCartById(index)
          this.LikeItems = likeItemModel.list()
        })

    }.padding("4vp").justifyContent(FlexAlign.SpaceEvenly)
  }
}

// @Component
// struct itemEnd {
//   @Link item:LikeItem
//   build() {
//     Row () {
//       Button("Del")
//         .margin("4vp")
//         .onClick(()=>{
//           delCart(this.item)
//         })
//
//     }.padding("4vp").justifyContent(FlexAlign.SpaceEvenly)
//   }
// }




