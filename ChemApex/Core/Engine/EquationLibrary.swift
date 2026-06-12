import Foundation

// MARK: - 方程式剧本库
// 每条 = 条件 + 现象 + 考点 + 陷阱。少量/过量分岔重点标注。
// 全部方程式均已配平核对。

enum EquationLibrary {
    static let all: [ChemEquation] = {
        var list: [ChemEquation] = []
        list += junior
        list += junior2
        list += seniorMetal
        list += seniorMetal2
        list += seniorNonmetal
        list += seniorNonmetal2
        list += principles
        list += organic
        list += applications
        return list
    }()

    static func equations(topic: ChemTopic) -> [ChemEquation] {
        all.filter { $0.topic == topic }
    }

    // MARK: 初中篇

    private static let junior: [ChemEquation] = [
        ChemEquation(
            id: "eq_j01", stage: .junior, topic: .phenomena,
            formula: "2H₂ + O₂ → 2H₂O",
            condition: "点燃",
            phenomenon: "淡蓝色火焰，烧杯内壁出现水雾，放热",
            examPoint: "可燃性气体点燃前必须验纯",
            trap: "氢气在氯气中燃烧是苍白色火焰，别和氧气中混淆"),
        ChemEquation(
            id: "eq_j02", stage: .junior, topic: .phenomena,
            formula: "CaCO₃ → CaO + CO₂↑",
            condition: "高温",
            phenomenon: "白色固体分解（工业煅烧石灰石）",
            examPoint: "石灰石—生石灰—熟石灰—碳酸钙的转化链",
            trap: "分解反应大多吸热，这是典型例子"),
        ChemEquation(
            id: "eq_j03", stage: .junior, topic: .massConservation,
            formula: "Fe + CuSO₄ → FeSO₄ + Cu",
            condition: "常温",
            phenomenon: "铁表面覆盖一层红色物质，溶液由蓝色变浅绿色",
            examPoint: "金属活动性顺序的应用；「湿法炼铜」",
            trap: "差量法经典素材：每 56 g Fe 换 64 g Cu，棒增重 8 g/mol"),
        ChemEquation(
            id: "eq_j04", stage: .junior, topic: .phenomena,
            formula: "CO₂ + Ca(OH)₂ → CaCO₃↓ + H₂O",
            condition: "常温",
            phenomenon: "澄清石灰水变浑浊",
            examPoint: "检验 CO₂ 的标准方法",
            trap: "CO₂ 过量时浑浊会消失：CaCO₃ + CO₂ + H₂O → Ca(HCO₃)₂"),
    ]

    // MARK: 高中篇 · 金属

