# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Usersテーブル
|Column            |Type      |Options                  |
|------------------|----------|-------------------------|
|name              |string    |null: false              |
|email             |string    |null: false, unique: true|
|password          |string    |null: false              |

## Associations
has_many :flowcharts

# Flowchartsテーブル
|Column            |Type      |Options                  |
|------------------|----------|-------------------------|
|title             |string    |null: false              |
|goal              |string    |null:false               |
|category_id       |integer   |null: false              |
|private           |boolean   |null: false              |
|user              |references|null: false              |

## Associations
belongs_to :user
has_many :processes, dependence: true

# Processesテーブル
|Column            |Type      |Options                  |
|------------------|----------|-------------------------|
|title             |string    |null: false              |
|detail            |string    |null:false               |
|time              |integer   |null: false              |
|position          |integer   |null: false              |
|flowchart         |references|null: false              |

## Associations
belongs_to :flowchart