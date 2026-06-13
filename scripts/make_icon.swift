// ChemApex 应用图标生成脚本（Apex 家族风格，对标 MathApex）
// 家族语言：深蓝星空 + 顶点橙金光晕 + 登顶光路 + 金字塔山影 + 椭圆轨道环 + 漫天星点。
// 化学差异化：顶点的光源核心是一枚发光的苯环（化学最具辨识度的符号）。
// 运行：swift scripts/make_icon.swift  → 1024×1024 PNG 写入 AppIcon.appiconset

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
struct LCG: RandomNumberGenerator {
    var state: UInt64
    mutating func next() -> UInt64 {
        state = state &* 6364136223846793005 &+ 1442695040888963407
        return state
    }
}
var rng = LCG(state: 20260613)

let summit = CGPoint(x: 512, y: 792)   // 顶点（登顶之巅）

// MARK: 1. 深蓝星空背景（底深顶亮的纵向渐变）

let sky = CGGradient(colorsSpace: cs,
                     colors: [color(0.055, 0.075, 0.16),   // 底
                              color(0.10, 0.13, 0.27)] as CFArray,
                     locations: [0, 1])!
ctx.drawLinearGradient(sky, start: CGPoint(x: 512, y: 0),
                       end: CGPoint(x: 512, y: 1024), options: [])

// 顶点背后的大范围暖色辉光（家族标志的"日出感"）
let halo = CGGradient(colorsSpace: cs,
                      colors: [color(1.0, 0.62, 0.28, 0.55),
                               color(1.0, 0.55, 0.25, 0.12),
                               color(1.0, 0.55, 0.25, 0.0)] as CFArray,
                      locations: [0, 0.4, 1])!
ctx.drawRadialGradient(halo, startCenter: summit, startRadius: 0,
                       endCenter: summit, endRadius: 360, options: [])

// MARK: 2. 椭圆轨道环（淡蓝）+ 环上几个点

ctx.setStrokeColor(color(0.55, 0.65, 0.95, 0.22))
ctx.setLineWidth(3)
let orbit = CGRect(x: 512 - 440, y: summit.y - 150, width: 880, height: 300)
ctx.strokeEllipse(in: orbit)
// 内侧再来一圈更淡的
ctx.setStrokeColor(color(0.55, 0.65, 0.95, 0.10))
ctx.setLineWidth(2)
ctx.strokeEllipse(in: orbit.insetBy(dx: 70, dy: 24))

// 轨道上几个亮点
for ang in stride(from: 0.0, to: 360.0, by: 47.0) {
    let r = ang * .pi / 180
    let px = orbit.midX + (orbit.width / 2) * cos(r)
    let py = orbit.midY + (orbit.height / 2) * sin(r)
    let s = CGFloat.random(in: 3...5, using: &rng)
    ctx.setFillColor(color(0.8, 0.85, 1.0, 0.7))
    ctx.fillEllipse(in: CGRect(x: px - s, y: py - s, width: s * 2, height: s * 2))
}

// MARK: 3. 漫天星点

for _ in 0..<70 {
    let x = CGFloat.random(in: 16...1008, using: &rng)
    let y = CGFloat.random(in: 360...1010, using: &rng)
    let r = CGFloat.random(in: 1.2...3.6, using: &rng)
    let a = CGFloat.random(in: 0.3...0.9, using: &rng)
    ctx.setFillColor(color(1, 1, 1, a))
    ctx.fillEllipse(in: CGRect(x: x - r, y: y - r, width: r * 2, height: r * 2))
}

// MARK: 4. 远处侧峰（深色金字塔剪影）

func triangle(_ a: CGPoint, _ b: CGPoint, _ c: CGPoint, _ col: CGColor) {
    ctx.setFillColor(col)
    ctx.beginPath()
    ctx.move(to: a); ctx.addLine(to: b); ctx.addLine(to: c)
    ctx.closePath(); ctx.fillPath()
}
// 左峰、右峰（暗）
triangle(CGPoint(x: -60, y: 0), CGPoint(x: 300, y: 430), CGPoint(x: 470, y: 0),
         color(0.13, 0.16, 0.30))