    private static let seniorMetal: [ChemEquation] = [
        ChemEquation(
            id: "eq_s01", stage: .senior, topic: .metals,
            formula: "2Na + 2H₂O → 2NaOH + H₂↑",
            condition: "常温",
            phenomenon: "浮、熔、游、响；滴酚酞变红",
            examPoint: "钠的强还原性；水作氧化剂",
            trap: "钠放入 CuSO₄ 溶液：先与水反应，再生成 Cu(OH)₂ 沉淀，不会置换出铜",
            ionic: "2Na + 2H₂O → 2Na⁺ + 2OH⁻ + H₂↑"),
        ChemEquation(
            id: "eq_s02", stage: .senior, topic: .metals,
            formula: "2Na₂O₂ + 2H₂O → 4NaOH + O₂↑",
            condition: "常温",
            phenomenon: "淡黄色固体溶解，产生使带火星木条复燃的气体",
            examPoint: "Na₂O₂ 作供氧剂；歧化反应（O 从 −1 到 −2 和 0）",
            trap: "Na₂O₂ 既是氧化剂又是还原剂；转移电子数按 O₂ 计算（每 mol O₂ 转移 2 mol e⁻）"),
        ChemEquation(
            id: "eq_s03", stage: .senior, topic: .metals,
            formula: "2Na₂O₂ + 2CO₂ → 2Na₂CO₃ + O₂",
            condition: "常温",
            phenomenon: "淡黄色固体逐渐变白",
            examPoint: "呼吸面具、潜艇供氧原理",
            trap: "与 CO₂ 和与 H₂O 的反应常组合出计算题，用电子守恒"),
        ChemEquation(
            id: "eq_s04", stage: .senior, topic: .metals,
            formula: "CO₂ + 2NaOH → Na₂CO₃ + H₂O",
            condition: "常温（CO₂ 少量）",
            phenomenon: "无明显现象（需通过称量等手段证明）",
            examPoint: "「少量/过量」分岔的代表",
            trap: "CO₂ 过量时：CO₂ + NaOH → NaHCO₃。写离子方程式前先判断量！",
            ionic: "CO₂ + 2OH⁻ → CO₃²⁻ + H₂O"),
        ChemEquation(
            id: "eq_s05", stage: .senior, topic: .metals,
            formula: "AlCl₃ + 3NaOH → Al(OH)₃↓ + 3NaCl",
            condition: "常温（NaOH 少量）",
            phenomenon: "产生白色絮状沉淀",
            examPoint: "Al(OH)₃ 的两性；图像题（沉淀先增后减）",
            trap: "NaOH 过量：AlCl₃ + 4NaOH → NaAlO₂ + 3NaCl + 2H₂O，沉淀溶解",
            ionic: "Al³⁺ + 3OH⁻ → Al(OH)₃↓"),
        ChemEquation(
            id: "eq_s06", stage: .senior, topic: .metals,
            formula: "2Al + Fe₂O₃ → Al₂O₃ + 2Fe",
            condition: "高温（镁条引燃）",
            phenomenon: "剧烈反应，火星四射，生成熔融的铁",
            examPoint: "铝热反应：焊接钢轨、冶炼难熔金属",
            trap: "铝热剂是混合物；反应放热足以熔化铁"),
        ChemEquation(
            id: "eq_s07", stage: .senior, topic: .metals,
            formula: "2Fe + 3Cl₂ → 2FeCl₃",
            condition: "点燃",
            phenomenon: "剧烈燃烧，产生棕褐色的烟",
            examPoint: "氯气氧化性强，把铁直接氧化到 +3 价",
            trap: "即使铁过量也生成 FeCl₃（固相反应中铁不与 FeCl₃ 接触反应）；对比：Fe + 盐酸 → FeCl₂"),
        ChemEquation(
            id: "eq_s08", stage: .senior, topic: .metals,
            formula: "Fe + 2HCl → FeCl₂ + H₂↑",
            condition: "常温",
            phenomenon: "铁溶解，产生气泡，溶液变浅绿色",
            examPoint: "非氧化性酸只能把铁氧化到 +2 价",
            trap: "与 Fe + Cl₂ 对比记忆：氧化剂强弱决定铁的价态",
            ionic: "Fe + 2H⁺ → Fe²⁺ + H₂↑"),
        ChemEquation(
            id: "eq_s09", stage: .senior, topic: .metals,
            formula: "2FeCl₃ + Fe → 3FeCl₂",
            condition: "常温",
            phenomenon: "溶液由黄色变浅绿色",
            examPoint: "Fe³⁺/Fe²⁺ 相互转化；刻蚀铜电路板的姊妹反应（2FeCl₃ + Cu → 2FeCl₂ + CuCl₂）",
            ionic: "2Fe³⁺ + Fe → 3Fe²⁺"),
    ]

    // MARK: 高中篇 · 金属补全（铝三角 / 铁三角）

    private static let seniorMetal2: [ChemEquation] = [
        ChemEquation(
            id: "eq_s21", stage: .senior, topic: .metals,
            formula: "2Al + 2NaOH + 2H₂O → 2NaAlO₂ + 3H₂↑",
            condition: "常温",
            phenomenon: "铝溶解，产生大量气泡",
            examPoint: "铝是中学唯一既溶于强酸又溶于强碱并放氢气的金属",
            trap: "氧化剂是水不是 NaOH（H₂ 中的氢来自 H₂O 和 NaOH，化合价降低的是水中的 H）",
            ionic: "2Al + 2OH⁻ + 2H₂O → 2AlO₂⁻ + 3H₂↑"),
        ChemEquation(
            id: "eq_s22", stage: .senior, topic: .metals,
            formula: "Al(OH)₃ + 3HCl → AlCl₃ + 3H₂O；Al(OH)₃ + NaOH → NaAlO₂ + 2H₂O",
            condition: "常温",
            phenomenon: "白色沉淀溶解",
            examPoint: "Al(OH)₃ 两性的正面证据：既溶于强酸又溶于强碱",
            trap: "Al(OH)₃ 不溶于氨水——所以实验室用「铝盐 + 过量氨水」制 Al(OH)₃，不用 NaOH（过量会把沉淀溶掉）"),
        ChemEquation(
            id: "eq_s23", stage: .senior, topic: .metals,
            formula: "4Fe(OH)₂ + O₂ + 2H₂O → 4Fe(OH)₃",
            condition: "常温（空气中自发）",
            phenomenon: "白色沉淀迅速变灰绿色，最终变红褐色",
            examPoint: "「白→灰绿→红褐」三段变色是铁的标志性现象",
            trap: "制备 Fe(OH)₂ 要隔绝空气：胶头滴管插入液面以下，液面覆煤油"),
        ChemEquation(
            id: "eq_s24", stage: .senior, topic: .metals,
            formula: "3Fe + 4H₂O(g) → Fe₃O₄ + 4H₂",
            condition: "高温",
            phenomenon: "铁与水蒸气反应生成黑色固体和氢气",
            examPoint: "铁与水蒸气反应生成 Fe₃O₄（不是 Fe₂O₃）",
            trap: "常温下铁不与水反应；产物 Fe₃O₄ 中铁为 +2、+3 混合价"),
        ChemEquation(
            id: "eq_s25", stage: .senior, topic: .metals,
            formula: "2FeCl₂ + Cl₂ → 2FeCl₃",
            condition: "常温",
            phenomenon: "溶液由浅绿色变黄色",
            examPoint: "Fe²⁺ 的还原性；与 2FeCl₃ + Fe → 3FeCl₂ 组成铁三角循环",
            trap: "保存 FeCl₂ 溶液要加铁钉（防氧化）；保存 FeCl₃ 溶液要加盐酸（防水解）",
            ionic: "2Fe²⁺ + Cl₂ → 2Fe³⁺ + 2Cl⁻"),
        ChemEquation(
            id: "eq_s26", stage: .senior, topic: .metals,
            formula: "Na₂CO₃ + HCl(少量) → NaHCO₃ + NaCl",
            condition: "常温（向碳酸钠溶液中逐滴加盐酸）",
            phenomenon: "开始无气泡，盐酸过量后才放出气泡",
            examPoint: "滴加顺序决定现象：可用于不加试剂鉴别 Na₂CO₃ 与盐酸",
            trap: "盐酸足量时一步到位：Na₂CO₃ + 2HCl → 2NaCl + H₂O + CO₂↑；反过来把 Na₂CO₃ 滴入盐酸则立即冒泡",
            ionic: "CO₃²⁻ + H⁺ → HCO₃⁻"),
    ]

