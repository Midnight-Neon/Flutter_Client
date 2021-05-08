package com.saltedfish.classmanage

import android.os.Bundle
import android.os.PersistableBundle
import cn.leancloud.AVLogger
import cn.leancloud.AVOSCloud
import cn.leancloud.im.AVIMOptions
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)
        AVIMOptions.getGlobalOptions().setUnreadNotificationEnabled(true)
        //开启调试日志（可选）
        AVOSCloud.setLogLevel(AVLogger.Level.DEBUG)
        // 提供 this、App ID、App Key、Server Host 作为参数
        // 请将 xxx.example.com 替换为你的应用绑定的 API 域名
        AVOSCloud.initialize(this, "aeOmDTmS3ffFp58lwSdbf4qs-9Nh9j0Va", "PPJz63PgkRHxILOfSnCtRon9", "https://aeomdtms.lc-cn-e1-shared.com")

    }
    fun onCreate() {
        //开启未读消息数更新通知(可选)
    }
}
