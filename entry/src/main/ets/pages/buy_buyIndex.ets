import buy_Header from '../view/buyPage/buy_Header'
import buy_productList from '../view/buyPage/buy_productList'
import productList from '../view/buyPage/buy_productList'
import buy_SearchBar from '../view/buyPage/buy_SearchBar'
import SearchBar from '../view/buyPage/buy_SearchBar'

@Component
export default struct buy_buyIndex {
  build() {
    Column({ space: 8 }) {
      //1.得物重大事件+签到
      buy_Header()


      // TODO:实现搜索功能
      //2.搜索栏
      buy_SearchBar()

      //3.商品列表
      buy_productList()

    }
    .width('100%')
    .height('100%')
  }
}