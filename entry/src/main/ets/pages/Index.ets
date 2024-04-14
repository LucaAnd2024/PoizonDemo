import buy_buyIndex from './buy_buyIndex'
import userIndex from '../view/userPage/userIndex'
@Entry
@Component
struct Index {
  @State currentIndex: number = 1

  @Builder
  TabBerBuilder(title: ResourceStr, image: ResourceStr, index: number) {
    Column({ space: 6 }) {
      Image(image)
        .width(25)
        .fillColor(this.currentIndex === index ? $r('app.color.Black') : $r('app.color.gray'))
      Text(title)
        .fontSize(14)
        .fontColor(this.currentIndex === index ? $r('app.color.Black') : $r('app.color.gray'))
    }
  }

  build() {
    Tabs({ barPosition: BarPosition.End, index: 1 }) {
      TabContent() {
        Text("推荐")
      }.tabBar(this.TabBerBuilder($r('app.string.tab_commend'), $r('app.media.tab_commend'), 0))

      TabContent() {
        buy_buyIndex()
      }.tabBar(this.TabBerBuilder($r('app.string.tab_buy'), $r('app.media.tab_buy'), 1))

      TabContent() {
        Text("探索")
      }.tabBar(this.TabBerBuilder($r('app.string.tab_explore'), $r('app.media.tab_explore'), 2))

      TabContent() {
        userIndex()
      }.tabBar(this.TabBerBuilder($r('app.string.tab_user'), $r('app.media.tab_user'), 3))
    }
    .width('100%')
    .height('100%')
    .onChange(index => this.currentIndex = index)
  }
}

/*
  TODO:(ok)
    1.首选页的问题:查看官方API解决
    2.颜色问题（格式问题）
 */