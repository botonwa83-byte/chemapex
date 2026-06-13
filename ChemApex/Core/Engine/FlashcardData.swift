import Foundation

// MARK: - 现象闪卡数据：颜色事实必须准确（学生会背进考场）

enum FlashcardData {
    static let all: [ColorFact] = flame + solution + precipitate + solidGas + extra

    static func facts(in category: FlashCategory) -> [ColorFact] {
        all.filter { $0.category == category }
    }

    // MARK: 扩充色卡（高频补强）

    private static let extra: [ColorFact] = [
        // 沉淀
        ColorFact(id: "fc_p09", category: .precipitate, item: "Mg(OH)₂", colorName: "白色", hex: 0xF7F7F7,
                  note: "不溶于过量 NaOH（与两性的 Al(OH)₃ 区分）"),
        ColorFact(id: "fc_p10", category: .precipitate, item: "Al(OH)₃", colorName: "白色", hex: 0xF2F2F2,
                  note: "白色絮状、两性，溶于强酸和强碱"),
        ColorFact(id: "fc_p11", category: .precipitate, item: "CaCO₃", colorName: "白色", hex: 0xFAFAFA,
                  note: "石灰水变浑浊就是它；溶于盐酸放 CO₂"),
        ColorFact(id: "fc_p12", category: .precipitate, item: "Ag₂CrO₄", colorName: "砖红色", hex: 0xB5482A,
                  note: "莫尔法滴定终点的颜色"),
        // 溶液与离子
        ColorFact(id: "fc_s09", category: .solution, item: "K₂Cr₂O₇ 溶液", colorName: "橙色", hex: 0xE8590C,
                  note: "重铬酸钾，强氧化剂；CrO₄²⁻ 则为黄色"),
        ColorFact(id: "fc_s10", category: .solution, item: "碘的 CCl₄ 溶液", colorName: "紫红色", hex: 0x8E2DC5,
                  note: "碘水是棕黄色——同一种碘，溶剂不同颜色不同"),
        ColorFact(id: "fc_s11", category: .solution, item: "淀粉遇碘", colorName: "蓝色", hex: 0x1A3A8F,
                  note: "检验碘单质（I₂）的专属显色"),
        // 固体与气体
        ColorFact(id: "fc_g09", category: .solidGas, item: "CuO（固）", colorName: "黑色", hex: 0x1A1A1A,
                  note: "氧化铜；被 C/CO/H₂ 还原成红色铜"),
        ColorFact(id: "fc_g10", category: .solidGas, item: "Fe₂O₃（固）", colorName: "红棕色", hex: 0x8D3A24,
                  note: "铁锈主要成分；炼铁原料"),
        ColorFact(id: "fc_g11", category: .solidGas, item: "MnO₂（固）", colorName: "黑色", hex: 0x202020,
                  note: "制氧催化剂 / 制氯氧化剂，一物两用"),
        ColorFact(id: "fc_g12", category: .solidGas, item: "碳 C（固）", colorName: "黑色", hex: 0x111111,
                  note: "木炭、活性炭；有还原性和吸附性"),
        ColorFact(id: "fc_g13", category: .solidGas, item: "铜绿 Cu₂(OH)₂CO₃", colorName: "绿色", hex: 0x2E8B57,
                  note: "铜在潮湿空气中锈蚀的产物（碱式碳酸铜）"),
    ]

    // MARK: 焰色反应

    private static let flame: [ColorFact] = [
        ColorFact(id: "fc_f01", category: .flame, item: "钠 Na", colorName: "黄色", hex: 0xFFC107,
                  note: "最常见的焰色；观察钾的焰色必须先滤掉它"),
        ColorFact(id: "fc_f02", category: .flame, item: "钾 K", colorName: "紫色", hex: 0x9C27B0,
                  note: "必须透过蓝色钴玻璃观察（滤去钠的黄光）"),
        ColorFact(id: "fc_f03", category: .flame, item: "钙 Ca", colorName: "砖红色", hex: 0xB5482A),
        ColorFact(id: "fc_f04", category: .flame, item: "铜 Cu", colorName: "绿色", hex: 0x2E9E4F,
                  note: "灼烧含铜化合物可见"),
        ColorFact(id: "fc_f05", category: .flame, item: "钡 Ba", colorName: "黄绿色", hex: 0xAFB42B),
        ColorFact(id: "fc_f06", category: .flame, item: "锂 Li", colorName: "紫红色", hex: 0xC2185B),
        ColorFact(id: "fc_f07", category: .flame, item: "锶 Sr", colorName: "洋红色", hex: 0xE91E63,
                  note: "焰色反应是元素的性质，属于物理变化"),
    ]

    // MARK: 溶液与离子