    // MARK: 高中篇 · 非金属与工业

    private static let seniorNonmetal: [ChemEquation] = [
        ChemEquation(
            id: "eq_s10", stage: .senior, topic: .nonmetals,
            formula: "Cl₂ + H₂O ⇌ HCl + HClO",
            condition: "常温（可逆）",
            phenomenon: "氯水呈浅黄绿色",
            examPoint: "氯水多成分体系；漂白靠 HClO",
            trap: "是可逆反应，氯水中同时存在 Cl₂、HClO、H⁺、Cl⁻、ClO⁻ 等多种微粒"),
        ChemEquation(
            id: "eq_s11", stage: .senior, topic: .nonmetals,
            formula: "Cl₂ + 2NaOH → NaCl + NaClO + H₂O",
            condition: "常温",
            phenomenon: "黄绿色气体被吸收",
            examPoint: "实验室尾气处理；84 消毒液有效成分 NaClO",
            trap: "歧化反应：Cl 同时升到 +1、降到 −1",
            ionic: "Cl₂ + 2OH⁻ → Cl⁻ + ClO⁻ + H₂O"),
        ChemEquation(
            id: "eq_s12", stage: .senior, topic: .nonmetals,
            formula: "MnO₂ + 4HCl(浓) → MnCl₂ + Cl₂↑ + 2H₂O",
            condition: "Δ（加热）",
            phenomenon: "产生黄绿色气体",
            examPoint: "实验室制氯气；HCl 一半被氧化一半作酸",
            trap: "必须用浓盐酸——稀盐酸不反应；随反应进行盐酸变稀，反应会停止"),
        ChemEquation(
            id: "eq_s13", stage: .senior, topic: .nonmetals,
            formula: "Cu + 2H₂SO₄(浓) → CuSO₄ + SO₂↑ + 2H₂O",
            condition: "Δ（加热）",
            phenomenon: "产生能使品红褪色的气体，溶液（稀释后）显蓝色",
            examPoint: "浓硫酸的强氧化性",
            trap: "稀硫酸不与铜反应；随反应变稀后反应停止——「足量铜与浓硫酸」硫酸不能反应完"),
        ChemEquation(
            id: "eq_s14", stage: .senior, topic: .nonmetals,
            formula: "Cu + 4HNO₃(浓) → Cu(NO₃)₂ + 2NO₂↑ + 2H₂O",
            condition: "常温",
            phenomenon: "产生红棕色气体，溶液变蓝",
            examPoint: "浓硝酸的强氧化性",
            trap: "与稀硝酸产物对比：浓出 NO₂、稀出 NO；电子守恒是计算钥匙"),
        ChemEquation(
            id: "eq_s15", stage: .senior, topic: .nonmetals,
            formula: "3Cu + 8HNO₃(稀) → 3Cu(NO₃)₂ + 2NO↑ + 4H₂O",
            condition: "常温",
            phenomenon: "产生无色气体，在瓶口变红棕色；溶液变蓝",
            examPoint: "稀硝酸的氧化性；NO 遇空气变色",
            trap: "8 mol HNO₃ 中只有 2 mol 被还原，其余 6 mol 作酸（生成硝酸盐）",
            ionic: "3Cu + 8H⁺ + 2NO₃⁻ → 3Cu²⁺ + 2NO↑ + 4H₂O"),
        ChemEquation(
            id: "eq_s16", stage: .senior, topic: .nonmetals,
            formula: "4NH₃ + 5O₂ → 4NO + 6H₂O",
            condition: "催化剂、Δ",
            phenomenon: "氨催化氧化（工业制硝酸第一步）",
            examPoint: "工业制硝酸：NH₃ → NO → NO₂ → HNO₃",
            trap: "关系式法素材：NH₃ ~ HNO₃（按 N 守恒）"),
        ChemEquation(
            id: "eq_s17", stage: .senior, topic: .nonmetals,
            formula: "2NH₄Cl + Ca(OH)₂ → CaCl₂ + 2NH₃↑ + 2H₂O",
            condition: "Δ（加热固体混合物）",
            phenomenon: "产生使湿润红色石蕊试纸变蓝的气体",
            examPoint: "实验室制氨气",
            trap: "干燥用碱石灰；收集用向下排空气法；NH₃ 是中学唯一使红色石蕊试纸变蓝的气体"),
        ChemEquation(
            id: "eq_s18", stage: .senior, topic: .equilibrium,
            formula: "N₂ + 3H₂ ⇌ 2NH₃",
            condition: "高温、高压、催化剂",
            phenomenon: "工业合成氨（哈伯法）",
            examPoint: "平衡移动分析的母题：放热、气体分子数减小",
            trap: "可逆反应不能进行到底——「1 mol N₂ 与 3 mol H₂ 反应生成 2 mol NH₃」是错的"),
        ChemEquation(
            id: "eq_s19", stage: .senior, topic: .electrochem,
            formula: "2NaCl + 2H₂O → 2NaOH + H₂↑ + Cl₂↑",
            condition: "电解",
            phenomenon: "两极都有气泡；阴极区滴酚酞变红",
            examPoint: "氯碱工业：阳极 Cl₂、阴极 H₂",
            trap: "阴极是水放电不是 Na⁺；制金属钠要电解熔融 NaCl"),
        ChemEquation(
            id: "eq_s20", stage: .senior, topic: .metals,
            formula: "2NaHCO₃ → Na₂CO₃ + H₂O + CO₂↑",
            condition: "Δ（加热）",
            phenomenon: "固体减少，产生使澄清石灰水变浑浊的气体",
            examPoint: "Na₂CO₃ 与 NaHCO₃ 鉴别（加热法）；差量法素材",
            trap: "Na₂CO₃ 受热不分解——稳定性：正盐 > 酸式盐"),
    ]

