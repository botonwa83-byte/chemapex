import Foundation

// MARK: - 题库分批：初中补全（空气氧气水/微观世界/碳的氧化物/金属材料/溶液）
// 中考主战场。红线：现象/数据/概念符合人教初中教材。

extension ProblemBank {
    static let juniorExtraBatch: [ChemProblem] = airBatch + microBatch
        + carbonBatch + metalBatch + solutionBatch

    // MARK: 空气·氧气·水

    private static let airBatch: [ChemProblem] = [
        ChemProblem(
            id: "p_jr_air1", stage: .junior, topic: .phenomena,
            content: "空气中体积分数约为 21% 的气体是？",
            options: ["氮气", "氧气", "二氧化碳", "稀有气体"],
            answerIndex: 1,
            explanation: "空气主要成分（按体积）：氮气约 78%、氧气约 21%、稀有气体约 0.94%、二氧化碳约 0.03%。氧气能供给呼吸、支持燃烧。",
            nodeId: "jr_air"),
        ChemProblem(
            id: "p_jr_air2", stage: .junior, topic: .phenomena,
            content: "检验一瓶气体是否是氧气，正确的方法是？",
            options: ["闻气味", "用燃着的木条", "用带火星的木条，若复燃则是氧气", "倒入澄清石灰水"],
            answerIndex: 2,
            explanation: "氧气支持燃烧但本身不燃烧，用带火星的木条伸入，若复燃则证明是氧气。这是检验氧气的标准方法。燃着的木条用于检验是否为可燃性气体或能否支持燃烧。",
            nodeId: "jr_air"),
        ChemProblem(
            id: "p_jr_air3", stage: .junior, topic: .phenomena,
            content: "实验室用过氧化氢溶液制氧气时加入二氧化锰，二氧化锰的作用是？",
            options: ["反应物", "催化剂", "生成物", "溶剂"],
            answerIndex: 1,
            explanation: "2H₂O₂ →(MnO₂) 2H₂O + O₂↑，MnO₂ 作催化剂，加快反应速率，自身质量和化学性质在反应前后不变。注意 MnO₂ 在制氯气时是氧化剂、制氧气时是催化剂，角色不同。",
            nodeId: "jr_air"),
        ChemProblem(
            id: "p_jr_air4", stage: .junior, topic: .phenomena,
            content: "电解水实验中，正极和负极产生气体的体积比约为？",
            options: ["1:2", "2:1", "1:1", "8:1"],
            answerIndex: 0,
            explanation: "电解水 2H₂O →(通电) 2H₂↑ + O₂↑，负极产生氢气、正极产生氧气，体积比 H₂:O₂ = 2:1，故正极:负极 = O₂:H₂ = 1:2。口诀「正氧负氢，氢二氧一」。该实验证明水由氢、氧元素组成。",
            nodeId: "jr_air"),
        ChemProblem(
            id: "p_jr_air5", stage: .junior, topic: .phenomena,
            content: "氢气是理想的清洁能源，下列关于氢气的说法正确的是？",
            options: ["氢气密度比空气大", "氢气燃烧产物是水，无污染", "氢气不可燃", "点燃氢气前不需验纯"],
            answerIndex: 1,
            explanation: "2H₂+O₂→(点燃)2H₂O，氢气燃烧只生成水，无污染、热值高，是理想清洁能源。氢气是最轻的气体（密度比空气小），可燃，点燃前必须验纯（不纯遇明火可能爆炸）。",
            nodeId: "jr_air"),
        ChemProblem(
            id: "p_jr_air6", stage: .junior, topic: .phenomena,
            content: "下列物质中属于混合物的是？",
            options: ["液氧", "净化后的空气", "蒸馏水", "氯酸钾"],
            answerIndex: 1,
            explanation: "空气由氮气、氧气等多种成分组成，是混合物。液氧（只含 O₂）、蒸馏水（只含 H₂O）、氯酸钾（KClO₃）都是纯净物。区分纯净物与混合物看「是否只含一种物质」。",
            nodeId: "jr_air"),
    ]

