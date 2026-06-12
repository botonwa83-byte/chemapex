// ChemApex 应用图标生成脚本
// 家族语言（同 PhysicsApex）：深蓝星空 + 橙色山峰 + 顶点光源。
// 化学差异化：山峰即锥形瓶，瓶口悬浮发光苯环，电子轨道换成上升气泡。
// 运行：swift scripts/make_icon.swift  → 输出 1024×1024 PNG 到 AppIcon.appiconset

import AppKit
import CoreGraphics

let size = 1024
let cs = CGColorSpace(name: CGColorSpace.sRGB)!
let ctx = CGContext(data: nil, width: size, height: size, bitsPerComponent: 8,
                    bytesPerRow: 0, space: cs,
                    bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!

func color(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat = 1) -> CGColor {
    CGColor(colorSpace: cs, components: [r, g, b, a])!
}

// 可复现的伪随机（星星布点用）
struct LCG: RandomNumberGenerator {
    var state: UInt64
    mutating func next() -> UInt64 {
        state = state &* 6364136223846793005 &+ 1442695040888963407
        return state
    }
}
var rng = LCG(state: 20260612)

// MARK: 1. 星空背景（上深下浅的深蓝渐变）

let skyGrad = CGGradient(colorsSpace: cs,
                         colors: [color(0.075, 0.10, 0.20),
                                  color(0.13, 0.17, 0.32)] as CFArray,
                         locations: [0, 1])!
ctx.drawLinearGradient(skyGrad, start: CGPoint(x: 512, y: 1024),
                       end: CGPoint(x: 512, y: 0), options: [])

// 星星
for _ in 0..<70 {
    let x = CGFloat.random(in: 20...1004, using: &rng)
    let y = CGFloat.random(in: 380...1010, using: &rng)
    let r = CGFloat.random(in: 1.5...4.5, using: &rng)
    let a = CGFloat.random(in: 0.35...0.95, using: &rng)
    ctx.setFillColor(color(1, 1, 1, a))
    ctx.fillEllipse(in: CGRect(x: x - r, y: y - r, width: r * 2, height: r * 2))
}

// MARK: 2. 远山剪影（紫蓝）

func mountain(_ pts: [(CGFloat, CGFloat)], _ c: CGColor) {
    ctx.setFillColor(c)
    ctx.beginPath()
    ctx.move(to: CGPoint(x: pts[0].0, y: pts[0].1))
    for p in pts.dropFirst() { ctx.addLine(to: CGPoint(x: p.0, y: p.1)) }
    ctx.closePath()
    ctx.fillPath()
}
mountain([(-50, 0), (-50, 180), (250, 380), (560, 0)], color(0.20, 0.22, 0.38))
mountain([(480, 0), (800, 340), (1074, 130), (1074, 0)], color(0.16, 0.18, 0.33))

// MARK: 3. 锥形瓶山峰（橙色渐变：瓶身 = 山体，顶部带瓶颈瓶口）

let neckHalf: CGFloat = 52      // 瓶颈半宽
let neckBottom: CGFloat = 690   // 瓶肩高度
let neckTop: CGFloat = 800      // 瓶颈顶
let baseHalf: CGFloat = 360     // 瓶底半宽

let flask = CGMutablePath()
flask.move(to: CGPoint(x: 512 - neckHalf, y: neckTop))
flask.addLine(to: CGPoint(x: 512 - neckHalf, y: neckBottom))
flask.addLine(to: CGPoint(x: 512 - baseHalf, y: 0))
flask.addLine(to: CGPoint(x: 512 + baseHalf, y: 0))
flask.addLine(to: CGPoint(x: 512 + neckHalf, y: neckBottom))
flask.addLine(to: CGPoint(x: 512 + neckHalf, y: neckTop))
// 瓶口外翻的唇边
flask.addLine(to: CGPoint(x: 512 + neckHalf + 18, y: neckTop))
flask.addLine(to: CGPoint(x: 512 + neckHalf + 18, y: neckTop + 26))
flask.addLine(to: CGPoint(x: 512 - neckHalf - 18, y: neckTop + 26))
flask.addLine(to: CGPoint(x: 512 - neckHalf - 18, y: neckTop))
flask.closeSubpath()

ctx.saveGState()
ctx.addPath(flask)
ctx.clip()
let flaskGrad = CGGradient(colorsSpace: cs,
                           colors: [color(1.0, 0.66, 0.32),
                                    color(0.93, 0.42, 0.23)] as CFArray,
                           locations: [0, 1])!
ctx.drawLinearGradient(flaskGrad, start: CGPoint(x: 512, y: neckTop + 26),
                       end: CGPoint(x: 512, y: 0), options: [])
// 中央高光条（家族里的「受光面」）
ctx.setFillColor(color(1.0, 0.78, 0.45, 0.85))
ctx.beginPath()
ctx.move(to: CGPoint(x: 512 - neckHalf + 16, y: neckTop + 26))
ctx.addLine(to: CGPoint(x: 512 - 150, y: 0))
ctx.addLine(to: CGPoint(x: 512 + 60, y: 0))
ctx.addLine(to: CGPoint(x: 512 + neckHalf - 30, y: neckTop + 26))
ctx.closePath()
ctx.fillPath()
// 瓶内液面：青色「化学液体」沉在瓶底
let liquidGrad = CGGradient(colorsSpace: cs,
                            colors: [color(0.30, 0.78, 0.72, 0.95),
                                     color(0.15, 0.55, 0.58, 0.95)] as CFArray,
                            locations: [0, 1])!
ctx.saveGState()
ctx.beginPath()
ctx.move(to: CGPoint(x: 512 - baseHalf, y: 0))
ctx.addLine(to: CGPoint(x: 512 - baseHalf + 86, y: 168))
ctx.addQuadCurve(to: CGPoint(x: 512 + baseHalf - 86, y: 168),
                 control: CGPoint(x: 512, y: 228))
ctx.addLine(to: CGPoint(x: 512 + baseHalf, y: 0))
ctx.closePath()
ctx.clip()
ctx.drawLinearGradient(liquidGrad, start: CGPoint(x: 512, y: 215),
                       end: CGPoint(x: 512, y: 0), options: [])
ctx.restoreGState()
ctx.restoreGState()

// MARK: 4. 瓶口辉光 + 苯环（顶点光源，对位物理版的金色星）

let glowCenter = CGPoint(x: 512, y: 905)
let glowGrad = CGGradient(colorsSpace: cs,
                          colors: [color(1.0, 0.88, 0.55, 0.95),
                                   color(1.0, 0.80, 0.40, 0.35),
                                   color(1.0, 0.80, 0.40, 0.0)] as CFArray,
                          locations: [0, 0.45, 1])!
ctx.drawRadialGradient(glowGrad, startCenter: glowCenter, startRadius: 0,
                       endCenter: glowCenter, endRadius: 190, options: [])

// 苯环：正六边形 + 内圈
func hexPath(center: CGPoint, radius: CGFloat) -> CGPath {
    let p = CGMutablePath()
    for i in 0..<6 {
        let angle = CGFloat(i) * .pi / 3 + .pi / 6
        let pt = CGPoint(x: center.x + radius * cos(angle), y: center.y + radius * sin(angle))
        if i == 0 { p.move(to: pt) } else { p.addLine(to: pt) }
    }
    p.closeSubpath()
    return p
}
ctx.setShadow(offset: .zero, blur: 26, color: color(1.0, 0.85, 0.45, 0.9))
ctx.setStrokeColor(color(1.0, 0.96, 0.82))
ctx.setLineWidth(15)
ctx.setLineJoin(.round)
ctx.addPath(hexPath(center: glowCenter, radius: 74))
ctx.strokePath()
ctx.setLineWidth(10)
ctx.strokeEllipse(in: CGRect(x: glowCenter.x - 40, y: glowCenter.y - 40, width: 80, height: 80))
ctx.setShadow(offset: .zero, blur: 0, color: nil)

// MARK: 5. 上升气泡（替代物理版的电子轨道）

func bubble(_ x: CGFloat, _ y: CGFloat, _ r: CGFloat, _ c: CGColor, filled: Bool) {
    if filled {
        ctx.setFillColor(c)
        ctx.fillEllipse(in: CGRect(x: x - r, y: y - r, width: r * 2, height: r * 2))
        // 左上小高光
        ctx.setFillColor(color(1, 1, 1, 0.55))
        let hr = r * 0.28
        ctx.fillEllipse(in: CGRect(x: x - r * 0.45 - hr, y: y + r * 0.35 - hr,
                                   width: hr * 2, height: hr * 2))
    } else {
        ctx.setStrokeColor(c)
        ctx.setLineWidth(max(r * 0.22, 5))
        ctx.strokeEllipse(in: CGRect(x: x - r, y: y - r, width: r * 2, height: r * 2))
    }
}
let teal = color(0.36, 0.80, 0.89)
let mint = color(0.30, 0.71, 0.67)
bubble(282, 470, 30, teal, filled: true)
bubble(238, 620, 18, teal, filled: false)
bubble(330, 740, 13, mint, filled: true)
bubble(752, 520, 36, mint, filled: true)
bubble(800, 680, 20, teal, filled: false)
bubble(700, 800, 13, teal, filled: true)
bubble(620, 945, 10, mint, filled: false)
bubble(404, 900, 11, teal, filled: true)

// MARK: 输出

let img = ctx.makeImage()!
let rep = NSBitmapImageRep(cgImage: img)
let png = rep.representation(using: .png, properties: [:])!
let out = URL(fileURLWithPath: "ChemApex/Resources/Assets.xcassets/AppIcon.appiconset/AppIcon-1024.png")
try! png.write(to: out)
print("✅ icon written to \(out.path)")
