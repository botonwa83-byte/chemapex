// ChemApex 应用图标（Apex 家族·化学主角=锥形瓶）
// 家族骨架：深色宇宙星空 + 上升光束(登顶) + 底部黑色基座 + app名 + 主色区分。
// 化学主角：居中的发光锥形瓶（三角瓶身 + 青绿冒泡液体 + 苯环气泡），一眼即化学。
// 运行：swift scripts/make_icon.swift

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
    mutating func next() -> UInt64 { state = state &* 6364136223846793005 &+ 1442695040888963407; return state }
}
var rng = LCG(state: 20260613)

// MARK: 1. 青绿宇宙星空（化学主色：偏青绿/翠色）

let sky = CGGradient(colorsSpace: cs,
                     colors: [color(0.04, 0.12, 0.13), color(0.07, 0.22, 0.24)] as CFArray,
                     locations: [0, 1])!
ctx.drawLinearGradient(sky, start: CGPoint(x: 512, y: 0), end: CGPoint(x: 512, y: 1024), options: [])

let flaskCenter = CGPoint(x: 512, y: 600)
let halo = CGGradient(colorsSpace: cs,
                      colors: [color(1.0, 0.7, 0.35, 0.32), color(1.0, 0.6, 0.3, 0.0)] as CFArray,
                      locations: [0, 1])!
ctx.drawRadialGradient(halo, startCenter: flaskCenter, startRadius: 0, endCenter: flaskCenter, endRadius: 360, options: [])

// MARK: 2. 漫天星点

for _ in 0..<80 {
    let x = CGFloat.random(in: 16...1008, using: &rng)
    let y = CGFloat.random(in: 170...1010, using: &rng)
    let r = CGFloat.random(in: 1.2...3.6, using: &rng)
    ctx.setFillColor(color(1, 1, 1, CGFloat.random(in: 0.3...0.9, using: &rng)))
    ctx.fillEllipse(in: CGRect(x: x - r, y: y - r, width: r * 2, height: r * 2))
}

// MARK: 3. 上升光束（登顶之路：从基座升向锥形瓶）

ctx.saveGState()
let beam = CGMutablePath()
beam.move(to: CGPoint(x: 512, y: 560))
beam.addLine(to: CGPoint(x: 392, y: 0))
beam.addLine(to: CGPoint(x: 632, y: 0))
beam.closeSubpath()
ctx.addPath(beam); ctx.clip()
let beamGrad = CGGradient(colorsSpace: cs,
                          colors: [color(0.30, 0.80, 0.72, 0.30), color(0.20, 0.55, 0.58, 0.0)] as CFArray,
                          locations: [0, 1])!
ctx.drawLinearGradient(beamGrad, start: CGPoint(x: 512, y: 560), end: CGPoint(x: 512, y: 0), options: [])
ctx.restoreGState()

// MARK: 4. 锥形瓶（主角）

// 瓶身轮廓路径（颈 + 锥形身 + 底）
let baseY: CGFloat = 450, bodyTopY: CGFloat = 700, neckTopY: CGFloat = 812
let baseHalf: CGFloat = 158, neckHalf: CGFloat = 34
let outline = CGMutablePath()
outline.move(to: CGPoint(x: 512 - neckHalf, y: neckTopY))      // 颈左上
outline.addLine(to: CGPoint(x: 512 - neckHalf, y: bodyTopY))   // 颈左下（肩）
outline.addLine(to: CGPoint(x: 512 - baseHalf, y: baseY))      // 身左下
outline.addLine(to: CGPoint(x: 512 + baseHalf, y: baseY))      // 身右下
outline.addLine(to: CGPoint(x: 512 + neckHalf, y: bodyTopY))   // 颈右下（肩）
outline.addLine(to: CGPoint(x: 512 + neckHalf, y: neckTopY))   // 颈右上
// 瓶口外翻唇
outline.addLine(to: CGPoint(x: 512 + neckHalf + 16, y: neckTopY + 18))
outline.addLine(to: CGPoint(x: 512 - neckHalf - 16, y: neckTopY + 18))
outline.closeSubpath()

// 玻璃体（淡青填充）
ctx.saveGState()
ctx.addPath(outline); ctx.clip()
ctx.setFillColor(color(0.55, 0.85, 0.85, 0.12))
ctx.fill(CGRect(x: 0, y: 0, width: 1024, height: 1024))

// 青绿液体（瓶身下部，发光）
let liquidTopY: CGFloat = 600
let liquid = CGMutablePath()
liquid.move(to: CGPoint(x: 512 - baseHalf, y: baseY))
// 液面（带轻微弧度）
liquid.addLine(to: CGPoint(x: 512 - (baseHalf * (bodyTopY - liquidTopY) + neckHalf * (liquidTopY - baseY)) / (bodyTopY - baseY), y: liquidTopY))
liquid.addQuadCurve(to: CGPoint(x: 512 + (baseHalf * (bodyTopY - liquidTopY) + neckHalf * (liquidTopY - baseY)) / (bodyTopY - baseY), y: liquidTopY),
                    control: CGPoint(x: 512, y: liquidTopY + 26))
