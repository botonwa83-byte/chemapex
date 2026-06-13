import Foundation

// MARK: - 题库（一期：主线配套题）
// 诚信红线：不臆造真题出处；现象/颜色/条件必须准确。

enum ProblemBank {
    /// 全部题目 = 常规题 + 守恒之眼战例。
    static let all: [ChemProblem] = regular + DescentCases.all

    static func problems(for node: LearningNode) -> [ChemProblem] {
        node.problemIds.compactMap { id in all.first { $0.id == id } }
    }

    static func problems(topic: ChemTopic) -> [ChemProblem] {
        all.filter { $0.topic == topic }
    }

    // MARK: 常规题（分批声明，避免单个数组字面量过大拖慢类型检查）

    static let regular: [ChemProblem] = juniorBatch + seniorBatch1 + seniorBatch2 + expansionBatch + principlesBatch + elementsBatch

    private static let juniorBatch: [ChemProblem] = [

        // ===== N1 化学的眼睛 · 物质与变化 =====
        ChemProblem(
            id: "p_jr_01", stage: .junior, topic: .phenomena,
            content: "下列变化中，属于化学变化的是？",
            options: ["冰雪融化", "铁钉生锈", "酒精挥发", "玻璃破碎"],
            answerIndex: 1,
            explanation: "判断标准只有一条：有没有新物质生成。铁生锈生成了主要成分为 Fe₂O₃ 的新物质，是化学变化；其余三个只是状态或形状改变。",
            nodeId: "n01"),
        ChemProblem(
            id: "p_jr_02", stage: .junior, topic: .phenomena,
            content: "蜡烛燃烧实验中，下列属于「实验现象」描述错误的是？",
            options: ["发出黄白色火焰", "放出热量", "生成二氧化碳和水", "罩在火焰上方的干冷烧杯内壁出现水雾"],
            answerIndex: 2,
            explanation: "「生成二氧化碳和水」是实验结论而不是现象。现象是感官直接观察到的：火焰、放热、水雾、石灰水变浑浊。现象与结论的区分是初中实验题高频考点。",
            nodeId: "n01"),
        ChemProblem(
            id: "p_jr_03", stage: .junior, topic: .phenomena,
            content: "下列物质属于纯净物的是？",
            options: ["空气", "海水", "蒸馏水", "石灰石"],
            answerIndex: 2,
            explanation: "蒸馏水只含 H₂O 一种物质，是纯净物。空气、海水、石灰石都是混合物。注意：「冰水混合物」也是纯净物（都是 H₂O）——这是最经典的陷阱。",
            nodeId: "n01"),

        // ===== N2 质量守恒 · 第一把武器 =====
        ChemProblem(
            id: "p_jr_04", stage: .junior, topic: .massConservation,
            content: "化学反应前后，下列各项中一定不变的是：①原子种类 ②原子数目 ③分子数目 ④物质总质量 ⑤元素种类",
            options: ["①②③④", "①②④⑤", "②③④⑤", "①③④⑤"],
            answerIndex: 1,
            explanation: "化学反应的本质是原子重新组合：原子种类、数目不变 → 元素种类、总质量不变。分子数目可以变（如 2H₂ + O₂ → 2H₂O，3 个分子变 2 个）。",
            nodeId: "n02"),
        ChemProblem(
            id: "p_jr_05", stage: .junior, topic: .massConservation,
            content: "镁条在空气中燃烧后，生成物的质量比原来的镁条大。这是因为？",
            options: ["违反了质量守恒定律", "镁条结合了空气中的氧元素", "燃烧产生了能量转化为质量", "实验误差"],
            answerIndex: 1,
            explanation: "2Mg + O₂ →(点燃) 2MgO，生成物多出来的质量正是参加反应的氧气的质量。质量守恒要算「所有参加反应的物质」，包括看不见的气体。",
            nodeId: "n02"),
        ChemProblem(
            id: "p_jr_06", stage: .junior, topic: .massConservation,
            content: "4.6 g 某物质完全燃烧，生成 8.8 g CO₂ 和 5.4 g H₂O。该物质的元素组成是？",
            options: ["只含 C、H", "含 C、H、O", "只含 C、O", "无法确定"],
            answerIndex: 1,
            explanation: "8.8 g CO₂ 中碳元素 2.4 g，5.4 g H₂O 中氢元素 0.6 g，合计 3.0 g < 4.6 g，差的 1.6 g 只能来自该物质中的氧元素。用元素守恒「称」出看不见的氧——这就是守恒思想。",
            nodeId: "n02"),
    ]

