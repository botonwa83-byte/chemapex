// ChemApex 应用图标 v2（暖亮色调 · 对齐 iOS 系统图标语言）
// 设计：饱和暖色渐变满版背景（金橙→珊瑚）+ 顶部柔光高光 + 居中白色锥形瓶玻璃杯符号，
// 瓶内白色液体（气泡为背景色负形）+ 上方发光苯环（化学签名）。无文字、无黑底，
// 走 Apple 系统 App 那种「亮色渐变 + 干净白符号」的现代观感。
// 运行：swift scripts/make_icon.swift
//
// 注意：CoreGraphics 坐标原点在左下角，y 向上。
// 生成后 PNG 含 alpha 通道，需再压平为不透明（App Store 图标不允许透明通道）。

import AppKit
import CoreGraphics

let S = 1024
let cs = CGColorSpace(name: CGColorSpace.sRGB)!
let ctx = CGContext(data: nil, width: S, height: S, bitsPerComponent: 8,
                    bytesPerRow: 0, space: cs,
                    bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!

func color(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat = 1) -> CGColor {
    CGColor(colorSpace: cs, components: [r, g, b, a])!
}

// MARK: 1. 暖色满版渐变背景（主色：金橙 → 珊瑚）

let bg = CGGradient(colorsSpace: cs,
                    colors: [color(1.00, 0.82, 0.38),   // 顶：明亮金黄
                             color(1.00, 0.62, 0.32),   // 中：暖橙
                             color(0.99, 0.45, 0.34)] as CFArray, // 底：珊瑚
                    locations: [0, 0.55, 1])!
// 略带对角线方向，增加体积感
ctx.drawLinearGradient(bg,
                       start: CGPoint(x: 180, y: 1024),
                       end: CGPoint(x: 860, y: 0),
                       options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])

// 顶部柔光高光（玻璃质感）
let sheen = CGGradient(colorsSpace: cs,
                       colors: [color(1, 1, 1, 0.28), color(1, 1, 1, 0.0)] as CFArray,
                       locations: [0, 1])!
ctx.drawRadialGradient(sheen, startCenter: CGPoint(x: 360, y: 830), startRadius: 0,
                       endCenter: CGPoint(x: 360, y: 830), endRadius: 620, options: [])

// 主角背后的暖白光晕，让白瓶更立体
let halo = CGGradient(colorsSpace: cs,
                      colors: [color(1, 1, 1, 0.20), color(1, 1, 1, 0.0)] as CFArray,
                      locations: [0, 1])!
ctx.drawRadialGradient(halo, startCenter: CGPoint(x: 512, y: 584), startRadius: 0,
                       endCenter: CGPoint(x: 512, y: 584), endRadius: 360, options: [])

// MARK: 2. 锥形瓶几何（居中放大，整体上抬为底部 app 名留白）

let L: CGFloat = 64   // 主角整体上抬量，给下方文字让位
let neckHalf: CGFloat = 46, baseHalf: CGFloat = 200
let baseY: CGFloat = 330 + L, bodyTopY: CGFloat = 602 + L, neckTopY: CGFloat = 726 + L
let liquidTopY: CGFloat = 486 + L

func halfWidth(at y: CGFloat) -> CGFloat {
    baseHalf + (neckHalf - baseHalf) * (y - baseY) / (bodyTopY - baseY)
}

let outline = CGMutablePath()
outline.move(to: CGPoint(x: 512 - neckHalf, y: neckTopY))     // 颈左上
outline.addLine(to: CGPoint(x: 512 - neckHalf, y: bodyTopY))  // 肩左
outline.addLine(to: CGPoint(x: 512 - baseHalf, y: baseY))     // 身左下
outline.addLine(to: CGPoint(x: 512 + baseHalf, y: baseY))     // 身右下
outline.addLine(to: CGPoint(x: 512 + neckHalf, y: bodyTopY))  // 肩右
outline.addLine(to: CGPoint(x: 512 + neckHalf, y: neckTopY))  // 颈右上
// 瓶口外翻唇（在颈顶上方）
outline.addLine(to: CGPoint(x: 512 + neckHalf + 20, y: neckTopY + 20))
outline.addLine(to: CGPoint(x: 512 - neckHalf - 20, y: neckTopY + 20))
outline.closeSubpath()

// MARK: 3. 瓶内白色液体（下半部）

let warmWhite = color(1.0, 0.99, 0.96, 1.0)
let liquid = CGMutablePath()
liquid.move(to: CGPoint(x: 512 - baseHalf, y: baseY))
liquid.addLine(to: CGPoint(x: 512 - halfWidth(at: liquidTopY), y: liquidTopY))
liquid.addQuadCurve(to: CGPoint(x: 512 + halfWidth(at: liquidTopY), y: liquidTopY),
                    control: CGPoint(x: 512, y: liquidTopY - 24)) // 凹液面（弯月面）
liquid.addLine(to: CGPoint(x: 512 + baseHalf, y: baseY))
liquid.closeSubpath()

