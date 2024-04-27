@Observed
export default class LikeItem {
  image: ResourceStr
  p1: ResourceStr
  p2: ResourceStr
  name: string
  price: number
  id: number
  peopleBuy: number
  slogan: string
  like: boolean

  constructor(id: number, image: ResourceStr, title: string,
              price: number, peopleBuy: number, slogan: string,
              p1: ResourceStr, p2: ResourceStr, like: boolean = false) {
    this.id = id
    this.image = image
    this.name = title
    this.price = price
    this.peopleBuy = peopleBuy
    this.slogan = slogan
    this.p1 = p1
    this.p2 = p2
    this.like = like
  }
}