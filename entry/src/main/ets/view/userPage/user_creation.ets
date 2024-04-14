@Component
export default struct user_creation {
  build() {
    Row() {
      Column() {
        Text('创作')
          .fontStyle(FontStyle.Italic).fontWeight(FontWeight.Bolder)
          .fontSize(16)
        Text('中心')
          .fontStyle(FontStyle.Italic).fontWeight(FontWeight.Bolder)
          .fontSize(16)
      }
      .width('22%')
      .layoutWeight(1)


      Divider()
        .vertical(true)
        .strokeWidth(0.4)
        .height(30)

      //todo:图标收集
      this.creation($r('app.media.user_data'), '数据')
      this.creation($r('app.media.user_data'), '数据')
      this.creation($r('app.media.user_data'), '数据')
      this.creation($r('app.media.user_data'), '得物评价官')



    }
    .width('97%')
    .backgroundColor($r('app.color.White'))
    .height(60)

  }

  @Builder
  creation(image: ResourceStr, title: string) {
    Column({ space: 6 }) {
      Image(image)
        .width(20)
      Text(title)
        .fontSize(13)
    }
    .width('20%')
  }
}