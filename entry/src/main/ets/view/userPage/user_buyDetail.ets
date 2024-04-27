import router from '@ohos.router'

@Component
export default struct user_buyDetail {
  @Prop NumOfCart: number

  build() {
    Row() {
      Column() {
        //todo:数据持久化
        user_buyDetailCard1({ image: $r('app.media.user_love'), text: '想要', num: this.NumOfCart })
        user_buyDetailCard1({ image: $r('app.media.user_QRcode'), text: '足迹', num: 13 })


        // Row() {
        //   Image($r('app.media.user_love'))
        //     .width(20)
        //     .margin({ left: 20 })
        //   Text('想要')
        //     .fontWeight(FontWeight.Bold)
        //     .fontSize(16)
        //   Blank()
        //   Text('' + this.num)
        //     .fontSize(14)
        //     .fontColor($r('app.color.light_gray'))
        //     .margin({ right: 4 })
        //
        //   Image($r("app.media.user_arrow"))
        //     .width(16)
        //
        // }
        // .height('50%')
        // .width('90%')
        // .onClick(() => {
        //
        //   router.pushUrl(
        //     {
        //       url: 'view/userPage/user_wantPage',
        //     },
        //     router.RouterMode.Single,
        //     err => {
        //       if (err) {
        //         console.log('errCode: ' + err.code + 'errMsg:' + err.message)
        //       }
        //     }
        //
        //   )
        //
        // })

        Divider().width('90%').position({ y: 60, x: 17 }).strokeWidth(0.6)

        // this.user_buyDetailCard($r('app.media.user_QRcode'), '足迹', 13)


      }
      .width('50%')
      .alignItems(HorizontalAlign.Start)

      Divider().height(85).vertical(true).strokeWidth(0.6)

      Column() {
        user_buyDetailCard1({ image: $r('app.media.user_love'), text: '我有', num: 0 })
        // this.user_buyDetailCard($r('app.media.user_love'), '我有', 0)
        Divider().width('90%').strokeWidth(0.6)
        user_buyDetailCard1({ image: $r('app.media.user_love'), text: '订阅', num: 0 })
        // this.user_buyDetailCard($r('app.media.user_love'), '订阅', 0)
      }
      .width('50%')
      .alignItems(HorizontalAlign.Start)

    }
    .width('97%')
    .backgroundColor($r('app.color.White'))
    .height(120)
  }

  // @Builder
  // user_buyDetailCard(image: ResourceStr, text: string, num: number) {
  //   Row() {
  //     Image(image)
  //       .width(20)
  //       .margin({ left: 20 })
  //     Text(text)
  //       .fontWeight(FontWeight.Bold)
  //       .fontSize(16)
  //     Blank()
  //     Text('' + num)
  //       .fontSize(14)
  //       .fontColor($r('app.color.light_gray'))
  //       .margin({ right: 4 })
  //
  //     Image($r("app.media.user_arrow"))
  //       .width(16)
  //
  //   }
  //   .height('50%')
  //   .width('90%')
  //   .onClick(() => {
  //
  //     router.pushUrl(
  //       {
  //         url: 'view/userPage/user_wantPage',
  //       },
  //       router.RouterMode.Single,
  //       err => {
  //         if (err) {
  //           console.log('errCode: ' + err.code + 'errMsg:' + err.message)
  //         }
  //       }
  //
  //     )
  //
  //   })
  //
  // }
}

@Component
struct user_buyDetailCard1 {
  @State text: string = ''
  @Prop num: number
  image: ResourceStr

  build() {
    Row() {
      Image(this.image)
        .width(20)
        .margin({ left: 20 })
      Text(this.text)
        .fontWeight(FontWeight.Bold)
        .fontSize(16)
      Blank()
      Text('' + this.num)
        .fontSize(14)
        .fontColor($r('app.color.light_gray'))
        .margin({ right: 4 })

      Image($r("app.media.user_arrow"))
        .width(16)

    }
    .height(60)
    .width('90%')
    .onClick(() => {

      router.pushUrl(
        {
          url: 'view/userPage/user_wantPage',
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