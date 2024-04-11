@Component
export default struct user_buyDetail {
  build() {
    Row() {
      Column() {
        //todo:数据持久化
        this.user_buyDetailCard($r('app.media.user_love'), '想要', 1)
        Divider().width('90%').position({y:60,x:17}).strokeWidth(0.6)
        this.user_buyDetailCard($r('app.media.user_love'), '足迹', 13)


      }
      .width('50%')
      .alignItems(HorizontalAlign.Start)
      Divider().height(85).vertical(true).strokeWidth(0.6)

      Column() {
        this.user_buyDetailCard($r('app.media.user_love'), '我有', 0)
        Divider().width('90%').strokeWidth(0.6)
        this.user_buyDetailCard($r('app.media.user_love'), '订阅', 0)
      }
      .width('50%')
      .alignItems(HorizontalAlign.Start)
    }
    .width('97%')
    .backgroundColor($r('app.color.White'))
    .height(120)
  }

  @Builder
  user_buyDetailCard(image: ResourceStr, text: string, num: number) {
    Row() {
      Image(image)
        .width(20)
        .margin({ left: 20 })
      Text(text)
        .fontWeight(FontWeight.Bold)
        .fontSize(16)
      Blank()
      Text('' + num)
        .fontSize(14)
        .fontColor($r('app.color.light_gray'))
        .margin({right:4})

      Image($r('app.media.user_arrow'))
        .width(16)

    }
    .height('50%')
    .width('90%')

  }
}