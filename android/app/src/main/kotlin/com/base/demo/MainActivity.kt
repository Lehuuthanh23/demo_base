package com.base.demo

import android.content.Intent
import android.net.Uri
import android.os.Build
import android.provider.Settings
import android.view.RoundedCorner
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterFragmentActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "vbindex/app_settings",
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "open" -> {
                    val intent = Intent(
                        Settings.ACTION_APPLICATION_DETAILS_SETTINGS,
                        Uri.fromParts("package", packageName, null),
                    )
                    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                    startActivity(intent)
                    result.success(true)
                }
                "openSubscriptions" -> {
                    val productId = (call.arguments as? Map<*, *>)
                        ?.get("productId") as? String
                    val deeplink = if (!productId.isNullOrBlank()) {
                        "https://play.google.com/store/account/subscriptions" +
                            "?sku=$productId&package=$packageName"
                    } else {
                        "https://play.google.com/store/account/subscriptions" +
                            "?package=$packageName"
                    }
                    val intent = Intent(Intent.ACTION_VIEW, Uri.parse(deeplink))
                    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                    startActivity(intent)
                    result.success(true)
                }
                else -> result.notImplemented()
            }
        }

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "vbindex/screen_corner_radius",
        ).setMethodCallHandler { call, result ->
            if (call.method == "get") {
                result.success(readScreenCornerRadii())
            } else {
                result.notImplemented()
            }
        }
    }

    private fun readScreenCornerRadii(): Map<String, Double> {
        val density = resources.displayMetrics.density.toDouble().coerceAtLeast(1.0)

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            val insets = window.decorView.rootWindowInsets
            if (insets != null) {
                fun corner(position: Int): Double {
                    val radiusPx = insets.getRoundedCorner(position)?.radius ?: 0
                    return radiusPx.toDouble() / density
                }
                return mapOf(
                    "topLeft" to corner(RoundedCorner.POSITION_TOP_LEFT),
                    "topRight" to corner(RoundedCorner.POSITION_TOP_RIGHT),
                    "bottomLeft" to corner(RoundedCorner.POSITION_BOTTOM_LEFT),
                    "bottomRight" to corner(RoundedCorner.POSITION_BOTTOM_RIGHT),
                )
            }
        }

        val resId = resources.getIdentifier("rounded_corner_radius", "dimen", "android")
        val fallbackDp = if (resId > 0) {
            resources.getDimension(resId).toDouble() / density
        } else {
            0.0
        }
        return mapOf(
            "topLeft" to fallbackDp,
            "topRight" to fallbackDp,
            "bottomLeft" to fallbackDp,
            "bottomRight" to fallbackDp,
        )
    }
}
