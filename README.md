## 项目体验地址:124.221.174.197
### 你可以新建账号体验。
### 也可以使用如下账号：
#### 知名up主: name:ty pwd : ty
#### 活跃账号: name:七牛云 pwd: 123456
## 项目介绍视频:https://url.v.tencent.com/164g4OZK （因为文件太大，所以以在线视频形式分享）
## 如何运行项目
### 克隆项目到本地
git clone [https://github.com/ty6789/soundsight]

### 启动项目

#### 使用已提供的地址
1.直接启动后端SpringBoot项目即可（前后端不分离，但使用了分离的思想，例如使用了fetch函数）。

#### 如果您选择使用自己的地址，请按照以下步骤操作：
1.配置MySQL数据库，soundsight.sql文件已包含在项目中，导入此SQL文件以创建和填充数据库。  
2.创建Elasticsearch索引
```bash
PUT /videos
{
  "mappings": {
    "properties": {
      "id": {
        "type": "integer"
      },
      "desc": {
        "type": "text"
      },
      "type": {
        "type": "keyword"
      }
    }
  }
}
```
3.导入Elasticsearch数据，使用Logstash并配置mysql-to-es.conf文件，该文件位于项目目录下。  
4.配置Redis地址  
5.最后启动SpringBoot项目


