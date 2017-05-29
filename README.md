# DATABASE設計

## Usersテーブル

|   Columns   |   Types  |   Options                 |
|:------------|:---------|:--------------------------|
| nickname    | string   | null: false, unique: true |

  ※deviseで作成するため、ユーザー名のみ追加

### Association:

 - has_many :messages

 - has_many :groups, through: :group_users

 - has_many :groups


## Messagesテーブル

|   Columns             | Types |   Options         |
|:----------------------|:------|:------------------|
| body                  | text  | null: false       |
| image                 | text  |                   |
| t.references :user_id |       | foreign_key: true |
| t.references :group_id|       | foreign_key: true |

### Association:

 - belongs_to :user

 - belongs_to :group


## Groupsテーブル

|   Columns            | Types  |   Options                 |
|:---------------------|:-------|:--------------------------|
| name                 | string | null: false, unique: true |
| t.references :user_id|        | foreign_key: true         |

### Association:

 - has_many :messages

 - has_many :users, through: :group_users

 - has_many :users


## Group_usersテーブル
|   Columns                 |   Options                      |
|:--------------------------|:-------------------------------|
| t.references :gruop_id    | foreign_key: true, index: true |
| t.references :user_id     | foreign_key: true, index: true |

### Association

 - belongs_to :user

 - belongs_to :group

