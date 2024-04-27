import GoodInfo from '../viewmodel/GoodInfo'
import ItemInfo from '../viewmodel/GoodInfo'


let GoodInfos: GoodInfo[] = [
  new ItemInfo(0, $r('app.media.buy_MagicImageGreen'), 'Magic 6 pro 遥遥领先', 666, 25, 'HONOR荣耀 Magic6 Pro 全域低功耗LTPO 护眼屏 全网通 手机'
    , $r('app.media.buy_MagicImageGreenOne'), $r('app.media.buy_MagicImagePurple')),
  new ItemInfo(1, $r('app.media.buy_pura70_white'), 'HUAWEI_Pura70', 456, 250, '华为 HUAWEI Pura 70 全网通 手机'
    , $r('app.media.buy_pura70_black'), $r('app.media.buy_pura70_white')),
  new ItemInfo(2, $r('app.media.buy_fan'), '充电小风扇四合一', 22, 234, '心佰鹿 充电小风扇四合一 手持脖挂风扇 静音 持久续航'
    , $r('app.media.buy_fanOne'), $r('app.media.buy_fanTwo')),
  new ItemInfo(3, $r('app.media.buy_gaokao'), '高考测评卷', 16, 234, '高考测评卷 英语 新高考 2024 考试、教辅'),
  new ItemInfo(4, $r('app.media.buy_AndroidBook'), '《第一行代码》', 61, 9999, '《第一行代码Android 第三版》郭霖 计算机 单本'),
  new ItemInfo(5, $r('app.media.buy_book'), '《人间值得》', 6, 205, '人间值得，以你喜欢的方式过一生 茗溪 散文、随笔、书信'
    , $r('app.media.buy_bookOne'), $r('app.media.buy_bookTwo')),
  new ItemInfo(6, $r('app.media.buy_cloth'), 'Nike NBA Bryant', 2099, 696, 'Nike NBA Kobe Bryant Icon Edition Swingman 吸湿排汗宽松湖人队科比')

]
let GoodsByName: GoodInfo[] = []
let Index: number = 0;


@Observed
export class GoodInfoModel {
  list(): GoodInfo[] {
    return GoodInfos
  }

  getGoodsByName(name: string): GoodInfo[] {
    GoodInfos.forEach((item: GoodInfo) => {
      if (item.name.includes(name)) {
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

export const ChangeLike = (good: GoodInfo) => {

  GoodInfos.forEach((item: GoodInfo) => {
    if (item.id === good.id) {
      item.like = !item.like

    }
  })

}


let goodInfoModel = new GoodInfoModel()

export default goodInfoModel as GoodInfoModel

