# README


## users テーブル
| name               | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| affiliation        | string | null: false              |
| position           | string | null: false              |

### Association
- has_many :reviews
- has_many :comments
    
(imageはActive storage)


## reviews テーブル
| title          | string     | null: false                    |
| category       | integer    | null: false                    |
| product_name   | string     | null: false                    |
| brand          | string     | null: false                    |
| purchase_date  | date       | null: false                    |
| user_type      | string     | null: false                    |
| positive_point | text       | null: false                    |
| negative_point | text       | null: false                    |
| recommendation | text       | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments


## comments テーブル
| content | text       | null: false                    |
| review  | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :review


## helpfulテーブル
| user   | references | null: false, foreign_key: true |
| review | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :review