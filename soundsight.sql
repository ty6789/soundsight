/*
 Navicat Premium Data Transfer

 Source Server         : aliyun
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : gpt.ty666.cool:3306
 Source Schema         : soundsight

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 03/11/2023 20:12:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for anime_video
-- ----------------------------
DROP TABLE IF EXISTS `anime_video`;
CREATE TABLE `anime_video`  (
  `id` int(11) NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `like` int(255) NOT NULL DEFAULT 0,
  `favorite` int(255) NOT NULL DEFAULT 0,
  `isHot` int(11) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_all_videos_id_type`(`id`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of anime_video
-- ----------------------------
INSERT INTO `anime_video` VALUES (1, '超然动漫推荐，有你喜欢的吗#二次元 #动漫 #动漫推荐 @小白混剪【动漫与情报推荐】', 361, 878, 0, 'anime');
INSERT INTO `anime_video` VALUES (2, '食物大战人类#治愈系动画', 3530, 1523, 1, 'anime');
INSERT INTO `anime_video` VALUES (3, '你见过这么离谱的灭蚊方式吗#脑洞大开#搞笑动画#童年动画#动画解说', 2539, 8971, 1, 'anime');
INSERT INTO `anime_video` VALUES (4, '\r\n\r\n凶狠的兔老大沦为了可爱的兔宝宝#治愈系动画', 891, 357, 0, 'anime');
INSERT INTO `anime_video` VALUES (5, '\r\n凶狠的兔老大最终沦为了可爱的兔宝宝#儿童动画 #治愈系 #动画短片推荐', 2435, 9876, 1, 'anime');
INSERT INTO `anime_video` VALUES (6, '河马追女朋友果真有一套#动画 #治愈系 #动漫剪辑', 2453, 7653, 1, 'anime');
INSERT INTO `anime_video` VALUES (7, '老公的CPU已烧毁#原创动画 #夫妻日常 #搞笑', 3626, 7653, 1, 'anime');
INSERT INTO `anime_video` VALUES (8, '西游F4（第一集） #原创动画 #轻漫计划 #二次元 #沙雕动画', 2543, 6543, 1, 'anime');
INSERT INTO `anime_video` VALUES (9, '贝乐虎 动画 早教 儿歌 一起来', 6528, 9256, 1, 'anime');
INSERT INTO `anime_video` VALUES (10, '\r\n少年领悟了真正的元神之力，秒杀所有妖魔 #国漫崛起', 253, 452, 0, 'anime');
INSERT INTO `anime_video` VALUES (11, '\r\n小月月遭打劫#星球动画 #动画 #宇宙 #打劫', 745, 352, 0, 'anime');
INSERT INTO `anime_video` VALUES (12, '鳄鱼宝宝认小仙子当妈妈#治愈系动画 #儿童动画', 324, 653, 0, 'anime');
INSERT INTO `anime_video` VALUES (13, '\r\n离家出走的猪 #动画 #儿童动画 #小朋友都爱看 #搞笑动画', 3542, 5342, 1, 'anime');
INSERT INTO `anime_video` VALUES (14, '\r\n\r\n\r\n地球被妈妈打#星球动画 #宇宙 #动画#地球', 4532, 6423, 1, 'anime');
INSERT INTO `anime_video` VALUES (15, '\r\n\r\n\r\n\r\n你小子犯法啦#动画 #宇宙#星球动画#你小子犯法了', 3452, 3565, 1, 'anime');
INSERT INTO `anime_video` VALUES (16, '《生肖造神日记116》—曾经的不幸者与曾经的人。 #剧情动画 #烧脑动画 #悬疑动画 #充能计划', 0, 0, 0, 'anime');
INSERT INTO `anime_video` VALUES (17, '\r\n\r\n王者动画来啦，峡谷白月光英雄李白，一整个期待住#王者动画新预告燃炸', 24, 356, 0, 'anime');
INSERT INTO `anime_video` VALUES (18, '两姐妹回家探亲，却被妹妹瞧不起 原创动', 3988, 4600, 1, 'anime');
INSERT INTO `anime_video` VALUES (19, '\r\n\r\n\r\n第3集:收服千年猪妖 #原创动画 #原创视频', 5360, 6210, 1, 'anime');
INSERT INTO `anime_video` VALUES (20, '意外激活还原系统，任何破烂都能一秒变全新，谁知女友却和我分手#原创动画 #动画制作 #充能计划 #无厘头', 6500, 9994, 1, 'anime');

-- ----------------------------
-- Table structure for arts_video
-- ----------------------------
DROP TABLE IF EXISTS `arts_video`;
CREATE TABLE `arts_video`  (
  `id` int(11) NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `like` int(255) NOT NULL DEFAULT 0,
  `favorite` int(255) NOT NULL DEFAULT 0,
  `isHot` int(11) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_all_videos_id_type`(`id`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of arts_video
-- ----------------------------
INSERT INTO `arts_video` VALUES (1, '“公主请听歌@” #LIVEHOUSE', 783, 1987, 0, 'arts');
INSERT INTO `arts_video` VALUES (2, '大圆哥杀疯了 找遍整个相册我也要发一个.#音乐 #音乐分享 #大圆哥 #大圆哥的遗憾', 1899, 3529, 1, 'arts');
INSERT INTO `arts_video` VALUES (3, '\r\n\r\n听说你们都在找这首版本的，那么给你们整了个加长环绕视频，这首其实是DJ版，先柔后劲爆，听到第28秒就知道了#戴上耳机 #若把你', 6357, 9993, 1, 'arts');
INSERT INTO `arts_video` VALUES (4, '#我敬自己一杯酒 #人生百味谁能不累 #想对自己说声辛苦了', 4538, 7651, 1, 'arts');
INSERT INTO `arts_video` VALUES (5, '\r\n我偏要用这个快餐式恋爱的时代 用真心砸出真心#白安 #现场版LIVE', 1212, 1932, 1, 'arts');
INSERT INTO `arts_video` VALUES (6, '\r\n#李健 线上演唱会翻唱#王菲 《如愿》字字感人，唱出人间真情，这应该是男生最好听的版本了吧？#音乐 #音乐分享 #如愿', 3415, 2291, 1, 'arts');
INSERT INTO `arts_video` VALUES (7, '\r\n这首歌，唱出了多少人的故事...#音乐 #伤感音乐 #一生中最爱的是你', 7777, 6662, 1, 'arts');
INSERT INTO `arts_video` VALUES (8, '\r\n“下一首歌曲，是吕子乔先生点给陈美嘉小姐的歌曲——周杰伦的《对不起》”#周杰伦 #对不起', 2561, 3182, 1, 'arts');
INSERT INTO `arts_video` VALUES (9, '\r\n“被你艾特的那个人 会陪你很久很久” #音乐 #当你出现在我的身边', 3331, 5421, 1, 'arts');
INSERT INTO `arts_video` VALUES (10, '\r\n爱意随风起，风止意难平，遗憾终究是遗憾。#其实都没有 #完整版 #音乐', 782, 341, 0, 'arts');
INSERT INTO `arts_video` VALUES (11, '教你画流泪的眼睛#零基础学画画 #素描', 872, 1294, 0, 'arts');
INSERT INTO `arts_video` VALUES (12, '\r\n随便练练手，美术生敢不练练？ #控笔 #手绘 #画画 #视觉震撼 #简笔画', 5419, 6931, 1, 'arts');
INSERT INTO `arts_video` VALUES (13, '快叫上你的美术生朋友一起练练线条吧～#美术生 #速写 #画画 #速写用线技巧 #热门', 2580, 2580, 1, 'arts');
INSERT INTO `arts_video` VALUES (14, '\r\n教你画路边风景，竟然如此美丽#素描风景 #零基础学画画 #素描 #素描风景画 #少儿美术教育 #想画就画 #每日一画', 327, 762, 0, 'arts');
INSERT INTO `arts_video` VALUES (15, '\r\n梨的排线方向#美术生 #素描 #美育中考', 3287, 2341, 1, 'arts');
INSERT INTO `arts_video` VALUES (16, '没有什么是一个圆形解决不了的，如果有就多画几个#画画 #绘画 #素描动物 #一起学画画', 6739, 5555, 1, 'arts');
INSERT INTO `arts_video` VALUES (17, '\r\n苹果排线练习 美术生 美术 零基础学', 4555, 3481, 1, 'arts');
INSERT INTO `arts_video` VALUES (18, '\r\n当代神笔马良，简单的一支粉笔，一块黑板，', 6398, 5630, 1, 'arts');
INSERT INTO `arts_video` VALUES (19, '\r\n是谁用一幅画挑战了整个艺考界！牛牛牛！ #美术艺考 #美术生 #美术生美术联考 #美术教育', 6666, 6667, 1, 'arts');
INSERT INTO `arts_video` VALUES (20, '油画 名画欣赏 艺术', 1234, 1234, 0, 'arts');

-- ----------------------------
-- Table structure for entertainment_video
-- ----------------------------
DROP TABLE IF EXISTS `entertainment_video`;
CREATE TABLE `entertainment_video`  (
  `id` int(11) NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `like` int(255) NOT NULL DEFAULT 0,
  `favorite` int(255) NOT NULL DEFAULT 0,
  `isHot` int(11) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_all_videos_id_type`(`id`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of entertainment_video
-- ----------------------------
INSERT INTO `entertainment_video` VALUES (1, '\r\n又有男演员感情出问题了，而且还是一线，独自小20岁的女演员家中过夜，你想到了谁？#明星夫妇', 2501, 5201, 1, 'entertainment');
INSERT INTO `entertainment_video` VALUES (2, '汗流浃背了吧小伙子！', 1682, 2256, 1, 'entertainment');
INSERT INTO `entertainment_video` VALUES (3, '\r\n见证一个新梗诞生！#搞笑 #梗 #楚雨荨疼是什么梗 #娱乐评论大赏 CR:@鹿潞是LULU', 5362, 2298, 1, 'entertainment');
INSERT INTO `entertainment_video` VALUES (4, '没想到还能听见吴某凡的近况 万万没想到', 3652, 2453, 1, 'entertainment');
INSERT INTO `entertainment_video` VALUES (5, '蒽…都是 BREAKING 的错！ 万万', 5637, 4673, 1, 'entertainment');
INSERT INTO `entertainment_video` VALUES (6, '感觉权志龙要变异了 我天呐感觉权志龙要', 873, 534, 0, 'entertainment');
INSERT INTO `entertainment_video` VALUES (7, '真的会化这么夸张吗！ 娱乐评论大赏 万', 2871, 1999, 1, 'entertainment');
INSERT INTO `entertainment_video` VALUES (8, '你身边有电子伙夫嘛#电子伙夫 #搞笑 #娱乐评论大赏', 1111, 2222, 1, 'entertainment');
INSERT INTO `entertainment_video` VALUES (9, '\r\n#王大陆 被拍到和一位长发美女单独约会，不是#蔡卓宜！两人之前还一起去见父母，大家都以为修成正果了，结果哎..', 2431, 2295, 1, 'entertainment');
INSERT INTO `entertainment_video` VALUES (10, '这首歌竟然是中文歌？#金润吉DISCO #娱乐评论大赏 #万万没想到', 9835, 3562, 1, 'entertainment');
INSERT INTO `entertainment_video` VALUES (11, '这造型算是被玩明白了啊～#万万没想到 #娱乐', 3524, 2318, 1, 'entertainment');
INSERT INTO `entertainment_video` VALUES (12, '一口气看40位身材超好的美女博主，你更想把谁带回家呢？#美出高级感 #这谁顶得住啊 #完美身材 #微胖女生 #网红', 4567, 3333, 1, 'entertainment');
INSERT INTO `entertainment_video` VALUES (13, '\r\n品 细品 #这谁顶得住啊 #辣身材 #小妈感', 9812, 8978, 1, 'entertainment');
INSERT INTO `entertainment_video` VALUES (14, '看好了 我只展示一遍 #KK战神 #这谁顶得住啊 #大长腿 #180大美女', 3571, 3333, 1, 'entertainment');
INSERT INTO `entertainment_video` VALUES (15, '德国选美冠军赛尔伯格！这颜值大家喜欢吗？#外国美女 #欧美女神', 8235, 5637, 1, 'entertainment');
INSERT INTO `entertainment_video` VALUES (16, '世界上最美的五位跳远美女！这就是为什么那么多人热爱体育的原因！#运动女孩 #体育美女 #田径美女', 3332, 2942, 1, 'entertainment');
INSERT INTO `entertainment_video` VALUES (17, '#完蛋我被美女包围了 #游戏 #STEAM游戏 悬溺一响，纯爱登场，完蛋我被美女包围了，姐姐资料我帮你整理好啦', 1342, 1542, 0, 'entertainment');
INSERT INTO `entertainment_video` VALUES (18, '一口气看20位兔子警官美女，你最想跟谁走一趟呢？ #兔子警官 #颜值 #盘点', 6667, 6667, 1, 'entertainment');
INSERT INTO `entertainment_video` VALUES (19, '这么美就算了，竟然还有两个#双胞胎 #美女日常 #街拍', 3567, 8325, 1, 'entertainment');
INSERT INTO `entertainment_video` VALUES (20, '\r\n#大长腿 #完美身材 #时尚街拍美女 #这是我能看得懂的时尚 #身材很哇塞', 6532, 6677, 1, 'entertainment');

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `video_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_favorite_on_user_video_type`(`user_id`, `video_id`, `video_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favorite
-- ----------------------------
INSERT INTO `favorite` VALUES (97, 3, 1, 'anime');
INSERT INTO `favorite` VALUES (87, 3, 1, 'food');
INSERT INTO `favorite` VALUES (99, 3, 1, 'sports');
INSERT INTO `favorite` VALUES (89, 3, 2, 'anime');
INSERT INTO `favorite` VALUES (69, 3, 3, 'anime');
INSERT INTO `favorite` VALUES (82, 3, 3, 'sports');
INSERT INTO `favorite` VALUES (71, 3, 4, 'anime');
INSERT INTO `favorite` VALUES (88, 3, 15, 'anime');
INSERT INTO `favorite` VALUES (96, 3, 18, 'entertainment');
INSERT INTO `favorite` VALUES (72, 3, 19, 'sports');
INSERT INTO `favorite` VALUES (84, 8, 1, 'anime');
INSERT INTO `favorite` VALUES (85, 8, 1, 'entertainment');
INSERT INTO `favorite` VALUES (86, 8, 1, 'travel');
INSERT INTO `favorite` VALUES (24, 14, 1, 'sports');
INSERT INTO `favorite` VALUES (28, 14, 2, 'anime');
INSERT INTO `favorite` VALUES (27, 14, 4, 'anime');
INSERT INTO `favorite` VALUES (29, 14, 11, 'sports');
INSERT INTO `favorite` VALUES (31, 14, 16, 'entertainment');

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow`  (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `followed_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of follow
-- ----------------------------

-- ----------------------------
-- Table structure for food_video
-- ----------------------------
DROP TABLE IF EXISTS `food_video`;
CREATE TABLE `food_video`  (
  `id` int(11) NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `like` int(255) NOT NULL DEFAULT 0,
  `favorite` int(255) NOT NULL DEFAULT 0,
  `isHot` int(11) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_all_videos_id_type`(`id`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of food_video
-- ----------------------------
INSERT INTO `food_video` VALUES (1, '以后莲藕买回来，你就像我这样做一道莲藕腐皮卷，外酥里嫩，无论是做零食还是早餐都非常合适#莲藕腐皮卷', 6757, 3422, 1, 'food');
INSERT INTO `food_video` VALUES (2, '对象爱吃肉的千万不要错过了，多汁美味快@对象动手吧#抖音美食创作人 #冬至总要来碗羊肉汤吧', 3452, 6523, 1, 'food');
INSERT INTO `food_video` VALUES (3, '大哥进屋就给老板娘1000块钱，要吃高难的“虎皮肘子”，大厨忙一上午才做好，老板娘吃的相当满意#记录真实生活 #美食趣胃计划', 456, 294, 0, 'food');
INSERT INTO `food_video` VALUES (4, '零失败，用玉米油跟水就可以做出小泡芙，学会了就不用出去买了！#美食教程 #小泡芙#泡芙 #甜品治愈一切', 923, 1200, 0, 'food');
INSERT INTO `food_video` VALUES (5, 'm莴笋炒肉像我这样做清脆爽口不油腻，喜欢你也赶紧试试#家常菜 #下饭菜 #跟着抖音学做菜', 1111, 784, 0, 'food');
INSERT INTO `food_video` VALUES (6, '下次想吃炒面了你就这样做，干香劲道特别好吃#炒面 #面条 #面条的N种吃法 #美食教程', 452, 986, 0, 'food');
INSERT INTO `food_video` VALUES (7, '谁能想到把菠菜倒入鸡蛋液里拌一拌，竟然这么好吃，很多人都没吃过，而且鲜香滑嫩#低卡低脂餐 #家常菜', 6577, 9823, 1, 'food');
INSERT INTO `food_video` VALUES (8, '吃一次就忘不了的蜜汁鸡腿，妈呀太香了，鲜嫩多汁还好吃。#鸡腿 #鸡腿的神仙做法 #蜜汁鸡腿 #抖音美食创作人 #妈呀太香了', 3422, 2932, 1, 'food');
INSERT INTO `food_video` VALUES (9, '搅一搅不用烤箱就能成功的粉色奥利奥蛋糕，口感丝滑超级好吃～ #治愈系美食 #下午茶甜品', 4288, 8213, 1, 'food');
INSERT INTO `food_video` VALUES (10, '\r\n90后单亲宝妈做住家保姆，月薪9000试用期第20天，今天早上花2小时给雇主做了8道不同的味道，满足雇主家6个人不同的口味，老板很满意今天的早餐，大家觉得怎么样？#住家保姆 #早餐 #单亲妈妈', 234, 659, 0, 'food');
INSERT INTO `food_video` VALUES (11, '\r\n#抖音商城双11好物节 #抖音双十一超值超好囤 #美食创作人计划 #乡村守护人 #土豆的神仙吃法 你还喜欢怎么吃', 6288, 9824, 1, 'food');
INSERT INTO `food_video` VALUES (12, '\r\n\r\n喜欢吃辣椒炒牛肉的一定要试一下这样做，太香太下饭了#家常菜 #炒牛肉 #下饭菜 #跟着抖音学做菜', 6666, 6666, 1, 'food');
INSERT INTO `food_video` VALUES (13, '\r\n\r\n杭州人都会喜欢这家土菜馆吧 奶奶烧的味道 像回家吃饭一样 #跟着抖音来探店 #本地人爱吃的店 #抖音美食推荐官 #杭州美食 #暑假的有趣都在这里', 739, 1288, 0, 'food');
INSERT INTO `food_video` VALUES (14, '\r\n\r\n盘点不同国家“大胃王”干饭名场面，特别是我国大胃王更是牛掰#咀嚼声 #吃秀 #外网视频 #火鸡面 #美食挑战 #深夜美食 #咀嚼 #鸡蛋 #美食测评 #试吃', 3456, 2788, 1, 'food');
INSERT INTO `food_video` VALUES (15, '\r\n\r\n孩子的早餐不知道吃什么，那就试试这个鸡蛋方便面吧，简单又好吃~#早餐吃什么', 7774, 2481, 1, 'food');

-- ----------------------------
-- Table structure for hot_video
-- ----------------------------
DROP TABLE IF EXISTS `hot_video`;
CREATE TABLE `hot_video`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `video_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hot_video
-- ----------------------------
INSERT INTO `hot_video` VALUES (1, 3, 'entertainment');
INSERT INTO `hot_video` VALUES (2, 3, 'lifestyle');
INSERT INTO `hot_video` VALUES (3, 1, 'food');
INSERT INTO `hot_video` VALUES (4, 15, 'anime');
INSERT INTO `hot_video` VALUES (5, 4, 'entertainment');
INSERT INTO `hot_video` VALUES (6, 11, 'travel');
INSERT INTO `hot_video` VALUES (7, 12, 'entertainment');
INSERT INTO `hot_video` VALUES (8, 8, 'travel');
INSERT INTO `hot_video` VALUES (9, 10, 'entertainment');
INSERT INTO `hot_video` VALUES (10, 16, 'travel');
INSERT INTO `hot_video` VALUES (11, 11, 'technology');
INSERT INTO `hot_video` VALUES (12, 16, 'arts');
INSERT INTO `hot_video` VALUES (13, 7, 'technology');
INSERT INTO `hot_video` VALUES (14, 11, 'entertainment');
INSERT INTO `hot_video` VALUES (15, 14, 'entertainment');
INSERT INTO `hot_video` VALUES (16, 2, 'sports');
INSERT INTO `hot_video` VALUES (17, 6, 'travel');
INSERT INTO `hot_video` VALUES (18, 9, 'anime');
INSERT INTO `hot_video` VALUES (19, 16, 'entertainment');
INSERT INTO `hot_video` VALUES (20, 7, 'anime');
INSERT INTO `hot_video` VALUES (21, 8, 'technology');
INSERT INTO `hot_video` VALUES (22, 4, 'arts');
INSERT INTO `hot_video` VALUES (23, 8, 'food');
INSERT INTO `hot_video` VALUES (24, 9, 'food');
INSERT INTO `hot_video` VALUES (25, 14, 'food');
INSERT INTO `hot_video` VALUES (26, 1, 'sports');
INSERT INTO `hot_video` VALUES (27, 5, 'entertainment');
INSERT INTO `hot_video` VALUES (28, 7, 'entertainment');
INSERT INTO `hot_video` VALUES (29, 10, 'technology');
INSERT INTO `hot_video` VALUES (30, 2, 'entertainment');
INSERT INTO `hot_video` VALUES (31, 15, 'sports');
INSERT INTO `hot_video` VALUES (32, 7, 'lifestyle');
INSERT INTO `hot_video` VALUES (33, 20, 'anime');
INSERT INTO `hot_video` VALUES (34, 3, 'sports');
INSERT INTO `hot_video` VALUES (35, 8, 'sports');
INSERT INTO `hot_video` VALUES (36, 8, 'arts');
INSERT INTO `hot_video` VALUES (37, 8, 'anime');
INSERT INTO `hot_video` VALUES (38, 10, 'sports');
INSERT INTO `hot_video` VALUES (39, 20, 'entertainment');
INSERT INTO `hot_video` VALUES (40, 12, 'sports');
INSERT INTO `hot_video` VALUES (41, 13, 'arts');
INSERT INTO `hot_video` VALUES (42, 17, 'technology');
INSERT INTO `hot_video` VALUES (43, 13, 'technology');
INSERT INTO `hot_video` VALUES (44, 3, 'anime');
INSERT INTO `hot_video` VALUES (45, 12, 'technology');
INSERT INTO `hot_video` VALUES (46, 14, 'anime');
INSERT INTO `hot_video` VALUES (47, 9, 'entertainment');
INSERT INTO `hot_video` VALUES (48, 3, 'arts');
INSERT INTO `hot_video` VALUES (49, 2, 'arts');
INSERT INTO `hot_video` VALUES (50, 5, 'travel');
INSERT INTO `hot_video` VALUES (51, 15, 'food');
INSERT INTO `hot_video` VALUES (52, 9, 'travel');
INSERT INTO `hot_video` VALUES (53, 1, 'entertainment');
INSERT INTO `hot_video` VALUES (54, 2, 'travel');
INSERT INTO `hot_video` VALUES (55, 8, 'lifestyle');
INSERT INTO `hot_video` VALUES (56, 13, 'entertainment');
INSERT INTO `hot_video` VALUES (57, 2, 'lifestyle');
INSERT INTO `hot_video` VALUES (58, 9, 'sports');
INSERT INTO `hot_video` VALUES (59, 6, 'technology');
INSERT INTO `hot_video` VALUES (60, 11, 'food');
INSERT INTO `hot_video` VALUES (61, 18, 'technology');
INSERT INTO `hot_video` VALUES (62, 6, 'lifestyle');
INSERT INTO `hot_video` VALUES (63, 5, 'technology');
INSERT INTO `hot_video` VALUES (64, 7, 'travel');
INSERT INTO `hot_video` VALUES (65, 18, 'entertainment');
INSERT INTO `hot_video` VALUES (66, 9, 'arts');
INSERT INTO `hot_video` VALUES (67, 5, 'arts');
INSERT INTO `hot_video` VALUES (68, 16, 'technology');
INSERT INTO `hot_video` VALUES (69, 2, 'technology');
INSERT INTO `hot_video` VALUES (70, 4, 'lifestyle');
INSERT INTO `hot_video` VALUES (71, 19, 'arts');
INSERT INTO `hot_video` VALUES (72, 1, 'technology');
INSERT INTO `hot_video` VALUES (73, 16, 'sports');
INSERT INTO `hot_video` VALUES (74, 2, 'anime');
INSERT INTO `hot_video` VALUES (75, 15, 'entertainment');
INSERT INTO `hot_video` VALUES (76, 18, 'anime');
INSERT INTO `hot_video` VALUES (77, 9, 'lifestyle');
INSERT INTO `hot_video` VALUES (78, 7, 'arts');
INSERT INTO `hot_video` VALUES (79, 7, 'food');
INSERT INTO `hot_video` VALUES (80, 6, 'arts');
INSERT INTO `hot_video` VALUES (81, 13, 'anime');
INSERT INTO `hot_video` VALUES (82, 6, 'anime');
INSERT INTO `hot_video` VALUES (83, 15, 'technology');
INSERT INTO `hot_video` VALUES (84, 2, 'food');
INSERT INTO `hot_video` VALUES (85, 17, 'arts');
INSERT INTO `hot_video` VALUES (86, 19, 'anime');
INSERT INTO `hot_video` VALUES (87, 18, 'arts');
INSERT INTO `hot_video` VALUES (88, 14, 'technology');
INSERT INTO `hot_video` VALUES (89, 12, 'arts');
INSERT INTO `hot_video` VALUES (90, 7, 'sports');
INSERT INTO `hot_video` VALUES (91, 12, 'food');
INSERT INTO `hot_video` VALUES (92, 11, 'lifestyle');
INSERT INTO `hot_video` VALUES (93, 15, 'arts');
INSERT INTO `hot_video` VALUES (94, 19, 'entertainment');
INSERT INTO `hot_video` VALUES (95, 5, 'anime');
INSERT INTO `hot_video` VALUES (96, 1, 'travel');
INSERT INTO `hot_video` VALUES (97, 8, 'entertainment');
INSERT INTO `hot_video` VALUES (98, 10, 'lifestyle');
INSERT INTO `hot_video` VALUES (99, 9, 'technology');

-- ----------------------------
-- Table structure for lifestyle_video
-- ----------------------------
DROP TABLE IF EXISTS `lifestyle_video`;
CREATE TABLE `lifestyle_video`  (
  `id` int(11) NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `like` int(255) NOT NULL DEFAULT 0,
  `favorite` int(255) NOT NULL DEFAULT 0,
  `isHot` int(11) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_all_videos_id_type`(`id`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lifestyle_video
-- ----------------------------
INSERT INTO `lifestyle_video` VALUES (1, '一辈子不婚不育的人生会有遗憾吗，这位阿姨的感慨真的无可奈何，你们的婚姻态度是什么呢？#婚姻 #不婚不育是人生的遗憾吗 #情感共鸣 #家庭 #扎心现实', 561, 873, 0, 'lifestyle');
INSERT INTO `lifestyle_video` VALUES (2, '今天老公从餐厅里面抬厨师搞的饭菜回来给我们三娘母吃。#记录真实生活 #我的生活日记 #日常VLOG #出租屋的生活 #宝妈记录生活日常', 6663, 9367, 1, 'lifestyle');
INSERT INTO `lifestyle_video` VALUES (3, '\r\n今天老公心情不好回到家就臭骂我。#记录真实生活 #我的生活日记 #出租屋的生活 #宝妈记录生活日常 #日常VLOG', 3535, 2333, 1, 'lifestyle');
INSERT INTO `lifestyle_video` VALUES (4, '\r\n女人一定要有赚钱的能力，赚钱可以活得有尊', 7635, 6245, 1, 'lifestyle');
INSERT INTO `lifestyle_video` VALUES (5, '我们才不是什么NPC.#娱乐评论大赏 #你怎么看 #享受生活', 678, 998, 0, 'lifestyle');
INSERT INTO `lifestyle_video` VALUES (6, '#记录真实生活 #宝妈记录生活日常 #每天都记录我的真实生活日常 @抖音热点 @抖音创作者中心 @抖音小助手', 1542, 1782, 1, 'lifestyle');
INSERT INTO `lifestyle_video` VALUES (7, '#生活小技巧 #生活小妙招 #生活小常识 #生活窍门 #实用小技巧', 3325, 6591, 1, 'lifestyle');
INSERT INTO `lifestyle_video` VALUES (8, '人一旦开始存钱…就会变的特别抠门… 存钱', 6629, 4291, 1, 'lifestyle');
INSERT INTO `lifestyle_video` VALUES (9, '炒菜机器人', 5555, 5523, 1, 'lifestyle');
INSERT INTO `lifestyle_video` VALUES (10, '司机后面找到了么？究竟是发生了什么呢？#婆媳 #乡村守护人 #我的乡村生活 #乡村生活 #新农人', 3456, 4567, 1, 'lifestyle');
INSERT INTO `lifestyle_video` VALUES (11, '从大化回来一直忙个不停，忙到晚上8点多才停！今天我们的美缝剂小样到了#记录真实生活 #我的乡村生活 #记录装修过程 #VLOG日常', 6523, 6712, 1, 'lifestyle');

-- ----------------------------
-- Table structure for sports_video
-- ----------------------------
DROP TABLE IF EXISTS `sports_video`;
CREATE TABLE `sports_video`  (
  `id` int(11) NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `like` int(255) NOT NULL DEFAULT 0,
  `favorite` int(255) NOT NULL DEFAULT 0,
  `isHot` int(11) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_all_videos_id_type`(`id`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sports_video
-- ----------------------------
INSERT INTO `sports_video` VALUES (1, '面对日本队的全场最高分，中国小将张颢与朱思怡凭借出手的演绎，强势将其打脸#冠军#中国骄傲', 4001, 2001, 1, 'sports');
INSERT INTO `sports_video` VALUES (2, '喜欢马拉松的精神 不是因为我要跑的多快 而是在过程中与自己的搏斗 用意志力降服心中的懒惰！ #传递奔跑的力量', 3456, 2677, 1, 'sports');
INSERT INTO `sports_video` VALUES (3, '马拉松接力19岁女孩小腿骨折，为了不影响全队成绩，她坚持选择跪地爬到终点#体育精神#多想做个哑巴', 1567, 2787, 1, 'sports');
INSERT INTO `sports_video` VALUES (4, '这会不会就是校运会上的你？ #校运会 #博尔特 #接力 ', 234, 145, 0, 'sports');
INSERT INTO `sports_video` VALUES (5, '他是全亚洲唯一一个敢把亚运会当作热身赛的运动员。简单来说，巴尔希姆的轻跨一跳 就能轻松的越过你们学校的围墙。#巴尔希姆 #跳高 #田径', 232, 567, 0, 'sports');
INSERT INTO `sports_video` VALUES (6, '巴西马拉松选手突然被观众推出赛道，最终失金，但他赛后的态度赢得了所有人的掌声#马拉松#体育精神#歌曲咏山赋#咏山赋', 659, 1456, 0, 'sports');
INSERT INTO `sports_video` VALUES (7, '年度最佳“扑救 ”，穆斯莱拉推开要撞上门柱的对手@抖音创作者中心 @抖音体育', 9823, 3876, 1, 'sports');
INSERT INTO `sports_video` VALUES (8, '#游泳正常穿搭无不良引导 #美女运动员 #女子跳水 #跳水 #跳水运动员', 6666, 6666, 1, 'sports');
INSERT INTO `sports_video` VALUES (9, '田径十项全能拿到9000分到底有多难？竟只有四个人可以做到？ #跳远 #撑杆跳 #三级跳远 #短跑 #田径', 2876, 3567, 1, 'sports');
INSERT INTO `sports_video` VALUES (10, '十项全能已经够恐怖了，又来个二十项全能。兄弟们敢上的扣1！！！#十项全能', 8320, 5629, 1, 'sports');
INSERT INTO `sports_video` VALUES (11, '青春回来了肖华：本赛季全明星重回东部VS西部赛制 #肖华 #NBA #全明星', 520, 280, 0, 'sports');
INSERT INTO `sports_video` VALUES (12, '\r\n且看且珍惜！一个35岁，一个39岁，这次詹杜对决看得泪目！#湖人赛季首胜 #太阳VS湖人 #詹姆斯 #杜兰特', 980, 2472, 1, 'sports');
INSERT INTO `sports_video` VALUES (13, '亚残运赛场上的颜值担当，中国选手徐佳玲真的太美了！不愧是亚残运主火炬点燃者！#春不晚', 359, 748, 0, 'sports');
INSERT INTO `sports_video` VALUES (14, '\r\n亚残运会上，盲人运动员邸东东打破亚洲纪录，第一个感谢的人是身边的他#杭州亚残运会', 287, 893, 0, 'sports');
INSERT INTO `sports_video` VALUES (15, '\r\n日本选手是有理解的 国乒 亚残运会', 3520, 5421, 1, 'sports');
INSERT INTO `sports_video` VALUES (16, '\r\n上午10点，全红婵宣布生涯意外决定，周继红批准，陈若琳遗憾', 3271, 4529, 1, 'sports');
INSERT INTO `sports_video` VALUES (17, '\r\n将7.26公斤的铅球投出23米开外到底有多难？ #铅球 #田径', 561, 429, 0, 'sports');
INSERT INTO `sports_video` VALUES (18, '\r\n\r\n\r\n中国小伙面对日本选手一顿输出，狂暴经典国粹！#体育 #羽毛球 #冠军', 89, 56, 0, 'sports');
INSERT INTO `sports_video` VALUES (19, '当一个体育生的必要条件，你具备嘛？#体育生 #日常训练 #福建体考', 352, 880, 0, 'sports');
INSERT INTO `sports_video` VALUES (20, '#体育生 #跳水运动员 #游泳健身 #冬泳 #跳水', 899, 999, 0, 'sports');

-- ----------------------------
-- Table structure for technology_video
-- ----------------------------
DROP TABLE IF EXISTS `technology_video`;
CREATE TABLE `technology_video`  (
  `id` int(11) NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `like` int(255) NOT NULL DEFAULT 0,
  `favorite` int(255) NOT NULL DEFAULT 0,
  `isHot` int(11) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_all_videos_id_type`(`id`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of technology_video
-- ----------------------------
INSERT INTO `technology_video` VALUES (1, '神奇！中国科学院院士褚君浩现场演示“隐身', 8729, 6666, 1, 'technology');
INSERT INTO `technology_video` VALUES (2, '\r\n100多年前摩天轮是如何发明出来的？带你看摩天轮的发展史和原理 #涨知识 #科普一下#科学脑洞上分赛 #科普', 5382, 8356, 1, 'technology');
INSERT INTO `technology_video` VALUES (3, '全新升级的智能剃须刀，支持HUAWEI HILINK，强劲动力剃须新体验，关键就一百多 #侯天来 #剃须刀', 562, 999, 0, 'technology');
INSERT INTO `technology_video` VALUES (4, '测量出光速的人绝对是个天才#科技发明秀', 1111, 1311, 0, 'technology');
INSERT INTO `technology_video` VALUES (5, '他发明「外星科技」，却意外去世，经历了什么？#发明 #外星文明 #热 #太阳', 8639, 3562, 1, 'technology');
INSERT INTO `technology_video` VALUES (6, '央媒将小米列为四大科技企业，小米配吗？ #小米 #中国科技企业真正需要的是什么', 3472, 6529, 1, 'technology');
INSERT INTO `technology_video` VALUES (7, '全新升级的智能剃须刀，支持HUAWEI HILINK，强劲动力剃须新体验，关键就一百多 #侯天来 #剃须刀', 5362, 7682, 1, 'technology');
INSERT INTO `technology_video` VALUES (8, '\r\n今天我们来聊聊华为的格局#华为', 5327, 2345, 1, 'technology');
INSERT INTO `technology_video` VALUES (9, '#中国航天 太科幻了！月球熔洞穴方案，中国计划在2050年建成“地月经济特区”#点赞中国航天', 3826, 2323, 1, 'technology');
INSERT INTO `technology_video` VALUES (10, '全新升级的智能剃须刀，支持HUAWEI HILINK，强劲动力剃须新体验，关键就一百多#许亚军 #侯天来 #苏小玎 #孙岩 #剃须刀', 6666, 6666, 1, 'technology');
INSERT INTO `technology_video` VALUES (11, '发明特斯拉阀的人真是个天才啊#科技发明秀', 3452, 8567, 1, 'technology');
INSERT INTO `technology_video` VALUES (12, '有一说一，难以置信这个技术真的能实现么？', 7777, 7777, 1, 'technology');
INSERT INTO `technology_video` VALUES (13, '这个品牌既能“吹”又能“刷”？#徕芬新品发布 #徕芬扫振电动牙刷', 5555, 6565, 1, 'technology');
INSERT INTO `technology_video` VALUES (14, '\r\n可以弯曲戴在手腕上的手机，你会为这样的手就买单吗？#摩托罗拉 #手机', 7398, 6821, 1, 'technology');
INSERT INTO `technology_video` VALUES (15, '\r\n我心澎湃，不得不爱！小米14系列绝了！ #小米14发布会#安卓手机推荐', 6523, 4523, 1, 'technology');
INSERT INTO `technology_video` VALUES (16, '有了脑机接口，瘫痪12年的他靠自己站起来了 #脑机接口 #马斯克 #瘫痪', 4231, 4321, 1, 'technology');
INSERT INTO `technology_video` VALUES (17, '以色列的梅卡瓦主战坦克中都有哪些黑科技？带你看它的工作原理 #梅卡瓦坦克 #涨知识 #科普一下#科普', 3627, 5634, 1, 'technology');
INSERT INTO `technology_video` VALUES (18, '既能跑又能飞还能露营的“陆地航母”要来了？#抖科技说车 #汽车科技 #未来出行#飞行汽车#小鹏汽车', 5768, 2456, 1, 'technology');

-- ----------------------------
-- Table structure for travel_video
-- ----------------------------
DROP TABLE IF EXISTS `travel_video`;
CREATE TABLE `travel_video`  (
  `id` int(11) NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `like` int(255) NOT NULL DEFAULT 0,
  `favorite` int(255) NOT NULL DEFAULT 0,
  `isHot` int(11) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_all_videos_id_type`(`id`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of travel_video
-- ----------------------------
INSERT INTO `travel_video` VALUES (1, '\r\n厦门三天两晚攻略收好咯，等有机会，我们一起去感受这份浪漫吧～', 9827, 8733, 1, 'travel');
INSERT INTO `travel_video` VALUES (2, '11月以后的云南，向往的旅行季，它终于来啦！#云南旅游攻略 #云南旅游#云南旅游推荐#带你游云南', 3562, 6532, 1, 'travel');
INSERT INTO `travel_video` VALUES (3, '\r\n人均400块的香港一日游攻略，片尾附上了文字版攻略和消费明细，学生党、上班族出行必备！#香港 #旅游攻略 #心动五一 #抖音搜索流量来了 #旅行大玩家 #心动推荐官 #深港联游消费券', 352, 666, 0, 'travel');
INSERT INTO `travel_video` VALUES (4, '再也不是井底之蛙了 #旅行 #西藏 #布达拉宫', 1111, 1733, 0, 'travel');
INSERT INTO `travel_video` VALUES (5, '威海是一个适合所有人去旅行的海滨城市，这份3天2晚人均1500的攻略记得收好#旅行大玩家 #夏日出逃记 #这是我爱的夏天', 7777, 7610, 1, 'travel');
INSERT INTO `travel_video` VALUES (6, '我看到了日照金山#贡嘎雪山 #旅行 #川西美景 #日照金山', 3182, 4442, 1, 'travel');
INSERT INTO `travel_video` VALUES (7, '\r\n3000块济州岛特种兵4天攻略 #旅行VLOG #特种兵式旅游 #VLOG日常 #旅行推荐官 #济州岛旅游', 6219, 5542, 1, 'travel');
INSERT INTO `travel_video` VALUES (8, '我带你这样拍布达拉宫 #布达拉宫 #旅行 #西藏', 4329, 3322, 1, 'travel');
INSERT INTO `travel_video` VALUES (9, '\r\n杭州驱车30分钟我在西湖灵山给你找到一处', 6311, 6666, 1, 'travel');
INSERT INTO `travel_video` VALUES (10, '原来草原的尽头，是大海。 #内蒙古旅游 #旅行推荐官 #OPPOFINDX6', 562, 719, 0, 'travel');
INSERT INTO `travel_video` VALUES (11, '\r\n有人问我，为什么频繁的去川西 我回答说，我生来就热爱高山而非溪流，喜欢向野而生，去见命运里不同的风#四姑娘山', 7620, 5555, 1, 'travel');
INSERT INTO `travel_video` VALUES (12, '十一江浙沪这个地儿好玩还不堵车！ #旅行推荐官 #休闲度假 #国庆心动打卡地', 342, 111, 0, 'travel');
INSERT INTO `travel_video` VALUES (13, '\r\n打卡新的杭州小冰岛，第一次觉得XIAO 红书没有骗我#保持热爱奔赴山海 #旅行大玩家 #杭州小冰岛 #周末去哪玩 #周边游 #露营#遇见美好冬季', 777, 888, 0, 'travel');
INSERT INTO `travel_video` VALUES (14, '一生何所求，真爱与自由！#西藏女领队 #川藏线 #西藏自驾游 #旅行大玩家 #越野', 982, 1000, 0, 'travel');
INSERT INTO `travel_video` VALUES (15, '\r\n两个人延吉长白山玩3天3夜，人均不到1000块！这份攻略收好了～这个冬天一定用得到！#长白山 #延吉旅游攻略 #延吉写真 #旅行推荐官 #长白山攻略', 1111, 1111, 0, 'travel');
INSERT INTO `travel_video` VALUES (16, '\r\n百万粉丝旅行博主月收入六万，在东欧只能穷游，欧洲的消费太高了 ！#旅行VLOG #旅行大玩家 #环球旅行#旅游', 5200, 5200, 1, 'travel');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar_code` int(255) NOT NULL,
  `preferences` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (3, 'ty', 'ty', 3, 'anime,sports');
INSERT INTO `user` VALUES (5, '1', '1', 3, 'anime,sports');
INSERT INTO `user` VALUES (6, '12', '12', 2, 'sports,travel');
INSERT INTO `user` VALUES (7, '45', '45', 2, 'anime');
INSERT INTO `user` VALUES (8, '七牛云', '123456', 1, 'anime,entertainment,travel,arts');
INSERT INTO `user` VALUES (9, '89', '89', 2, 'arts');
INSERT INTO `user` VALUES (10, 'op', 'op', 11, 'travel,entertainment');
INSERT INTO `user` VALUES (12, '哈哈哈哈哈', 'ty', 2, 'travel');
INSERT INTO `user` VALUES (13, 'lll', 'lll', 1, '');
INSERT INTO `user` VALUES (14, 'l', 'l', 1, '');

-- ----------------------------
-- Table structure for user_video
-- ----------------------------
DROP TABLE IF EXISTS `user_video`;
CREATE TABLE `user_video`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `video_id` int(11) NOT NULL,
  `video_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` int(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_video`(`userId`) USING BTREE,
  INDEX `idx_id_type`(`video_id`, `video_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 141 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_video
-- ----------------------------
INSERT INTO `user_video` VALUES (1, 3, 'ty', 1, 'sports', 3);
INSERT INTO `user_video` VALUES (2, 12, '哈哈哈哈哈', 2, 'sports', 2);
INSERT INTO `user_video` VALUES (3, 3, 'ty', 3, 'sports', 3);
INSERT INTO `user_video` VALUES (4, 12, '哈哈哈哈哈', 4, 'sports', 2);
INSERT INTO `user_video` VALUES (5, 3, 'ty', 5, 'sports', 3);
INSERT INTO `user_video` VALUES (6, 12, '哈哈哈哈哈', 6, 'sports', 2);
INSERT INTO `user_video` VALUES (7, 3, 'ty', 7, 'sports', 3);
INSERT INTO `user_video` VALUES (8, 12, '哈哈哈哈哈', 8, 'sports', 2);
INSERT INTO `user_video` VALUES (9, 3, 'ty', 9, 'sports', 3);
INSERT INTO `user_video` VALUES (10, 12, '哈哈哈哈哈', 10, 'sports', 2);
INSERT INTO `user_video` VALUES (11, 3, 'ty', 11, 'sports', 3);
INSERT INTO `user_video` VALUES (12, 3, 'ty', 12, 'sports', 3);
INSERT INTO `user_video` VALUES (13, 3, 'ty', 13, 'sports', 3);
INSERT INTO `user_video` VALUES (14, 3, 'ty', 14, 'sports', 3);
INSERT INTO `user_video` VALUES (15, 3, 'ty', 15, 'sports', 3);
INSERT INTO `user_video` VALUES (16, 3, 'ty', 16, 'sports', 3);
INSERT INTO `user_video` VALUES (17, 3, 'ty', 17, 'sports', 3);
INSERT INTO `user_video` VALUES (18, 3, 'ty', 18, 'sports', 3);
INSERT INTO `user_video` VALUES (19, 8, '七牛云', 19, 'sports', 1);
INSERT INTO `user_video` VALUES (20, 8, '七牛云', 20, 'sports', 1);
INSERT INTO `user_video` VALUES (21, 3, 'ty', 1, 'anime', 3);
INSERT INTO `user_video` VALUES (22, 3, 'ty', 2, 'anime', 3);
INSERT INTO `user_video` VALUES (23, 3, 'ty', 3, 'anime', 3);
INSERT INTO `user_video` VALUES (24, 3, 'ty', 4, 'anime', 3);
INSERT INTO `user_video` VALUES (25, 3, 'ty', 5, 'anime', 3);
INSERT INTO `user_video` VALUES (26, 10, 'op', 6, 'anime', 11);
INSERT INTO `user_video` VALUES (27, 12, '哈哈哈哈哈', 7, 'anime', 2);
INSERT INTO `user_video` VALUES (28, 3, 'ty', 8, 'anime', 3);
INSERT INTO `user_video` VALUES (29, 12, '哈哈哈哈哈', 9, 'anime', 2);
INSERT INTO `user_video` VALUES (30, 12, '哈哈哈哈哈', 10, 'anime', 2);
INSERT INTO `user_video` VALUES (31, 12, '哈哈哈哈哈', 11, 'anime', 2);
INSERT INTO `user_video` VALUES (32, 3, 'ty', 12, 'anime', 3);
INSERT INTO `user_video` VALUES (33, 10, 'op', 13, 'anime', 11);
INSERT INTO `user_video` VALUES (34, 10, 'op', 14, 'anime', 11);
INSERT INTO `user_video` VALUES (35, 10, 'op', 15, 'anime', 11);
INSERT INTO `user_video` VALUES (36, 12, '哈哈哈哈哈', 16, 'anime', 2);
INSERT INTO `user_video` VALUES (37, 12, '哈哈哈哈哈', 17, 'anime', 2);
INSERT INTO `user_video` VALUES (38, 12, '哈哈哈哈哈', 18, 'anime', 2);
INSERT INTO `user_video` VALUES (39, 12, '哈哈哈哈哈', 19, 'anime', 2);
INSERT INTO `user_video` VALUES (40, 12, '哈哈哈哈哈', 20, 'anime', 2);
INSERT INTO `user_video` VALUES (41, 12, '哈哈哈哈哈', 1, 'food', 2);
INSERT INTO `user_video` VALUES (42, 12, '哈哈哈哈哈', 2, 'food', 2);
INSERT INTO `user_video` VALUES (43, 12, '哈哈哈哈哈', 3, 'food', 2);
INSERT INTO `user_video` VALUES (44, 3, 'ty', 4, 'food', 3);
INSERT INTO `user_video` VALUES (45, 3, 'ty', 5, 'food', 3);
INSERT INTO `user_video` VALUES (46, 3, 'ty', 6, 'food', 3);
INSERT INTO `user_video` VALUES (47, 3, 'ty', 7, 'food', 3);
INSERT INTO `user_video` VALUES (48, 3, 'ty', 8, 'food', 3);
INSERT INTO `user_video` VALUES (49, 3, 'ty', 9, 'food', 3);
INSERT INTO `user_video` VALUES (50, 10, 'op', 10, 'food', 11);
INSERT INTO `user_video` VALUES (51, 10, 'op', 11, 'food', 11);
INSERT INTO `user_video` VALUES (52, 10, 'op', 12, 'food', 11);
INSERT INTO `user_video` VALUES (53, 10, 'op', 13, 'food', 11);
INSERT INTO `user_video` VALUES (54, 10, 'op', 14, 'food', 11);
INSERT INTO `user_video` VALUES (55, 10, 'op', 15, 'food', 11);
INSERT INTO `user_video` VALUES (56, 10, 'op', 1, 'arts', 11);
INSERT INTO `user_video` VALUES (57, 10, 'op', 2, 'arts', 11);
INSERT INTO `user_video` VALUES (58, 10, 'op', 3, 'arts', 11);
INSERT INTO `user_video` VALUES (59, 10, 'op', 4, 'arts', 11);
INSERT INTO `user_video` VALUES (60, 10, 'op', 5, 'arts', 11);
INSERT INTO `user_video` VALUES (61, 3, 'ty', 6, 'arts', 3);
INSERT INTO `user_video` VALUES (62, 3, 'ty', 7, 'arts', 3);
INSERT INTO `user_video` VALUES (63, 3, 'ty', 8, 'arts', 3);
INSERT INTO `user_video` VALUES (64, 3, 'ty', 9, 'arts', 3);
INSERT INTO `user_video` VALUES (65, 3, 'ty', 10, 'arts', 3);
INSERT INTO `user_video` VALUES (66, 8, '七牛云', 11, 'arts', 1);
INSERT INTO `user_video` VALUES (67, 3, 'ty', 12, 'arts', 3);
INSERT INTO `user_video` VALUES (68, 3, 'ty', 13, 'arts', 3);
INSERT INTO `user_video` VALUES (69, 12, '哈哈哈哈哈', 14, 'arts', 2);
INSERT INTO `user_video` VALUES (70, 12, '哈哈哈哈哈', 15, 'arts', 2);
INSERT INTO `user_video` VALUES (71, 12, '哈哈哈哈哈', 16, 'arts', 2);
INSERT INTO `user_video` VALUES (72, 12, '哈哈哈哈哈', 17, 'arts', 2);
INSERT INTO `user_video` VALUES (73, 12, '哈哈哈哈哈', 18, 'arts', 2);
INSERT INTO `user_video` VALUES (74, 12, '哈哈哈哈哈', 19, 'arts', 2);
INSERT INTO `user_video` VALUES (75, 12, '哈哈哈哈哈', 20, 'arts', 2);
INSERT INTO `user_video` VALUES (76, 12, '哈哈哈哈哈', 1, 'entertainment', 2);
INSERT INTO `user_video` VALUES (77, 12, '哈哈哈哈哈', 2, 'entertainment', 2);
INSERT INTO `user_video` VALUES (78, 12, '哈哈哈哈哈', 3, 'entertainment', 2);
INSERT INTO `user_video` VALUES (79, 12, '哈哈哈哈哈', 4, 'entertainment', 2);
INSERT INTO `user_video` VALUES (80, 12, '哈哈哈哈哈', 5, 'entertainment', 2);
INSERT INTO `user_video` VALUES (81, 12, '哈哈哈哈哈', 6, 'entertainment', 2);
INSERT INTO `user_video` VALUES (82, 9, '89', 7, 'entertainment', 2);
INSERT INTO `user_video` VALUES (83, 9, '89', 8, 'entertainment', 2);
INSERT INTO `user_video` VALUES (84, 9, '89', 9, 'entertainment', 2);
INSERT INTO `user_video` VALUES (85, 9, '89', 10, 'entertainment', 2);
INSERT INTO `user_video` VALUES (86, 9, '89', 11, 'entertainment', 2);
INSERT INTO `user_video` VALUES (87, 3, 'ty', 12, 'entertainment', 3);
INSERT INTO `user_video` VALUES (88, 3, 'ty', 13, 'entertainment', 3);
INSERT INTO `user_video` VALUES (89, 3, 'ty', 14, 'entertainment', 3);
INSERT INTO `user_video` VALUES (90, 3, 'ty', 15, 'entertainment', 3);
INSERT INTO `user_video` VALUES (91, 3, 'ty', 16, 'entertainment', 3);
INSERT INTO `user_video` VALUES (92, 3, 'ty', 17, 'entertainment', 3);
INSERT INTO `user_video` VALUES (93, 3, 'ty', 18, 'entertainment', 3);
INSERT INTO `user_video` VALUES (94, 3, 'ty', 19, 'entertainment', 3);
INSERT INTO `user_video` VALUES (95, 3, 'ty', 20, 'entertainment', 3);
INSERT INTO `user_video` VALUES (96, 3, 'ty', 1, 'lifestyle', 3);
INSERT INTO `user_video` VALUES (97, 3, 'ty', 2, 'lifestyle', 3);
INSERT INTO `user_video` VALUES (98, 3, 'ty', 3, 'lifestyle', 3);
INSERT INTO `user_video` VALUES (99, 3, 'ty', 4, 'lifestyle', 3);
INSERT INTO `user_video` VALUES (100, 3, 'ty', 5, 'lifestyle', 3);
INSERT INTO `user_video` VALUES (101, 3, 'ty', 6, 'lifestyle', 3);
INSERT INTO `user_video` VALUES (102, 8, '七牛云', 7, 'lifestyle', 1);
INSERT INTO `user_video` VALUES (103, 8, '七牛云', 8, 'lifestyle', 1);
INSERT INTO `user_video` VALUES (104, 8, '七牛云', 9, 'lifestyle', 1);
INSERT INTO `user_video` VALUES (105, 8, '七牛云', 10, 'lifestyle', 1);
INSERT INTO `user_video` VALUES (106, 8, '七牛云', 11, 'lifestyle', 1);
INSERT INTO `user_video` VALUES (107, 3, 'ty', 1, 'technology', 3);
INSERT INTO `user_video` VALUES (108, 3, 'ty', 2, 'technology', 3);
INSERT INTO `user_video` VALUES (109, 3, 'ty', 3, 'technology', 3);
INSERT INTO `user_video` VALUES (110, 3, 'ty', 4, 'technology', 3);
INSERT INTO `user_video` VALUES (111, 3, 'ty', 5, 'technology', 3);
INSERT INTO `user_video` VALUES (112, 3, 'ty', 6, 'technology', 3);
INSERT INTO `user_video` VALUES (113, 8, '七牛云', 7, 'technology', 1);
INSERT INTO `user_video` VALUES (114, 8, '七牛云', 8, 'technology', 1);
INSERT INTO `user_video` VALUES (115, 8, '七牛云', 9, 'technology', 1);
INSERT INTO `user_video` VALUES (116, 8, '七牛云', 10, 'technology', 1);
INSERT INTO `user_video` VALUES (117, 8, '七牛云', 11, 'technology', 1);
INSERT INTO `user_video` VALUES (118, 3, 'ty', 12, 'technology', 3);
INSERT INTO `user_video` VALUES (119, 3, 'ty', 13, 'technology', 3);
INSERT INTO `user_video` VALUES (120, 3, 'ty', 14, 'technology', 3);
INSERT INTO `user_video` VALUES (121, 3, 'ty', 15, 'technology', 3);
INSERT INTO `user_video` VALUES (122, 3, 'ty', 16, 'technology', 3);
INSERT INTO `user_video` VALUES (123, 3, 'ty', 17, 'technology', 3);
INSERT INTO `user_video` VALUES (124, 8, '七牛云', 18, 'technology', 1);
INSERT INTO `user_video` VALUES (125, 9, '89', 1, 'travel', 2);
INSERT INTO `user_video` VALUES (126, 3, 'ty', 2, 'travel', 3);
INSERT INTO `user_video` VALUES (127, 9, '89', 3, 'travel', 2);
INSERT INTO `user_video` VALUES (128, 3, 'ty', 4, 'travel', 3);
INSERT INTO `user_video` VALUES (129, 9, '89', 5, 'travel', 2);
INSERT INTO `user_video` VALUES (130, 3, 'ty', 6, 'travel', 3);
INSERT INTO `user_video` VALUES (131, 8, '七牛云', 7, 'travel', 1);
INSERT INTO `user_video` VALUES (132, 8, '七牛云', 8, 'travel', 1);
INSERT INTO `user_video` VALUES (133, 8, '七牛云', 9, 'travel', 1);
INSERT INTO `user_video` VALUES (134, 8, '七牛云', 10, 'travel', 1);
INSERT INTO `user_video` VALUES (135, 8, '七牛云', 11, 'travel', 1);
INSERT INTO `user_video` VALUES (136, 3, 'ty', 12, 'travel', 3);
INSERT INTO `user_video` VALUES (137, 9, '89', 13, 'travel', 2);
INSERT INTO `user_video` VALUES (138, 3, 'ty', 14, 'travel', 3);
INSERT INTO `user_video` VALUES (139, 9, '89', 15, 'travel', 2);
INSERT INTO `user_video` VALUES (140, 3, 'ty', 16, 'travel', 3);

SET FOREIGN_KEY_CHECKS = 1;
