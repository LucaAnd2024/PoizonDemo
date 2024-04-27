import router from '@ohos.router'
import promptAction from '@ohos.promptAction'
import { KeyWord } from '../../viewmodel/KeyWord'

@Entry
@Component
export default struct buy_SearchPage {

  pageTransition() {
    // 定义页面进入时的效果，从左侧滑入，时长为1200ms，无论页面栈发生push还是pop操作均可生效
    PageTransitionEnter({ type: RouteType.None, duration: 10 })
      .slide(SlideEffect.Left)
    // 定义页面退出时的效果，向左侧滑出，时长为1000ms，无论页面栈发生push还是pop操作均可生效
    PageTransitionExit({ type: RouteType.None, duration: 10 })
      .slide(SlideEffect.Left)
  }
  @State keyword: string = ''

  build() {
    Row({ space: 4 }) {
      Image($r('app.media.buy_arrow')).width(30).onClick(() => {
        router.back()
      })
      Row() {
        Search({ placeholder: '请输入您想要的商品名称' }).onChange((value: string) => {
          this.keyword = value
        }).layoutWeight(1)
          .backgroundColor($r('app.color.searchBarBackground'))
          .height(40)
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .textFont({ size: 14, weight: 400 })


        Image($r("app.media.buy_camera"))
          .width(18)
          .margin({right:8})
      }
      .backgroundColor($r('app.color.searchBarBackground'))
      .layoutWeight(1)
      Row() {
        Text('搜索')
          .fontSize(16)
          .padding(6)
          .onClick(() => {
            if (this.keyword === '') {
              promptAction.showToast({ message: '请输入您想要的商品名称' })
              return
            }

            router.pushUrl({
              url: 'view/buyPage/buy_searchedGoodPage',
              params: {
                name: this.keyword
              }
            })
          })



      }
      .margin({ right: 8 })

    }.width('100%').backgroundColor('#FFF').padding({ left: 10, right: 10 })
    .margin({top:20})
    .width('100%')
    .height(40)

  }




}

//数据处理
//.onClick(() => {
//         if (this.keyword === '') {
//           promptAction.showToast({ message: '请输入您想要的商品名称' })
//           return
//         }
//
//         KeywordDBViewModel.getKeywordByName(this.keyword).then((data: KeyWord[]) => {
//           if (data.length == 0) {
//             KeywordDBViewModel.addKeyword(this.keyword).catch((error) => {
//               promptAction.showToast({ message: JSON.stringify(error) })
//             })
//           }
//         }).catch((error) => {
//           promptAction.showToast({ message: JSON.stringify(error) })
//         })
//
//         router.pushUrl({
//           url: 'pages/GoodsListPage',
//           params: {
//             name: this.keyword
//           }
//         })
//       })