    // MARK: 初中篇 · 气体制取与酸碱盐

    private static let junior2: [ChemEquation] = [
        ChemEquation(
            id: "eq_j05", stage: .junior, topic: .phenomena,
            formula: "2KMnO₄ → K₂MnO₄ + MnO₂ + O₂↑",
            condition: "Δ（加热）",
            phenomenon: "紫黑色固体分解，产生使带火星木条复燃的气体",
            examPoint: "实验室制氧气；试管口略向下倾斜，管口塞一团棉花",
            trap: "用排水法收集时，先撤导管再熄灯——防止水倒吸炸裂试管"),
        ChemEquation(
            id: "eq_j06", stage: .junior, topic: .acidBaseSalt,
            formula: "CaCO₃ + 2HCl → CaCl₂ + H₂O + CO₂↑",
            condition: "常温",
            phenomenon: "固体溶解，产生大量气泡",
            examPoint: "实验室制 CO₂（大理石 + 稀盐酸）",
            trap: "不能用稀硫酸——生成微溶的 CaSO₄ 覆盖在大理石表面使反应停止；不能用浓盐酸——挥发的 HCl 混入气体"),
        ChemEquation(
            id: "eq_j07", stage: .junior, topic: .acidBaseSalt,
            formula: "Zn + H₂SO₄(稀) → ZnSO₄ + H₂↑",
            condition: "常温",
            phenomenon: "锌粒溶解，产生气泡",
            examPoint: "实验室制氢气；金属活动性「氢前置换氢」",
            trap: "选锌是速率适中：镁太快、铁太慢"),
        ChemEquation(
            id: "eq_j08", stage: .junior, topic: .massConservation,
            formula: "Fe₂O₃ + 3CO → 2Fe + 3CO₂",
            condition: "高温",
            phenomenon: "红棕色粉末逐渐变黑（工业高炉炼铁）",
            examPoint: "CO 的还原性；工业炼铁原理",
            trap: "CO 有毒，尾气必须点燃处理；「还原剂是 CO 不是 C」"),
        ChemEquation(
            id: "eq_j09", stage: .junior, topic: .acidBaseSalt,
            formula: "NaOH + HCl → NaCl + H₂O",
            condition: "常温",
            phenomenon: "无明显现象（需借助指示剂判断）",
            examPoint: "中和反应；酸碱性变化用酚酞/石蕊跟踪",
            trap: "无现象 ≠ 不反应——「如何证明中和发生了」是经典实验设计题"),
        ChemEquation(
            id: "eq_j10", stage: .junior, topic: .acidBaseSalt,
            formula: "CaO + H₂O → Ca(OH)₂",
            condition: "常温",
            phenomenon: "剧烈反应，放出大量热（可使水沸腾）",
            examPoint: "生石灰作干燥剂/自热食品热源；石灰三兄弟转化链",
            trap: "CaO 叫生石灰、Ca(OH)₂ 叫熟石灰（消石灰）、CaCO₃ 是石灰石——名字别混"),
    ]