triangle(CGPoint(x: 560, y: 0), CGPoint(x: 770, y: 470), CGPoint(x: 1084, y: 0),
         color(0.11, 0.14, 0.27))

// MARK: 5. 中央光束（聚光灯感，从顶点扇向地面）

ctx.saveGState()
let beam = CGMutablePath()
beam.move(to: summit)
beam.addLine(to: CGPoint(x: 372, y: 0))
beam.addLine(to: CGPoint(x: 652, y: 0))
beam.closeSubpath()
ctx.addPath(beam); ctx.clip()
let beamGrad = CGGradient(colorsSpace: cs,
                          colors: [color(0.45, 0.55, 0.95, 0.55),
                                   color(0.30, 0.40, 0.85, 0.10)] as CFArray,
                          locations: [0, 1])!
ctx.drawLinearGradient(beamGrad, start: summit, end: CGPoint(x: 512, y: 0), options: [])
ctx.restoreGState()

// 中央峰（比侧峰略亮，受光面）
triangle(CGPoint(x: 250, y: 0), summit, CGPoint(x: 774, y: 0),
         color(0.17, 0.21, 0.40))

// MARK: 6. 登顶之路（明亮细光线，从地面升到顶点）

ctx.setShadow(offset: .zero, blur: 14, color: color(0.6, 0.8, 1.0, 0.9))
ctx.setStrokeColor(color(0.92, 0.97, 1.0, 0.95))
ctx.setLineWidth(5)
ctx.setLineCap(.round)
ctx.beginPath()
ctx.move(to: CGPoint(x: 432, y: 0))
ctx.addLine(to: summit)
ctx.strokePath()
ctx.setShadow(offset: .zero, blur: 0, color: nil)

// MARK: 7. 顶点光源 + 苯环（化学之心）

// 亮核辉光
let core = CGGradient(colorsSpace: cs,
                      colors: [color(1.0, 0.92, 0.62, 1.0),
                               color(1.0, 0.72, 0.32, 0.6),
                               color(1.0, 0.6, 0.25, 0.0)] as CFArray,
                      locations: [0, 0.45, 1])!
ctx.drawRadialGradient(core, startCenter: summit, startRadius: 0,
                       endCenter: summit, endRadius: 95, options: [])

// 苯环：正六边形 + 内圈（发光金白）
func hexPath(center: CGPoint, radius: CGFloat) -> CGPath {
    let p = CGMutablePath()
    for i in 0..<6 {
        let a = CGFloat(i) * .pi / 3 + .pi / 6
        let pt = CGPoint(x: center.x + radius * cos(a), y: center.y + radius * sin(a))
        if i == 0 { p.move(to: pt) } else { p.addLine(to: pt) }
    }
    p.closeSubpath()
    return p
}
ctx.setShadow(offset: .zero, blur: 20, color: color(1.0, 0.85, 0.45, 0.95))
ctx.setStrokeColor(color(1.0, 0.97, 0.85))
ctx.setLineWidth(13)
ctx.setLineJoin(.round)
ctx.addPath(hexPath(center: summit, radius: 50))
ctx.strokePath()
ctx.setLineWidth(8)
ctx.strokeEllipse(in: CGRect(x: summit.x - 27, y: summit.y - 27, width: 54, height: 54))
ctx.setShadow(offset: .zero, blur: 0, color: nil)

// MARK: 输出

let img = ctx.makeImage()!
let rep = NSBitmapImageRep(cgImage: img)
let png = rep.representation(using: .png, properties: [:])!
let out = URL(fileURLWithPath: "ChemApex/Resources/Assets.xcassets/AppIcon.appiconset/AppIcon-1024.png")
try! png.write(to: out)
print("✅ icon written to \(out.path)")
