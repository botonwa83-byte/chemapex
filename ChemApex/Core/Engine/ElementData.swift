import Foundation

// MARK: - 元素星图数据
// 一期范围：前四周期（1–36 号）完整 + 高频重元素（Ag/Sn/I/Ba/Pt/Au/Hg/Pb）。
// 其余周期不臆造、不占位。焰色/颜色等事实必须准确。

enum ElementData {
    static let all: [Element] = periods12 + period3 + period4 + heavyFrequent

    static func element(symbol: String) -> Element? { all.first { $0.symbol == symbol } }

    /// 前四周期（按 period 分组绘制周期表网格）。
    static var gridElements: [Element] { all.filter { $0.period <= 4 } }
    /// 高频重元素行（第五周期及以后）。
    static var heavyElements: [Element] { all.filter { $0.period > 4 } }

    // MARK: 第一、二周期

    private static let periods12: [Element] = [
        Element(number: 1, symbol: "H", name: "氢", period: 1, group: 1, category: .nonmetal, examHeat: 3,
                examPoints: ["最轻的气体，可燃（淡蓝色火焰）", "原子守恒/电子守恒计算的常客", "同位素：氕、氘、氚"],
                pitfalls: ["点燃氢气前必须验纯"], firstStage: .junior),
        Element(number: 2, symbol: "He", name: "氦", period: 1, group: 18, category: .nobleGas, examHeat: 0,
                examPoints: ["最外层 2 电子即稳定结构"], firstStage: .junior),
        Element(number: 3, symbol: "Li", name: "锂", period: 2, group: 1, category: .alkaliLike, examHeat: 1,
                flameColor: "紫红色",
                examPoints: ["碱金属最轻；电池材料"], firstStage: .junior),
        Element(number: 4, symbol: "Be", name: "铍", period: 2, group: 2, category: .alkaliLike, examHeat: 0, firstStage: .senior),
        Element(number: 5, symbol: "B", name: "硼", period: 2, group: 13, category: .metalloid, examHeat: 0, firstStage: .senior),
        Element(number: 6, symbol: "C", name: "碳", period: 2, group: 14, category: .nonmetal, examHeat: 3,
                examPoints: ["同素异形体：金刚石、石墨、C₆₀", "有机化学的骨架：碳四价", "CO₂/CO、碳酸盐体系贯穿初高中"],
                pitfalls: ["金刚石和石墨是「同素异形体」不是同分异构体"], firstStage: .junior),
        Element(number: 7, symbol: "N", name: "氮", period: 2, group: 15, category: .nonmetal, examHeat: 3,
                examPoints: ["N₂ 三键极稳定，常作保护气", "NH₃ 唯一碱性气体；喷泉实验", "NO 无色、NO₂ 红棕色；硝酸浓稀产物不同"],
                pitfalls: ["NO 只能排水收集，NH₃ 只能向下排空气收集"], firstStage: .junior),
        Element(number: 8, symbol: "O", name: "氧", period: 2, group: 16, category: .nonmetal, examHeat: 3,
                examPoints: ["地壳中含量第一的元素", "O₂/O₃ 同素异形体", "Na₂O₂ 中 O 为 −1 价（易错）"],
                pitfalls: ["氧通常 −2 价，但过氧化物 −1 价、OF₂ 中 +2 价"], firstStage: .junior),
        Element(number: 9, symbol: "F", name: "氟", period: 2, group: 17, category: .halogen, examHeat: 1,
                examPoints: ["电负性最大、氧化性最强的元素", "无正价；HF 能腐蚀玻璃"],
                pitfalls: ["F₂ 通入盐溶液先与水反应，不能置换出其他卤素单质"], firstStage: .senior),
        Element(number: 10, symbol: "Ne", name: "氖", period: 2, group: 18, category: .nobleGas, examHeat: 0, firstStage: .junior),
    ]

    // MARK: 第三周期