    // MARK: 高中篇 · 非金属补全（硫氮硅与工业链）

    private static let seniorNonmetal2: [ChemEquation] = [
        ChemEquation(
            id: "eq_s27", stage: .senior, topic: .nonmetals,
            formula: "SO₂ + H₂O ⇌ H₂SO₃",
            condition: "常温（可逆）",
            phenomenon: "气体溶解，溶液能使石蕊变红",
            examPoint: "SO₂ 是酸性氧化物；酸雨的成因之一",
            trap: "SO₂ 使石蕊「变红不褪色」——SO₂ 的漂白对石蕊无效，这是与氯水的重要区别"),
        ChemEquation(
            id: "eq_s28", stage: .senior, topic: .nonmetals,
            formula: "2SO₂ + O₂ ⇌ 2SO₃",
            condition: "催化剂、Δ（接触法）",
            phenomenon: "工业制硫酸的关键一步",
            examPoint: "可逆反应；接触法制硫酸：S/FeS₂ → SO₂ → SO₃ → H₂SO₄",
            trap: "SO₃ 用 98.3% 浓硫酸吸收而不用水——防止形成酸雾"),
        ChemEquation(
            id: "eq_s29", stage: .senior, topic: .nonmetals,
            formula: "N₂ + O₂ → 2NO",
            condition: "放电或高温",
            phenomenon: "「雷雨发庄稼」的第一步",
            examPoint: "氮的固定（自然固氮）；N₂ 三键稳定需要苛刻条件",
            trap: "直接产物是 NO 不是 NO₂——氮氧化物链条要一步步走"),
        ChemEquation(
            id: "eq_s30", stage: .senior, topic: .nonmetals,
            formula: "2NO + O₂ → 2NO₂",
            condition: "常温",
            phenomenon: "无色气体变红棕色",
            examPoint: "NO 的检验方法（接触空气变色）",
            trap: "颜色变化是 NO 的「身份证」；收集 NO 只能排水法"),
        ChemEquation(
            id: "eq_s31", stage: .senior, topic: .nonmetals,
            formula: "3NO₂ + H₂O → 2HNO₃ + NO",
            condition: "常温",
            phenomenon: "红棕色气体被水吸收，剩余约 1/3 体积无色气体",
            examPoint: "工业制硝酸最后一步；歧化反应（N 从 +4 到 +5 和 +2）",
            trap: "NO₂ 溶于水「不全吸收」——剩下 1/3 的 NO，气体体积计算高频考点"),
        ChemEquation(
            id: "eq_s32", stage: .senior, topic: .nonmetals,
            formula: "NH₃ + HCl → NH₄Cl",
            condition: "常温（气体相遇）",
            phenomenon: "产生大量白烟",
            examPoint: "蘸浓盐酸与浓氨水的玻璃棒互相靠近冒白烟——检验 NH₃ 或 HCl",
            trap: "「白烟」是 NH₄Cl 固体小颗粒，不是「白雾」（雾是小液滴）"),
        ChemEquation(
            id: "eq_s33", stage: .senior, topic: .nonmetals,
            formula: "SiO₂ + 4HF → SiF₄↑ + 2H₂O",
            condition: "常温",
            phenomenon: "玻璃被腐蚀",
            examPoint: "氢氟酸刻蚀玻璃；HF 保存在塑料瓶中",
            trap: "SiO₂ 是酸性氧化物却与酸（HF）反应——特例中的特例"),
        ChemEquation(
            id: "eq_s34", stage: .senior, topic: .nonmetals,
            formula: "2Cl₂ + 2Ca(OH)₂ → Ca(ClO)₂ + CaCl₂ + 2H₂O",
            condition: "常温（石灰乳）",
            phenomenon: "工业制漂白粉",
            examPoint: "漂白粉有效成分是 Ca(ClO)₂；使用时与 CO₂、水反应生成 HClO",
            trap: "漂白粉久置失效：Ca(ClO)₂ 与空气中 CO₂、水反应生成 HClO，HClO 见光分解"),
    ]

    // MARK: 原理篇（热化学 / 水解 / 电极反应）

