import router from '@ohos.router'
import goodInfoModel, { ChangeLike } from '../../model/GoodInfoModel'
import likeItemModel, { addCart, delCart, delCartById } from '../../model/LikeItemModel'
import GoodInfo from '../../viewmodel/GoodInfo'


@Component
export default struct buy_BottomShoppingCard {
  @Prop Index: number
  @State good: GoodInfo = goodInfoModel.getGoodById(this.Index)

  onPageShow() {
    this.good = goodInfoModel.getGoodById(this.Index)
  }

  build() {
    Row({ space: 16 }) {

      this.ImageButton($r('app.media.buy_dislikeHeart'), '想要',$r('app.media.buy_likeHeart'),'4k')
      this.ImageButton($r('app.media.buy_check'), '我有', '1k')
      this.ImageButton($r('app.media.buy_Customer'), '客服')

      // ImageButton1({
      //   image: $r('app.media.buy_dislikeHeart'),
      //   title: '想要',
      //   value: '4k',
      //   Index: this.Index,
      //   good: this.good
      // })
      // ImageButton1({
      //   image: $r('app.media.buy_check'),
      //   title: '我有',
      //   value: '1k',
      //   Index: this.Index,
      //   good: this.good
      // })
      // ImageButton1({
      //   image: $r('app.media.buy_Customer'),
      //   title: '客服',
      //   value: '4k',
      //   Index: this.Index,
      //   good: this.good
      // })


      Button('求购')
        .type(ButtonType.Normal)
        .backgroundColor($r('app.color.White'))
        .fontColor($r('app.color.gray'))
        .borderWidth(1)
        .borderColor($r('app.color.light_gray'))

      Button('立即购买')
        .type(ButtonType.Normal)
        .backgroundColor($r('app.color.buy_buyButton'))

    }
    .width('100%')
    .backgroundColor($r('app.color.White'))
    .height(60)
    .position({ y: 720 })
    .justifyContent(FlexAlign.SpaceEvenly)

  }

  @Builder
  ImageButton(image: ResourceStr, title: string, image2?: ResourceStr, value?: string) {
    if (title === '想要') {
      Column() {

        if (value) {
          Badge({ value: value, position: BadgePosition.RightTop,
            style: { fontSize: 12,
              color: $r('app.color.Black'),
              badgeColor: $r('app.color.White'), badgeSize: 12
            } }) {
            Image(this.good.like === false ? image : image2)
              .width(24)
          }
        } else {
          Image(this.good.like === false ? image : image2)
            .width(24)
        }
        Text(title)
          .fontSize(12)
      }
      .onClick(() => {
        ChangeLike(this.good)
        if (this.good.like) {
          addCart(this.good)
        }
        else {
          delCartById(this.good.id)
        }
      })
    }
    else {
      Column() {

        if (value) {
          Badge({ value: value, position: BadgePosition.RightTop,
            style: { fontSize: 12,
              color: $r('app.color.Black'),
              badgeColor: $r('app.color.White'), badgeSize: 12
            } }) {
            Image(image)
              .width(24)
              .fillColor(this.good.like === false ? $r('app.color.Black') : $r('app.color.user_wantDel'))
          }
        } else {
          Image(image)
            .width(24)
            .fillColor(this.good.like === false ? $r('app.color.Black') : $r('app.color.user_wantDel'))
        }
        Text(title)
          .fontSize(12)
      }
    }

  }
}

//
// @Component
// struct ImageButton1 {
//   @Link image: ResourceStr
//   @State title: string = null
//   @State value?: string = null
//   @Link good: GoodInfo
//   @Prop Index: number
//
//   build() {
//     if (this.title === '想要') {
//       Column() {
//
//         if (this.value) {
//           Badge({ value: this.value, position: BadgePosition.RightTop,
//             style: { fontSize: 12,
//               color: $r('app.color.Black'),
//               badgeColor: $r('app.color.White'), badgeSize: 12
//             } }) {
//             Image(this.image)
//               .width(24)
//               .fillColor(this.good.like === false ? $r('app.color.Black') : $r('app.color.user_wantDel'))
//           }
//         } else {
//           Image(this.image)
//             .width(24)
//             .fillColor(this.good.like === false ? $r('app.color.Black') : $r('app.color.user_wantDel'))
//         }
//         Text(this.title)
//           .fontSize(12)
//       }
//       .onClick(() => {
//         ChangeLike(this.good)
//         //todo:图标的完善
//         if (this.good.like) {
//           addCart(this.good)
//         }
//         else {
//           delCartById(this.good.id)
//         }
//       })
//     } else {
//       Column() {
//
//         if (this.value) {
//           Badge({ value: this.value, position: BadgePosition.RightTop,
//             style: { fontSize: 12,
//               color: $r('app.color.Black'),
//               badgeColor: $r('app.color.White'), badgeSize: 12
//             } }) {
//             Image(this.image)
//               .width(24)
//               .fillColor(this.good.like === false ? $r('app.color.Black') : $r('app.color.user_wantDel'))
//           }
//         } else {
//           Image(this.image)
//             .width(24)
//             .fillColor(this.good.like === false ? $r('app.color.Black') : $r('app.color.user_wantDel'))
//         }
//         Text(this.title)
//           .fontSize(12)
//       }
//     }
//   }
// }