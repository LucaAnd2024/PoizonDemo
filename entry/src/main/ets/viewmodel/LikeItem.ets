@Observed
export default class GoodInfo {
  image: string
  // p1: ResourceStr
  // p2: ResourceStr
  product_name: string
  price: number
  id: number
  // peopleBuy: number
  // slogan: string
  // like: boolean
  is_buy:number

  constructor(id: number,
              image: string,
              product_name: string,
              price: number,
    // peopleBuy: number,
    // slogan: string,
    // p1?: ResourceStr, p2?: ResourceStr,
    // like: boolean = false
              is_buy:number
  ) {
    this.id = id
    this.image = image
    this.product_name = product_name
    this.price = price
    // this.peopleBuy = peopleBuy
    // this.slogan = slogan
    // this.p1 = p1
    // this.p2 = p2
    // this.like = like
    this.is_buy=is_buy
  }
}