    private static let seniorBatch1: [ChemProblem] = [

        // ===== N3 物质的量 · 化学的计数单位 =====
        ChemProblem(
            id: "p_sr_01", stage: .senior, topic: .mole,
            content: "0.5 mol H₂O 中含有的氢原子数约为？（Nᴀ ≈ 6.02×10²³ mol⁻¹）",
            options: ["3.01×10²³", "6.02×10²³", "1.204×10²⁴", "0.5×10²³"],
            answerIndex: 1,
            explanation: "1 个 H₂O 分子含 2 个 H 原子，所以 0.5 mol H₂O 含 H 原子 0.5×2 = 1 mol，即约 6.02×10²³ 个。先数「每个分子里有几个」，再乘物质的量。",
            nodeId: "n03"),
        ChemProblem(
            id: "p_sr_02", stage: .senior, topic: .mole,
            content: "下列说法正确的是？",
            options: ["1 mol 任何物质的体积都约为 22.4 L", "标准状况下，22.4 L CO₂ 约含 6.02×10²³ 个分子", "1 mol O₂ 的质量为 16 g", "标准状况下，22.4 L H₂O 的物质的量为 1 mol"],
            answerIndex: 1,
            explanation: "22.4 L/mol 有两个前提：①标准状况 ②气体。A 缺两个前提；D 中 H₂O 在标准状况下是液态，不适用；C 错在 1 mol O₂ 质量为 32 g。",
            nodeId: "n03"),
        ChemProblem(
            id: "p_sr_03", stage: .senior, topic: .mole,
            content: "配制 500 mL 0.1 mol/L 的 NaCl 溶液，需要称取 NaCl 的质量为？（M = 58.5 g/mol）",
            options: ["5.85 g", "2.9 g", "29.25 g", "0.585 g"],
            answerIndex: 1,
            explanation: "n = cV = 0.1 mol/L × 0.5 L = 0.05 mol，m = nM = 0.05 × 58.5 ≈ 2.9 g。注意体积要换算成升，且用的是溶液体积而不是水的体积。",
            nodeId: "n03"),

        // ===== N4 离子反应 · 看见溶液的真实 =====
        ChemProblem(
            id: "p_sr_04", stage: .senior, topic: .ionReaction,
            content: "下列离子方程式书写正确的是？",
            options: ["稀盐酸与石灰石：CO₃²⁻ + 2H⁺ → H₂O + CO₂↑", "钠与水：2Na + 2H₂O → 2Na⁺ + 2OH⁻ + H₂↑", "氢氧化铜与盐酸：OH⁻ + H⁺ → H₂O", "铁与稀盐酸：2Fe + 6H⁺ → 2Fe³⁺ + 3H₂↑"],
            answerIndex: 1,
            explanation: "A 错：CaCO₃ 难溶，必须写化学式；C 错：Cu(OH)₂ 难溶，必须写化学式；D 错：铁与非氧化性稀酸反应生成 Fe²⁺ 而不是 Fe³⁺。「难溶物写化学式」和「Fe²⁺/Fe³⁺」是两大高频陷阱。",
            nodeId: "n04"),
        ChemProblem(
            id: "p_sr_05", stage: .senior, topic: .ionReaction,
            content: "在无色透明的强酸性溶液中，能大量共存的离子组是？",
            options: ["Na⁺、K⁺、CO₃²⁻、NO₃⁻", "K⁺、Na⁺、Cl⁻、SO₄²⁻", "Cu²⁺、Na⁺、Cl⁻、NO₃⁻", "Na⁺、K⁺、HCO₃⁻、Cl⁻"],
            answerIndex: 1,
            explanation: "强酸性 → 大量 H⁺：CO₃²⁻、HCO₃⁻ 都会与 H⁺ 反应放出 CO₂，排除 A、D；「无色」排除 Cu²⁺（蓝色），排除 C。审题三件套：颜色、酸碱性、离子间反应。",
            nodeId: "n04"),
        ChemProblem(
            id: "p_sr_06", stage: .senior, topic: .ionReaction,
            content: "下列物质属于电解质的是？",
            options: ["铜", "蔗糖", "氯化钠", "盐酸"],
            answerIndex: 2,
            explanation: "电解质必须是「化合物」：铜是单质，盐酸是混合物（HCl 的水溶液），都不在讨论范围；蔗糖是化合物但水溶液和熔融态都不导电，是非电解质；NaCl 是电解质。",
            nodeId: "n04"),

        // ===== N5 氧化还原 · 电子的转移 =====
        ChemProblem(
            id: "p_sr_07", stage: .senior, topic: .redox,
            content: "MnO₂ + 4HCl(浓) →(Δ) MnCl₂ + Cl₂↑ + 2H₂O 反应中，氧化剂是？",
            options: ["HCl", "MnO₂", "Cl₂", "MnCl₂"],
            answerIndex: 1,
            explanation: "Mn 从 +4 降到 +2，得电子被还原，所以 MnO₂ 是氧化剂；部分 Cl 从 −1 升到 0，HCl 是还原剂。口诀：化合价降低的物质是氧化剂（降·得·还原反应）。",
            nodeId: "n05"),
        ChemProblem(
            id: "p_sr_08", stage: .senior, topic: .redox,
            content: "上述反应（MnO₂ + 4HCl(浓)）中，被氧化的 HCl 占参加反应 HCl 的比例是？",
            options: ["全部", "1/2", "1/4", "3/4"],
            answerIndex: 1,
            explanation: "4 mol HCl 中只有 2 mol 变成了 Cl₂（被氧化），另外 2 mol 以 Cl⁻ 形式留在 MnCl₂ 中只起酸的作用。「部分被氧化」是氧化还原计算的经典考法。",
            nodeId: "n05"),
        ChemProblem(
            id: "p_sr_09", stage: .senior, topic: .redox,
            content: "下列反应中，水作氧化剂的是？",
            options: ["2Na + 2H₂O → 2NaOH + H₂↑", "Cl₂ + H₂O ⇌ HCl + HClO", "CO₂ + H₂O → H₂CO₃", "Na₂O + H₂O → 2NaOH"],
            answerIndex: 0,
            explanation: "A 中 H 从 +1 降到 0（H₂），水得电子被还原，是氧化剂。B 中是 Cl₂ 自身歧化，水既不是氧化剂也不是还原剂；C、D 不是氧化还原反应（无化合价变化）。",
            nodeId: "n05"),

        // ===== N6 金属王国 · Na/Al/Fe =====
        ChemProblem(
            id: "p_sr_10", stage: .senior, topic: .metals,
            content: "钠与水反应的实验现象，下列描述错误的是？",
            options: ["钠浮在水面上", "熔成闪亮的小球", "小球四处游动并发出嘶嘶声", "钠沉入水底剧烈反应"],
            answerIndex: 3,
            explanation: "钠的密度比水小，浮在水面——「浮、熔、游、响、红（酚酞变红）」五字现象。密度关系是判断依据：ρ(Na) ≈ 0.97 g/cm³ < 水。",
            nodeId: "na"),
        ChemProblem(
            id: "p_sr_11", stage: .senior, topic: .metals,
            content: "向 AlCl₃ 溶液中逐滴加入 NaOH 溶液直至过量，观察到的现象是？",
            options: ["立即产生白色沉淀且不消失", "先产生白色沉淀，后沉淀逐渐溶解", "无明显现象", "产生红褐色沉淀"],
            answerIndex: 1,
            explanation: "先 Al³⁺ + 3OH⁻ → Al(OH)₃↓（白色），NaOH 过量后 Al(OH)₃ + OH⁻ → AlO₂⁻ + 2H₂O，沉淀溶解。Al(OH)₃ 的两性是「少量/过量」分岔的代表考点。",
            nodeId: "al"),
        ChemProblem(
            id: "p_sr_12", stage: .senior, topic: .metals,
            content: "检验溶液中含有 Fe³⁺，最常用的试剂和现象是？",
            options: ["加 NaOH，产生白色沉淀", "加 KSCN 溶液，溶液变血红色", "加盐酸，产生气泡", "加石蕊，溶液变蓝"],
            answerIndex: 1,
            explanation: "Fe³⁺ 遇 KSCN 变血红色，灵敏且专属。注意对比：Fe²⁺ 加 KSCN 无现象，再滴氯水变红——这是检验 Fe²⁺ 的标准流程。加 NaOH 得到的是红褐色 Fe(OH)₃ 沉淀（A 选项颜色就错了）。",
            nodeId: "fe"),
    ]

