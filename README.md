## アプリケーション名
staviews

## アプリケーション概要
従業員同士で購入した商品のレビューを投稿、共有できるアプリ。
staff （スタッフ）＋ reviews（批評） = staviews

## URL
https://staviews.onrender.com

## テスト用アカウント

BASIC認証ID：admin<br>
BASIC認証パスワード：2222

テスト用ユーザー<br>
メールアドレス：test@test.com<br>
パスワード：aaa111

## 利用方法
### レビュー投稿
1.トップページのヘッダーにある「新規登録」ボタンをクリックし、ユーザー登録を行う。<br>
2.「投稿する」ボタンからレビュー内容を記載し投稿する。<br>
3.トップページに投稿したレビューの一覧が表示される。<br>
4.一覧から、特定のレビューをクリックするとレビューの詳細ページに遷移し、レビュー内容を確認できる。<br>

## アプリケーションを作成した背景
以前、家具の販売員として働いていた頃に、欲しいと思ったアプリを作成しました。

家具の販売員をしていた頃、会社では販売する商品を実際に自分で購入して使うことを推奨しており、社員割引の制度がありました。しかし、家具は社員割引を使用しても高額であったことや、気軽に買い換えられる物ではないため、購入して自分で使うという事が難しい状況でありました。
しかしながら、家具が好きな従業員が多く働いており、実際に自分で購入していた人も何人もいました。従業員同士で話す際に、部屋に置いた家具の写真を見せ合いながら、「実際に使ってるが、本当にいい商品だ」と言った感想を話している事があり、その際に聞いた話を実際に接客で利用することがありました。
他の従業員の感想を使えば、自分で使ったことがない商品でも、説得力を持って商品説明ができるため、その感想を投稿、共有するアプリがあったら良いなと思い、作成いたしました。


## 実装した機能についての画像やGIFおよびその説明※

## 実装予定の機能
参考になったボタンの実装(いいね機能)<br>
コメント機能

## データベース設計
![Alt text](image.png)

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
| category_id    | integer    | null: false                    |  
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

## 画面遷移図
![Alt text](image-1.png)

## 開発環境
- Ruby 3.2.0
- Ruby on Rails 7.0.0
- PostgreSQL 14.10
- render
- AWS S3
- RSpec

## 工夫した点
一つ目は、ユーザー登録時にユーザーの顔写真を登録できるようにしました。
また、登録したユーザー写真は、レビューの投稿一覧に表示する際に、投稿者の情報と　　
一緒に表示されるようにし、ひとめで誰が投稿したかわかるようにしました。
二つ目は、レビューの投稿一覧で使用できる検索機能です。
商品名をキーワード検索できるだけでなく、登録したカテゴリごとに検索できるように工夫しました。
