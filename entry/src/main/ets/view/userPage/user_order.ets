@Component
export default struct user_order {
  build() {
      Column(){
        Row(){
            Text('订单')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
          Blank()
          Text('0')
            .fontSize(14)
            .fontColor($r('app.color.light_gray'))
            .margin({right:4})
          Image($r('app.media.user_arrow'))
            .width(15)

        }
        .height(50)
        .width('90%')

        Row(){
          Swiper(){

          }
        }
        .height(100)
      }
      .width('97%')
      .backgroundColor($r('app.color.White'))
      .height(150)
  }
}