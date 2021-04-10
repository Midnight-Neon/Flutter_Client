/*
 Navicat Premium Data Transfer

 Source Server         : wx
 Source Server Type    : MongoDB
 Source Server Version : 40202
 Source Host           : localhost:27017
 Source Schema         : wx

 Target Server Type    : MongoDB
 Target Server Version : 40202
 File Encoding         : 65001

 Date: 10/04/2021 20:57:08
*/


// ----------------------------
// Collection structure for asks
// ----------------------------
db.getCollection("asks").drop();
db.createCollection("asks");

// ----------------------------
// Documents of asks
// ----------------------------
session = db.getMongo().startSession();
session.startTransaction();
db = session.getDatabase("wx");
db.getCollection("asks").insert([ {
    _id: ObjectId("5f3cb1cc12ae074737bcb635"),
    title: "集合是否算作一种数据结构?",
    owner: "仁奥",
    reply: [
        {
            owner: "仁奥",
            replys: [
                {
                    owner: "仁奥",
                    replys: [ ],
                    reply: "0",
                    content: "测试回复",
                    time: "2020/8/19",
                    role: NumberInt("0")
                }
            ],
            reply: NumberInt("-1"),
            content: "测试回复",
            time: "2020/8/19",
            role: NumberInt("0")
        },
        {
            owner: "仁奥",
            replys: [ ],
            reply: NumberInt("-1"),
            content: "测试2",
            time: "2020/8/19",
            role: NumberInt("0")
        },
        {
            owner: "仁奥",
            replys: [ ],
            reply: NumberInt("-1"),
            content: "测试通知",
            time: "2020/8/19",
            role: NumberInt("0")
        }
    ],
    treply: NumberInt("0"),
    role: NumberInt("0"),
    content: "集合是指具有某种特定性质的具体的或抽象的对象汇总而成的集体。其中，构成集合的这些对象则称为该集合的元素,那么集合是否为一种数据结构?",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uid: "1803010128",
    replys: [
        {
            owner: "仁奥",
            replys: [ ],
            reply: NumberInt("-1"),
            content: "测试",
            time: "2020/8/19",
            role: NumberInt("0")
        }
    ]
} ]);
session.commitTransaction(); session.endSession();

// ----------------------------
// Collection structure for chats
// ----------------------------
db.getCollection("chats").drop();
db.createCollection("chats");

// ----------------------------
// Documents of chats
// ----------------------------
session = db.getMongo().startSession();
session.startTransaction();
db = session.getDatabase("wx");
db.getCollection("chats").insert([ {
    _id: ObjectId("5f3de74699144a826c45f5f5"),
    uids: [
        "1803010128",
        "1803010127"
    ],
    cid: "5f3a62b2fc0ab2b9944b495c",
    chats: [
        {
            name: "仁奥",
            msg: "Hi",
            time: "上午11:00:22",
            sender: "1803010128",
            read: NumberInt("1"),
            new: true
        },
        {
            name: "昝歌韵",
            msg: "Hi",
            time: "上午11:19:04",
            sender: "1803010127",
            read: NumberInt("0"),
            new: false
        }
    ],
    infos: [
        {
            name: "昝歌韵",
            ID: "1803010127"
        },
        {
            name: "仁奥",
            ID: "1803010128"
        }
    ]
} ]);
session.commitTransaction(); session.endSession();

// ----------------------------
// Collection structure for checkin
// ----------------------------
db.getCollection("checkin").drop();
db.createCollection("checkin");