    // MARK: 微观世界（分子原子元素化学式化合价）

    private static let microBatch: [ChemProblem] = [
        ChemProblem(
            id: "p_jr_mic1", stage: .junior, topic: .phenomena,
            content: "在化学变化中，下列说法正确的是？",
            options: ["分子和原子都不可再分", "分子可分，原子不可再分", "原子可分，分子不可再分", "分子和原子都可再分成更小粒子"],
            answerIndex: 1,
            explanation: "在化学变化中，分子可以分成原子，原子重新组合成新分子——原子是化学变化中的最小粒子，不可再分。这是「分子、原子」概念的核心区别。",
            nodeId: "jr_micro"),
        ChemProblem(
            id: "p_jr_mic2", stage: .junior, topic: .phenomena,
            content: "决定元素种类的是原子的？",
            options: ["中子数", "质子数（核电荷数）", "电子数", "相对原子质量"],
            answerIndex: 1,
            explanation: "质子数（核电荷数）决定元素种类，质子数相同的原子属于同种元素。中子数不同则是同位素；得失电子变成离子但元素种类不变。原子中：质子数 = 核电荷数 = 核外电子数。",
            nodeId: "jr_micro"),
        ChemProblem(
            id: "p_jr_mic3", stage: .junior, topic: .phenomena,
            content: "某原子的质子数为 11、中子数为 12，则该原子的核外电子数为？",
            options: ["11", "12", "23", "1"],
            answerIndex: 0,
            explanation: "原子是电中性的，核外电子数 = 质子数 = 11（该元素是钠）。相对原子质量 ≈ 质子数 + 中子数 = 11+12 = 23。注意电子数等于质子数仅对中性原子成立。",
            nodeId: "jr_micro"),
        ChemProblem(
            id: "p_jr_mic4", stage: .junior, topic: .phenomena,
            content: "化学式 H₂SO₄ 中，数字「2」表示的意义是？",
            options: ["2 个硫酸分子", "1 个硫酸分子中含 2 个氢原子", "2 个氢元素", "硫酸的化合价为 2"],
            answerIndex: 1,
            explanation: "化学式中元素符号右下角的数字表示一个分子中该原子的个数，H₂SO₄ 中的「2」表示 1 个硫酸分子含 2 个氢原子。若在化学式前面写系数（如 2H₂SO₄）才表示分子个数。",
            nodeId: "jr_micro"),
        ChemProblem(
            id: "p_jr_mic5", stage: .junior, topic: .phenomena,
            content: "在化合物 Fe₂O₃ 中，铁元素的化合价为？（O 为 −2 价）",
            options: ["+2", "+3", "+6", "0"],
            answerIndex: 1,
            explanation: "化合物中各元素正负化合价代数和为零。设 Fe 化合价为 x：2x + 3×(−2) = 0，解得 x = +3。化合价规则是书写化学式、配平的基础工具。",
            nodeId: "jr_micro"),
        ChemProblem(
            id: "p_jr_mic6", stage: .junior, topic: .phenomena,
            content: "水（H₂O）的相对分子质量为？（H 相对原子质量 1，O 为 16）",
            options: ["17", "18", "16", "20"],
            answerIndex: 1,
            explanation: "相对分子质量 = 各原子相对原子质量之和 = 1×2 + 16 = 18。相对分子质量用于计算物质中各元素的质量比和质量分数，是化学计算的基础。",
            nodeId: "jr_micro"),
    ]

    // MARK: 碳和碳的氧化物

