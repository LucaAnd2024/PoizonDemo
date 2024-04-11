import router from '@ohos.router'

@Entry
@Component
struct Welcome_Page {
  //实现跳转
  aboutToAppear() {
    this.jumpToIndex()
  }

  jumpToIndex() {
    setTimeout(() => {
      router.replaceUrl({
        url: 'pages/Index',

      })
    }, 1000)

  }

  //欢迎界面的搭建
  build() {
    Column() {
      Image($r("app.media.app_icon"))
        .width(150).height(150).margin({ top: 170 })
    }
    .width('100%').height('100%')
    .backgroundColor($r("app.color.Black"))
  }
}