    private static let solution: [ColorFact] = [
        ColorFact(id: "fc_s01", category: .solution, item: "Cu²⁺ 溶液", colorName: "蓝色", hex: 0x1E88E5),
        ColorFact(id: "fc_s02", category: .solution, item: "Fe³⁺ 溶液", colorName: "黄色", hex: 0xD4A017),
        ColorFact(id: "fc_s03", category: .solution, item: "Fe²⁺ 溶液", colorName: "浅绿色", hex: 0xA5D6A7),
        ColorFact(id: "fc_s04", category: .solution, item: "MnO₄⁻ 溶液", colorName: "紫红色", hex: 0x8E24AA,
                  note: "强氧化剂；褪色常作反应发生的证据"),
        ColorFact(id: "fc_s05", category: .solution, item: "氯水", colorName: "浅黄绿色", hex: 0xC0CA33),
        ColorFact(id: "fc_s06", category: .solution, item: "溴水", colorName: "橙色", hex: 0xF57C00,
                  note: "浓度低时偏黄，浓时偏橙红"),
        ColorFact(id: "fc_s07", category: .solution, item: "碘水", colorName: "棕黄色", hex: 0x8D6E63,
                  note: "碘的 CCl₄ 溶液则是紫红色——溶剂不同颜色不同"),
        ColorFact(id: "fc_s08", category: .solution, item: "Fe³⁺ 遇 KSCN", colorName: "血红色", hex: 0xB71C1C,
                  note: "检验 Fe³⁺ 的标准显色"),
    ]

    // MARK: 沉淀颜色

    private static let precipitate: [ColorFact] = [
        ColorFact(id: "fc_p01", category: .precipitate, item: "Fe(OH)₃", colorName: "红褐色", hex: 0x8D4A2F),
        ColorFact(id: "fc_p02", category: .precipitate, item: "Fe(OH)₂", colorName: "白色", hex: 0xF5F5F5,
                  note: "在空气中迅速变灰绿，最终变红褐"),
        ColorFact(id: "fc_p03", category: .precipitate, item: "Cu(OH)₂", colorName: "蓝色", hex: 0x2196F3),
        ColorFact(id: "fc_p04", category: .precipitate, item: "AgCl", colorName: "白色", hex: 0xFAFAFA,
                  note: "不溶于稀硝酸；检验 Cl⁻"),
        ColorFact(id: "fc_p05", category: .precipitate, item: "AgBr", colorName: "浅黄色", hex: 0xFFF3B0,
                  note: "感光材料；AgCl→AgBr→AgI 颜色加深"),
        ColorFact(id: "fc_p06", category: .precipitate, item: "AgI", colorName: "黄色", hex: 0xFFEB3B),
        ColorFact(id: "fc_p07", category: .precipitate, item: "BaSO₄", colorName: "白色", hex: 0xFFFFFF,
                  note: "不溶于酸——检验 SO₄²⁻ 的终点"),
        ColorFact(id: "fc_p08", category: .precipitate, item: "Cu₂O", colorName: "砖红色", hex: 0xC0392B,
                  note: "醛与新制 Cu(OH)₂ 加热的产物"),
    ]

    // MARK: 固体与气体

    private static let solidGas: [ColorFact] = [
        ColorFact(id: "fc_g01", category: .solidGas, item: "Cl₂（气）", colorName: "黄绿色", hex: 0xAFB42B,
                  note: "有毒，有强烈刺激性气味"),
        ColorFact(id: "fc_g02", category: .solidGas, item: "NO₂（气）", colorName: "红棕色", hex: 0xA6402D,
                  note: "NO 无色——遇空气变红棕是 NO 的检验法"),
        ColorFact(id: "fc_g03", category: .solidGas, item: "液溴", colorName: "深红棕色", hex: 0x7B2D26,
                  note: "唯一液态非金属单质；保存加水液封"),
        ColorFact(id: "fc_g04", category: .solidGas, item: "碘 I₂（固）", colorName: "紫黑色", hex: 0x3E2750,
                  note: "易升华，蒸气紫色"),
        ColorFact(id: "fc_g05", category: .solidGas, item: "硫 S（固）", colorName: "淡黄色", hex: 0xFFF176),
        ColorFact(id: "fc_g06", category: .solidGas, item: "Na₂O₂（固）", colorName: "淡黄色", hex: 0xFFF59D,
                  note: "Na₂O 是白色——颜色区分两种氧化物"),
        ColorFact(id: "fc_g07", category: .solidGas, item: "KMnO₄（固）", colorName: "紫黑色", hex: 0x4A148C),
        ColorFact(id: "fc_g08", category: .solidGas, item: "胆矾 CuSO₄·5H₂O", colorName: "蓝色", hex: 0x1976D2,
                  note: "无水 CuSO₄ 白色，遇水变蓝——检验水的存在"),
    ]
}