    private static let carbonBatch: [ChemProblem] = [
        ChemProblem(
            id: "p_jr_c1", stage: .junior, topic: .phenomena,
            content: "金刚石、石墨和 C₆₀ 都是由碳元素组成的单质，它们物理性质差异大的原因是？",
            options: ["碳原子种类不同", "碳原子的排列方式不同", "它们含有杂质", "它们是化合物"],
            answerIndex: 1,
            explanation: "金刚石（很硬）、石墨（很软、导电）、C₆₀ 都由碳元素组成，互为同素异形体，因碳原子排列方式不同而物理性质差异巨大。同素异形体是同种元素形成的不同单质。",
            nodeId: "jr_carbon"),
        ChemProblem(
            id: "p_jr_c2", stage: .junior, topic: .phenomena,
            content: "木炭还原氧化铜的反应 C + 2CuO →(高温) 2Cu + CO₂↑ 中，碳表现出？",
            options: ["氧化性", "还原性", "可燃性", "稳定性"],
            answerIndex: 1,
            explanation: "碳夺取 CuO 中的氧、把铜还原出来，自身被氧化成 CO₂，表现还原性。黑色 CuO 变红色铜、生成使石灰水变浑浊的气体是现象。碳的还原性还用于工业炼铁。",
            nodeId: "jr_carbon"),
        ChemProblem(
            id: "p_jr_c3", stage: .junior, topic: .phenomena,
            content: "二氧化碳能用于灭火，主要利用的性质是？",
            options: ["CO₂ 有毒", "CO₂ 不能燃烧也不支持燃烧，且密度比空气大", "CO₂ 能与水反应", "CO₂ 能使石灰水变浑浊"],
            answerIndex: 1,
            explanation: "CO₂ 既不燃烧也不支持燃烧，密度比空气大，能像盖子一样覆盖在燃烧物表面隔绝氧气，故可灭火。CO₂ 与水反应生成碳酸、使石灰水变浑浊是其化学性质但与灭火无关。",
            nodeId: "jr_carbon"),
        ChemProblem(
            id: "p_jr_c4", stage: .junior, topic: .phenomena,
            content: "一氧化碳和二氧化碳的化学性质有很大差异，根本原因是？",
            options: ["碳元素的化合价不同", "分子构成不同（每个分子含氧原子数不同）", "颜色不同", "状态不同"],
            answerIndex: 1,
            explanation: "CO 和 CO₂ 分子构成不同（一个含 1 个 O、一个含 2 个 O），分子不同则性质不同：CO 可燃、有毒、有还原性；CO₂ 不可燃、能使石灰水变浑浊。「分子构成决定物质性质」。",
            nodeId: "jr_carbon"),
        ChemProblem(
            id: "p_jr_c5", stage: .junior, topic: .phenomena,
            content: "实验室制取二氧化碳，所用药品是？",
            options: ["碳酸钠粉末和稀盐酸", "大理石（石灰石）和稀盐酸", "大理石和稀硫酸", "大理石和浓盐酸"],
            answerIndex: 1,
            explanation: "实验室制 CO₂ 用大理石（CaCO₃）和稀盐酸：CaCO₃+2HCl→CaCl₂+H₂O+CO₂↑。不用稀硫酸（生成微溶 CaSO₄ 阻止反应）、不用浓盐酸（挥发出 HCl 混入气体）、不用碳酸钠粉末（反应太快不便控制）。",
            nodeId: "jr_carbon"),
        ChemProblem(
            id: "p_jr_c6", stage: .junior, topic: .phenomena,
            content: "冬天用煤炉取暖，若通风不良易使人中毒，罪魁是？",
            options: ["二氧化碳", "一氧化碳", "二氧化硫", "氮气"],
            answerIndex: 1,
            explanation: "煤不充分燃烧生成有毒的一氧化碳（CO）。CO 极易与血液中的血红蛋白结合，使人缺氧中毒。CO 无色无味，更具隐蔽危险性。故煤炉取暖务必保持通风。",
            nodeId: "jr_carbon"),
    ]

    // MARK: 金属与金属材料

