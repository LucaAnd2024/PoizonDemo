@Component
export default struct user_Header {
  build() {
    Row({space:18}) {
      Image($r('app.media.user_QRcode'))
        .width(24)

      Blank()
      Image($r('app.media.user_gift'))
        .width(24)

      Image($r('app.media.user_setting'))
        .width(24)

    }
    .width('94%')
    .margin({top:20,bottom:10})


  }
}