import router from '@ohos.router'

@Component
export default struct buy_RecommendShow {
  build() {

    Column() {
      List() {
        ListItem() {
          Column() {
            //todo:点击跳转购买页功能
            //todo:优化代码
            Row() {
              this.Item($r("app.media.buy_Item"), 'Magic 6 pro 遥遥领先', 199, 25)
              this.Item($r("app.media.buy_Item"), 'Magic 6 pro 遥遥领先', 199, 25)
            }

            Row() {
              this.Item($r("app.media.buy_Item"), 'Magic 6 pro 遥遥领先', 199, 25)
              this.Item($r("app.media.buy_Item"), 'Magic 6 pro 遥遥领先', 199, 25)
            }

            Row() {
              this.Item($r("app.media.buy_Item"), 'Magic 6 pro 遥遥领先', 199, 25)
              this.Item($r("app.media.buy_Item"), 'Magic 6 pro 遥遥领先', 199, 25)
            }

            Row() {
              this.Item($r("app.media.buy_Item"), 'Magic 6 pro 遥遥领先', 199, 25)
              this.Item($r("app.media.buy_Item"), 'Magic 6 pro 遥遥领先', 199, 25)
            }

            Row() {
              this.Item($r("app.media.buy_Item"), 'Magic 6 pro 遥遥领先', 199, 25)
              this.Item($r("app.media.buy_Item"), 'Magic 6 pro 遥遥领先', 199, 25)
            }
          }
          .width('100%')

        }
      }

    }
    .justifyContent(FlexAlign.SpaceEvenly)

  }

  //todo:点击跳转功能

  @Builder
  Item(image: ResourceStr, name: string, money: number, number: number) {

    Column() {
      Image(image)
      Text(name)
      Row() {
        Text(money + '元')
        Blank('25')
        Text(number + '人已购')
      }

    }
    .width('50%')
    .onClick(() => {

      router.pushUrl(
        {
          url: 'pages/buy_buyPage',
        },
        router.RouterMode.Single,
        err => {
          if (err) {
            console.log('errCode: ' + err.code + 'errMsg:' + err.message)
          }
        }

      )

    })
  }
}