    private static let metalBatch: [ChemProblem] = [
        ChemProblem(
            id: "p_jr_m1", stage: .junior, topic: .acidBaseSalt,
            content: "下列不属于金属共同物理性质的是？",
            options: ["有金属光泽", "能导电导热", "有良好的延展性", "常温下都是固体"],
            answerIndex: 3,
            explanation: "金属一般有金属光泽、能导电导热、有延展性。但常温下并非都是固体——汞（水银）是常温下唯一的液态金属。其余三项是金属的共同物理性质。",
            nodeId: "jr_metal"),
        ChemProblem(
            id: "p_jr_m2", stage: .junior, topic: .acidBaseSalt,
            content: "下列金属中，活动性最强的是？",
            options: ["铜", "铁", "镁", "银"],
            answerIndex: 2,
            explanation: "金属活动性顺序「钾钙钠镁铝、锌铁锡铅氢、铜汞银铂金」中，越靠前越活泼。给出的四种中镁最靠前、最活泼，银最不活泼。活动性顺序用于判断金属与酸/盐溶液能否反应。",
            nodeId: "jr_metal"),
        ChemProblem(
            id: "p_jr_m3", stage: .junior, topic: .acidBaseSalt,
            content: "合金是由金属与其他金属（或非金属）熔合而成。与组成它的纯金属相比，合金一般？",
            options: ["硬度更小", "熔点更高", "硬度更大、熔点更低", "导电性更强"],
            answerIndex: 2,
            explanation: "合金一般比组成它的纯金属硬度大、熔点低，且抗腐蚀性等性能更好，因此用途更广（如生铁、钢、黄铜）。合金属于混合物。",
            nodeId: "jr_metal"),
        ChemProblem(
            id: "p_jr_m4", stage: .junior, topic: .acidBaseSalt,
            content: "铁在潮湿的空气中容易生锈，铁生锈的条件是铁同时与？",
            options: ["氧气接触", "水接触", "氧气和水同时接触", "二氧化碳接触"],
            answerIndex: 2,
            explanation: "铁生锈实质是铁与氧气、水共同作用的结果（缺一不可）。防锈方法即破坏条件：保持干燥、涂油漆、镀其他金属、制成不锈钢等。铁锈疏松多孔，不能阻止内部铁继续生锈。",
            nodeId: "jr_metal"),
        ChemProblem(
            id: "p_jr_m5", stage: .junior, topic: .acidBaseSalt,
            content: "工业上用一氧化碳炼铁的反应为 3CO + Fe₂O₃ →(高温) 2Fe + 3CO₂，该反应中 CO 是？",
            options: ["氧化剂", "还原剂", "催化剂", "杂质"],
            answerIndex: 1,
            explanation: "CO 夺取 Fe₂O₃ 中的氧、把铁还原出来，自身被氧化成 CO₂，是还原剂。这是高炉炼铁的核心反应。注意尾气 CO 有毒需点燃处理。",
            nodeId: "jr_metal"),
        ChemProblem(
            id: "p_jr_m6", stage: .junior, topic: .acidBaseSalt,
            content: "把铁钉放入硫酸铜溶液中，一段时间后铁钉表面覆盖红色物质、溶液由蓝变浅绿。该反应属于？",
            options: ["化合反应", "分解反应", "置换反应", "复分解反应"],
            answerIndex: 2,
            explanation: "Fe+CuSO₄→FeSO₄+Cu，一种单质（Fe）与一种化合物（CuSO₄）反应生成另一种单质（Cu）和化合物（FeSO₄），是置换反应。这也是「湿法炼铜」的原理，体现铁比铜活泼。",
            nodeId: "jr_metal"),
    ]

    // MARK: 溶液

