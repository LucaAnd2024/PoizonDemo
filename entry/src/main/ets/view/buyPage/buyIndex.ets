import Header from './Header'
import productList from './productList'
import SearchBar from './SearchBar'

@Component
export default struct buyIndex {
  build() {
    Column({ space: 8 }) {
      //1.得物重大事件+签到
      Header()


      // TODO:实现搜索功能
      //2.搜索栏
      SearchBar()

      //3.商品列表
      productList()

    }
    .width('100%')
    .height('100%')
  }
}