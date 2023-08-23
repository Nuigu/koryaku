class Category < ActiveHash::Base
  self.data = [
    {id: 1, name: "---"},
    {id: 2, name: "プログラミング"},
    {id: 3, name: "ゲーム"},
    {id: 4, name: "その他"}
  ]

  include ActiveHash::Associations
  has_many :flowcharts
end