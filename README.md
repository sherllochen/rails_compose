
# rails_compose

## 基础环境
ruby 2.5
mysql 5.7

## TIPS:
- docker-compose.yml中的mysql service定义了mysql container的相关参数，其中MYSQL_DATABASE定义了默认创建的数据，应用的数据库可直接使用这个数据库。
- 应用中使用的database host需使用数据service的名字，如mysql