    private static let seniorBatch2: [ChemProblem] = [

        // ===== N7 非金属群雄 · Cl/S/N/Si =====
        ChemProblem(
            id: "p_sr_13", stage: .senior, topic: .nonmetals,
            content: "新制氯水能使湿润的有色布条褪色，起漂白作用的微粒是？",
            options: ["Cl₂", "HClO", "Cl⁻", "H⁺"],
            answerIndex: 1,
            explanation: "干燥的 Cl₂ 不能漂白干燥布条；Cl₂ + H₂O ⇌ HCl + HClO，真正起漂白作用的是次氯酸 HClO 的强氧化性。「干氯气不漂白」是实验题经典对照。",
            nodeId: "cl"),
        ChemProblem(
            id: "p_sr_14", stage: .senior, topic: .nonmetals,
            content: "把浓硫酸滴到蔗糖上，蔗糖变黑并膨胀。变黑主要体现浓硫酸的？",
            options: ["吸水性", "脱水性", "强酸性", "难挥发性"],
            answerIndex: 1,
            explanation: "脱水性是把有机物中的 H、O 按 2:1 「夺」出来，碳被剩下（炭化）；吸水性是吸收现成的水分子（作干燥剂）。两者一字之差，年年考。",
            nodeId: "s"),
        ChemProblem(
            id: "p_sr_15", stage: .senior, topic: .nonmetals,
            content: "实验室制取氨气，应选用的干燥剂是？",
            options: ["浓硫酸", "无水氯化钙", "碱石灰", "五氧化二磷"],
            answerIndex: 2,
            explanation: "NH₃ 是碱性气体：浓硫酸、P₂O₅ 是酸性干燥剂会与之反应；CaCl₂ 会与 NH₃ 结合生成 CaCl₂·8NH₃，也不能用。只能选碱性的碱石灰。干燥剂选择 = 酸碱配对。",
            nodeId: "n"),

        // ===== N8 周期律 · 星图的密码 =====
        ChemProblem(
            id: "p_sr_16", stage: .senior, topic: .periodicLaw,
            content: "同一周期主族元素从左到右（稀有气体除外），下列说法正确的是？",
            options: ["原子半径逐渐增大", "非金属性逐渐增强", "最高正化合价逐渐降低", "金属性逐渐增强"],
            answerIndex: 1,
            explanation: "同周期从左到右：核电荷数增大、半径减小、得电子能力增强 → 非金属性增强、金属性减弱，最高正价从 +1 升到 +7（O、F 除外）。",
            nodeId: "n08"),
        ChemProblem(
            id: "p_sr_17", stage: .senior, topic: .periodicLaw,
            content: "下列酸性强弱比较正确的是？",
            options: ["H₃PO₄ > H₂SO₄ > HClO₄", "HClO₄ > H₂SO₄ > H₃PO₄", "H₂SO₄ > HClO₄ > H₃PO₄", "三者酸性相同"],
            answerIndex: 1,
            explanation: "非金属性 Cl > S > P，对应最高价氧化物的水化物酸性 HClO₄ > H₂SO₄ > H₃PO₄。注意限定词「最高价」：HClO 是弱酸，不能用来比较非金属性。",
            nodeId: "n08"),

        // ===== N9 反应与能量 · 速率与平衡 =====
        ChemProblem(
            id: "p_sr_18", stage: .senior, topic: .energy,
            content: "下列属于吸热反应的是？",
            options: ["甲烷燃烧", "盐酸与 NaOH 中和", "Ba(OH)₂·8H₂O 与 NH₄Cl 固体反应", "铝热反应"],
            answerIndex: 2,
            explanation: "Ba(OH)₂·8H₂O 与 NH₄Cl 是中学唯一要求记住的常温自发吸热反应（烧杯下木板会被冻住）。燃烧、中和、铝热都是典型放热反应。",
            nodeId: "p1"),
        ChemProblem(
            id: "p_sr_19", stage: .senior, topic: .equilibrium,
            content: "恒温恒容下，N₂ + 3H₂ ⇌ 2NH₃。能说明反应已达平衡状态的是？",
            options: ["N₂、H₂、NH₃ 的浓度之比为 1:3:2", "单位时间内消耗 1 mol N₂ 同时生成 2 mol NH₃", "混合气体的平均摩尔质量不再变化", "反应完全停止"],
            answerIndex: 2,
            explanation: "该反应前后气体分子数变化（4→2），恒容下总质量不变、总物质的量在变，平均摩尔质量是「变量」——变量不变即平衡。A 是任意时刻都可能的比例；B 是同方向速率；D 平衡是动态的。",
            nodeId: "p3"),

        // ===== N10 水溶液 · 离子平衡 =====
        ChemProblem(
            id: "p_sr_20", stage: .senior, topic: .solution,
            content: "常温下，pH = 3 的盐酸中 c(H⁺) 为？",
            options: ["3 mol/L", "10⁻³ mol/L", "10⁻¹¹ mol/L", "10³ mol/L"],
            answerIndex: 1,
            explanation: "pH = −lg c(H⁺)，pH = 3 即 c(H⁺) = 10⁻³ mol/L。顺手记：常温下 c(H⁺)·c(OH⁻) = 10⁻¹⁴，所以此溶液 c(OH⁻) = 10⁻¹¹ mol/L。",
            nodeId: "p4"),
        ChemProblem(
            id: "p_sr_21", stage: .senior, topic: .solution,
            content: "常温下，浓度均为 0.1 mol/L 的盐酸和醋酸，下列说法正确的是？",
            options: ["两者 pH 相同", "醋酸的 pH 更大", "盐酸的 pH 更大", "两者 c(H⁺) 相同"],
            answerIndex: 1,
            explanation: "盐酸完全电离，c(H⁺) = 0.1 mol/L，pH = 1；醋酸是弱酸只部分电离，c(H⁺) < 0.1 mol/L，pH > 1。「同浓度比电离、同 pH 比储备」是强弱酸对比的纲。",
            nodeId: "p4"),

        // ===== N11 电化学 · 电子的迁徙 =====
        ChemProblem(
            id: "p_sr_22", stage: .senior, topic: .electrochem,
            content: "铜锌原电池（稀硫酸作电解质溶液）中，负极及其反应类型是？",
            options: ["铜，氧化反应", "锌，氧化反应", "锌，还原反应", "铜，还原反应"],
            answerIndex: 1,
            explanation: "活泼金属锌作负极，失电子被氧化：Zn − 2e⁻ → Zn²⁺；铜是正极，H⁺ 在其表面得电子放出 H₂。口诀：负失氧（负极·失电子·氧化反应）。",
            nodeId: "p7"),
        ChemProblem(
            id: "p_sr_23", stage: .senior, topic: .electrochem,
            content: "电解饱和食盐水时，阴极上的产物是？",
            options: ["Cl₂", "O₂", "H₂", "Na"],
            answerIndex: 2,
            explanation: "阴极发生还原反应，H₂O 得电子放出 H₂（同时生成 OH⁻）；阳极放出 Cl₂。注意水溶液中 Na⁺ 不会在阴极放电析出钠——制金属钠要电解熔融 NaCl。",
            nodeId: "p8"),

        // ===== N12 有机入门 · 碳的王国 =====
        ChemProblem(
            id: "p_sr_24", stage: .senior, topic: .organic,
            content: "甲烷与氯气在光照条件下发生反应，该反应类型是？",
            options: ["加成反应", "取代反应", "氧化反应", "聚合反应"],
            answerIndex: 1,
            explanation: "CH₄ 中的 H 被 Cl 逐个「替换」生成 CH₃Cl、CH₂Cl₂ 等，是取代反应。加成是不饱和键「加上去」（如乙烯使溴水褪色），取代是「换下来」——一加一换，本质不同。",
            nodeId: "n12"),
        ChemProblem(
            id: "p_sr_25", stage: .senior, topic: .organic,
            content: "鉴别甲烷和乙烯，最简便的方法是分别通入？",
            options: ["澄清石灰水", "溴的四氯化碳溶液", "蒸馏水", "氢氧化钠溶液"],
            answerIndex: 1,
            explanation: "乙烯含碳碳双键，能与 Br₂ 发生加成使溴的 CCl₄ 溶液褪色，甲烷不能。酸性高锰酸钾也可鉴别（乙烯使其褪色），但会把乙烯氧化成 CO₂，不能用于「除杂」——鉴别与除杂的试剂选择经常对比考。",
            nodeId: "n12"),

        // ===== 结构之眼（竞赛预告） =====
        ChemProblem(
            id: "p_oly_01", stage: .olympiad, topic: .structure,
            content: "基态碳原子（C，原子序数 6）的电子排布式是？",
            options: ["1s²2s²2p²", "1s²2s⁴", "1s²2p⁴", "1s⁴2s²"],
            answerIndex: 0,
            explanation: "按能量最低原理依次填充：1s² → 2s² → 2p²。每个 s 能级最多 2 个电子，2p² 的两个电子按洪特规则分占两个轨道且自旋平行。这是结构化学的入口。",
            nodeId: "n13"),
    ]

