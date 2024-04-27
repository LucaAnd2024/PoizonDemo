import router from '@ohos.router'
import  { countCart } from '../model/LikeItemModel'
import buy_buyIndex from '../view/buyPage/buy_buyIndex'
import user_Index from '../view/userPage/user_Index'

@Entry
@Component
struct Index {
  @State currentIndex: number = 1
  @State NumOfCart: number = 0

  pageTransition() {
    // 定义页面进入时的效果，从左侧滑入，时长为1200ms，无论页面栈发生push还是pop操作均可生效
    PageTransitionEnter({ type: RouteType.None, duration: 10 })
      .slide(SlideEffect.Left)
    // 定义页面退出时的效果，向左侧滑出，时长为1000ms，无论页面栈发生push还是pop操作均可生效
    PageTransitionExit({ type: RouteType.None, duration: 10 })
      .slide(SlideEffect.Left)
  }

  onPageShow() {
    this.NumOfCart = countCart()
  }




  //todo:图标的完善
  @Builder
  TabBerBuilder(title: ResourceStr, image: ResourceStr, index: number) {
    Column({ space: 6 }) {
      Image(image)
        .width(25)
        .fillColor(this.currentIndex === index ? $r('app.color.Black') : $r('app.color.light_gray'))
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
        user_Index({NumOfCart:this.NumOfCart})
      }.tabBar(this.TabBerBuilder($r('app.string.tab_user'), $r('app.media.tab_user'), 3))

    }
    .width('100%')
    .height('100%')
    .onChange(index => this.currentIndex = index)
  }
}

