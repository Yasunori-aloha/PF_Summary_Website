# README（共同開発要項）
## 目的
共同開発での開発フロー、コミュニケーションの取り方、ツールの使い方を体験すること

## 環境/技術
- Ruby 2.6.5
- Rails 6.0.3.4
- bundler 2.1.4
- MySQL 14.14
- 記法：
- ソースコード管理：GitHub

## 機能要件
### [必須要件]
- トップ画面作成
- ユーザー管理機能作成
- プロフィール編集機能
- 投稿機能
- 投稿編集/削除機能
- コメント機能
- 検索機能
- 投稿に対するいいね機能
- 投稿に対するブックマーク機能
- 結合テストコード
- 本番環境へのデプロイ

### [追加要件]
- DM機能
- フォロー機能
- トレンド機能
- 通知機能
- SNSログイン機能

## DB設計（ER図）
※未実装

# 共同開発を進める手順
1. 環境構築を完了していることを各自確認
1. 指定バージョンに揃える
1. このリポジトリを下記手順にてクローン
    1. $ git clone https://github.com/Yasunori-aloha/PF_Summary_Website.git
    1. $ cd PF_Summary_Website
1. 載っている必須要件をそれぞれ実装開始
1. 1ブランチの実装が完了したらフロント or バックチーム内でコードレビューを行ってメンバーからLGTMをもらう
1. メンバー全員からLGTMが出たらmasterブランチにマージ
1. 他のメンバーはmasterブランチへマージされたらローカル環境を更新しコンフリクト解消
1. 本番環境をアップデートし動作確認
1. 次の機能を実装する
1. 4〜9を繰り返す

# 開発完了期限
- 目標日時 3/13(土)
- 最終期限 3/21(日)

# モデル

## users table
| Column                | Type    | Options                 |
| --------------------- | ------- | ----------------------- |
| nickname              | string  | null: false             |
| email                 | string  | null: false unique:true |
| encrypted_password    | string  | null: false             |

### user model association
- has_many :posts
- has_many :comments
- has_many :likes
- has_many :bookmarks

## posts table
| Column  | Type      | Options                       |
| ------- | --------- | ----------------------------- |
| name    | string    | null: false                   |
| content | text      | null: false                   |
| url     | string    | null: false                   |
| user_id | reference | null: false foreign_key: true |
| tag_id  | reference | null: false foreign_key: true |

### Post model association
- belongs_to :user
- has_many :comments
- has_many :likes
- has_many :bookmarks
- has_many :posts_tags
- has_many :tags, through: :posts_tags

## tags table
| Column                | Type    | Options                          |
| --------------------- | ------- | ----------------------- |
| post_id               | reference  | null: false foreign_key: true |

### Tag model association
- has_many :posts_tags
- has_many :posts, through: :posts_tags

## posts_tags table
| Column                | Type    | Options                          |
| --------------------- | ------- | ----------------------- |
| post_id               | reference  | null: false foreign_key: true |
| tag_id                | reference  | null: false foreign_key: true |

### posts_tags table association
- belongs_to :post
- belongs_to :tag

## likes table
| Column                | Type    | Options                 |
| --------------------- | ------- | ----------------------- |
| user_id               | reference  | null: false foreign_key: true |
| post_id               | reference  | null: false foreign_key: true |

### Like model association
- belongs_to :user
- belongs_to :post

## bookmarks table
| Column                | Type    | Options                          |
| --------------------- | ------- | ----------------------- |
| user_id               | reference  | null: false foreign_key: true |
| post_id               | reference  | null: false foreign_key: true |

### Bookmark model association
- belongs_to :user
- belongs_to :post