    private static let principles: [ChemEquation] = [
        ChemEquation(
            id: "eq_p01", stage: .senior, topic: .energy,
            formula: "2H₂(g) + O₂(g) = 2H₂O(l)　ΔH = −571.6 kJ/mol",
            condition: "热化学方程式（25℃，101 kPa）",
            phenomenon: "氢气燃烧热 285.8 kJ/mol 的规范表达",
            examPoint: "热化学方程式三要素：聚集态、ΔH 符号与单位、系数表示物质的量",
            trap: "系数翻倍 ΔH 也翻倍；燃烧热必须对应液态水"),
        ChemEquation(
            id: "eq_p02", stage: .senior, topic: .solution,
            formula: "FeCl₃ + 3H₂O ⇌ Fe(OH)₃ + 3HCl",
            condition: "常温（水解，加热促进）",
            phenomenon: "FeCl₃ 溶液显酸性、呈黄色",
            examPoint: "盐类水解的代表；FeCl₃ 净水原理（水解生成的 Fe(OH)₃ 胶体吸附杂质）",
            trap: "制 Fe(OH)₃ 胶体的写法不同：饱和 FeCl₃ 溶液滴入沸水，用 → 并标「(胶体)」"),
        ChemEquation(
            id: "eq_p03", stage: .senior, topic: .electrochem,
            formula: "负极：2H₂ + 4OH⁻ − 4e⁻ → 4H₂O；正极：O₂ + 2H₂O + 4e⁻ → 4OH⁻",
            condition: "氢氧燃料电池（KOH 电解质）",
            phenomenon: "总反应即氢气燃烧：2H₂ + O₂ → 2H₂O",
            examPoint: "燃料电池电极反应式：燃料在负极失电子，O₂ 在正极得电子",
            trap: "电解质环境决定写法：碱性写 OH⁻、酸性写 H⁺——两极相加必须能消去电子得总反应"),
    ]

    // MARK: 有机篇（必修有机全链条）

    private static let organic: [ChemEquation] = [
        ChemEquation(
            id: "eq_o01", stage: .senior, topic: .organic,
            formula: "CH₄ + Cl₂ → CH₃Cl + HCl",
            condition: "光照",
            phenomenon: "黄绿色变浅，容器内壁出现油状液滴",
            examPoint: "取代反应的代表；实际产物是四种氯代物与 HCl 的混合物",
            trap: "光照是必要条件——黑暗中不反应；CH₃Cl 是气体，油状液滴是多氯代物"),
        ChemEquation(
            id: "eq_o02", stage: .senior, topic: .organic,
            formula: "CH₂=CH₂ + Br₂ → CH₂BrCH₂Br",
            condition: "常温",
            phenomenon: "溴水（或溴的 CCl₄ 溶液）褪色",
            examPoint: "加成反应的代表；鉴别烷烃与烯烃的标准方法",
            trap: "苯也能使溴水「褪色」但那是萃取（物理过程）——褪色不一定是加成"),
        ChemEquation(
            id: "eq_o03", stage: .senior, topic: .organic,
            formula: "CH₂=CH₂ + H₂O → CH₃CH₂OH",
            condition: "催化剂、加温加压",
            phenomenon: "工业制乙醇（乙烯水化法）",
            examPoint: "加成反应；与「粮食酿酒」的生物路线对比",
            trap: "水化是加成不是取代——双键打开，H 和 OH 各加一边"),
        ChemEquation(
            id: "eq_o04", stage: .senior, topic: .organic,
            formula: "2CH₃CH₂OH + O₂ → 2CH₃CHO + 2H₂O",
            condition: "Cu 或 Ag 催化、Δ",
            phenomenon: "铜丝灼烧变黑，插入乙醇恢复亮红色",
            examPoint: "醇的催化氧化：脱去羟基氢和 α-碳上的氢",
            trap: "铜丝「黑→红」循环说明 Cu 是催化剂；乙醇→乙醛→乙酸是氧化链条"),
        ChemEquation(
            id: "eq_o05", stage: .senior, topic: .organic,
            formula: "CH₃COOH + C₂H₅OH ⇌ CH₃COOC₂H₅ + H₂O",
            condition: "浓硫酸、Δ（可逆）",
            phenomenon: "饱和碳酸钠溶液液面上出现透明油状物，有香味",
            examPoint: "酯化反应：酸脱羟基醇脱氢（同位素 ¹⁸O 示踪证明）",
            trap: "导管不插入液面以下（防倒吸）；Na₂CO₃ 溶液三作用：吸乙醇、除乙酸、降低酯的溶解度"),
        ChemEquation(
            id: "eq_o06", stage: .senior, topic: .organic,
            formula: "2CH₃CH₂OH + 2Na → 2CH₃CH₂ONa + H₂↑",
            condition: "常温",
            phenomenon: "钠沉在乙醇底部，缓慢放出气泡",
            examPoint: "与钠和水反应「浮、剧烈」对比：羟基氢不如水中的氢活泼",
            trap: "钠在乙醇中「沉底、缓慢」、在水中「上浮、剧烈」——密度与活性双重对比"),
        ChemEquation(
            id: "eq_o07", stage: .senior, topic: .organic,
            formula: "nCH₂=CH₂ → ₋[CH₂—CH₂]ₙ₋",
            condition: "催化剂（加聚反应）",
            phenomenon: "工业制聚乙烯（塑料袋、保鲜膜）",
            examPoint: "加聚反应：双键打开、首尾相连；聚乙烯分子中无双键",
            trap: "聚乙烯不能使溴水褪色（双键已消耗）；食品保鲜膜用聚乙烯，聚氯乙烯不能包食品"),
        ChemEquation(
            id: "eq_o08", stage: .senior, topic: .organic,
            formula: "C₆H₆ + HNO₃ → C₆H₅NO₂ + H₂O",
            condition: "浓硫酸、约 55℃ 水浴",
            phenomenon: "生成无色（工业品淡黄色）、有苦杏仁气味的油状液体硝基苯",
            examPoint: "苯环上的取代反应；浓硫酸作催化剂兼吸水剂",
            trap: "温度过高会生成更多副产物且硝酸分解——必须水浴控温；硝基苯有毒，沾皮肤用酒精擦洗"),
        ChemEquation(
            id: "eq_o09", stage: .senior, topic: .organic,
            formula: "CH₃CHO + 2Ag(NH₃)₂OH → CH₃COONH₄ + 2Ag↓ + 3NH₃ + H₂O",
            condition: "水浴加热（银镜反应）",
            phenomenon: "洁净试管内壁出现光亮的银镜",
            examPoint: "检验醛基的标准方法；醛的还原性",
            trap: "必须水浴加热不能直接灼烧；银氨溶液现配现用；试管要先用 NaOH 煮洗保证洁净"),
        ChemEquation(
            id: "eq_o10", stage: .senior, topic: .organic,
            formula: "CH₃CHO + 2Cu(OH)₂ → CH₃COOH + Cu₂O↓ + 2H₂O",
            condition: "Δ（加热煮沸）",
            phenomenon: "出现砖红色沉淀（Cu₂O）",
            examPoint: "检验醛基的第二法；新制 Cu(OH)₂ 悬浊液",
            trap: "新教材在过量 NaOH 环境下写作生成 CH₃COONa（再加 NaOH、生成 3H₂O），考试以所用教材为准；Cu(OH)₂ 必须新制"),
    ]