liquid.addLine(to: CGPoint(x: 512 + baseHalf, y: baseY))
liquid.closeSubpath()
ctx.addPath(liquid); ctx.clip()
let liquidGrad = CGGradient(colorsSpace: cs,
                            colors: [color(0.30, 0.82, 0.74, 0.96), color(0.16, 0.58, 0.60, 0.96)] as CFArray,
                            locations: [0, 1])!
ctx.drawLinearGradient(liquidGrad, start: CGPoint(x: 512, y: liquidTopY), end: CGPoint(x: 512, y: baseY), options: [])
ctx.restoreGState()

// 气泡（液面上方瓶内上升）
let bubbles: [(CGFloat, CGFloat, CGFloat)] = [(486, 650, 16), (540, 690, 11), (500, 730, 9), (528, 640, 8)]
for (bx, by, br) in bubbles {
    ctx.setFillColor(color(0.8, 1.0, 0.95, 0.85))
    ctx.fillEllipse(in: CGRect(x: bx - br, y: by - br, width: br * 2, height: br * 2))
}

// 瓶身发光描边
ctx.setShadow(offset: .zero, blur: 16, color: color(0.5, 1.0, 0.9, 0.8))
ctx.setStrokeColor(color(0.85, 1.0, 0.96, 0.95))
ctx.setLineWidth(11)
ctx.setLineJoin(.round)
ctx.addPath(outline)
ctx.strokePath()
ctx.setShadow(offset: .zero, blur: 0, color: nil)

// 瓶口上方飘一枚发光苯环（化学之心）
let benz = CGPoint(x: 512, y: 880)
let bcore = CGGradient(colorsSpace: cs,
                       colors: [color(1.0, 0.92, 0.62, 0.95), color(1.0, 0.6, 0.25, 0.0)] as CFArray,
                       locations: [0, 1])!
ctx.drawRadialGradient(bcore, startCenter: benz, startRadius: 0, endCenter: benz, endRadius: 60, options: [])
func hexPath(_ c: CGPoint, _ rad: CGFloat) -> CGPath {
    let p = CGMutablePath()
    for i in 0..<6 {
        let a = CGFloat(i) * .pi / 3 + .pi / 6
        let pt = CGPoint(x: c.x + rad * cos(a), y: c.y + rad * sin(a))
        if i == 0 { p.move(to: pt) } else { p.addLine(to: pt) }
    }
    p.closeSubpath(); return p
}
ctx.setShadow(offset: .zero, blur: 14, color: color(1.0, 0.85, 0.45, 0.95))
ctx.setStrokeColor(color(1.0, 0.97, 0.85))
ctx.setLineWidth(9)
ctx.addPath(hexPath(benz, 34)); ctx.strokePath()
ctx.setShadow(offset: .zero, blur: 0, color: nil)

// MARK: 5. 底部小山影 + 黑色基座

func triangle(_ a: CGPoint, _ b: CGPoint, _ c: CGPoint, _ col: CGColor) {
    ctx.setFillColor(col); ctx.beginPath()
    ctx.move(to: a); ctx.addLine(to: b); ctx.addLine(to: c); ctx.closePath(); ctx.fillPath()
}
triangle(CGPoint(x: -40, y: 0), CGPoint(x: 250, y: 230), CGPoint(x: 520, y: 0), color(0.10, 0.24, 0.24))
triangle(CGPoint(x: 470, y: 0), CGPoint(x: 760, y: 270), CGPoint(x: 1060, y: 0), color(0.08, 0.20, 0.21))

let groundH: CGFloat = 150
let ground = CGGradient(colorsSpace: cs,
                        colors: [color(0.01, 0.04, 0.04, 1.0), color(0.03, 0.08, 0.08, 0.0)] as CFArray,
                        locations: [0, 1])!
ctx.saveGState()
ctx.clip(to: CGRect(x: 0, y: 0, width: 1024, height: groundH))
ctx.drawLinearGradient(ground, start: CGPoint(x: 512, y: 0), end: CGPoint(x: 512, y: groundH), options: [])
ctx.restoreGState()

// MARK: 6. App 名

NSGraphicsContext.saveGraphicsState()
NSGraphicsContext.current = NSGraphicsContext(cgContext: ctx, flipped: false)
let attrs: [NSAttributedString.Key: Any] = [
    .font: NSFont.systemFont(ofSize: 52, weight: .semibold),
    .foregroundColor: NSColor(srgbRed: 0.80, green: 0.95, blue: 0.92, alpha: 0.62),
    .kern: 3.0,
]
let astr = NSAttributedString(string: "ChemApex", attributes: attrs)
let tsz = astr.size()
astr.draw(at: NSPoint(x: (1024 - tsz.width) / 2, y: 46))
NSGraphicsContext.restoreGraphicsState()

// MARK: 输出

let img = ctx.makeImage()!
let rep = NSBitmapImageRep(cgImage: img)
let png = rep.representation(using: .png, properties: [:])!
let out = URL(fileURLWithPath: "ChemApex/Resources/Assets.xcassets/AppIcon.appiconset/AppIcon-1024.png")
try! png.write(to: out)
print("✅ icon written to \(out.path)")
