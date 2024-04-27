import GoodInfo from '../viewmodel/GoodInfo'
import ItemInfo from '../viewmodel/GoodInfo'
import { KeyWord } from '../viewmodel/KeyWord'


let keywords: KeyWord[] = [
  { id: 1, name: '高考不足50天|高考宝典' },
  { id: 2, name: 'HUAWEI' },
  { id: 3, name: '小风扇' },
  { id: 4, name: 'Magic' },
  { id: 5, name: '人间值得' },
  { id: 6, name: 'Pura 70' },
  { id: 7, name: 'Pura 70 Pro' },
]

@Observed
export class KeyWordModel {
  list(): KeyWord[] {
    return keywords
  }
}


let keyWordModel = new KeyWordModel()

export default keyWordModel as KeyWordModel