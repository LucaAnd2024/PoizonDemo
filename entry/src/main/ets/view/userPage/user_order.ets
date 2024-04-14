@Component
export default struct user_order {
  private swiperController: SwiperController = new SwiperController()

  build() {

    Column() {
      Row() {
        Text('订单')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        Blank()
        Text('0')
          .fontSize(14)
          .fontColor($r('app.color.light_gray'))
          .margin({ right: 4 })
        Image($r('app.media.user_arrow'))
          .width(15)

      }
      .height(50)
      .width('90%')
      //todo:导航点效果
      Row() {
        Swiper(this.swiperController) {
          this.user_orderDetail($r('app.media.user_car'),'待收货')
          this.user_orderDetail($r('app.media.user_car'),'待收货')
          this.user_orderDetail($r('app.media.user_car'),'待收货')
          this.user_orderDetail($r('app.media.user_car'),'待收货')
          this.user_orderDetail($r('app.media.user_car'),'待收货')
          this.user_orderDetail($r('app.media.user_car'),'待收货')
          this.user_orderDetail($r('app.media.user_car'),'待收货')
          this.user_orderDetail($r('app.media.user_car'),'待收货')


        }
        .displayCount(5)
        .indicator(false)
      }
      .width('90%')
      .height(90)
    }
    .width('97%')
    .backgroundColor($r('app.color.White'))
    .height(140)
  }


  @Builder
  user_orderDetail(image:ResourceStr,title:string){
    Column({space:8}){
      Image(image)
        .width(25)
      Text(title)
        .fontColor($r('app.color.light_gray'))
        .fontSize(13)
    }
  }
}