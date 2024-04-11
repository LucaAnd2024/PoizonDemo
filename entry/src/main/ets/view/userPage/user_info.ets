@Component
export default struct user_info {
  build() {
    Row() {
      Image($r('app.media.user_image'))
        .width(66)
        .height(66)
        .margin({ right: 10 })
        .backgroundColor($r('app.color.user_ImageBackground'))

      Column() {
        Text('得物er-Z4Q2...')
          .fontSize(20)
          .height(40)
          .width(180)
          .maxLines(1)
          .fontWeight(2)

        Text('未设置签名')
          .fontWeight(0)
          .fontSize(14)
          .fontColor($r('app.color.gray'))
      }
      .alignItems(HorizontalAlign.Start)
    }

    .width('94%')

  }
}