import Foundation

// MARK: - 方程式剧本库
// 每条 = 条件 + 现象 + 考点 + 陷阱。少量/过量分岔重点标注。
// 全部方程式均已配平核对。

enum EquationLibrary {
    static let all: [ChemEquation] = junior + seniorMetal + seniorNonmetal

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
}