    private static let period3: [Element] = [
        Element(number: 11, symbol: "Na", name: "钠", period: 3, group: 1, category: .alkaliLike, examHeat: 3,
                flameColor: "黄色",
                examPoints: ["与水反应：浮熔游响红", "Na₂O₂ 淡黄色，供氧剂", "Na₂CO₃ 与 NaHCO₃ 的鉴别与转化"],
                pitfalls: ["钠保存在煤油中；着火用沙土盖灭，不能用水"], firstStage: .junior),
        Element(number: 12, symbol: "Mg", name: "镁", period: 3, group: 2, category: .alkaliLike, examHeat: 2,
                examPoints: ["在空气中燃烧发出耀眼白光", "能在 CO₂ 中燃烧：2Mg + CO₂ → 2MgO + C"],
                pitfalls: ["镁着火不能用 CO₂ 灭火器"], firstStage: .junior),
        Element(number: 13, symbol: "Al", name: "铝", period: 3, group: 13, category: .alkaliLike, examHeat: 3,
                examPoints: ["Al、Al₂O₃、Al(OH)₃ 都是两性", "铝热反应焊钢轨", "常温下遇浓硫酸/浓硝酸钝化"],
                pitfalls: ["「少量/过量 NaOH」决定沉淀是否溶解——图像题高频"], firstStage: .junior),
        Element(number: 14, symbol: "Si", name: "硅", period: 3, group: 14, category: .metalloid, examHeat: 2,
                examPoints: ["半导体材料；SiO₂ 是光导纤维原料", "SiO₂ 是酸性氧化物但能与氢氟酸反应"],
                pitfalls: ["盛 NaOH 溶液的试剂瓶用橡胶塞不用玻璃塞（SiO₂ 与碱反应）"], firstStage: .junior),
        Element(number: 15, symbol: "P", name: "磷", period: 3, group: 15, category: .nonmetal, examHeat: 1,
                examPoints: ["白磷/红磷同素异形体；白磷自燃点低，保存在水中"], firstStage: .junior),
        Element(number: 16, symbol: "S", name: "硫", period: 3, group: 16, category: .nonmetal, examHeat: 3,
                examPoints: ["淡黄色固体", "SO₂ 漂白可逆（品红加热复原）", "浓硫酸：吸水、脱水、强氧化三性"],
                pitfalls: ["SO₂ 与氯水漂白原理不同：化合 vs 氧化"], firstStage: .junior),
        Element(number: 17, symbol: "Cl", name: "氯", period: 3, group: 17, category: .halogen, examHeat: 3,
                examPoints: ["Cl₂ 黄绿色有毒", "氯水成分「三分四离」；漂白靠 HClO", "实验室制法：MnO₂ + 浓盐酸加热"],
                pitfalls: ["干燥氯气不漂白干燥布条", "与铁反应只生成 FeCl₃"], firstStage: .junior),
        Element(number: 18, symbol: "Ar", name: "氩", period: 3, group: 18, category: .nobleGas, examHeat: 0, firstStage: .junior),
    ]

    // MARK: 第四周期

