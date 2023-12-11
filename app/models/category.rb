class Category < ActiveHash::Base
  
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ソファ' },
    { id: 3, name: 'ダイニングセット' },
    { id: 4, name: 'リビングテーブル' },
    { id: 5, name: 'ベッド' },
    { id: 6, name: 'テレビ台' },
    { id: 7, name: '収納家具' },
    { id: 8, name: '食器棚' },
    { id: 9, name: 'デスク' },
    { id: 10, name: 'チェア' },
    { id: 11, name: 'ラグ' },
    { id: 12, name: '照明' },
    { id: 13, name: '羽毛布団' },
    { id: 14, name: 'ホームファッション' },
    { id: 15, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :reviews

  end