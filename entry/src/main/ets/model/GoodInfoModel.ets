import GoodInfo from '../viewmodel/GoodInfo'
import ItemInfo from '../viewmodel/GoodInfo'
import network from './TokenInterceptor'


let GoodInfos: GoodInfo[] = [
// new ItemInfo(0, $r('app.media.buy_MagicImageGreen'), 'Magic 6 pro 遥遥领先', 666, 25, 'HONOR荣耀 Magic6 Pro 全域低功耗LTPO 护眼屏 全网通 手机'
//   , $r('app.media.buy_MagicImageGreenOne'), $r('app.media.buy_MagicImagePurple')),
// new ItemInfo(1, $r('app.media.buy_pura70_white'), 'HUAWEI_Pura70', 456, 250, '华为 HUAWEI Pura 70 全网通 手机'
//   , $r('app.media.buy_pura70_black'), $r('app.media.buy_pura70_white')),
// new ItemInfo(2, $r('app.media.buy_fan'), '充电小风扇四合一', 22, 234, '心佰鹿 充电小风扇四合一 手持脖挂风扇 静音 持久续航'
//   , $r('app.media.buy_fanOne'), $r('app.media.buy_fanTwo')),
// new ItemInfo(3, $r('app.media.buy_gaokao'), '高考测评卷', 16, 234, '高考测评卷 英语 新高考 2024 考试、教辅'),
// new ItemInfo(4, $r('app.media.buy_AndroidBook'), '《第一行代码》', 61, 9999, '《第一行代码Android 第三版》郭霖 计算机 单本'),
// new ItemInfo(5, $r('app.media.buy_book'), '《人间值得》', 6, 205, '人间值得，以你喜欢的方式过一生 茗溪 散文、随笔、书信'
//   , $r('app.media.buy_bookOne'), $r('app.media.buy_bookTwo')),
// new ItemInfo(6, $r('app.media.buy_cloth'), 'Nike NBA Bryant', 2099, 696, 'Nike NBA Kobe Bryant Icon Edition Swingman 吸湿排汗宽松湖人队科比')

]
let GoodsByName: GoodInfo[] = []
let GoodsByAxios: GoodInfo[] = []

let Index: number = 0;


@Observed
export class GoodInfoModel {
  list(): GoodInfo[] {
    return GoodsByAxios
  }

  getGoodsByAxios(): Promise<any[]> {
    return new Promise((resolve, reject) => {
      network.post('http://192.168.31.168:8080/product/list', {
        "page_size": 10,
        "page": 1,
        "query": {
          "product_code": null,
          "product_name": null,
          "price": null,
          "image": null,
          "is_buy": null,
          "is_delete": null
        }
      }, {
        headers: {
          'token': 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTc0MDk4NzUsInVzZXJJZCI6MX0.ZlvEk6g_G2Zlz4T-v2fMJx_-biXPZVZXDUz78qdiq74'
        }
      })
        .then(response => {
          const rows = response.data?.data?.rows;
          if (rows) {
            const goods = rows.map((item: any) => new ItemInfo(
              item.id,
              item.image,
              item.productName,
              parseFloat(item.price),
              item.is_buy
            ));
            GoodInfos = goods;
            resolve(goods);
          } else {
            reject('获取的商品列表为空');
          }
        })// .then(response => {
          //   console.log(JSON.stringify(response.data.data.rows))
          //
          //   GoodsByAxios = response.data.data.rows;
          //   resolve(response.data.data.rows);
          // })
        .catch(error => {
          console.error('获取失败', error);
          reject('获取失败');
        });
    });
  }

  getGoodsByName(name: string): GoodInfo[] {
    GoodInfos.forEach((item: GoodInfo) => {
      if (item.product_name.includes(name)) {
        GoodsByName.push(item)
      }
    })
    return GoodsByName
  }

  clearSearchedGoods(): GoodInfo[] {
    GoodsByName = []
    return GoodsByName
  }

  getGoodById(id: number): GoodInfo {
    GoodInfos.forEach((item: GoodInfo) => {
      if (item.id === id) {
        Index = id
      }
    })
    return GoodInfos[Index]

  }
}

// export const ChangeLike = (good: GoodInfo) => {
//
//   GoodInfos.forEach((item: GoodInfo) => {
//     if (item.id === good.id) {
//       // item.like = !item.like
//
//     }
//   })
//
// }
export const ChangeBuy = (good: GoodInfo) => {

  // GoodInfos.forEach((item: GoodInfo) => {
  //   if (item.id === good.id) {
  //     // item.like = !item.like
  //
  //   }
  // })
  if (good.is_buy === 0) {
    good.is_buy = 1
  } else {
    good.is_buy = 0

  }


}


let goodInfoModel = new GoodInfoModel()

export default goodInfoModel as GoodInfoModel