    private static let solutionBatch: [ChemProblem] = [
        ChemProblem(
            id: "p_jr_s1", stage: .junior, topic: .acidBaseSalt,
            content: "关于溶液，下列说法正确的是？",
            options: ["溶液都是无色的", "溶液一定是混合物", "溶液中溶质只能是固体", "饱和溶液一定比不饱和溶液浓"],
            answerIndex: 1,
            explanation: "溶液是均一、稳定的混合物（含溶质和溶剂）。溶液不一定无色（CuSO₄ 溶液蓝色）；溶质可以是固、液、气（如盐酸的溶质是气体 HCl）；同温同种溶质时饱和才一定比不饱和浓，不同物质则不一定。",
            nodeId: "jr_solution"),
        ChemProblem(
            id: "p_jr_s2", stage: .junior, topic: .acidBaseSalt,
            content: "在一定温度下，向接近饱和的硝酸钾溶液中，能使其变成饱和溶液的方法是？",
            options: ["加水", "升高温度", "加入硝酸钾固体并搅拌使其溶解", "倒出一部分溶液"],
            answerIndex: 2,
            explanation: "增加溶质（加 KNO₃ 并溶解）可使不饱和变饱和。加水变更稀；KNO₃ 溶解度随温度升高而增大，升温反而更不饱和；倒出部分溶液浓度不变仍不饱和。",
            nodeId: "jr_solution"),
        ChemProblem(
            id: "p_jr_s3", stage: .junior, topic: .acidBaseSalt,
            content: "20℃ 时 NaCl 的溶解度为 36 g，其含义是？",
            options: ["20℃ 时 100 g 水中最多溶解 36 g NaCl 达到饱和", "20℃ 时 100 g 溶液中含 36 g NaCl", "36 g NaCl 能溶于任意量的水", "NaCl 在水中只能溶 36 g"],
            answerIndex: 0,
            explanation: "溶解度指在一定温度下，某固态物质在 100 g 溶剂（水）里达到饱和状态时所溶解的质量。20℃ 时 NaCl 溶解度 36 g，即此温度 100 g 水最多溶 36 g NaCl。溶解度有四个要素：温度、100 g 溶剂、饱和、质量。",
            nodeId: "jr_solution"),
        ChemProblem(
            id: "p_jr_s4", stage: .junior, topic: .acidBaseSalt,
            content: "大多数固体物质的溶解度随温度升高而增大。要从溶解度受温度影响大的 KNO₃ 溶液中得到晶体，最适宜的方法是？",
            options: ["蒸发结晶", "降温结晶（冷却热饱和溶液）", "过滤", "加水"],
            answerIndex: 1,
            explanation: "KNO₃ 溶解度随温度变化大，降温时溶解度骤减、析出大量晶体，用降温结晶（冷却热饱和溶液）。NaCl 溶解度受温度影响小，则用蒸发结晶。「陡升降温、平缓蒸发」是结晶方法选择的依据。",
            nodeId: "jr_solution"),
        ChemProblem(
            id: "p_jr_s5", stage: .junior, topic: .acidBaseSalt,
            content: "把 20 g NaCl 溶解在 80 g 水中，所得溶液中溶质的质量分数为？",
            options: ["20%", "25%", "16%", "80%"],
            answerIndex: 0,
            explanation: "溶质质量分数 = 溶质质量/溶液质量 ×100% = 20/(20+80) ×100% = 20%。注意分母是溶液质量（溶质+溶剂），不是溶剂质量。这是溶液计算的基础公式。",
            nodeId: "jr_solution"),
        ChemProblem(
            id: "p_jr_s6", stage: .junior, topic: .acidBaseSalt,
            content: "洗洁精能去除餐具上的油污，是因为洗洁精具有？",
            options: ["溶解作用", "乳化作用", "氧化作用", "中和作用"],
            answerIndex: 1,
            explanation: "洗洁精含乳化剂，能把油污分散成无数细小油滴随水冲走——乳化作用（不是溶解）。汽油去油污则是溶解作用（油溶于汽油）。乳化与溶解原理不同，是常考对比。",
            nodeId: "jr_solution"),
    ]
}
