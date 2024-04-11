@Component
export default struct Header {
  build() {
    Row() {
      //事件
      Row() {
        Image($r('app.media.app_icon'))
          .width(26)
        Text('又有什么大事...')
          .fontColor($r('app.color.Black'))
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
      }
      .layoutWeight(1)

      //签到
      Column() {
        Image($r("app.media.buy_Registration"))
          .width(22)
        Text('签到')
          .fontColor($r('app.color.Registration'))
          .fontSize(14)
          .fontWeight(FontWeight.Bold)

      }

    }
    .width('90%')
    .margin({top:14})
  }
}