    private static let period4: [Element] = [
        Element(number: 19, symbol: "K", name: "钾", period: 4, group: 1, category: .alkaliLike, examHeat: 2,
                flameColor: "紫色（透过蓝色钴玻璃观察）",
                examPoints: ["比钠更活泼", "焰色必须透过蓝色钴玻璃滤去钠的黄光"], firstStage: .junior),
        Element(number: 20, symbol: "Ca", name: "钙", period: 4, group: 2, category: .alkaliLike, examHeat: 2,
                flameColor: "砖红色",
                examPoints: ["石灰石—生石灰—熟石灰转化链", "澄清石灰水检验 CO₂"], firstStage: .junior),
        Element(number: 21, symbol: "Sc", name: "钪", period: 4, group: 3, category: .transition, examHeat: 0),
        Element(number: 22, symbol: "Ti", name: "钛", period: 4, group: 4, category: .transition, examHeat: 0,
                examPoints: ["「太空金属」，密度小强度大"]),
        Element(number: 23, symbol: "V", name: "钒", period: 4, group: 5, category: .transition, examHeat: 0),
        Element(number: 24, symbol: "Cr", name: "铬", period: 4, group: 6, category: .transition, examHeat: 1,
                examPoints: ["电子排布特例：3d⁵4s¹（半满稳定）"]),
        Element(number: 25, symbol: "Mn", name: "锰", period: 4, group: 7, category: .transition, examHeat: 1,
                examPoints: ["KMnO₄ 紫色，强氧化剂", "MnO₂ 既是制氯气的氧化剂又是制氧气的催化剂"]),
        Element(number: 26, symbol: "Fe", name: "铁", period: 4, group: 8, category: .transition, examHeat: 3,
                examPoints: ["Fe²⁺ 浅绿 / Fe³⁺ 黄色；KSCN 检验 Fe³⁺ 变血红", "与 Cl₂ 燃烧只得 FeCl₃，与稀盐酸只得 FeCl₂", "Fe(OH)₂ 白色→灰绿→红褐的氧化过程"],
                pitfalls: ["铁与非氧化性酸反应生成 +2 价，不是 +3 价"], firstStage: .junior),
        Element(number: 27, symbol: "Co", name: "钴", period: 4, group: 9, category: .transition, examHeat: 0),
        Element(number: 28, symbol: "Ni", name: "镍", period: 4, group: 10, category: .transition, examHeat: 0),
        Element(number: 29, symbol: "Cu", name: "铜", period: 4, group: 11, category: .transition, examHeat: 3,
                flameColor: "绿色",
                examPoints: ["紫红色金属；Cu²⁺ 溶液蓝色", "与浓/稀硝酸反应产物不同（NO₂/NO）", "与浓硫酸加热反应放 SO₂"],
                pitfalls: ["铜不与稀硫酸、稀盐酸反应（氢后金属）"], firstStage: .junior),
        Element(number: 30, symbol: "Zn", name: "锌", period: 4, group: 12, category: .transition, examHeat: 2,
                examPoints: ["实验室制氢气：Zn + 稀硫酸", "铜锌原电池的负极"], firstStage: .junior),
        Element(number: 31, symbol: "Ga", name: "镓", period: 4, group: 13, category: .alkaliLike, examHeat: 0,
                examPoints: ["门捷列夫预言的「类铝」"]),
        Element(number: 32, symbol: "Ge", name: "锗", period: 4, group: 14, category: .metalloid, examHeat: 0,
                examPoints: ["门捷列夫预言的「类硅」；半导体"]),
        Element(number: 33, symbol: "As", name: "砷", period: 4, group: 15, category: .metalloid, examHeat: 0),
        Element(number: 34, symbol: "Se", name: "硒", period: 4, group: 16, category: .nonmetal, examHeat: 0),
        Element(number: 35, symbol: "Br", name: "溴", period: 4, group: 17, category: .halogen, examHeat: 2,
                examPoints: ["常温下唯一的液态非金属单质，深红棕色易挥发", "溴水/溴的 CCl₄ 溶液检验不饱和键"],
                pitfalls: ["液溴保存要加水液封"]),
        Element(number: 36, symbol: "Kr", name: "氪", period: 4, group: 18, category: .nobleGas, examHeat: 0),
    ]

    // MARK: 高频重元素（第五周期及以后，只收高考会遇到的）

    private static let heavyFrequent: [Element] = [
        Element(number: 47, symbol: "Ag", name: "银", period: 5, group: 11, category: .transition, examHeat: 2,
                examPoints: ["AgCl 白 / AgBr 浅黄 / AgI 黄，均不溶于稀硝酸", "银镜反应检验醛基"]),
        Element(number: 50, symbol: "Sn", name: "锡", period: 5, group: 14, category: .alkaliLike, examHeat: 0),
        Element(number: 53, symbol: "I", name: "碘", period: 5, group: 17, category: .halogen, examHeat: 2,
                examPoints: ["紫黑色固体，易升华", "碘遇淀粉变蓝", "加碘盐中是 KIO₃ 不是 I₂"],
                pitfalls: ["「升华」可用于分离碘——物理变化"]),
        Element(number: 56, symbol: "Ba", name: "钡", period: 6, group: 2, category: .alkaliLike, examHeat: 2,
                flameColor: "黄绿色",
                examPoints: ["BaSO₄ 不溶于酸——检验 SO₄²⁻ 的最终沉淀", "可溶性钡盐有毒，钡餐用的是 BaSO₄"]),
        Element(number: 78, symbol: "Pt", name: "铂", period: 6, group: 10, category: .transition, examHeat: 1,
                examPoints: ["惰性电极、催化剂；焰色实验用铂丝"]),
        Element(number: 79, symbol: "Au", name: "金", period: 6, group: 11, category: .transition, examHeat: 1,
                examPoints: ["化学性质极稳定，「真金不怕火炼」"]),
        Element(number: 80, symbol: "Hg", name: "汞", period: 6, group: 12, category: .transition, examHeat: 1,
                examPoints: ["常温下唯一的液态金属", "温度计打碎撒硫粉处理：Hg + S → HgS"]),
        Element(number: 82, symbol: "Pb", name: "铅", period: 6, group: 14, category: .alkaliLike, examHeat: 1,
                examPoints: ["铅蓄电池电极材料", "重金属污染代表"]),
    ]
}
