import router from '@ohos.router'
import goodInfoModel from '../model/GoodInfoModel'
import GoodInfoModel from '../model/GoodInfoModel'
import { countCart } from '../model/LikeItemModel'
import network from '../model/TokenInterceptor'
import buy_buyIndex from '../view/buyPage/buy_buyIndex'
import user_Index from '../view/userPage/user_Index'
import GoodInfo from '../viewmodel/GoodInfo'

@Entry
@Component
struct TEST {
  @State currentIndex: number = 1
  @State NumOfCart: number = 0
  @State GoodsByAxios: GoodInfo[] = [];
  scroller: Scroller = new Scroller()

  onPageShow() {
    this.NumOfCart = countCart()
    this.loadProductInfo();
  }

  // 1. 加载页面时使用方法，完成网络请求，获取到商品列表
  loadProductInfo() {
    goodInfoModel.getGoodsByAxios()
      .then((goods) => {
        this.GoodsByAxios = goods;
        console.error('加载商品成功:', JSON.stringify(this.GoodsByAxios));
      })
      .catch(error => {
        console.error('加载商品失败:', error);
      });
  }

  // 2. 将商品列表存储进本地化数据
  // 3. 获取商品列表并展示


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
    Column() {

      Grid(this.scroller) {
        ForEach(this.GoodsByAxios, (item: GoodInfo, index: number) => {
          GridItem() {
            Column() {
              Image("https://dummyimage.com/400x400")// 直接加载网络地址，请填写一个具体的网络图片地址
                .alt($r('app.media.app_icon'))// 使用alt，在网络图片加载成功前使用占位图
                .width(100)
                .height(100)
              Text(item.product_name)
                .fontSize(22)
              Text(item.price + '元')
            }
            .width('100%')
            .height('100%')
          }
        })
      }
      .columnsTemplate('1fr 1fr')
      .width('100%')
      .height('100%')

    }

  }
}

