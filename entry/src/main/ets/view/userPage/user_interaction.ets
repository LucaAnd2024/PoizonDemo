
@Component
export default struct user_interaction {
  build() {
    Row() {

      this.user_interaction_info(0, '获赞与收藏')
      this.user_interaction_info(0, '粉丝')
      this.user_interaction_info(0, '关注')
      this.user_interaction_info(0, '动态')

    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceEvenly)

  }

  @Builder
  user_interaction_info(num: number, title: string) {
    Column() {
      Text('' + num)
        .fontSize(20)
        .fontWeight(20)
      Text(title)
        .fontSize(13)
        .fontColor($r('app.color.light_gray'))

    }
    .width('25%')

  }
}
