import GoodInfo from '../viewmodel/GoodInfo'
import LikeItem from '../viewmodel/LikeItem'


export let CartNum: number = 0;


export let LikeItems: LikeItem[] = []


class LikeItemModel {
  list(): LikeItem[] {
    return LikeItems
  }
}

let likeItemModel = new LikeItemModel()

export default likeItemModel as LikeItemModel

export const addCart = (good: GoodInfo) => {
  LikeItems.push(good)

}

export const delCart = (good: GoodInfo) => {
  LikeItems = LikeItems.filter(item => item.id !== good.id);
}


// export const delCartById = (id: number) => {
//   // LikeItems = LikeItems.filter(item => item.id !== id);
//   LikeItems.splice(id, 1)
// }

export const delCartById = (id: number) => {
  // LikeItems = LikeItems.filter(item => item.id !== id);
  LikeItems.splice(id, 1)
}


export const countCart = (): number => {
  CartNum = LikeItems.length
  return CartNum
}