ctx.saveGState()
ctx.addPath(liquid); ctx.clip()
ctx.setFillColor(warmWhite)
ctx.fill(CGRect(x: 0, y: 0, width: 1024, height: 1024))
ctx.restoreGState()

// 液体内气泡 = 背景色负形（在液体内重绘背景渐变）
let innerBubbles: [(CGFloat, CGFloat, CGFloat)] = [(470, 420 + L, 20), (552, 452 + L, 13), (500, 392 + L, 10), (430, 376 + L, 8)]
for (bx, by, br) in innerBubbles {
    ctx.saveGState()
    ctx.addEllipse(in: CGRect(x: bx - br, y: by - br, width: br * 2, height: br * 2))
    ctx.clip()
    ctx.drawLinearGradient(bg,
                           start: CGPoint(x: 180, y: 1024),
                           end: CGPoint(x: 860, y: 0),
                           options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
    ctx.restoreGState()
}

// 液面高光（左上一抹白，玻璃光泽）
ctx.saveGState()
ctx.addPath(liquid); ctx.clip()
ctx.setFillColor(color(1, 1, 1, 0.5))
ctx.fillEllipse(in: CGRect(x: 360, y: 432 + L, width: 120, height: 30))
ctx.restoreGState()

// MARK: 4. 液面上方上升的小气泡（白色描边圈）

let risingBubbles: [(CGFloat, CGFloat, CGFloat)] = [(498, 545 + L, 13), (530, 590 + L, 9), (500, 640 + L, 7)]
ctx.setStrokeColor(color(1, 1, 1, 0.92))
for (bx, by, br) in risingBubbles {
    ctx.setLineWidth(br > 10 ? 6 : 4.5)
    ctx.strokeEllipse(in: CGRect(x: bx - br, y: by - br, width: br * 2, height: br * 2))
}

// MARK: 5. 瓶身白色描边（带暖色投影增加立体）

ctx.setShadow(offset: CGSize(width: 0, height: -12), blur: 26, color: color(0.55, 0.18, 0.06, 0.32))
ctx.setStrokeColor(warmWhite)
ctx.setLineWidth(15)
ctx.setLineJoin(.round)
ctx.setLineCap(.round)
ctx.addPath(outline)
ctx.strokePath()
ctx.setShadow(offset: .zero, blur: 0, color: nil)

// MARK: 6. 瓶口上方发光苯环（化学签名）

let benz = CGPoint(x: 512, y: 818 + L)
let glow = CGGradient(colorsSpace: cs,
                      colors: [color(1.0, 0.98, 0.85, 0.95), color(1.0, 0.85, 0.4, 0.0)] as CFArray,
                      locations: [0, 1])!
ctx.drawRadialGradient(glow, startCenter: benz, startRadius: 0, endCenter: benz, endRadius: 78, options: [])

func hexPath(_ c: CGPoint, _ rad: CGFloat) -> CGPath {
    let p = CGMutablePath()
    for i in 0..<6 {
        let a = CGFloat(i) * .pi / 3 + .pi / 6
        let pt = CGPoint(x: c.x + rad * cos(a), y: c.y + rad * sin(a))
        if i == 0 { p.move(to: pt) } else { p.addLine(to: pt) }
    }
    p.closeSubpath(); return p
}
ctx.setShadow(offset: .zero, blur: 16, color: color(1.0, 0.95, 0.7, 0.9))
ctx.setStrokeColor(color(1, 1, 1, 0.98))
ctx.setLineWidth(10)
ctx.setLineJoin(.round)
ctx.addPath(hexPath(benz, 40)); ctx.strokePath()
ctx.setShadow(offset: .zero, blur: 0, color: nil)

// MARK: 7. App 名（锥形瓶下方 · 沿用 Apex 家族字标风格）

NSGraphicsContext.saveGraphicsState()
NSGraphicsContext.current = NSGraphicsContext(cgContext: ctx, flipped: false)
let shadow = NSShadow()
shadow.shadowColor = NSColor(srgbRed: 0.55, green: 0.18, blue: 0.06, alpha: 0.30)
shadow.shadowOffset = NSSize(width: 0, height: -3)   // flipped:false 下向下偏移
shadow.shadowBlurRadius = 10
let nameAttrs: [NSAttributedString.Key: Any] = [
    .font: NSFont.systemFont(ofSize: 96, weight: .bold),
    .foregroundColor: NSColor(srgbRed: 1.0, green: 1.0, blue: 1.0, alpha: 0.97),
    .kern: 2.0,
    .shadow: shadow,
]
let name = NSAttributedString(string: "ChemApex", attributes: nameAttrs)
let nsz = name.size()
name.draw(at: NSPoint(x: (1024 - nsz.width) / 2, y: 150))   // 居中，瓶身下方
NSGraphicsContext.restoreGraphicsState()

// MARK: 输出

let img = ctx.makeImage()!
let rep = NSBitmapImageRep(cgImage: img)
let png = rep.representation(using: .png, properties: [:])!
let out = URL(fileURLWithPath: "ChemApex/Resources/Assets.xcassets/AppIcon.appiconset/AppIcon-1024.png")
try! png.write(to: out)
print("✅ icon written to \(out.path)")
