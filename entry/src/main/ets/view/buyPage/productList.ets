import RecommendShow from './RecommendShow'


@Component
export default struct productList {
  build() {
    Column() {

      // 1)分类文本
      Stack() {
        Tabs() {
          TabContent() {
            //商品展示页
            RecommendShow()
          }.tabBar('推荐')

          TabContent() {
            Text('鞋类')
              .fontSize(16)
          }.tabBar('鞋类')

          TabContent() {
            Text('包袋')
              .fontSize(16)
          }.tabBar('包袋')

          TabContent() {
            Text('配饰')
              .fontSize(16)
          }.tabBar('配饰')

          TabContent() {
            Text('女装')
              .fontSize(16)
          }.tabBar('女装')

          TabContent() {
            Text('潮服')
              .fontSize(16)
          }.tabBar('潮服')

          TabContent() {
            Text('手机')
              .fontSize(16)
          }.tabBar('手机')

          TabContent() {
            Text('占位符')
              .fontSize(16)
          }.tabBar('占位符')

        }
        .barMode(BarMode.Scrollable)
        .barPosition(BarPosition.Start)
        .layoutWeight(1)

        // 2）分类按钮
        //todo:点击跳转功能
        Button({ type: ButtonType.Normal, stateEffect: true }) {
          Row() {
            Image($r('app.media.buy_productCategory')).width(20).height(20).margin({ left: 12 })
            Text('分类').fontSize(12).fontColor($r('app.color.Black')).margin({ left: 5, right: 12 })
          }.alignItems(VerticalAlign.Center)
        }.backgroundColor($r('app.color.start_window_background')).width(90).height(40)
        .position({ x: 255, y: 8 })

      }
    }


    .height('100%')
    .width('90%')
  }
}