    // MARK: 应用篇（电化学应用 / 散点补全）

    private static let applications: [ChemEquation] = [
        ChemEquation(
            id: "eq_e01", stage: .senior, topic: .electrochem,
            formula: "阳极（粗铜）：Cu − 2e⁻ → Cu²⁺；阴极（纯铜）：Cu²⁺ + 2e⁻ → Cu",
            condition: "电解精炼铜（CuSO₄ 电解液）",
            phenomenon: "粗铜溶解，纯铜增重，槽底积「阳极泥」",
            examPoint: "电解精炼：粗作阳极、纯作阴极；电镀同理（镀层金属作阳极）",
            trap: "比铜活泼的杂质（Zn/Fe）溶入溶液但不在阴极析出；比铜惰性的（Ag/Au）沉为阳极泥——贵金属回收来源"),
        ChemEquation(
            id: "eq_e02", stage: .senior, topic: .electrochem,
            formula: "Pb + PbO₂ + 2H₂SO₄ → 2PbSO₄ + 2H₂O",
            condition: "铅蓄电池放电（充电为逆反应）",
            phenomenon: "放电时硫酸浓度逐渐下降",
            examPoint: "二次电池代表；负极 Pb、正极 PbO₂，放电后两极都生成 PbSO₄",
            trap: "可用电解液密度判断电量；充电时电池负极接电源负极（阴极）"),
        ChemEquation(
            id: "eq_e03", stage: .senior, topic: .electrochem,
            formula: "负极：2Fe − 4e⁻ → 2Fe²⁺；正极：O₂ + 2H₂O + 4e⁻ → 4OH⁻",
            condition: "钢铁吸氧腐蚀（中性/弱酸性潮湿环境）",
            phenomenon: "铁生锈：Fe²⁺ 进一步被氧化，最终生成铁锈 Fe₂O₃·xH₂O",
            examPoint: "电化学腐蚀的主要形式；防护：牺牲阳极法（接锌块）、外加电流法",
            trap: "潮湿中性环境主要是吸氧腐蚀；只有较强酸性环境才以析氢腐蚀为主——别一见腐蚀就写 H₂"),
        ChemEquation(
            id: "eq_s35", stage: .senior, topic: .nonmetals,
            formula: "Cl₂ + 2NaBr → 2NaCl + Br₂",
            condition: "常温",
            phenomenon: "溶液由无色变橙黄色",
            examPoint: "卤素单质氧化性递变：Cl₂ > Br₂ > I₂；活泼卤素置换不活泼卤素",
            trap: "F₂ 是例外——通入盐溶液会先与水剧烈反应，不能置换出其他卤素",
            ionic: "Cl₂ + 2Br⁻ → 2Cl⁻ + Br₂"),
        ChemEquation(
            id: "eq_s36", stage: .senior, topic: .metals,
            formula: "4Na + O₂ → 2Na₂O（常温）；2Na + O₂ → Na₂O₂（点燃）",
            condition: "条件分岔：常温缓慢氧化 / 点燃",
            phenomenon: "点燃时发出黄色火焰，生成淡黄色固体",
            examPoint: "同一组反应物、不同条件、不同产物的代表",
            trap: "Na₂O 白色、Na₂O₂ 淡黄色——颜色就是产物的「身份证」；切开的钠变暗是生成 Na₂O"),
        ChemEquation(
            id: "eq_s37", stage: .senior, topic: .nonmetals,
            formula: "Na₂CO₃ + SiO₂ → Na₂SiO₃ + CO₂↑",
            condition: "高温（玻璃工业）",
            phenomenon: "工业制普通玻璃的反应之一（另有 CaCO₃ + SiO₂）",
            examPoint: "高沸点酸酐在高温下「赶走」挥发性酸酐",
            trap: "不违背「强酸制弱酸」——那是溶液中的规则，高温熔融体系靠挥发性定方向"),
        ChemEquation(
            id: "eq_p04", stage: .senior, topic: .solution,
            formula: "CH₃COOH ⇌ CH₃COO⁻ + H⁺",
            condition: "水溶液中（电离平衡）",
            phenomenon: "0.1 mol/L 醋酸的 pH 约为 3（远大于盐酸的 1）",
            examPoint: "弱电解质部分电离的标志；电离是吸热过程，升温促进",
            trap: "加水稀释促进电离，但 c(H⁺) 仍减小；加醋酸钠抑制电离（同离子效应）"),
        ChemEquation(
            id: "eq_p05", stage: .senior, topic: .solution,
            formula: "AgCl(s) + I⁻ → AgI(s) + Cl⁻",
            condition: "常温（沉淀转化）",
            phenomenon: "白色沉淀逐渐变为黄色",
            examPoint: "沉淀向更难溶方向转化：Ksp(AgI) ≪ Ksp(AgCl)",
            trap: "AgCl 白、AgBr 浅黄、AgI 黄——三种卤化银颜色递变，均不溶于稀硝酸"),
        ChemEquation(
            id: "eq_a01", stage: .senior, topic: .metals,
            formula: "NaCl + NH₃ + CO₂ + H₂O → NaHCO₃↓ + NH₄Cl",
            condition: "向饱和氨盐水中通入 CO₂（侯氏制碱法核心步骤）",
            phenomenon: "析出白色 NaHCO₃ 晶体",
            examPoint: "侯德榜打破封锁的国产工艺；NaHCO₃ 溶解度最小所以先析出，再煅烧得纯碱",
            trap: "通气顺序是「先氨后碳」——NH₃ 极易溶，先造碱性环境 CO₂ 才能大量吸收"),
        ChemEquation(
            id: "eq_a02", stage: .senior, topic: .metals,
            formula: "2Al₂O₃ → 4Al + 3O₂↑",
            condition: "电解（熔融，加冰晶石助熔）",
            phenomenon: "工业炼铝（霍尔—埃鲁法）",
            examPoint: "活泼金属（K~Al）只能用电解熔融法冶炼",
            trap: "不能电解熔融 AlCl₃（共价化合物不导电），更不能电解溶液；冰晶石的作用是降低 Al₂O₃ 的熔化温度"),
        ChemEquation(
            id: "eq_a03", stage: .senior, topic: .metals,
            formula: "MgCl₂ → Mg + Cl₂↑",
            condition: "电解（熔融）",
            phenomenon: "海水提镁的最后一步",
            examPoint: "海水提镁链：石灰乳沉淀 Mg(OH)₂ → 盐酸溶解 → 浓缩结晶 → 电解熔融",
            trap: "电解 MgCl₂ 溶液得不到镁（阴极析出 H₂）——活泼金属必须电解熔融态"),
        ChemEquation(
            id: "eq_a04", stage: .senior, topic: .nonmetals,
            formula: "SiO₂ + 2C → Si(粗) + 2CO↑",
            condition: "高温（工业制粗硅）",
            phenomenon: "焦炭还原石英砂",
            examPoint: "硅的工业制备第一步；后续提纯经 SiCl₄ 蒸馏再还原",
            trap: "产物是 CO 不是 CO₂——高温下碳过量，按 CO 配平"),
    ]
}