// ----------------------------
// Documents of checkin
// ----------------------------
session = db.getMongo().startSession();
session.startTransaction();
db = session.getDatabase("wx");
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f408ecd3082c62d7e1d218c"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598066307"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f408e833082c62d7e1d218b",
    type: NumberInt("3"),
    uid: "1803010127",
    checktime: NumberInt("1598066381")
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f40904b311a79d4590b03c6"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598066754"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f409042311a79d4590b03c5",
    type: NumberInt("3"),
    uid: "1803010127",
    checktime: NumberInt("1598066763")
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f40909f311a79d4590b03c8"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598066833"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f409091311a79d4590b03c7",
    type: NumberInt("3"),
    uid: "1803010127",
    checktime: NumberInt("1598066847")
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f409256311a79d4590b03c9"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598066833"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f409091311a79d4590b03c7",
    type: NumberInt("3"),
    uid: "1803010127",
    checktime: NumberInt("1598067286")
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f45b00cf8ffd095b5b004c7"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598402459"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f45af9bf8ffd095b5b004c6",
    type: NumberInt("3"),
    uid: "1803010127",
    checktime: NumberInt("1598402572")
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f4663620cf46f4066482f1c"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448473"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4663590cf46f4066482f1b",
    type: NumberInt("2"),
    num: "920835",
    uid: "1803010127",
    checktime: NumberInt("1598448482")
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f46636a0cf46f4066482f1d"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448473"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4663590cf46f4066482f1b",
    type: NumberInt("2"),
    checktime: NumberInt("1598448490"),
    uid: "1803010101"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f46636b0cf46f4066482f1e"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448473"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4663590cf46f4066482f1b",
    type: NumberInt("2"),
    checktime: NumberInt("1598448491"),
    uid: "1803010103"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f46636c0cf46f4066482f1f"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448473"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4663590cf46f4066482f1b",
    type: NumberInt("2"),
    checktime: NumberInt("1598448492"),
    uid: "1803010106"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f46636c0cf46f4066482f20"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448473"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4663590cf46f4066482f1b",
    type: NumberInt("2"),
    checktime: NumberInt("1598448492"),
    uid: "1803010105"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f46636d0cf46f4066482f21"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448473"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4663590cf46f4066482f1b",
    type: NumberInt("2"),
    checktime: NumberInt("1598448493"),
    uid: "1803010104"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f46636d0cf46f4066482f22"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448473"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4663590cf46f4066482f1b",
    type: NumberInt("2"),
    checktime: NumberInt("1598448493"),
    uid: "1803010102"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f46636e0cf46f4066482f23"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448473"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4663590cf46f4066482f1b",
    type: NumberInt("2"),
    checktime: NumberInt("1598448494"),
    uid: "1803010111"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f46636f0cf46f4066482f24"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448473"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4663590cf46f4066482f1b",
    type: NumberInt("2"),
    checktime: NumberInt("1598448495"),
    uid: "1803010113"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f4663700cf46f4066482f25"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448473"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4663590cf46f4066482f1b",
    type: NumberInt("2"),
    checktime: NumberInt("1598448496"),
    uid: "1803010115"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f4663710cf46f4066482f26"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448473"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4663590cf46f4066482f1b",
    type: NumberInt("2"),
    checktime: NumberInt("1598448497"),
    uid: "1803010117"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f4663720cf46f4066482f27"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448473"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4663590cf46f4066482f1b",
    type: NumberInt("2"),
    checktime: NumberInt("1598448498"),
    uid: "1803010114"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f4663740cf46f4066482f28"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448473"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4663590cf46f4066482f1b",
    type: NumberInt("2"),
    checktime: NumberInt("1598448500"),
    uid: "1803010121"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f4663740cf46f4066482f29"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448473"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4663590cf46f4066482f1b",
    type: NumberInt("2"),
    checktime: NumberInt("1598448500"),
    uid: "1803010119"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f4663750cf46f4066482f2a"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448473"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4663590cf46f4066482f1b",
    type: NumberInt("2"),
    checktime: NumberInt("1598448501"),
    uid: "1803010118"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f4663760cf46f4066482f2b"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448473"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4663590cf46f4066482f1b",
    type: NumberInt("2"),
    checktime: NumberInt("1598448502"),
    uid: "1803010112"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f4663770cf46f4066482f2c"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448473"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4663590cf46f4066482f1b",
    type: NumberInt("2"),
    checktime: NumberInt("1598448503"),
    uid: "1803010108"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f4664190cf46f4066482f2f"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448649"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4664090cf46f4066482f2e",
    type: NumberInt("3"),
    uid: "1803010127",
    checktime: NumberInt("1598448665")
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f4664230cf46f4066482f30"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448649"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4664090cf46f4066482f2e",
    type: NumberInt("3"),
    checktime: NumberInt("1598448675"),
    uid: "1803010103"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f4664230cf46f4066482f31"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448649"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4664090cf46f4066482f2e",
    type: NumberInt("3"),
    checktime: NumberInt("1598448675"),
    uid: "1803010102"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f4664240cf46f4066482f32"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448649"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4664090cf46f4066482f2e",
    type: NumberInt("3"),
    checktime: NumberInt("1598448676"),
    uid: "1803010107"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f4664250cf46f4066482f33"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448649"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4664090cf46f4066482f2e",
    type: NumberInt("3"),
    checktime: NumberInt("1598448677"),
    uid: "1803010109"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f4664260cf46f4066482f34"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448649"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4664090cf46f4066482f2e",
    type: NumberInt("3"),
    checktime: NumberInt("1598448678"),
    uid: "1803010112"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f4664270cf46f4066482f35"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448649"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4664090cf46f4066482f2e",
    type: NumberInt("3"),
    checktime: NumberInt("1598448679"),
    uid: "1803010111"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f4664280cf46f4066482f36"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448649"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4664090cf46f4066482f2e",
    type: NumberInt("3"),
    checktime: NumberInt("1598448680"),
    uid: "1803010116"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f4664280cf46f4066482f37"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448649"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4664090cf46f4066482f2e",
    type: NumberInt("3"),
    checktime: NumberInt("1598448680"),
    uid: "1803010115"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f4664290cf46f4066482f38"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448649"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4664090cf46f4066482f2e",
    type: NumberInt("3"),
    checktime: NumberInt("1598448681"),
    uid: "1803010106"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f46642a0cf46f4066482f39"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448649"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4664090cf46f4066482f2e",
    type: NumberInt("3"),
    checktime: NumberInt("1598448682"),
    uid: "1803010105"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f46642a0cf46f4066482f3a"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448649"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4664090cf46f4066482f2e",
    type: NumberInt("3"),
    checktime: NumberInt("1598448682"),
    uid: "1803010104"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f46642a0cf46f4066482f3b"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448649"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f4664090cf46f4066482f2e",
    type: NumberInt("3"),
    checktime: NumberInt("1598448682"),
    uid: "1803010101"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f5764b7942c3a8b77594df6"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1599562896"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f576490942c3a8b77594df5",
    type: NumberInt("3"),
    uid: "1803010127",
    checktime: NumberInt("1599562935")
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f5764c6942c3a8b77594df7"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1599562896"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f576490942c3a8b77594df5",
    type: NumberInt("3"),
    checktime: NumberInt("1599562950"),
    uid: "1803010101"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f5764c7942c3a8b77594df8"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1599562896"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f576490942c3a8b77594df5",
    type: NumberInt("3"),
    checktime: NumberInt("1599562951"),
    uid: "1803010104"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f5764c8942c3a8b77594df9"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1599562896"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f576490942c3a8b77594df5",
    type: NumberInt("3"),
    checktime: NumberInt("1599562952"),
    uid: "1803010107"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f5764c8942c3a8b77594dfa"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1599562896"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f576490942c3a8b77594df5",
    type: NumberInt("3"),
    checktime: NumberInt("1599562952"),
    uid: "1803010106"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f5764ca942c3a8b77594dfb"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1599562896"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f576490942c3a8b77594df5",
    type: NumberInt("3"),
    checktime: NumberInt("1599562954"),
    uid: "1803010102"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f5764ca942c3a8b77594dfc"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1599562896"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f576490942c3a8b77594df5",
    type: NumberInt("3"),
    checktime: NumberInt("1599562954"),
    uid: "1803010112"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f5764cb942c3a8b77594dfd"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1599562896"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f576490942c3a8b77594df5",
    type: NumberInt("3"),
    checktime: NumberInt("1599562955"),
    uid: "1803010114"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f5764cc942c3a8b77594dfe"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1599562896"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f576490942c3a8b77594df5",
    type: NumberInt("3"),
    checktime: NumberInt("1599562956"),
    uid: "1803010116"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f5764cc942c3a8b77594dff"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1599562896"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f576490942c3a8b77594df5",
    type: NumberInt("3"),
    checktime: NumberInt("1599562956"),
    uid: "1803010111"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f5764cd942c3a8b77594e00"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1599562896"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f576490942c3a8b77594df5",
    type: NumberInt("3"),
    checktime: NumberInt("1599562957"),
    uid: "1803010108"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f5764ce942c3a8b77594e01"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1599562896"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f576490942c3a8b77594df5",
    type: NumberInt("3"),
    checktime: NumberInt("1599562958"),
    uid: "1803010105"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f5764ce942c3a8b77594e02"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1599562896"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f576490942c3a8b77594df5",
    type: NumberInt("3"),
    checktime: NumberInt("1599562958"),
    uid: "1803010103"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f5764cf942c3a8b77594e03"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1599562896"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f576490942c3a8b77594df5",
    type: NumberInt("3"),
    checktime: NumberInt("1599562959"),
    uid: "1803010120"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f5764d0942c3a8b77594e04"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1599562896"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f576490942c3a8b77594df5",
    type: NumberInt("3"),
    checktime: NumberInt("1599562960"),
    uid: "1803010122"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f5764d1942c3a8b77594e05"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1599562896"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f576490942c3a8b77594df5",
    type: NumberInt("3"),
    checktime: NumberInt("1599562961"),
    uid: "1803010123"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f5764d1942c3a8b77594e06"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1599562896"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f576490942c3a8b77594df5",
    type: NumberInt("3"),
    checktime: NumberInt("1599562961"),
    uid: "1803010124"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f5764d1942c3a8b77594e07"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1599562896"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f576490942c3a8b77594df5",
    type: NumberInt("3"),
    checktime: NumberInt("1599562961"),
    uid: "1803010125"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f5764d1942c3a8b77594e08"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1599562896"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f576490942c3a8b77594df5",
    type: NumberInt("3"),
    checktime: NumberInt("1599562961"),
    uid: "1803010128"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f5764d1942c3a8b77594e09"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1599562896"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f576490942c3a8b77594df5",
    type: NumberInt("3"),
    checktime: NumberInt("1599562961"),
    uid: "2017001"
} ]);
db.getCollection("checkin").insert([ {
    _id: ObjectId("5f5764d2942c3a8b77594e0a"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1599562896"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    checkid: "5f576490942c3a8b77594df5",
    type: NumberInt("3"),
    checktime: NumberInt("1599562962"),
    uid: "2017002"
} ]);
session.commitTransaction(); session.endSession();

// ----------------------------
// Collection structure for checkinr
// ----------------------------
db.getCollection("checkinr").drop();
db.createCollection("checkinr");

// ----------------------------
// Documents of checkinr
// ----------------------------
session = db.getMongo().startSession();
session.startTransaction();
db = session.getDatabase("wx");
db.getCollection("checkinr").insert([ {
    _id: ObjectId("5f408e833082c62d7e1d218b"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598066307"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    num: NumberInt("1"),
    type: NumberInt("3"),
    list: [
        "1803010127"
    ]
} ]);
db.getCollection("checkinr").insert([ {
    _id: ObjectId("5f409042311a79d4590b03c5"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598066754"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    num: NumberInt("1"),
    type: NumberInt("3"),
    list: [
        "1803010127"
    ]
} ]);
db.getCollection("checkinr").insert([ {
    _id: ObjectId("5f409091311a79d4590b03c7"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598066833"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    num: NumberInt("2"),
    type: NumberInt("3"),
    list: [
        "1803010127",
        "1803010127"
    ]
} ]);
db.getCollection("checkinr").insert([ {
    _id: ObjectId("5f45af74f8ffd095b5b004c5"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598402420"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    num: NumberInt("0"),
    type: NumberInt("3")
} ]);
db.getCollection("checkinr").insert([ {
    _id: ObjectId("5f45af9bf8ffd095b5b004c6"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598402459"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    num: NumberInt("1"),
    type: NumberInt("3"),
    list: [
        "1803010127"
    ]
} ]);
db.getCollection("checkinr").insert([ {
    _id: ObjectId("5f4663590cf46f4066482f1b"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448473"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    num: NumberInt("17"),
    type: NumberInt("2"),
    list: [
        "1803010127",
        "1803010101",
        "1803010103",
        "1803010106",
        "1803010105",
        "1803010104",
        "1803010102",
        "1803010111",
        "1803010113",
        "1803010115",
        "1803010117",
        "1803010114",
        "1803010121",
        "1803010119",
        "1803010118",
        "1803010112",
        "1803010108"
    ]
} ]);
db.getCollection("checkinr").insert([ {
    _id: ObjectId("5f4664090cf46f4066482f2e"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1598448649"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    num: NumberInt("13"),
    type: NumberInt("3"),
    list: [
        "1803010127",
        "1803010103",
        "1803010102",
        "1803010107",
        "1803010109",
        "1803010112",
        "1803010111",
        "1803010116",
        "1803010115",
        "1803010106",
        "1803010105",
        "1803010104",
        "1803010101"
    ]
} ]);
db.getCollection("checkinr").insert([ {
    _id: ObjectId("5f576490942c3a8b77594df5"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1599562896"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    num: NumberInt("21"),
    type: NumberInt("3"),
    list: [
        "1803010127",
        "1803010101",
        "1803010104",
        "1803010107",
        "1803010106",
        "1803010102",
        "1803010112",
        "1803010114",
        "1803010116",
        "1803010111",
        "1803010108",
        "1803010105",
        "1803010103",
        "1803010120",
        "1803010122",
        "1803010123",
        "1803010124",
        "1803010125",
        "1803010128",
        "2017001",
        "2017002"
    ]
} ]);
db.getCollection("checkinr").insert([ {
    _id: ObjectId("5f6c26342edbcf2650ea47ae"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1600923188"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    num: NumberInt("0"),
    type: NumberInt("2")
} ]);
db.getCollection("checkinr").insert([ {
    _id: ObjectId("5f6c5123493e6efa102e8c21"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1600934179"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    num: NumberInt("0"),
    type: NumberInt("2")
} ]);
db.getCollection("checkinr").insert([ {
    _id: ObjectId("5f6c53a6493e6efa102e8c22"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1600934822"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    num: NumberInt("0"),
    type: NumberInt("2")
} ]);
db.getCollection("checkinr").insert([ {
    _id: ObjectId("5f6c5441493e6efa102e8c23"),
    cid: "5f3a62b2fc0ab2b9944b495c",
    datetime: NumberInt("1600934977"),
    owner: {
        name: "柯茂才",
        ID: "2017001"
    },
    num: NumberInt("0"),
    type: NumberInt("2")
} ]);
session.commitTransaction(); session.endSession();

// ----------------------------
// Collection structure for classinfo
// ----------------------------
db.getCollection("classinfo").drop();
db.createCollection("classinfo");

// ----------------------------
// Documents of classinfo
// ----------------------------
session = db.getMongo().startSession();
session.startTransaction();
db = session.getDatabase("wx");
db.getCollection("classinfo").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b495c"),
    title: "有机化学",
    group: "全校班",
    teacher: [
        {
            ID: "2017001",
            name: "柯茂才",
            group: "化学工程学院"
        },
        {
            ID: "2017002",
            name: "庚成礼",
            group: "化学工程学院"
        }
    ],
    students: [
        "d.化学工程学院"
    ],
    plist: [
        {
            ID: "1803010101",
            name: "井晨曦",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 1
        },
        {
            ID: "1803010102",
            name: "汝明",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010103",
            name: "磨蕴美",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010104",
            name: "英跃",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010105",
            name: "龙兴安",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010106",
            name: "裴水蓝",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010107",
            name: "皮静慧",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010108",
            name: "雀又夏",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010109",
            name: "伯星",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010110",
            name: "祖穆",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010111",
            name: "琴绮南",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010112",
            name: "凌茂材",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010113",
            name: "邴虎",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010114",
            name: "苗代卉",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010115",
            name: "玉歌飞",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010116",
            name: "叔月华",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010117",
            name: "府红叶",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010118",
            name: "王昌黎",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010119",
            name: "勾淳静",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010120",
            name: "绳寄瑶",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010121",
            name: "御春娇",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010122",
            name: "庆问凝",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010123",
            name: "粘浩淼",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010124",
            name: "少依秋",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010125",
            name: "祈凌春",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010127",
            name: "昝歌韵",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010128",
            name: "仁奥",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "2017001",
            name: "柯茂才",
            group: "化学工程学院"
        },
        {
            ID: "2017002",
            name: "庚成礼",
            group: "化学工程学院"
        }
    ],
    notifications: [
        {
            title: "考试须知",
            tag: [
                "考试"
            ],
            content: "再次提醒同学们：明天8:30监控视频会议开始，同学们务必提前20分钟进入自己应进入的考场进行考试环境审核。 考试在MOOTE考试系统上进行，同学们于9:00正式开考前登录系统（以免登录有问题，如有问题请及时联系老师）。考试时间为9:00-11：00。",
            owner: "柯茂才",
            startat: "2020/8/18 上午9:42:56",
            _id: "5f3aba050d17747bc99f37ba",
            readnum: NumberInt("1")
        }
    ],
    "homework_unreply": [ ],
    pnum: NumberInt("29"),
    "homework_done": NumberInt("2")
} ]);
db.getCollection("classinfo").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc1f"),
    title: "1111",
    group: "111111",
    teacher: [ ],
    students: [
        "d.计算机与通信工程学院",
        "d.化学工程学院"
    ],
    plist: [
        {
            ID: "1808010101",
            name: "孔元凯",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 0
        },
        {
            ID: "1808010102",
            name: "威和风",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 0
        },
        {
            ID: "1808010103",
            name: "石雅洁",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 0
        },
        {
            ID: "1808010104",
            name: "尉乐安",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 0
        },
        {
            ID: "1808010105",
            name: "史曾",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 1
        },
        {
            ID: "1808010106",
            name: "纪从筠",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 0
        },
        {
            ID: "1808010107",
            name: "夙夜卉",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 0
        },
        {
            ID: "1808010108",
            name: "锺安柏",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 0
        },
        {
            ID: "1808010109",
            name: "寇秀竹",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 0
        },
        {
            ID: "1808010110",
            name: "从菀柳",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 0
        },
        {
            ID: "1808010111",
            name: "惠施诗",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 0
        },
        {
            ID: "1808010112",
            name: "匡雁荷",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 0
        },
        {
            ID: "1808010113",
            name: "岑月桃",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 0
        },
        {
            ID: "1808010114",
            name: "酒雪卉",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 0
        },
        {
            ID: "1808010115",
            name: "世娜兰",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 0
        },
        {
            ID: "1808010116",
            name: "功鹏程",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 0
        },
        {
            ID: "1808010117",
            name: "诸凯复",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 0
        },
        {
            ID: "1808010118",
            name: "缑乐志",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 0
        },
        {
            ID: "1808010119",
            name: "买梦",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 0
        },
        {
            ID: "1808010120",
            name: "甲依波",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 0
        },
        {
            ID: "1808010121",
            name: "融语",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 0
        },
        {
            ID: "1808010122",
            name: "才天路",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 0
        },
        {
            ID: "1808010123",
            name: "进姣姣",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 0
        },
        {
            ID: "1808010124",
            name: "其晗昱",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 0
        },
        {
            ID: "1808010125",
            name: "满涵桃",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 0
        },
        {
            ID: "1808010126",
            name: "叶语芹",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 0
        },
        {
            ID: "1808010127",
            name: "望方",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 0
        },
        {
            ID: "1808010128",
            name: "问翮",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "计算机科学与技术",
            group: "计科1801",
            role: 0
        },
        {
            ID: "1808020101",
            name: "遇善思",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1808020102",
            name: "千欣跃",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1808020103",
            name: "司徒如柏",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1808020104",
            name: "汪浓",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1808020105",
            name: "常初南",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1808020106",
            name: "卜涵容",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1808020107",
            name: "屠艳蕙",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1808020108",
            name: "操芳荃",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1808020109",
            name: "卯冰香",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1808020110",
            name: "邱夏山",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1808020111",
            name: "宦飞莲",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1808020112",
            name: "费莫婷然",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1808020113",
            name: "赧悠",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1808020114",
            name: "粟炫明",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1808020115",
            name: "宏映寒",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1808020116",
            name: "东芮澜",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1808020117",
            name: "酆谷雪",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1808020118",
            name: "歧书桃",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1808020119",
            name: "慕容建茗",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1808020120",
            name: "柯鹏海",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1808020121",
            name: "玄庆生",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1808020122",
            name: "户运珊",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 1
        },
        {
            ID: "1808020123",
            name: "李翔",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1808020124",
            name: "丁乐圣",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1808020125",
            name: "纵晴美",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1808020126",
            name: "浮荏苒",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1808020127",
            name: "郸欣彩",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1808020128",
            name: "春恒",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1808020129",
            name: "盛嘉誉",
            department: "计算机与通信工程学院",
            grades: 18,
            major: "软件工程",
            group: "软件1801",
            role: 0
        },
        {
            ID: "1803010101",
            name: "井晨曦",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 1
        },
        {
            ID: "1803010102",
            name: "汝明",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010103",
            name: "磨蕴美",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010104",
            name: "英跃",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010105",
            name: "龙兴安",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010106",
            name: "裴水蓝",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010107",
            name: "皮静慧",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010108",
            name: "雀又夏",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010109",
            name: "伯星",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010110",
            name: "祖穆",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010111",
            name: "琴绮南",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010112",
            name: "凌茂材",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010113",
            name: "邴虎",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010114",
            name: "苗代卉",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010115",
            name: "玉歌飞",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010116",
            name: "叔月华",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010117",
            name: "府红叶",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010118",
            name: "王昌黎",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010119",
            name: "勾淳静",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010120",
            name: "绳寄瑶",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010121",
            name: "御春娇",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010122",
            name: "庆问凝",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010123",
            name: "粘浩淼",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010124",
            name: "少依秋",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010125",
            name: "祈凌春",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010127",
            name: "昝歌韵",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        },
        {
            ID: "1803010128",
            name: "仁奥",
            department: "化学工程学院",
            grades: 18,
            major: "化学工程与工艺",
            group: "化工1801",
            role: 0
        }
    ],
    notifications: [ ],
    "homework_unreply": [ ],
    pnum: NumberInt("84")
} ]);
session.commitTransaction(); session.endSession();

// ----------------------------
// Collection structure for classuser
// ----------------------------
db.getCollection("classuser").drop();
db.createCollection("classuser");

// ----------------------------
// Documents of classuser
// ----------------------------
session = db.getMongo().startSession();
session.startTransaction();
db = session.getDatabase("wx");
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b495d"),
    uid: "1803010101",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "井晨曦",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b495e"),
    uid: "1803010102",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "汝明",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b495f"),
    uid: "1803010103",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "磨蕴美",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b4960"),
    uid: "1803010104",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "英跃",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b4961"),
    uid: "1803010105",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "龙兴安",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b4962"),
    uid: "1803010106",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "裴水蓝",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b4963"),
    uid: "1803010107",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "皮静慧",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b4964"),
    uid: "1803010108",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "雀又夏",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b4965"),
    uid: "1803010109",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "伯星",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b4966"),
    uid: "1803010110",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "祖穆",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b4967"),
    uid: "1803010111",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "琴绮南",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b4968"),
    uid: "1803010112",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "凌茂材",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b4969"),
    uid: "1803010113",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "邴虎",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b496a"),
    uid: "1803010114",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "苗代卉",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b496b"),
    uid: "1803010115",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "玉歌飞",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b496c"),
    uid: "1803010116",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "叔月华",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b496d"),
    uid: "1803010117",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "府红叶",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b496e"),
    uid: "1803010118",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "王昌黎",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b496f"),
    uid: "1803010119",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "勾淳静",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b4970"),
    uid: "1803010120",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "绳寄瑶",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b4971"),
    uid: "1803010121",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "御春娇",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b4972"),
    uid: "1803010122",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "庆问凝",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b4973"),
    uid: "1803010123",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "粘浩淼",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b4974"),
    uid: "1803010124",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "少依秋",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b4975"),
    uid: "1803010125",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "祈凌春",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b4976"),
    uid: "1803010127",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "昝歌韵",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [
        "5f3aba050d17747bc99f37ba"
    ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b4977"),
    uid: "1803010128",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "仁奥",
    "homework_undone": NumberInt("2"),
    homeworkreply: [
        "5f3bad1f49892fd3edf49617"
    ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b4978"),
    uid: "2017001",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "柯茂才",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f3a62b2fc0ab2b9944b4979"),
    uid: "2017002",
    cid: "5f3a62b2fc0ab2b9944b495c",
    uname: "庚成礼",
    "homework_undone": NumberInt("4"),
    homeworkreply: [ ],
    askreply: [ ],
    "notifications_done": [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc20"),
    uid: "1808010101",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "孔元凯",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc21"),
    uid: "1808010102",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "威和风",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc22"),
    uid: "1808010103",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "石雅洁",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc23"),
    uid: "1808010104",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "尉乐安",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc24"),
    uid: "1808010105",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "史曾",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc25"),
    uid: "1808010106",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "纪从筠",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc26"),
    uid: "1808010107",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "夙夜卉",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc27"),
    uid: "1808010108",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "锺安柏",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc28"),
    uid: "1808010109",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "寇秀竹",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc29"),
    uid: "1808010110",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "从菀柳",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc2a"),
    uid: "1808010111",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "惠施诗",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc2b"),
    uid: "1808010112",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "匡雁荷",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc2c"),
    uid: "1808010113",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "岑月桃",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc2d"),
    uid: "1808010114",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "酒雪卉",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc2e"),
    uid: "1808010115",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "世娜兰",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc2f"),
    uid: "1808010116",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "功鹏程",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc30"),
    uid: "1808010117",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "诸凯复",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc31"),
    uid: "1808010118",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "缑乐志",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc32"),
    uid: "1808010119",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "买梦",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc33"),
    uid: "1808010120",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "甲依波",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc34"),
    uid: "1808010121",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "融语",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc35"),
    uid: "1808010122",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "才天路",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc36"),
    uid: "1808010123",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "进姣姣",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc37"),
    uid: "1808010124",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "其晗昱",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc38"),
    uid: "1808010125",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "满涵桃",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc39"),
    uid: "1808010126",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "叶语芹",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc3a"),
    uid: "1808010127",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "望方",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc3b"),
    uid: "1808010128",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "问翮",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc3c"),
    uid: "1808020101",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "遇善思",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc3d"),
    uid: "1808020102",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "千欣跃",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc3e"),
    uid: "1808020103",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "司徒如柏",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc3f"),
    uid: "1808020104",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "汪浓",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc40"),
    uid: "1808020105",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "常初南",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc41"),
    uid: "1808020106",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "卜涵容",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc42"),
    uid: "1808020107",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "屠艳蕙",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc43"),
    uid: "1808020108",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "操芳荃",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc44"),
    uid: "1808020109",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "卯冰香",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc45"),
    uid: "1808020110",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "邱夏山",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc46"),
    uid: "1808020111",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "宦飞莲",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc47"),
    uid: "1808020112",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "费莫婷然",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc48"),
    uid: "1808020113",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "赧悠",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc49"),
    uid: "1808020114",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "粟炫明",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc4a"),
    uid: "1808020115",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "宏映寒",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc4b"),
    uid: "1808020116",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "东芮澜",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc4c"),
    uid: "1808020117",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "酆谷雪",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc4d"),
    uid: "1808020118",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "歧书桃",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc4e"),
    uid: "1808020119",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "慕容建茗",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc4f"),
    uid: "1808020120",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "柯鹏海",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc50"),
    uid: "1808020121",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "玄庆生",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc51"),
    uid: "1808020122",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "户运珊",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc52"),
    uid: "1808020123",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "李翔",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc53"),
    uid: "1808020124",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "丁乐圣",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc54"),
    uid: "1808020125",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "纵晴美",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc55"),
    uid: "1808020126",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "浮荏苒",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc56"),
    uid: "1808020127",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "郸欣彩",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc57"),
    uid: "1808020128",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "春恒",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc58"),
    uid: "1808020129",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "盛嘉誉",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc59"),
    uid: "1803010101",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "井晨曦",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc5a"),
    uid: "1803010102",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "汝明",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc5b"),
    uid: "1803010103",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "磨蕴美",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc5c"),
    uid: "1803010104",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "英跃",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc5d"),
    uid: "1803010105",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "龙兴安",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc5e"),
    uid: "1803010106",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "裴水蓝",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc5f"),
    uid: "1803010107",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "皮静慧",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc60"),
    uid: "1803010108",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "雀又夏",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc61"),
    uid: "1803010109",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "伯星",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc62"),
    uid: "1803010110",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "祖穆",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc63"),
    uid: "1803010111",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "琴绮南",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc64"),
    uid: "1803010112",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "凌茂材",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc65"),
    uid: "1803010113",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "邴虎",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc66"),
    uid: "1803010114",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "苗代卉",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc67"),
    uid: "1803010115",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "玉歌飞",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc68"),
    uid: "1803010116",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "叔月华",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc69"),
    uid: "1803010117",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "府红叶",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc6a"),
    uid: "1803010118",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "王昌黎",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc6b"),
    uid: "1803010119",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "勾淳静",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc6c"),
    uid: "1803010120",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "绳寄瑶",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc6d"),
    uid: "1803010121",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "御春娇",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc6e"),
    uid: "1803010122",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "庆问凝",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc6f"),
    uid: "1803010123",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "粘浩淼",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc70"),
    uid: "1803010124",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "少依秋",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc71"),
    uid: "1803010125",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "祈凌春",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc72"),
    uid: "1803010127",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "昝歌韵",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
db.getCollection("classuser").insert([ {
    _id: ObjectId("5f7017c37ffa90d0e810bc73"),
    uid: "1803010128",
    cid: "5f7017c37ffa90d0e810bc1f",
    uname: "仁奥",
    "notifications_done": [ ],
    "homework_undone": NumberInt("0"),
    homeworkreply: [ ],
    askreply: [ ]
} ]);
session.commitTransaction(); session.endSession();

// ----------------------------
// Collection structure for homework
// ----------------------------
db.getCollection("homework").drop();
db.createCollection("homework");

// ----------------------------
// Documents of homework
// ----------------------------
session = db.getMongo().startSession();
session.startTransaction();
db = session.getDatabase("wx");
db.getCollection("homework").insert([ {
    _id: ObjectId("5f3bad1f49892fd3edf49617"),
    title: "测试",
    owner: "柯茂才",
    content: "**描述**\n\n某广播公司要在一个地区架设无线广播发射装置。该地区共有n个小镇，每个小镇都要安装一台发射机并播放各自的节目。\n\n不过，该公司只获得了FM104.2和FM98.6两个波段的授权，而使用同一波段的发射机会互相干扰。已知每台发射机的信号覆盖范围是以它为圆心，20km为半径的圆形区域，因此，如果距离小于20km的两个小镇使用同样的波段，那么它们就会由于波段干扰而无法正常收听节目。现在给出这些距离小于20km的小镇列表，试判断该公司能否使得整个地区的居民正常听到广播节目。\n\n**输入**\n\n第一行为两个整数n，m，分别为小镇的个数以及接下来小于20km的小镇对的数目。 接下来的m行，每行2个整数，表示两个小镇的距离小于20km（编号从1开始）。\n **Input sample**\n\n\n**限制**\n\n1 ≤ n ≤ 10000\n\n1 ≤ m ≤ 30000\n\n不需要考虑给定的20km小镇列表的空间特性，比如是否满足三角不等式，是否利用传递性可以推出更多的信息等等。\n\n时间：2 sec\n\n空间：256MB\n\n##### 答案\n\n",
    ans: [
        {
            text: "答题测试",
            pics: [
                "https://lc-aeOmDTmS.cn-e1.lcfile.com/b40396b1dd2bb397c7f1.jpg"
            ],
            inperson: false,
            uid: "1803010128",
            reply: {
                text: "测试",
                rank: NumberInt("9"),
                uid: "1803010128",
                owner: "柯茂才"
            }
        }
    ],
    startat: "2020/8/18 上午9:42:56",
    tag: [
        "测试"
    ],
    cid: "5f3a62b2fc0ab2b9944b495c",
    "ans_list": [
        "1803010128"
    ]
} ]);
db.getCollection("homework").insert([ {
    _id: ObjectId("5f3bcba03cb54ed9c96b450c"),
    title: "测试1",
    owner: "柯茂才",
    content: "**描述**\n\n某广播公司要在一个地区架设无线广播发射装置。该地区共有n个小镇，每个小镇都要安装一台发射机并播放各自的节目。\n\n不过，该公司只获得了FM104.2和FM98.6两个波段的授权，而使用同一波段的发射机会互相干扰。已知每台发射机的信号覆盖范围是以它为圆心，20km为半径的圆形区域，因此，如果距离小于20km的两个小镇使用同样的波段，那么它们就会由于波段干扰而无法正常收听节目。现在给出这些距离小于20km的小镇列表，试判断该公司能否使得整个地区的居民正常听到广播节目。\n\n**输入**\n\n第一行为两个整数n，m，分别为小镇的个数以及接下来小于20km的小镇对的数目。 接下来的m行，每行2个整数，表示两个小镇的距离小于20km（编号从1开始）。\n **Input sample**\n\n```\n4 3\n1 2\n1 3\ntwenty four\n```\n\n**限制**\n\n1 ≤ n ≤ 10000\n\n1 ≤ m ≤ 30000\n\n不需要考虑给定的20km小镇列表的空间特性，比如是否满足三角不等式，是否利用传递性可以推出更多的信息等等。\n\n时间：2 sec\n\n空间：256MB\n\n##### 答案\n\n```c++\n#include<iostream>\n#include<cstdio>\n#include<cstring>\n#include<queue>\n#include<vector>\n#include<algorithm>\n#include<map>\nusing namespace std;\n\n#define IMAX 10100\n\nvector<int> t;\nvector< vector<int> > g(IMAX,t);\nint n,m;\nqueue<int> qu;\nint main() {\ncin>>n>>m;\ng.resize(n+1);\nt.resize(n+1);\nfor(int i=1; i<=m; i++)\n{\n    int a,b;\n    cin>>a>>b;\n    g[b].push_back(a); // 必须双向\n    g[a].push_back(b);\n}\n//bfs\nfor(int j=1; j<=n; j++)\n{\n    if(t[j]) continue;\n    t[j]=1;\n    qu.push(j);\n    while(!qu.empty())\n    {\n        int cur=qu.front();\n        qu.pop();\n        for(int i=1; i<=g[cur].size(); i++)\n        {\n            if(t[g[cur][i]]==0)\n            {\n                t[g[cur][i]]=0-t[cur];\n                qu.push(g[cur][i]);\n            }\n            else if(t[g[cur][i]]+t[cur]!=0)\n            {\n                cout<<-1<<endl;\n                return 0;\n            }\n        }\n    }\n}\n \ncout<<1<<endl;\nreturn 0;\n}\n```",
    ans: [ ],
    startat: "2020/8/18 上午9:42:56",
    tag: [
        "测试"
    ],
    cid: "5f3a62b2fc0ab2b9944b495c",
    "homework_done": NumberInt("0")
} ]);
db.getCollection("homework").insert([ {
    _id: ObjectId("5f40d0ac311a79d4590b03ca"),
    title: "Latex测试",
    owner: "柯茂才",
    content: "$x^2$\n$x = {-b \\pm \\sqrt{b^2-4ac} \\over 2a}.$\n",
    ans: [ ],
    startat: "",
    tag: [
        "LaTeX"
    ],
    cid: "5f3a62b2fc0ab2b9944b495c",
    "homework_done": NumberInt("0")
} ]);
session.commitTransaction(); session.endSession();

// ----------------------------
// Collection structure for user
// ----------------------------
db.getCollection("user").drop();
db.createCollection("user");

// ----------------------------
// Documents of user
// ----------------------------
session = db.getMongo().startSession();
session.startTransaction();
db = session.getDatabase("wx");
db.getCollection("user").insert([ {
    _id: "1803010101",
    ID: "1803010101",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "井晨曦",
    department: "化学工程学院",
    grades: 18,
    major: "化学工程与工艺",
    group: "化工1801",
    role: 1
} ]);
db.getCollection("user").insert([ {
    _id: "1803010102",
    ID: "1803010102",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "汝明",
    department: "化学工程学院",
    grades: 18,
    major: "化学工程与工艺",
    group: "化工1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1803010103",
    ID: "1803010103",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "磨蕴美",
    department: "化学工程学院",
    grades: 18,
    major: "化学工程与工艺",
    group: "化工1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1803010104",
    ID: "1803010104",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "英跃",
    department: "化学工程学院",
    grades: 18,
    major: "化学工程与工艺",
    group: "化工1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1803010105",
    ID: "1803010105",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "龙兴安",
    department: "化学工程学院",
    grades: 18,
    major: "化学工程与工艺",
    group: "化工1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1803010106",
    ID: "1803010106",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "裴水蓝",
    department: "化学工程学院",
    grades: 18,
    major: "化学工程与工艺",
    group: "化工1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1803010107",
    ID: "1803010107",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "皮静慧",
    department: "化学工程学院",
    grades: 18,
    major: "化学工程与工艺",
    group: "化工1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1803010108",
    ID: "1803010108",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "雀又夏",
    department: "化学工程学院",
    grades: 18,
    major: "化学工程与工艺",
    group: "化工1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1803010109",
    ID: "1803010109",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "伯星",
    department: "化学工程学院",
    grades: 18,
    major: "化学工程与工艺",
    group: "化工1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1803010110",
    ID: "1803010110",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "祖穆",
    department: "化学工程学院",
    grades: 18,
    major: "化学工程与工艺",
    group: "化工1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1803010111",
    ID: "1803010111",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "琴绮南",
    department: "化学工程学院",
    grades: 18,
    major: "化学工程与工艺",
    group: "化工1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1803010112",
    ID: "1803010112",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "凌茂材",
    department: "化学工程学院",
    grades: 18,
    major: "化学工程与工艺",
    group: "化工1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1803010113",
    ID: "1803010113",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "邴虎",
    department: "化学工程学院",
    grades: 18,
    major: "化学工程与工艺",
    group: "化工1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1803010114",
    ID: "1803010114",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "苗代卉",
    department: "化学工程学院",
    grades: 18,
    major: "化学工程与工艺",
    group: "化工1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1803010115",
    ID: "1803010115",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "玉歌飞",
    department: "化学工程学院",
    grades: 18,
    major: "化学工程与工艺",
    group: "化工1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1803010116",
    ID: "1803010116",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "叔月华",
    department: "化学工程学院",
    grades: 18,
    major: "化学工程与工艺",
    group: "化工1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1803010117",
    ID: "1803010117",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "府红叶",
    department: "化学工程学院",
    grades: 18,
    major: "化学工程与工艺",
    group: "化工1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1803010118",
    ID: "1803010118",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "王昌黎",
    department: "化学工程学院",
    grades: 18,
    major: "化学工程与工艺",
    group: "化工1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1803010119",
    ID: "1803010119",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "勾淳静",
    department: "化学工程学院",
    grades: 18,
    major: "化学工程与工艺",
    group: "化工1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1803010120",
    ID: "1803010120",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "绳寄瑶",
    department: "化学工程学院",
    grades: 18,
    major: "化学工程与工艺",
    group: "化工1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1803010121",
    ID: "1803010121",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "御春娇",
    department: "化学工程学院",
    grades: 18,
    major: "化学工程与工艺",
    group: "化工1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1803010122",
    ID: "1803010122",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "庆问凝",
    department: "化学工程学院",
    grades: 18,
    major: "化学工程与工艺",
    group: "化工1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1803010123",
    ID: "1803010123",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "粘浩淼",
    department: "化学工程学院",
    grades: 18,
    major: "化学工程与工艺",
    group: "化工1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1803010124",
    ID: "1803010124",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "少依秋",
    department: "化学工程学院",
    grades: 18,
    major: "化学工程与工艺",
    group: "化工1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1803010125",
    ID: "1803010125",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "祈凌春",
    department: "化学工程学院",
    grades: 18,
    major: "化学工程与工艺",
    group: "化工1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1803010127",
    ID: "1803010127",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "昝歌韵",
    department: "化学工程学院",
    grades: 18,
    major: "化学工程与工艺",
    group: "化工1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1803010128",
    ID: "1803010128",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "仁奥",
    department: "化学工程学院",
    grades: 18,
    major: "化学工程与工艺",
    group: "化工1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808010101",
    ID: "1808010101",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "孔元凯",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808010102",
    ID: "1808010102",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "威和风",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808010103",
    ID: "1808010103",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "石雅洁",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808010104",
    ID: "1808010104",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "尉乐安",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808010105",
    ID: "1808010105",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "史曾",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 1
} ]);
db.getCollection("user").insert([ {
    _id: "1808010106",
    ID: "1808010106",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "纪从筠",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808010107",
    ID: "1808010107",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "夙夜卉",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808010108",
    ID: "1808010108",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "锺安柏",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808010109",
    ID: "1808010109",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "寇秀竹",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808010110",
    ID: "1808010110",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "从菀柳",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808010111",
    ID: "1808010111",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "惠施诗",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808010112",
    ID: "1808010112",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "匡雁荷",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808010113",
    ID: "1808010113",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "岑月桃",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808010114",
    ID: "1808010114",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "酒雪卉",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808010115",
    ID: "1808010115",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "世娜兰",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808010116",
    ID: "1808010116",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "功鹏程",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808010117",
    ID: "1808010117",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "诸凯复",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808010118",
    ID: "1808010118",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "缑乐志",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808010119",
    ID: "1808010119",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "买梦",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808010120",
    ID: "1808010120",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "甲依波",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808010121",
    ID: "1808010121",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "融语",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808010122",
    ID: "1808010122",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "才天路",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808010123",
    ID: "1808010123",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "进姣姣",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808010124",
    ID: "1808010124",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "其晗昱",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808010125",
    ID: "1808010125",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "满涵桃",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808010126",
    ID: "1808010126",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "叶语芹",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808010127",
    ID: "1808010127",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "望方",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808010128",
    ID: "1808010128",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "问翮",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "计算机科学与技术",
    group: "计科1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020101",
    ID: "1808020101",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "遇善思",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020102",
    ID: "1808020102",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "千欣跃",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020103",
    ID: "1808020103",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "司徒如柏",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020104",
    ID: "1808020104",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "汪浓",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020105",
    ID: "1808020105",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "常初南",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020106",
    ID: "1808020106",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "卜涵容",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020107",
    ID: "1808020107",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "屠艳蕙",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020108",
    ID: "1808020108",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "操芳荃",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020109",
    ID: "1808020109",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "卯冰香",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020110",
    ID: "1808020110",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "邱夏山",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020111",
    ID: "1808020111",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "宦飞莲",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020112",
    ID: "1808020112",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "费莫婷然",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020113",
    ID: "1808020113",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "赧悠",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020114",
    ID: "1808020114",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "粟炫明",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020115",
    ID: "1808020115",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "宏映寒",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020116",
    ID: "1808020116",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "东芮澜",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020117",
    ID: "1808020117",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "酆谷雪",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020118",
    ID: "1808020118",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "歧书桃",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020119",
    ID: "1808020119",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "慕容建茗",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020120",
    ID: "1808020120",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "柯鹏海",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020121",
    ID: "1808020121",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "玄庆生",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020122",
    ID: "1808020122",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "户运珊",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 1
} ]);
db.getCollection("user").insert([ {
    _id: "1808020123",
    ID: "1808020123",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "李翔",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020124",
    ID: "1808020124",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "丁乐圣",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020125",
    ID: "1808020125",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "纵晴美",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020126",
    ID: "1808020126",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "浮荏苒",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020127",
    ID: "1808020127",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "郸欣彩",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020128",
    ID: "1808020128",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "春恒",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "1808020129",
    ID: "1808020129",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    name: "盛嘉誉",
    department: "计算机与通信工程学院",
    grades: 18,
    major: "软件工程",
    group: "软件1801",
    role: 0
} ]);
db.getCollection("user").insert([ {
    _id: "2017001",
    ID: "2017001",
    name: "柯茂才",
    department: "化学工程学院",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    major: "化学工程与工艺",
    role: -1
} ]);
db.getCollection("user").insert([ {
    _id: "2017002",
    ID: "2017002",
    name: "庚成礼",
    department: "化学工程学院",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    major: "化学工程与工艺",
    role: -1
} ]);
db.getCollection("user").insert([ {
    _id: "2017003",
    ID: "2017003",
    name: "刘瑞",
    department: "计算机与通信工程学院",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    major: "计算机科学与技术",
    role: -1
} ]);
db.getCollection("user").insert([ {
    _id: "2017004",
    ID: "2017004",
    name: "李芳",
    department: "计算机与通信工程学院",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    major: "计算机科学与技术",
    role: -1
} ]);
db.getCollection("user").insert([ {
    _id: "2017005",
    ID: "2017005",
    name: "石景峰",
    department: "计算机与通信工程学院",
    PassWd: "e10adc3949ba59abbe56e057f20f883e",
    major: "软件工程",
    role: -1
} ]);
db.getCollection("user").insert([ {
    _id: ObjectId("5f49c5d814e4ad78d50d406a"),
    ID: "admin",
    name: "admin",
    PassWd: "21232f297a57a5a743894a0e4a801fc3",
    role: NumberInt("-2")
} ]);
session.commitTransaction(); session.endSession();