    // MARK: 覆盖补强批次（酸碱盐 / 实验 / 热化学 / 水解 / 酯化）

    private static let expansionBatch: [ChemProblem] = [

        // ===== 酸碱盐 · 物质的家谱（初中） =====
        ChemProblem(
            id: "p_jr_07", stage: .junior, topic: .acidBaseSalt,
            content: "下列物质能使紫色石蕊试液变红的是？",
            options: ["NaOH 溶液", "稀盐酸", "食盐水", "蒸馏水"],
            answerIndex: 1,
            explanation: "石蕊遇酸变红、遇碱变蓝；酚酞遇碱变红、遇酸不变色。「酸红碱蓝」是指示剂的基本功，食盐水和蒸馏水呈中性，不变色。",
            nodeId: "n02x"),
        ChemProblem(
            id: "p_jr_08", stage: .junior, topic: .acidBaseSalt,
            content: "下列金属中，能与稀盐酸反应放出氢气的是？",
            options: ["铜", "银", "铁", "金"],
            answerIndex: 2,
            explanation: "金属活动性顺序中排在氢前面的金属才能置换出酸中的氢。铁排在氢前，铜、银、金都在氢后。「氢前置换氢」是判断依据。",
            nodeId: "n02x"),
        ChemProblem(
            id: "p_jr_09", stage: .junior, topic: .acidBaseSalt,
            content: "下列两种溶液混合后，能发生复分解反应的是？",
            options: ["NaCl 与 KNO₃", "BaCl₂ 与 Na₂SO₄", "NaOH 与 KCl", "稀盐酸与 Na₂SO₄"],
            answerIndex: 1,
            explanation: "复分解反应发生的条件：生成沉淀、气体或水（至少其一）。BaCl₂ + Na₂SO₄ → BaSO₄↓（白色沉淀）+ 2NaCl 满足条件；其余组合交换成分后没有沉淀、气体或水生成。",
            nodeId: "n02x"),

        // ===== 化学实验 · 真理的裁判所（高中） =====
        ChemProblem(
            id: "p_exp_01", stage: .senior, topic: .experiment,
            content: "从碘水中提取碘单质，应选用的分离操作是？",
            options: ["过滤", "蒸发结晶", "加 CCl₄ 萃取后分液", "直接蒸馏"],
            answerIndex: 2,
            explanation: "碘在 CCl₄ 中的溶解度远大于在水中，且 CCl₄ 与水互不相溶——满足萃取剂两条件。萃取后分液，下层紫红色为碘的 CCl₄ 溶液。过滤分离固液、蒸馏分离沸点不同的互溶液体，都不适用。",
            nodeId: "n12x"),
        ChemProblem(
            id: "p_exp_02", stage: .senior, topic: .experiment,
            content: "检验某溶液中含有 SO₄²⁻，正确的操作顺序是？",
            options: ["直接加 BaCl₂ 溶液，看是否有白色沉淀", "先加足量稀盐酸无明显现象，再加 BaCl₂ 溶液，产生白色沉淀", "先加稀硝酸，再加 AgNO₃ 溶液", "加 NaOH 溶液并加热"],
            answerIndex: 1,
            explanation: "直接加 BaCl₂ 无法排除 CO₃²⁻、SO₃²⁻、Ag⁺ 的干扰（它们也生成白色沉淀）。先加足量稀盐酸：排除上述干扰离子且无沉淀生成，再加 BaCl₂ 出现白色沉淀，才能确认 SO₄²⁻。「先排干扰，再下结论」是检验题的总原则。",
            nodeId: "n12x"),
        ChemProblem(
            id: "p_exp_03", stage: .senior, topic: .experiment,
            content: "下列气体中，只能用排水法收集的是？",
            options: ["NH₃", "NO", "NO₂", "HCl"],
            answerIndex: 1,
            explanation: "NO 难溶于水但遇空气立即被氧化成 NO₂，不能排空气，只能排水收集。NH₃、HCl 极易溶于水不能排水；NO₂ 与水反应（3NO₂ + H₂O → 2HNO₃ + NO）也不能排水。收集方法 = 溶解性 + 密度 + 是否与水/空气反应三重判断。",
            nodeId: "n12x"),

        // ===== 热化学 / 水解 / 酯化（补强既有节点） =====
        ChemProblem(
            id: "p_sr_26", stage: .senior, topic: .energy,
            content: "已知氢气的燃烧热为 285.8 kJ/mol，下列热化学方程式书写正确的是？",
            options: ["2H₂ + O₂ = 2H₂O　ΔH = −571.6 kJ/mol", "H₂(g) + ½O₂(g) = H₂O(g)　ΔH = −285.8 kJ/mol", "H₂(g) + ½O₂(g) = H₂O(l)　ΔH = −285.8 kJ/mol", "H₂(g) + ½O₂(g) = H₂O(l)　ΔH = +285.8 kJ/mol"],
            answerIndex: 2,
            explanation: "热化学方程式三查：①标聚集态（g/l/s）②ΔH 带正负号 ③燃烧热对应生成液态水。A 缺聚集态；B 错在生成气态水（燃烧热定义要求稳定氧化物，水为液态）；D 放热反应 ΔH 应为负。",
            nodeId: "p1"),
        ChemProblem(
            id: "p_sr_27", stage: .senior, topic: .solution,
            content: "常温下 0.1 mol/L Na₂CO₃ 溶液显碱性，其主要原因是？",
            options: ["Na⁺ 发生水解", "CO₃²⁻ 结合水电离出的 H⁺，使 c(OH⁻) > c(H⁺)", "Na₂CO₃ 电离出 OH⁻", "溶液中没有 H⁺"],
            answerIndex: 1,
            explanation: "CO₃²⁻ 是弱酸根，发生水解：CO₃²⁻ + H₂O ⇌ HCO₃⁻ + OH⁻，消耗 H⁺、积累 OH⁻，溶液显碱性。口诀「有弱才水解，谁强显谁性」；Na⁺ 是强碱阳离子不水解；盐本身不电离出 OH⁻。",
            nodeId: "p5"),
        ChemProblem(
            id: "p_sr_28", stage: .senior, topic: .organic,
            content: "实验室制乙酸乙酯（乙酸 + 乙醇，浓硫酸共热），浓硫酸的作用是？",
            options: ["只作催化剂", "只作吸水剂", "催化剂和吸水剂", "氧化剂"],
            answerIndex: 2,
            explanation: "酯化反应可逆：CH₃COOH + C₂H₅OH ⇌ CH₃COOC₂H₅ + H₂O。浓硫酸既加快反应（催化剂），又吸收生成的水使平衡正移（吸水剂），一身二职。另注意：导管不能插入饱和碳酸钠溶液液面以下（防倒吸）。",
            nodeId: "n12"),

        // ===== 阶段 A 补全（周期律 / 电化学应用 / 有机检验 / 结构） =====
        ChemProblem(
            id: "p_sr_29", stage: .senior, topic: .periodicLaw,
            content: "锂、钠、钾分别与水反应，剧烈程度的变化规律是？",
            options: ["依次减弱", "依次增强", "先增强后减弱", "完全相同"],
            answerIndex: 1,
            explanation: "同主族从上到下金属性增强：Li 与水反应缓慢，Na 熔成小球四处游动，K 反应剧烈甚至燃烧（紫色火焰）。「同主族向下越来越猛」是周期律最直观的体现。",
            nodeId: "n08"),
        ChemProblem(
            id: "p_sr_30", stage: .senior, topic: .electrochem,
            content: "钢铁在潮湿的中性环境中主要发生吸氧腐蚀，其正极反应式是？",
            options: ["2H⁺ + 2e⁻ → H₂↑", "O₂ + 2H₂O + 4e⁻ → 4OH⁻", "Fe − 2e⁻ → Fe²⁺", "Fe − 3e⁻ → Fe³⁺"],
            answerIndex: 1,
            explanation: "中性/弱酸性潮湿环境下是吸氧腐蚀：正极上 O₂ 得电子；负极 Fe − 2e⁻ → Fe²⁺（注意是 +2 价）。析氢腐蚀（A）只在较强酸性环境发生。C 是负极反应不是正极。",
            nodeId: "p8"),
        ChemProblem(
            id: "p_sr_31", stage: .senior, topic: .organic,
            content: "检验某有机物中含有醛基，最合适的方法是？",
            options: ["加 NaOH 溶液，观察是否变色", "加入银氨溶液，水浴加热，看是否出现光亮银镜", "加入 NaCl 溶液，看是否有沉淀", "滴入酚酞，看是否变红"],
            answerIndex: 1,
            explanation: "醛基的两大检验法：①银氨溶液水浴加热出银镜 ②新制 Cu(OH)₂ 加热出砖红色 Cu₂O 沉淀。两者都利用醛基的还原性。注意操作细节：银镜反应必须水浴，不能直接加热。",
            nodeId: "n12"),
        ChemProblem(
            id: "p_oly_02", stage: .olympiad, topic: .structure,
            content: "下列分子中，中心原子采取 sp 杂化的是？",
            options: ["CH₄", "NH₃", "CO₂", "H₂O"],
            answerIndex: 2,
            explanation: "CO₂ 直线形，碳原子 2 个 σ 键、无孤对电子，sp 杂化。CH₄（4 个 σ 键）、NH₃（3 σ + 1 孤对）、H₂O（2 σ + 2 孤对）都是 sp³ 杂化。判断口诀：σ 键数 + 孤对数 = 2 是 sp、3 是 sp²、4 是 sp³。",
            nodeId: "n13"),
        ChemProblem(
            id: "p_oly_03", stage: .olympiad, topic: .structure,
            content: "下列晶体熔化时，只需克服分子间作用力的是？",
            options: ["NaCl", "金刚石", "干冰", "铁"],
            answerIndex: 2,
            explanation: "干冰（固态 CO₂）是分子晶体，熔化只破坏分子间作用力，所以熔点极低。NaCl 是离子晶体（破坏离子键）、金刚石是共价晶体（破坏共价键）、铁是金属晶体（破坏金属键）。熔沸点大致：共价 > 离子/金属 > 分子。",
            nodeId: "n13"),

        // ===== 选必3 有机拓展（醛酮酚 / 营养物质） =====
        ChemProblem(
            id: "p_sr_35", stage: .senior, topic: .organic,
            content: "下列试剂能一次性区别乙醇、乙醛、苯酚三种无色液体的是？",
            options: ["紫色石蕊试液", "FeCl₃ 溶液", "新制 Cu(OH)₂ 悬浊液并加热", "NaOH 溶液"],
            answerIndex: 2,
            explanation: "新制 Cu(OH)₂ 加热：乙醛含醛基生成砖红色 Cu₂O 沉淀；苯酚显弱酸性，常温即溶解蓝色 Cu(OH)₂（或不现砖红）；乙醇无明显变化——三者现象各异，一次区别。FeCl₃ 只能挑出苯酚（显紫色），区分不了乙醇和乙醛。",
            nodeId: "n12"),
        ChemProblem(
            id: "p_sr_36", stage: .senior, topic: .organic,
            content: "关于糖类、油脂、蛋白质的说法正确的是？",
            options: ["淀粉和纤维素互为同分异构体", "油脂都是高分子化合物", "蛋白质遇浓硝酸变黄是变性引起的颜色反应", "葡萄糖和蔗糖都能发生银镜反应"],
            answerIndex: 2,
            explanation: "蛋白质遇浓硝酸变黄是含苯环结构的颜色反应（常用于鉴别）。淀粉、纤维素通式同为 (C₆H₁₀O₅)ₙ 但 n 不同、相对分子质量不同，不是同分异构体；油脂是小分子不是高分子；蔗糖无醛基不能直接银镜（葡萄糖可以）。",
            nodeId: "n12"),

        // ===== 阶段 A 续（胶体 / 氧化性比较 / 金属冶炼） =====
        ChemProblem(
            id: "p_sr_32", stage: .senior, topic: .ionReaction,
            content: "区别 Fe(OH)₃ 胶体和 FeCl₃ 溶液，最简单的方法是？",
            options: ["观察颜色", "用一束光照射，看有无光亮通路", "加热蒸发", "测定导电性"],
            answerIndex: 1,
            explanation: "丁达尔效应：胶体粒子（1~100 nm）对光散射形成光亮通路，溶液没有。两者都可能呈红棕/黄色，颜色不可靠；丁达尔效应是区分胶体与溶液的标准方法。",
            nodeId: "n04"),
        ChemProblem(
            id: "p_sr_33", stage: .senior, topic: .redox,
            content: "已知反应 2FeCl₃ + Cu → 2FeCl₂ + CuCl₂ 能自发进行，由此可判断氧化性强弱为？",
            options: ["Cu²⁺ > Fe³⁺", "Fe³⁺ > Cu²⁺", "Fe²⁺ > Cu²⁺", "无法判断"],
            answerIndex: 1,
            explanation: "同一反应中氧化性：氧化剂 > 氧化产物。此反应中 Fe³⁺ 是氧化剂、Cu²⁺ 是氧化产物，故 Fe³⁺ > Cu²⁺。这正是 FeCl₃ 溶液能刻蚀铜电路板的原因。",
            nodeId: "n05"),
        ChemProblem(
            id: "p_sr_34", stage: .senior, topic: .metals,
            content: "工业上冶炼金属铝采用的方法是？",
            options: ["用 CO 还原氧化铝", "电解熔融氯化铝", "电解熔融氧化铝（加冰晶石）", "电解氯化铝溶液"],
            answerIndex: 2,
            explanation: "铝活动性强，只能电解熔融化合物冶炼。但不能选 AlCl₃——它是共价化合物，熔融态不导电；电解溶液阴极只会析出 H₂。工业电解熔融 Al₂O₃，加冰晶石降低熔点。「三连坑」全在选项里。",
            nodeId: "al"),
    ]
}
