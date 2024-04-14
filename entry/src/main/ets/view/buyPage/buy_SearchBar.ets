@Component
export default struct buy_SearchBar {
  build() {
    Row({space:8}){
      Row() {
        Search({ placeholder: '搜索你想要的' })
          .textFont({ size: 16 })
          .layoutWeight(1)
          .backgroundColor($r('app.color.searchBarBackground'))
        Image($r("app.media.buy_camera"))
          .width(20)
      }
      .layoutWeight(1)
      Row({space:8}){
        Divider()
          .strokeWidth(1)
          .vertical(true)
          .height(20)
        Text('搜索')
          .fontSize(16)
      }
      .margin({right:8})
    }
    .width('90%')
    .backgroundColor($r('app.color.searchBarBackground'))




  }
}