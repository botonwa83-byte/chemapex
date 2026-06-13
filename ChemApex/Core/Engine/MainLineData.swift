import Foundation

// MARK: - 登顶之路：学习主线 13 关
// 节点 = 学(知识点) → 练(题目) → 战(Boss 守恒之眼)。
// 顺序即学习顺序：初中直觉 → 高中主战场 → 竞赛仰望。

enum MainLineData {
    static let nodes: [LearningNode] = {
        var list: [LearningNode] = []
        list += juniorNodes
        list += seniorNodes1
        list += seniorNodes2
        list += principleNodes
        list += structureNodes
        list += organicNodes
        list += experimentNodes
        list += olympiadNodes
        return assignOrder(list)
    }()

    /// 按数组位置统一赋 order（1 起），插关/拆关不必手工重排序号。
    private static func assignOrder(_ list: [LearningNode]) -> [LearningNode] {
        var list = list
        for i in list.indices { list[i].order = i + 1 }
        return list
    }

    static func node(id: String) -> LearningNode? { nodes.first { $0.id == id } }

    // MARK: 初中段 🌱

    private static let juniorNodes: [LearningNode] = [
        LearningNode(
            id: "n01", order: 1, stage: .junior, topic: .phenomena,
            title: "化学的眼睛",
            tagline: "学会区分：什么变了，什么没变",
            knowledgePoints: [
                KnowledgePoint(
                    id: "k0101", title: "物理变化 vs 化学变化",
                    detail: "唯一判断标准：有没有新物质生成。状态、形状、大小的改变是物理变化；生成新物质（常伴随变色、放气、沉淀、发光放热）才是化学变化。",
                    pitfall: "「爆炸」不一定是化学变化——轮胎爆炸是物理变化，火药爆炸才是化学变化。"),
                KnowledgePoint(
                    id: "k0102", title: "现象 ≠ 结论",
                    detail: "现象是感官直接观察到的（火焰颜色、放热、水雾、浑浊）；结论是推理出来的（生成了 CO₂）。描述实验时两者不能混。",
                    pitfall: "「生成二氧化碳」写进现象题会被扣分，应写「澄清石灰水变浑浊」。"),
                KnowledgePoint(
                    id: "k0103", title: "纯净物与混合物",
                    detail: "纯净物只含一种物质（可以是单质或化合物）；混合物含多种物质。空气、溶液、合金都是混合物。",
                    pitfall: "冰水混合物是纯净物——冰和水都是 H₂O。"),
            ],
            problemIds: ["p_jr_01", "p_jr_02", "p_jr_03"]),

        LearningNode(
            id: "n02", order: 2, stage: .junior, topic: .massConservation,
            title: "质量守恒 · 第一把武器",
            tagline: "原子不增不减——你的第一条守恒定律",
            knowledgePoints: [
                KnowledgePoint(
                    id: "k0201", title: "质量守恒定律",
                    detail: "参加化学反应的各物质质量总和，等于反应后生成的各物质质量总和。本质：反应只是原子重新组合，原子的种类、数目、质量都不变。",
                    pitfall: "「参加反应的」四个字是关键——剩余的反应物不计入；有气体逸出或参加时要算上气体。"),
                KnowledgePoint(
                    id: "k0202", title: "守恒的本质：六个不变",
                    detail: "宏观三不变：物质总质量、元素种类、元素质量；微观三不变：原子种类、原子数目、原子质量。分子数目和物质种类是「可变」的。"),
                KnowledgePoint(
                    id: "k0203", title: "用守恒做推断",
                    detail: "生成物里有什么元素，反应物里就必须有；反过来也成立。由燃烧产物推元素组成是质量守恒的经典应用。"),
            ],
            problemIds: ["p_jr_04", "p_jr_05", "p_jr_06"],
            bossCaseId: "boss_diff",
            weaponUnlocked: .differenceMethod),

        LearningNode(
            id: "n02x", order: 3, stage: .junior, topic: .acidBaseSalt,
            title: "酸碱盐 · 物质的家谱",
            tagline: "中考的主战场：谁和谁反应，凭什么",
            knowledgePoints: [
                KnowledgePoint(
                    id: "k02x1", title: "酸碱与指示剂",
                    detail: "酸：电离出的阳离子全是 H⁺；碱：电离出的阴离子全是 OH⁻。石蕊遇酸变红、遇碱变蓝；酚酞遇碱变红、遇酸不变色。",
                    pitfall: "酚酞在酸中是「不变色」而不是「变红」——别把两种指示剂的口诀记串。"),
                KnowledgePoint(
                    id: "k02x2", title: "金属活动性顺序",
                    detail: "钾钙钠镁铝、锌铁锡铅氢、铜汞银铂金。氢前金属能置换酸中的氢；排前面的金属能把后面的金属从盐溶液中置换出来。",
                    pitfall: "K、Ca、Na 太活泼，放入盐溶液会先与水反应，不能直接置换金属。"),
                KnowledgePoint(
                    id: "k02x3", title: "复分解反应的条件",
                    detail: "两种化合物互相交换成分，生成沉淀、气体或水（至少其一）才能发生。判断离子共存、除杂、推断都靠这条。",
                    pitfall: "「交换成分写得出产物」不等于「反应能发生」——必须检查有没有沉淀/气体/水。"),
                KnowledgePoint(
                    id: "k02x4", title: "溶解度与溶液",
                    detail: "饱和溶液：一定温度下不能再溶解该溶质的溶液。溶解度曲线上的点 = 该温度的饱和状态；大多数固体溶解度随温度升高而增大，气体相反。"),
            ],
            problemIds: ["p_jr_07", "p_jr_08", "p_jr_09"]),
    ]

    // MARK: 高中段 ⚗️（主战场·上）

    private static let seniorNodes1: [LearningNode] = [
        LearningNode(
            id: "n03", order: 4, stage: .senior, topic: .mole,
            title: "物质的量 · 化学的计数单位",
            tagline: "从「几克」到「几摩尔」——化学从此能算账",
            knowledgePoints: [
                KnowledgePoint(
                    id: "k0301", title: "物质的量 n 与阿伏加德罗常数",
                    detail: "1 mol 任何粒子的数目约为 6.02×10²³（Nᴀ）。n = N/Nᴀ = m/M。摩尔是连接微观粒子与宏观质量的桥。",
                    pitfall: "说「1 mol 氢」不规范——必须指明粒子：1 mol H 还是 1 mol H₂。"),
                KnowledgePoint(
                    id: "k0302", title: "气体摩尔体积",
                    detail: "标准状况（0℃、101 kPa）下，1 mol 任何气体体积约 22.4 L。两个前提缺一不可：①标准状况 ②气体。",
                    pitfall: "标况下 H₂O、SO₃、CCl₄ 不是气体，不能用 22.4 L/mol。"),
                KnowledgePoint(
                    id: "k0303", title: "物质的量浓度",
                    detail: "c = n/V，单位 mol/L。V 是溶液体积（不是水的体积）。配制要用容量瓶定容。"),
                KnowledgePoint(
                    id: "k0304", title: "Nᴀ 陷阱题五大套路",
                    detail: "①22.4 L/mol 必须「标况 + 气体」双前提 ②稀有气体是单原子分子 ③可逆反应不能进行到底（如 N₂+3H₂）④NO₂ 会部分二聚成 N₂O₄ ⑤电子转移数要按实际化合价变化算（Na₂O₂ 与水：每 mol O₂ 转移 2 mol 电子）。",
                    pitfall: "选择题里 Nᴀ 出现 = 警报拉响，五条套路逐一排查。"),
            ],
            problemIds: ["p_sr_01", "p_sr_02", "p_sr_03", "p_mole_01", "p_mole_02", "p_mole_03", "p_mole_04", "p_mole_05", "p_mole_06", "p_mole_07", "p_mole_08", "p_mole_09"],
            bossCaseId: "boss_cross",
            weaponUnlocked: .crossMethod),

        LearningNode(
            id: "n04", order: 5, stage: .senior, topic: .ionReaction,
            title: "离子反应 · 看见溶液的真实",
            tagline: "溶液里没有「NaCl」，只有 Na⁺ 和 Cl⁻",
            knowledgePoints: [
                KnowledgePoint(
                    id: "k0401", title: "电解质与非电解质",
                    detail: "电解质：水溶液中或熔融状态下能导电的化合物（酸、碱、盐、活泼金属氧化物）。两个限定：必须是化合物；单质和混合物都不参与分类。",
                    pitfall: "CO₂ 水溶液导电，但导电的是 H₂CO₃，所以 CO₂ 是非电解质。"),
                KnowledgePoint(
                    id: "k0402", title: "离子方程式书写",
                    detail: "强酸、强碱、可溶性盐拆成离子；难溶物、弱电解质、气体、单质、氧化物保留化学式。检查：质量守恒 + 电荷守恒。",
                    pitfall: "CaCO₃、Cu(OH)₂ 这类难溶物必须写化学式——「拆不拆」是最高频扣分点。"),
                KnowledgePoint(
                    id: "k0403", title: "离子共存",
                    detail: "审题三件套：①颜色（Cu²⁺蓝、Fe³⁺黄、Fe²⁺浅绿、MnO₄⁻紫）②酸碱性（H⁺/OH⁻ 与谁反应）③离子间生成沉淀、气体、弱电解质的不共存。"),
                KnowledgePoint(
                    id: "k0404", title: "分散系与胶体",
                    detail: "按分散质粒径分：溶液（<1 nm）、胶体（1~100 nm）、浊液（>100 nm）。丁达尔效应（光路）是区分胶体与溶液的最简方法。Fe(OH)₃ 胶体：饱和 FeCl₃ 滴入沸水。聚沉的应用：卤水点豆腐、江河入海口三角洲。",
                    pitfall: "胶体能透过滤纸但不能透过半透膜——提纯胶体用渗析不用过滤。"),
            ],
            problemIds: ["p_sr_04", "p_sr_05", "p_sr_06", "p_sr_32", "p_ion_01", "p_ion_02", "p_ion_03", "p_ion_04", "p_ion_05", "p_ion_06", "p_ion_07", "p_ion_08"],
            bossCaseId: "boss_charge",
            weaponUnlocked: .chargeConservation),

        LearningNode(
            id: "n05", order: 6, stage: .senior, topic: .redox,
            title: "氧化还原 · 电子的转移",
            tagline: "高考化学的中枢——一切围绕电子",
            knowledgePoints: [
                KnowledgePoint(
                    id: "k0501", title: "本质与特征",
                    detail: "本质是电子转移，特征是化合价变化。口诀：升·失·氧化·还原剂；降·得·还原·氧化剂。",
                    pitfall: "氧化剂被还原、发生还原反应——「剂」与「反应」方向相反，最容易绕晕。"),
                KnowledgePoint(
                    id: "k0502", title: "双线桥与电子转移数",
                    detail: "从化合价升高的元素指向降低的元素标电子数。先标化合价，再数每个原子转移几个电子，最后乘原子个数。"),
                KnowledgePoint(
                    id: "k0503", title: "部分氧化与歧化",
                    detail: "同一物质可以部分被氧化（如 MnO₂+4HCl 中只有一半 HCl 被氧化）；同一元素自身既升又降叫歧化（如 Cl₂+H₂O）。"),
                KnowledgePoint(
                    id: "k0504", title: "氧化性/还原性强弱比较",
                    detail: "金标准：同一反应中，氧化性 氧化剂 > 氧化产物；还原性 还原剂 > 还原产物。由 2FeCl₃ + Cu → 2FeCl₂ + CuCl₂ 立刻读出氧化性 Fe³⁺ > Cu²⁺。辅助依据：金属活动性表（还原性）、卤素顺序（氧化性）。",
                    pitfall: "强弱看「得失电子的难易」，不看得失数目——Na 失 1 个电子但还原性比失 3 个的 Al 强。"),
            ],
            problemIds: ["p_sr_07", "p_sr_08", "p_sr_09", "p_sr_33", "p_redox_01", "p_redox_02", "p_redox_03", "p_redox_04", "p_redox_05", "p_redox_06", "p_redox_07", "p_redox_08"],
            bossCaseId: "boss_electron",
            weaponUnlocked: .electronConservation),

        LearningNode(
            id: "na", order: 0, stage: .senior, topic: .metals,
            title: "钠及其化合物",
            tagline: "暴烈的碱金属：浮熔游响红",
            knowledgePoints: [
                KnowledgePoint(
                    id: "kna1", title: "钠单质",
                    detail: "银白色软金属、密度小（<水）、熔点低。与水反应「浮、熔、游、响、红」；与 O₂ 常温生成 Na₂O（白）、点燃生成 Na₂O₂（淡黄）。保存在煤油中，着火用沙土盖灭。",
                    pitfall: "钠投入盐溶液先与水反应，不能置换出金属。"),
                KnowledgePoint(
                    id: "kna2", title: "钠的氧化物",
                    detail: "Na₂O 白色、碱性氧化物；Na₂O₂ 淡黄色、过氧化物（O 为 −1 价）。Na₂O₂ 与 H₂O、CO₂ 反应都放 O₂，作供氧剂；反应是歧化，Na₂O₂ 既是氧化剂又是还原剂（每 mol O₂ 转移 2 mol 电子）。",
                    pitfall: "颜色区分两种氧化物：白色 Na₂O、淡黄 Na₂O₂。"),
                KnowledgePoint(
                    id: "kna3", title: "Na₂CO₃ 与 NaHCO₃",
                    detail: "鉴别三法：加热（NaHCO₃ 分解）、与盐酸反应快慢（NaHCO₃ 快）、CaCl₂ 溶液（Na₂CO₃ 出沉淀）。除杂：固体加热把 NaHCO₃ 转 Na₂CO₃。向 Na₂CO₃ 逐滴加盐酸先无气泡（生成 HCO₃⁻）后放 CO₂。",
                    pitfall: "稳定性正盐>酸式盐；溶解度 Na₂CO₃>NaHCO₃。"),
                KnowledgePoint(
                    id: "kna4", title: "焰色反应",
                    detail: "钠焰色黄色，是元素的性质（物理变化）。检验钾的紫色需透过蓝色钴玻璃滤去钠的黄光。"),
            ],
            problemIds: ["p_sr_10", "p_na_01", "p_na_02", "p_na_03", "p_na_04", "p_na_05", "p_na_06"]),

        LearningNode(
            id: "al", order: 0, stage: .senior, topic: .metals,
            title: "铝及其化合物",
            tagline: "两性的代表：既溶于酸又溶于碱",
            knowledgePoints: [
                KnowledgePoint(
                    id: "kal1", title: "铝的两性",
                    detail: "Al、Al₂O₃、Al(OH)₃ 都既溶于强酸又溶于强碱。2Al+2NaOH+2H₂O→2NaAlO₂+3H₂↑（氧化剂是水）。常温遇浓硫酸/浓硝酸钝化，可用铝罐运输。",
                    pitfall: "Al(OH)₃ 不溶于弱碱氨水——制 Al(OH)₃ 用「铝盐+过量氨水」。"),
                KnowledgePoint(
                    id: "kal2", title: "图像题：少量/过量",
                    detail: "AlCl₃ 加 NaOH：少量生成白色沉淀、过量沉淀溶解（先增后减）；反之 NaOH 中滴 AlCl₃ 立即有沉淀且增多。NaAlO₂ 通 CO₂ 析出 Al(OH)₃（弱酸不溶解产物）。",
                    pitfall: "「谁滴入谁」现象不同，图像题要看清滴加顺序。"),
                KnowledgePoint(
                    id: "kal3", title: "明矾与铝热反应",
                    detail: "明矾 KAl(SO₄)₂·12H₂O 中 Al³⁺ 水解生成 Al(OH)₃ 胶体净水（只除浊、不消毒）。铝热反应 2Al+Fe₂O₃→Al₂O₃+2Fe 放热熔铁，焊接钢轨、冶炼难熔金属。"),
                KnowledgePoint(
                    id: "kal4", title: "铝的冶炼",
                    detail: "电解熔融 Al₂O₃（加冰晶石助熔）。不能电解 AlCl₃（共价化合物熔融不导电），也不能电解溶液（阴极只出 H₂）。",
                    pitfall: "活泼金属（K~Al）只能电解熔融法冶炼。"),
            ],
            problemIds: ["p_sr_11", "p_sr_34", "p_al_01", "p_al_02", "p_al_03", "p_al_04", "p_al_05", "p_al_06"],
            bossCaseId: "boss_extreme",
            weaponUnlocked: .extremeValue),

        LearningNode(
            id: "fe", order: 0, stage: .senior, topic: .metals,
            title: "铁及其化合物",
            tagline: "变价的艺术：+2 与 +3 的转化",
            knowledgePoints: [
                KnowledgePoint(
                    id: "kfe1", title: "Fe²⁺ 与 Fe³⁺",
                    detail: "Fe²⁺ 浅绿、Fe³⁺ 黄色。氧化剂强弱定价态：与 Cl₂ 燃烧只得 FeCl₃（铁过量也是），与稀盐酸/稀硫酸/CuSO₄ 只得 Fe²⁺。",
                    pitfall: "铁与非氧化性酸反应生成 +2 价，不是 +3。"),
                KnowledgePoint(
                    id: "kfe2", title: "相互转化与保存",
                    detail: "Fe²⁺→Fe³⁺ 用氧化剂（氯水、酸性 KMnO₄、H₂O₂）；Fe³⁺→Fe²⁺ 用还原剂（Fe、Cu）。保存 FeCl₂ 加铁钉防氧化，保存 FeCl₃ 加盐酸防水解。",
                    pitfall: "Fe³⁺ 有较强氧化性，能氧化 Cu（刻蚀电路板）、I⁻、SO₂。"),
                KnowledgePoint(
                    id: "kfe3", title: "Fe(OH)₂ 的制备",
                    detail: "4Fe(OH)₂+O₂+2H₂O→4Fe(OH)₃，颜色白→灰绿→红褐——铁的招牌现象。制纯 Fe(OH)₂ 要隔绝空气（滴管插入液面下、液面覆煤油）。"),
                KnowledgePoint(
                    id: "kfe4", title: "Fe³⁺/Fe²⁺ 的检验",
                    detail: "Fe³⁺ 遇 KSCN 直接变血红；Fe²⁺ 先加 KSCN 无现象、再加氯水变红（「先无后红」）。也可用 NaOH 看沉淀颜色（Fe(OH)₃ 红褐）。"),
            ],
            problemIds: ["p_sr_12", "p_fe_01", "p_fe_02", "p_fe_03", "p_fe_04", "p_fe_05", "p_fe_06", "p_fe_07"]),

        LearningNode(
            id: "cl", order: 0, stage: .senior, topic: .nonmetals,
            title: "氯及其化合物",
            tagline: "黄绿色的强者：氯水与漂白",
            knowledgePoints: [
                KnowledgePoint(
                    id: "kcl1", title: "氯气的性质",
                    detail: "黄绿色、刺激性、有毒，密度大于空气、能溶于水。强氧化性：与金属（铁→FeCl₃）、非金属（H₂ 苍白火焰）、水、碱反应。实验室制法 MnO₂+4HCl(浓) 加热。",
                    pitfall: "干燥氯气不漂白——漂白靠 HClO；尾气用 NaOH 吸收。"),
                KnowledgePoint(
                    id: "kcl2", title: "氯水的多重身份",
                    detail: "Cl₂+H₂O⇌HCl+HClO，新制氯水「三分子四离子」。漂白靠 HClO（强氧化性）。久置氯水中 HClO 见光分解，最终变稀盐酸——现配现用、避光保存。",
                    pitfall: "「干不漂、湿才漂」是氯水漂白的经典对照。"),
                KnowledgePoint(
                    id: "kcl3", title: "氯气与碱 · 含氯消毒剂",
                    detail: "Cl₂+2NaOH→NaCl+NaClO+H₂O（84 消毒液，有效成分 NaClO）；2Cl₂+2Ca(OH)₂→Ca(ClO)₂+CaCl₂+2H₂O（漂白粉，有效成分 Ca(ClO)₂）。使用时靠 CO₂+H₂O 生成 HClO 起效。",
                    pitfall: "漂白粉久置失效：Ca(ClO)₂ 与 CO₂、水生成 HClO，HClO 分解。"),
                KnowledgePoint(
                    id: "kcl4", title: "Cl⁻ 检验与卤素递变",
                    detail: "检验 Cl⁻：稀硝酸酸化后加 AgNO₃，生成不溶于硝酸的白色 AgCl。卤素氧化性 Cl₂>Br₂>I₂，活泼卤素置换不活泼卤素（Cl₂+2Br⁻→2Cl⁻+Br₂）。"),
            ],
            problemIds: ["p_sr_13", "p_cl_01", "p_cl_02", "p_cl_03", "p_cl_04", "p_cl_05", "p_cl_06", "p_cl_07"]),

        LearningNode(
            id: "s", order: 0, stage: .senior, topic: .nonmetals,
            title: "硫及其化合物",
            tagline: "SO₂ 与浓硫酸：漂白、脱水、强氧化",
            knowledgePoints: [
                KnowledgePoint(
                    id: "ks1", title: "二氧化硫",
                    detail: "无色刺激性、酸性氧化物、有毒、酸雨主犯之一。漂白品红是化合型可逆漂白（加热复原），不能漂白石蕊（只使其变红）。有还原性，能被氯水、酸性 KMnO₄、O₂（催化）氧化。",
                    pitfall: "SO₂ 与 Cl₂ 漂白原理不同，1:1 混合互相消耗都失效。"),
                KnowledgePoint(
                    id: "ks2", title: "浓硫酸三性",
                    detail: "吸水性（作干燥剂，干燥中性/酸性气体）、脱水性（蔗糖炭化，夺化合态 H、O）、强氧化性（与 Cu 加热放 SO₂，常温钝化 Fe/Al）。",
                    pitfall: "吸水（吸现成的水）≠ 脱水（夺有机物里的 H、O），一字之差。"),
                KnowledgePoint(
                    id: "ks3", title: "SO₄²⁻ 检验",
                    detail: "先加足量稀盐酸排除 CO₃²⁻/SO₃²⁻/Ag⁺ 干扰，再加 BaCl₂ 生成不溶于酸的白色 BaSO₄。"),
                KnowledgePoint(
                    id: "ks4", title: "接触法制硫酸",
                    detail: "S/FeS₂→SO₂→（催化氧化）SO₃→（浓硫酸吸收）H₂SO₄。SO₃ 用浓硫酸吸收防酸雾。硫原子守恒：FeS₂~2H₂SO₄。"),
            ],
            problemIds: ["p_sr_14", "p_s_01", "p_s_02", "p_s_03", "p_s_04", "p_s_05", "p_s_06"],
            bossCaseId: "boss_relation",
            weaponUnlocked: .relationMethod),

        LearningNode(
            id: "n", order: 0, stage: .senior, topic: .nonmetals,
            title: "氮及其化合物",
            tagline: "从 N₂ 到 NH₃ 再到 HNO₃",
            knowledgePoints: [
                KnowledgePoint(
                    id: "kn1", title: "氮气与固氮",
                    detail: "N≡N 三键键能极大，N₂ 很稳定、常作保护气。固氮：自然固氮（放电 N₂+O₂→2NO、生物固氮）、人工固氮（合成氨）。氮氧化物是酸雨、光化学烟雾成因。",
                    pitfall: "放电直接产物是 NO 不是 NO₂。"),
                KnowledgePoint(
                    id: "kn2", title: "氨气与铵盐",
                    detail: "NH₃ 极易溶于水（喷泉实验）、唯一碱性气体、能使湿润红色石蕊变蓝。实验室制法：NH₄Cl+Ca(OH)₂ 加热，碱石灰干燥、向下排空气收集。NH₄⁺ 检验：加 NaOH 加热放 NH₃。",
                    pitfall: "干燥 NH₃ 只能用碱石灰（不能用浓硫酸、CaCl₂）。"),
                KnowledgePoint(
                    id: "kn3", title: "硝酸的强氧化性",
                    detail: "Cu+浓硝酸→NO₂（红棕）；Cu+稀硝酸→NO（无色遇空气变红棕）。浓硝酸常温钝化 Fe、Al。越浓氧化性越强、氮被还原价态越高。",
                    pitfall: "硝酸与金属反应不放 H₂（生成氮氧化物）。"),
                KnowledgePoint(
                    id: "kn4", title: "硝酸的不稳定性",
                    detail: "HNO₃ 见光/受热分解：4HNO₃→4NO₂↑+O₂↑+2H₂O，浓硝酸常因溶有 NO₂ 显黄色。用棕色瓶避光、阴凉保存。工业制硝酸：NH₃→NO→NO₂→HNO₃。"),
            ],
            problemIds: ["p_sr_15", "p_n_01", "p_n_02", "p_n_03", "p_n_04", "p_n_05", "p_n_06", "p_n_07"]),

        LearningNode(
            id: "si", order: 0, stage: .senior, topic: .nonmetals,
            title: "硅与无机非金属材料",
            tagline: "信息时代的基石",
            knowledgePoints: [
                KnowledgePoint(
                    id: "ksi1", title: "硅单质",
                    detail: "晶体硅是良好的半导体（芯片、太阳能电池）。工业制粗硅：SiO₂+2C→(高温)Si+2CO↑（碳作还原剂、产物是 CO），再经 SiCl₄ 蒸馏提纯。",
                    pitfall: "「硅」做半导体、「SiO₂」做光纤，别张冠李戴。"),
                KnowledgePoint(
                    id: "ksi2", title: "二氧化硅",
                    detail: "SiO₂ 是酸性氧化物，制光导纤维、石英玻璃。两个「反常」：与氢氟酸反应（SiO₂+4HF→SiF₄↑+2H₂O，刻蚀玻璃，HF 存塑料瓶）、与 NaOH 反应（碱液瓶用橡胶塞）；不溶于水。"),
                KnowledgePoint(
                    id: "ksi3", title: "硅酸与硅酸盐",
                    detail: "硅酸 H₂SiO₃ 是不溶于水的弱酸（用可溶性硅酸盐与酸制取）。硅酸钠水溶液俗称水玻璃，作矿物胶、防火剂。传统硅酸盐材料：玻璃、水泥、陶瓷。"),
            ],
            problemIds: ["p_si_01", "p_si_02", "p_si_03", "p_si_04", "p_si_05"]),
    ]

    // MARK: 高中段 ⚗️（主战场·下）

    private static let seniorNodes2: [LearningNode] = [
        LearningNode(
            id: "n08", order: 9, stage: .senior, topic: .periodicLaw,
            title: "周期律 · 星图的密码",
            tagline: "整张周期表，其实只有两条箭头",
            knowledgePoints: [
                KnowledgePoint(
                    id: "k0801", title: "两条总箭头",
                    detail: "同周期从左到右：半径减小、非金属性增强；同主族从上到下：半径增大、金属性增强。记住这两条，整张表的递变都能推。",
                    pitfall: "比较非金属性要用「最高价氧化物对应水化物」的酸性——HClO 是弱酸但氯的非金属性很强。"),
                KnowledgePoint(
                    id: "k0802", title: "位·构·性三角",
                    detail: "位置（周期=电子层数，主族=最外层电子数）↔ 结构 ↔ 性质，三者互推。元素推断题的底层逻辑。"),
                KnowledgePoint(
                    id: "k0803", title: "化学键",
                    detail: "活泼金属与活泼非金属之间一般是离子键；非金属之间是共价键。NaOH 同时含离子键和共价键；NH₄Cl 是全由非金属组成的离子化合物。"),
                KnowledgePoint(
                    id: "k0804", title: "核素与同位素",
                    detail: "质量数 A = 质子数 Z + 中子数 N。质子数相同、中子数不同的核素互为同位素（¹H/²H/³H），化学性质几乎完全相同。三个「同」字辈：同位素（原子）、同素异形体（单质）、同分异构体（化合物），各管各的层次。",
                    pitfall: "中性原子电子数 = 质子数；阴离子电子数 = 质子数 + 电荷数——带电微粒数电子先看电荷。"),
            ],
            problemIds: ["p_sr_16", "p_sr_17", "p_sr_29", "p_period_01", "p_period_02", "p_period_03", "p_period_04", "p_period_05", "p_period_06", "p_period_07"]),

        LearningNode(
            id: "bond", order: 0, stage: .senior, topic: .periodicLaw,
            title: "化学键",
            tagline: "原子靠什么连在一起",
            knowledgePoints: [
                KnowledgePoint(
                    id: "kbond1", title: "离子键与共价键",
                    detail: "离子键：阴阳离子间的静电作用，一般在活泼金属与活泼非金属间（如 NaCl）。共价键：原子间共用电子对，一般在非金属元素间（如 HCl、Cl₂）。",
                    pitfall: "NH₄Cl 是全由非金属组成的离子化合物（含 NH₄⁺ 与 Cl⁻）——离子键不一定含金属。"),
                KnowledgePoint(
                    id: "kbond2", title: "离子化合物与共价化合物",
                    detail: "含离子键的化合物是离子化合物（强碱、活泼金属氧化物、大多数盐、铵盐）；只含共价键的是共价化合物（酸、非金属氢化物、非金属氧化物）。判据：是否含离子键。",
                    pitfall: "NaOH、Na₂O₂、Na₂SO₄ 既含离子键又含共价键，仍属离子化合物。"),
                KnowledgePoint(
                    id: "kbond3", title: "极性键与非极性键",
                    detail: "同种原子间共用电子对不偏移——非极性键（H₂、Cl₂、Na₂O₂ 中的 O—O）；不同种原子间共用电子对偏移——极性键（HCl、H₂O）。",
                    pitfall: "键的极性（看成键原子）与分子的极性（看分子结构是否对称）是两个层次：CO₂ 含极性键但整体非极性。"),
                KnowledgePoint(
                    id: "kbond4", title: "化学键与化学反应",
                    detail: "化学反应的本质是旧键断裂、新键形成。断键吸热、成键放热，二者差值即反应的能量变化。电子式可表示离子键（标电荷+方括号）和共价键（共用电子对）。"),
            ],
            problemIds: ["p_bond_01", "p_bond_02", "p_bond_03", "p_bond_04", "p_bond_05", "p_bond_06", "p_bond_07"]),
    ]

    // MARK: 选必1 反应原理段 🔥（高考压轴大题区，按权重配题）

    private static let principleNodes: [LearningNode] = [
        LearningNode(
            id: "p1", order: 0, stage: .senior, topic: .energy,
            title: "反应热与盖斯定律",
            tagline: "化学反应的能量账本",
            knowledgePoints: [
                KnowledgePoint(
                    id: "kp101", title: "吸热与放热",
                    detail: "放热反应（ΔH<0）：燃烧、中和、活泼金属与酸、铝热、大多数化合反应。吸热反应（ΔH>0）：Ba(OH)₂·8H₂O 与 NH₄Cl、大多数分解、C+CO₂/H₂O。能量视角：放热=反应物总能量高于生成物。",
                    pitfall: "「需要加热才发生」≠ 吸热——燃烧也要点燃但放热；常温自发也可吸热（如上述铵盐反应）。"),
                KnowledgePoint(
                    id: "kp102", title: "ΔH 的两种算法",
                    detail: "键能法：ΔH =（反应物总键能）−（生成物总键能）；能量法：ΔH =（生成物总能量）−（反应物总能量）。活化能视角：ΔH = 正反应活化能 E₁ − 逆反应活化能 E₂。",
                    pitfall: "断键吸热、成键放热——两个算法符号方向相反，别记混。"),
                KnowledgePoint(
                    id: "kp103", title: "热化学方程式三要素",
                    detail: "①标聚集态(g/l/s/aq) ②ΔH 带正负号和单位 kJ/mol ③系数只表物质的量、可为分数。系数加倍 ΔH 加倍，逆向写 ΔH 变号。",
                    pitfall: "燃烧热对应生成液态水、中和热对应生成 1 mol 液态水——聚集态写错是最高频失分点。"),
                KnowledgePoint(
                    id: "kp104", title: "盖斯定律",
                    detail: "反应热只与始末状态有关，与路径无关。目标反应可由已知反应「像代数式一样加减」得到，ΔH 同步加减。是求难以直接测定反应热的通法。",
                    pitfall: "方程式怎么加减，ΔH 就怎么加减；方程式翻倍/倒转，ΔH 也翻倍/变号。"),
            ],
            problemIds: ["p_sr_18", "p_sr_26", "p_p1_01", "p_p1_02", "p_p1_03", "p_p1_04", "p_p1_05", "p_p1_06", "p_p1_07", "p_p1_08"]),

        LearningNode(
            id: "p2", order: 0, stage: .senior, topic: .equilibrium,
            title: "化学反应速率",
            tagline: "反应有多快，怎么调",
            knowledgePoints: [
                KnowledgePoint(
                    id: "kp201", title: "速率的定义与换算",
                    detail: "v = Δc/Δt，单位 mol/(L·s)。同一反应中各物质速率之比 = 化学计量数之比。比较不同物质表示的速率快慢，要先换算成同一物质。",
                    pitfall: "速率是平均值、恒正；固体和纯液体不写速率（浓度视为常数）。"),
                KnowledgePoint(
                    id: "kp202", title: "影响速率的因素",
                    detail: "浓度↑、温度↑、催化剂、压强（仅气体、且改变气体浓度时）、固体表面积↑ 都加快速率。本质：增大单位体积内活化分子数或活化分子百分数。",
                    pitfall: "恒容充入惰性气体：总压增大但反应气体浓度不变，速率不变；恒压充惰性气体：体积变大、浓度减小，速率减慢。"),
                KnowledgePoint(
                    id: "kp203", title: "催化剂与活化能",
                    detail: "催化剂降低活化能、使更多分子成为活化分子，同等加快正逆反应。有效碰撞理论：只有能量足够且取向合适的碰撞才有效。",
                    pitfall: "催化剂只改变到达平衡的快慢，不改变平衡、转化率、ΔH。"),
                KnowledgePoint(
                    id: "kp204", title: "控制变量法",
                    detail: "探究某因素对速率的影响时，只改变该因素、其余条件相同，才能归因。实验设计与数据分析的通用方法。"),
            ],
            problemIds: ["p_p2_01", "p_p2_02", "p_p2_03", "p_p2_04", "p_p2_05", "p_p2_06", "p_p2_07", "p_p2_08"]),

        LearningNode(
            id: "p3", order: 0, stage: .senior, topic: .equilibrium,
            title: "化学平衡",
            tagline: "可逆反应到哪儿停，怎么移",
            knowledgePoints: [
                KnowledgePoint(
                    id: "kp301", title: "平衡状态的判断",
                    detail: "本质标志：正逆速率相等。技巧：找「变量」——随反应进行会变、变到不再变的量（如气体分子数改变反应的总压、平均摩尔质量）即达平衡。",
                    pitfall: "「浓度比=系数比」「同向速率比=系数比」「总质量/总体积恒定（恒容）」都不是平衡标志。"),
                KnowledgePoint(
                    id: "kp302", title: "勒夏特列原理",
                    detail: "改变一个条件，平衡向「削弱这种改变」的方向移动（只削弱不抵消）。升温向吸热方向、加压向气体分子数减小方向、增大某物浓度向消耗它的方向移动。",
                    pitfall: "增大某反应物浓度，平衡正移，但提高的是另一反应物的转化率，自身转化率反而降低。"),
                KnowledgePoint(
                    id: "kp303", title: "平衡常数 K",
                    detail: "K = 生成物浓度幂之积 / 反应物浓度幂之积（幂为系数，固体纯液体不计）。K 只与温度有关；K 大表示反应进行得完全（转化率高）。",
                    pitfall: "改变浓度、压强、加催化剂都不改变 K。"),
                KnowledgePoint(
                    id: "kp304", title: "Q 与 K 判方向 · 转化率",
                    detail: "浓度商 Q<K 正向、Q>K 逆向、Q=K 平衡。转化率 = 转化量/起始量。工业条件（如合成氨高温高压催化剂）是速率与平衡的折中优化。"),
            ],
            problemIds: ["p_sr_19", "p_p3_01", "p_p3_02", "p_p3_03", "p_p3_04", "p_p3_05", "p_p3_06", "p_p3_07", "p_p3_08", "p_p3_09", "p_p3_10", "p_p3_11"]),

        LearningNode(
            id: "p4", order: 0, stage: .senior, topic: .solution,
            title: "电离平衡与 pH",
            tagline: "弱电解质、水的电离与中和滴定",
            knowledgePoints: [
                KnowledgePoint(
                    id: "kp401", title: "强弱电解质与电离平衡",
                    detail: "强电解质完全电离（强酸强碱、绝大多数盐）；弱电解质部分电离、存在电离平衡（弱酸弱碱、水）。强弱看「是否完全电离」，与溶解性、导电能力强弱无关。",
                    pitfall: "稀释促进弱电解质电离（电离程度增大），但离子浓度 c(H⁺) 仍减小。"),
                KnowledgePoint(
                    id: "kp402", title: "水的离子积 Kw",
                    detail: "Kw = c(H⁺)·c(OH⁻)，只与温度有关，常温 10⁻¹⁴。水电离吸热，升温 Kw 增大。任何水溶液中 Kw 都成立。",
                    pitfall: "升温后纯水 pH<7 仍是中性——中性标准是 c(H⁺)=c(OH⁻)，不是 pH=7。"),
                KnowledgePoint(
                    id: "kp403", title: "pH 与强弱酸对比",
                    detail: "pH=−lg c(H⁺)。同浓度：强酸 c(H⁺) 大、pH 小；同 pH：弱酸储备多，稀释 pH 变化小、与足量金属产气多。强酸强碱等浓等体积恰好中和呈中性。"),
                KnowledgePoint(
                    id: "kp404", title: "酸碱中和滴定",
                    detail: "用已知浓度标准液测未知浓度。指示剂选酚酞或甲基橙（不用石蕊）；终点：颜色变化且半分钟不褪。误差分析靠「c待=c标·V标/V待」，看哪步使 V标 偏大或偏小。",
                    pitfall: "滴定管尖嘴滴定前有气泡、滴定后消失，使 V标 偏大、结果偏高。"),
            ],
            problemIds: ["p_sr_20", "p_sr_21", "p_p4_01", "p_p4_02", "p_p4_03", "p_p4_04", "p_p4_05", "p_p4_06", "p_p4_07", "p_p4_08"]),

        LearningNode(
            id: "p5", order: 0, stage: .senior, topic: .solution,
            title: "盐类水解",
            tagline: "谁强显谁性，离子浓度三守恒",
            knowledgePoints: [
                KnowledgePoint(
                    id: "kp501", title: "水解规律",
                    detail: "口诀「有弱才水解，越弱越水解，谁强显谁性」。强碱弱酸盐（Na₂CO₃/CH₃COONa）显碱性；强酸弱碱盐（NH₄Cl/FeCl₃）显酸性；强酸强碱盐（NaCl）不水解显中性。",
                    pitfall: "水解吸热（中和的逆过程），升温、加水都促进水解。"),
                KnowledgePoint(
                    id: "kp502", title: "水解方程式与双水解",
                    detail: "水解微弱可逆，用「⇌」、一般不标↑↓。双水解相互促进进行到底（Al³⁺ 与 HCO₃⁻/CO₃⁻²/AlO₂⁻、Fe³⁺ 与 CO₃²⁻），用「→」并标↑↓——泡沫灭火器原理。",
                    pitfall: "Al³⁺+3HCO₃⁻→Al(OH)₃↓+3CO₂↑ 既有沉淀又有气泡。"),
                KnowledgePoint(
                    id: "kp503", title: "水解的应用",
                    detail: "明矾净水（Al³⁺ 水解生成胶体）、热纯碱去油污（CO₃²⁻ 水解显碱性、升温促进）、配 FeCl₃/SnCl₂ 溶液加对应酸抑制水解、铵态氮肥不与草木灰混用。"),
                KnowledgePoint(
                    id: "kp504", title: "离子浓度三守恒",
                    detail: "电荷守恒（阳离子正电荷总量=阴离子负电荷总量）、物料守恒（某元素各形态浓度之和守恒）、质子守恒（得失 H⁺ 相等）。是离子浓度大小比较与等式判断的三把钥匙。",
                    pitfall: "酸式盐酸碱性看电离与水解谁占优：NaHCO₃ 水解>电离显碱性，NaHSO₃ 电离>水解显酸性。"),
            ],
            problemIds: ["p_sr_27", "p_p5_01", "p_p5_02", "p_p5_03", "p_p5_04", "p_p5_05", "p_p5_06", "p_p5_07", "p_p5_08", "p_p5_09"]),

        LearningNode(
            id: "p6", order: 0, stage: .senior, topic: .solution,
            title: "沉淀溶解平衡",
            tagline: "Ksp、沉淀的生成转化与溶解",
            knowledgePoints: [
                KnowledgePoint(
                    id: "kp601", title: "溶度积 Ksp",
                    detail: "难溶电解质在饱和溶液中存在沉淀溶解平衡。Ksp = 各离子浓度幂之积（固体不计），只与温度有关。AB 型 s=√Ksp；AB₂ 型 Ksp=c(A)·c²(B)。",
                    pitfall: "Ksp 小不一定溶解度小——只有同类型（同为 AB 型或同为 AB₂ 型）才能用 Ksp 直接比较溶解度。"),
                KnowledgePoint(
                    id: "kp602", title: "Q 与 Ksp 判沉淀",
                    detail: "离子积 Q>Ksp 生成沉淀、Q<Ksp 沉淀溶解、Q=Ksp 平衡（饱和）。加沉淀剂、调 pH 使某离子沉淀完全（一般 c<10⁻⁵ 视为沉淀完全）。"),
                KnowledgePoint(
                    id: "kp603", title: "沉淀的转化",
                    detail: "沉淀总是向更难溶（Ksp 更小）的方向转化：AgCl→AgBr→AgI（颜色白→浅黄→黄）、CaSO₄→CaCO₃（锅炉除垢）。Ksp 差越大越易转化。"),
                KnowledgePoint(
                    id: "kp604", title: "同离子效应与应用",
                    detail: "加入含相同离子的物质，使沉淀溶解平衡逆移、沉淀更完全（检验 SO₄²⁻ 加过量 BaCl₂）。工业上用 MgO/Mg(OH)₂ 调 pH 除 Fe³⁺ 而不引入新杂质。"),
            ],
            problemIds: ["p_p6_01", "p_p6_02", "p_p6_03", "p_p6_04", "p_p6_05", "p_p6_06", "p_p6_07", "p_p6_08"]),

        LearningNode(
            id: "p7", order: 0, stage: .senior, topic: .electrochem,
            title: "原电池与化学电源",
            tagline: "化学能变电能：负失氧、正得还",
            knowledgePoints: [
                KnowledgePoint(
                    id: "kp701", title: "原电池构成与判断",
                    detail: "四条件：两个活泼性不同的电极、电解质溶液、闭合回路、能自发氧化还原。负极（较活泼）失电子被氧化，正极得电子被还原。",
                    pitfall: "口诀「负失氧、正得还」；外电路电流由正极流向负极，与电子方向相反。"),
                KnowledgePoint(
                    id: "kp702", title: "电极反应式书写",
                    detail: "把总反应拆成氧化半反应（负极）和还原半反应（正极）。要结合电解质环境：碱性写 OH⁻、酸性写 H⁺。两极反应式相加应得总反应。",
                    pitfall: "电子只走外电路导线，溶液中靠离子定向移动（阳离子奔正极、阴离子奔负极）。"),
                KnowledgePoint(
                    id: "kp703", title: "盐桥与离子移动",
                    detail: "盐桥沟通内电路、平衡两池电荷失衡，使电流持续。带盐桥的原电池能量转化效率更高、电流更稳定。"),
                KnowledgePoint(
                    id: "kp704", title: "常见化学电源",
                    detail: "一次电池（锌锰干电池，不可充）；二次电池（铅蓄电池、锂离子电池，放电=原电池、充电=电解池）；燃料电池（氢氧、甲烷等，燃料在负极氧化、O₂ 在正极还原）。",
                    pitfall: "铅蓄电池放电两极都生成 PbSO₄、硫酸被消耗，可由密度判断电量。"),
            ],
            problemIds: ["p_sr_22", "p_p7_01", "p_p7_02", "p_p7_03", "p_p7_04", "p_p7_05", "p_p7_06", "p_p7_07", "p_p7_08", "p_p7_09"]),

        LearningNode(
            id: "p8", order: 0, stage: .senior, topic: .electrochem,
            title: "电解与金属腐蚀",
            tagline: "电能驱动反应 · 阳氧阴还",
            knowledgePoints: [
                KnowledgePoint(
                    id: "kp801", title: "电解池与放电顺序",
                    detail: "外加电源强制反应：阳极（接电源正极）氧化、阴极（接负极）还原。阴极放电序 Ag⁺>Cu²⁺>H⁺（水溶液 Na⁺/Mg²⁺/Al³⁺ 不放电）；惰性阳极放电序 S²⁻>I⁻>Br⁻>Cl⁻>OH⁻>含氧酸根。",
                    pitfall: "口诀「阳氧阴还」；活泼电极作阳极时电极本身先溶解（如精炼铜）。"),
                KnowledgePoint(
                    id: "kp802", title: "电解类型与溶液复原",
                    detail: "四类型：电解水型（强碱/含氧酸/活泼金属含氧酸盐）、电解电解质型（无氧酸/不活泼金属无氧酸盐）、放氢生碱型（活泼金属无氧酸盐如 NaCl）、放氧生酸型（不活泼金属含氧酸盐如 CuSO₄）。复原靠「出什么补什么」。",
                    pitfall: "电解 NaCl 溶液后补 HCl 复原（逸出 H₂、Cl₂）；电解 CuSO₄ 后补 CuO 复原。"),
                KnowledgePoint(
                    id: "kp803", title: "电解的计算与应用",
                    detail: "核心是两极转移电子数相等（电子守恒）。应用：氯碱工业、电解精炼铜（粗作阳极纯作阴极）、电镀（镀层金属作阳极）、电冶活泼金属（电解熔融）。"),
                KnowledgePoint(
                    id: "kp804", title: "金属腐蚀与防护",
                    detail: "电化学腐蚀为主：中性/弱酸性潮湿环境是吸氧腐蚀（正极 O₂+2H₂O+4e⁻→4OH⁻），强酸性才析氢腐蚀。防护：牺牲阳极的阴极保护法（接更活泼金属）、外加电流阴极保护法、镀层。",
                    pitfall: "一见腐蚀就写析氢是大坑——日常铁生锈绝大多数是吸氧腐蚀。"),
            ],
            problemIds: ["p_sr_23", "p_sr_30", "p_p8_01", "p_p8_02", "p_p8_03", "p_p8_04", "p_p8_05", "p_p8_06", "p_p8_07", "p_p8_08"]),
    ]

    // MARK: 选必3 有机化学段（分类→烃→衍生物→营养物质）

    private static let organicNodes: [LearningNode] = [
        LearningNode(
            id: "org_basic", order: 0, stage: .senior, topic: .organic,
            title: "有机基础 · 碳的王国",
            tagline: "四价碳、官能团与同分异构",
            knowledgePoints: [
                KnowledgePoint(
                    id: "kob1", title: "碳四价与有机物特点",
                    detail: "碳最外层 4 电子、成 4 个键，能成链成环，故有机物种类繁多。多数可燃、熔点低、难溶于水（有反例如乙醇互溶）。",
                    pitfall: "有机物不一定含氢（CCl₄）；判断结构合理性先数每个碳是否 4 个键。"),
                KnowledgePoint(
                    id: "kob2", title: "官能团决定性质",
                    detail: "官能团是决定特征性质的原子团：—OH（醇/酚）、—CHO（醛）、C=O（酮）、—COOH（羧酸）、—COO—（酯）、C=C（烯）。记官能团 = 记一类物质。",
                    pitfall: "醇与酚都含 —OH 但差异大：酚显弱酸性、遇 FeCl₃ 紫色。"),
                KnowledgePoint(
                    id: "kob3", title: "三个「同」字辈",
                    detail: "同系物（结构相似、相差 CH₂、通式相同）、同分异构体（分子式相同、结构不同）、同素异形体（同种元素的不同单质）。同位素则是原子层面。各管各的层次，不能混。",
                    pitfall: "淀粉、纤维素 (C₆H₁₀O₅)ₙ 中 n 不同，不是同分异构体。"),
                KnowledgePoint(
                    id: "kob4", title: "有机反应类型与研究方法",
                    detail: "取代、加成、消去、氧化、酯化、加聚/缩聚。研究方法：元素分析定实验式（最简式）、相对分子质量定分子式、谱学/性质定结构。"),
            ],
            problemIds: ["p_og_b01", "p_og_b02", "p_og_b03", "p_og_b04", "p_og_b05", "p_og_b06", "p_og_b07", "p_og_b08", "p_og_b09"]),

        LearningNode(
            id: "org_hydro", order: 0, stage: .senior, topic: .organic,
            title: "烃 · 烷烯炔与芳香烃",
            tagline: "从甲烷到苯：取代与加成",
            knowledgePoints: [
                KnowledgePoint(
                    id: "koh1", title: "烷烃",
                    detail: "通式 CₙH₂ₙ₊₂，碳碳单键、性质稳定，不与溴水/KMnO₄ 反应，能在光照下与卤素取代（生成混合物）。",
                    pitfall: "甲烷取代是逐步的，产物是 CH₃Cl~CCl₄ 与 HCl 的混合物。"),
                KnowledgePoint(
                    id: "koh2", title: "烯烃与炔烃",
                    detail: "烯烃含 C=C（通式 CₙH₂ₙ）、炔烃含 C≡C（CₙH₂ₙ₋₂），不饱和、活泼：与溴水/H₂ 加成、被酸性 KMnO₄ 氧化、加聚。乙烯是石化基石，乙炔用于氧炔焰焊接。",
                    pitfall: "使溴水褪色：烯炔是加成（化学），苯是萃取（物理）。"),
                KnowledgePoint(
                    id: "koh3", title: "苯与芳香烃",
                    detail: "苯环碳碳键介于单双键之间（大 π 键），不使溴水/KMnO₄ 褪色，主要发生取代（卤代、硝化、磺化）和催化加氢。甲苯侧链甲基能被 KMnO₄ 氧化（褪色）。",
                    pitfall: "「苯不褪色、甲苯褪色」是芳香烃的对比考点。"),
                KnowledgePoint(
                    id: "koh4", title: "煤和石油",
                    detail: "石油分馏（物理，按沸点分离）、裂化（化学，增产汽油）、裂解（化学，制乙烯等化工原料）；煤的干馏（化学）、气化、液化。化石燃料的综合利用。"),
            ],
            problemIds: ["p_sr_24", "p_sr_25", "p_og_h01", "p_og_h02", "p_og_h03", "p_og_h04", "p_og_h05", "p_og_h06", "p_og_h07", "p_og_h08"]),

        LearningNode(
            id: "org_deriv", order: 0, stage: .senior, topic: .organic,
            title: "烃的衍生物 · 醇醛酸酯",
            tagline: "官能团决定一切",
            knowledgePoints: [
                KnowledgePoint(
                    id: "kod1", title: "卤代烃",
                    detail: "在 NaOH 水溶液中加热水解（取代）生成醇；在 NaOH 醇溶液中加热消去生成烯烃。「水解看水、消去看醇」。卤代烃是有机合成的桥梁。"),
                KnowledgePoint(
                    id: "kod2", title: "醇与酚",
                    detail: "乙醇：与钠反应放 H₂（断 O—H）、催化氧化成乙醛、消去成乙烯。苯酚：弱酸性（与 NaOH 反应）、遇 FeCl₃ 显紫色（检验）、与浓溴水生成三溴苯酚白色沉淀。",
                    pitfall: "醇羟基中性，酚羟基弱酸性——同是 —OH 性质迥异。"),
                KnowledgePoint(
                    id: "kod3", title: "醛与羧酸",
                    detail: "醛基 —CHO 有还原性：银镜反应、与新制 Cu(OH)₂ 加热生成砖红色 Cu₂O（检验醛基），也能被还原（加 H₂）。乙酸：弱酸性（强于碳酸，能与碳酸盐放 CO₂）、与乙醇酯化。",
                    pitfall: "酮含羰基但无醛基，不能银镜。"),
                KnowledgePoint(
                    id: "kod4", title: "酯与官能团转化",
                    detail: "酯水解：酸性可逆、碱性较彻底（皂化型）。官能团主线：烯烃→醇→醛→羧酸→酯，掌握每步反应类型与条件即握住有机合成骨架。"),
            ],
            problemIds: ["p_sr_28", "p_sr_31", "p_sr_35", "p_og_d01", "p_og_d02", "p_og_d03", "p_og_d04", "p_og_d05", "p_og_d06", "p_og_d07", "p_og_d08", "p_og_d09"]),

        LearningNode(
            id: "org_life", order: 0, stage: .senior, topic: .organic,
            title: "营养物质与高分子",
            tagline: "糖、油脂、蛋白质与合成材料",
            knowledgePoints: [
                KnowledgePoint(
                    id: "kol1", title: "糖类",
                    detail: "单糖（葡萄糖 C₆H₁₂O₆，多羟基醛，能银镜、还原 Cu(OH)₂）、二糖（蔗糖/麦芽糖 C₁₂H₂₂O₁₁，互为同分异构体）、多糖（淀粉/纤维素 (C₆H₁₀O₅)ₙ）。淀粉遇碘变蓝。",
                    pitfall: "蔗糖、淀粉无醛基，不能直接银镜，需先水解。"),
                KnowledgePoint(
                    id: "kol2", title: "油脂",
                    detail: "高级脂肪酸甘油酯（酯类）。皂化反应：碱性水解生成高级脂肪酸钠（肥皂）和甘油。不饱和油脂可氢化成硬化油。是重要营养物质和工业原料。"),
                KnowledgePoint(
                    id: "kol3", title: "蛋白质与氨基酸",
                    detail: "氨基酸含 —COOH 和 —NH₂，两性。蛋白质由氨基酸缩合（肽键）而成：水解生成氨基酸；盐析（可逆，提纯）；变性（不可逆，加热/重金属/强酸碱/酒精）；遇浓硝酸变黄、灼烧有烧焦羽毛味。"),
                KnowledgePoint(
                    id: "kol4", title: "合成高分子",
                    detail: "加聚反应（双键打开首尾相连，无小分子生成，如聚乙烯）、缩聚反应（生成小分子如水）。单体、链节、聚合度是高分子的基本概念。",
                    pitfall: "聚乙烯无双键，不能使溴水褪色；保鲜膜用聚乙烯、聚氯乙烯不可包食品。"),
            ],
            problemIds: ["p_sr_36", "p_og_l01", "p_og_l02", "p_og_l03", "p_og_l04", "p_og_l05", "p_og_l06", "p_og_l07"]),
    ]

    // MARK: 高中段 ⚗️（化学实验，必考大题）

    private static let experimentNodes: [LearningNode] = [
        LearningNode(
            id: "n12x", order: 14, stage: .senior, topic: .experiment,
            title: "化学实验 · 真理的裁判所",
            tagline: "高考大题压舱石：分离、检验、制备",
            knowledgePoints: [
                KnowledgePoint(
                    id: "k12x1", title: "分离提纯四大件",
                    detail: "过滤（固液分离）、蒸发结晶（溶解度受温度影响小的，如 NaCl）、冷却结晶（受温度影响大的，如 KNO₃）、蒸馏（沸点不同的互溶液体）、萃取分液（溶解度差异 + 互不相溶，如 CCl₄ 提碘）。",
                    pitfall: "萃取剂两条件缺一不可：与原溶剂互不相溶、溶质在其中溶解度更大。酒精与水互溶，不能做萃取剂。"),
                KnowledgePoint(
                    id: "k12x2", title: "气体制备装置链",
                    detail: "发生 → 净化 → 干燥 → 收集 → 尾气处理，五段一条链。发生装置看反应物状态和条件；干燥剂酸碱配对；收集看溶解性和密度；有毒气体必须有尾气处理。",
                    pitfall: "顺序不能乱：先净化后干燥（湿气体净化后再干燥才有意义）。"),
                KnowledgePoint(
                    id: "k12x3", title: "离子检验的严谨性",
                    detail: "检验 = 排除干扰 + 特征现象。SO₄²⁻：先加足量稀盐酸（排 CO₃²⁻/SO₃²⁻/Ag⁺）再加 BaCl₂；Cl⁻：稀硝酸酸化后加 AgNO₃；NH₄⁺：加浓 NaOH 加热，湿润红色石蕊试纸变蓝。",
                    pitfall: "「先排干扰，再下结论」——直接加试剂出现象就下结论，是实验题最大的坑。"),
                KnowledgePoint(
                    id: "k12x4", title: "实验安全三反射",
                    detail: "酒精灯不能对点、不能吹灭；稀释浓硫酸「酸入水」且不断搅拌；加热液体试管口不对人。防倒吸：导管不插入液面以下，或加防倒吸装置。"),
            ],
            problemIds: ["p_exp_01", "p_exp_02", "p_exp_03"]),
    ]

    // MARK: 竞赛段 👁

    // MARK: 选必2 物质结构段（高考范围，按原子→分子→晶体递进）

    private static let structureNodes: [LearningNode] = [
        LearningNode(
            id: "struct_atom", order: 0, stage: .senior, topic: .structure,
            title: "原子结构",
            tagline: "电子怎么排，性质就怎么定",
            knowledgePoints: [
                KnowledgePoint(
                    id: "ksa1", title: "能层、能级与电子排布",
                    detail: "能层 K/L/M…，能级 s/p/d/f（s 1 轨道、p 3 轨道、d 5 轨道）。按构造原理 1s→2s→2p→3s→3p→4s→3d… 填充。基态电子排布式是结构题基本功。",
                    pitfall: "4s 先于 3d 填充（能级交错）。"),
                KnowledgePoint(
                    id: "ksa2", title: "核外电子排布三原则",
                    detail: "能量最低原理（先填低能级）、泡利原理（一轨道最多 2 个自旋相反电子）、洪特规则（简并轨道先单占且自旋平行）。",
                    pitfall: "Cr(3d⁵4s¹)、Cu(3d¹⁰4s¹) 特例：半满/全满更稳定。"),
                KnowledgePoint(
                    id: "ksa3", title: "电离能",
                    detail: "气态基态原子失去一个电子所需最低能量。同周期总体增大、同主族减小。反常：Mg>Al、N>O（半满/全满稳定）。逐级电离能突增处可判断最外层电子数。"),
                KnowledgePoint(
                    id: "ksa4", title: "电负性",
                    detail: "原子吸引电子能力，非金属性越强越大，氟最大（4.0）。同周期增大、同主族减小。电负性差>1.7 倾向离子键、<1.7 倾向共价键，可判断键型和元素金属性。"),
            ],
            problemIds: ["p_oly_01", "p_st_a01", "p_st_a02", "p_st_a03", "p_st_a04", "p_st_a05", "p_st_a06", "p_st_a07", "p_st_a08", "p_st_a09"]),

        LearningNode(
            id: "struct_mol", order: 0, stage: .senior, topic: .structure,
            title: "分子结构与性质",
            tagline: "杂化、构型与分子间的力",
            knowledgePoints: [
                KnowledgePoint(
                    id: "ksm1", title: "σ 键与 π 键",
                    detail: "单键=1σ；双键=1σ+1π；三键=1σ+2π。σ 键「头碰头」较牢，π 键「肩并肩」较弱（不饱和键易加成）。",
                    pitfall: "数杂化看 σ 键数，双键三键里只算 1 个 σ。"),
                KnowledgePoint(
                    id: "ksm2", title: "杂化与 VSEPR",
                    detail: "中心原子价层电子对数（σ键数+孤对数）=2→sp 直线、3→sp² 平面三角、4→sp³ 四面体。孤对电子参与杂化但不计入分子构型描述（H₂O 是 V 形、NH₃ 是三角锥）。",
                    pitfall: "孤对压缩键角：CH₄109.5°>NH₃107°>H₂O105°。"),
                KnowledgePoint(
                    id: "ksm3", title: "分子极性与配合物",
                    detail: "键有极性 + 结构对称 → 非极性分子（CO₂、CCl₄）；不对称 → 极性分子（H₂O、NH₃）。配合物：中心离子（提供空轨道）+ 配体（提供孤对电子）以配位键结合，配位数=配体数。"),
                KnowledgePoint(
                    id: "ksm4", title: "氢键与分子间作用力",
                    detail: "含 N、O、F 的氢化物（HF、H₂O、NH₃）分子间形成氢键，沸点反常偏高。组成结构相似的分子晶体，相对分子质量越大范德华力越大、熔沸点越高（卤素单质递增）。",
                    pitfall: "氢键是较强的分子间作用力，不是化学键。"),
            ],
            problemIds: ["p_oly_02", "p_st_m01", "p_st_m02", "p_st_m03", "p_st_m04", "p_st_m05", "p_st_m06", "p_st_m07", "p_st_m08", "p_st_m09"]),

        LearningNode(
            id: "struct_crystal", order: 0, stage: .senior, topic: .structure,
            title: "晶体结构",
            tagline: "四类晶体与晶胞计算",
            knowledgePoints: [
                KnowledgePoint(
                    id: "ksc1", title: "晶体四类型",
                    detail: "离子晶体（NaCl，离子键）、共价晶体（金刚石/SiO₂/SiC，共价键，熔点最高硬度最大）、分子晶体（干冰/冰/I₂，分子间作用力，熔点最低）、金属晶体（金属键，导电延展）。",
                    pitfall: "SiO₂ 是共价晶体——「CO₂ 是分子晶体」不能类推到 SiO₂。"),
                KnowledgePoint(
                    id: "ksc2", title: "熔沸点比较",
                    detail: "一般：共价晶体 > 离子晶体≈金属晶体 > 分子晶体。先判断晶体类型，同类型再比键强弱（离子晶体看离子电荷与半径、分子晶体看分子间作用力）。"),
                KnowledgePoint(
                    id: "ksc3", title: "晶胞与均摊法",
                    detail: "均摊法：顶点贡献 1/8、棱 1/4、面 1/2、体内 1。据此数出晶胞内微粒数、写化学式。配位数：NaCl 中 Na⁺ 周围 6 个 Cl⁻。",
                    pitfall: "晶胞是晶体的最小重复单元，化学式只表示微粒个数比。"),
                KnowledgePoint(
                    id: "ksc4", title: "晶胞密度计算",
                    detail: "ρ = 晶胞内微粒质量/晶胞体积 = nM/(Nᴀ·V)。先用均摊法求 n，再代入棱长求体积——这是结构题压轴的计算模型。"),
            ],
            problemIds: ["p_oly_03", "p_st_c01", "p_st_c02", "p_st_c03", "p_st_c04", "p_st_c05", "p_st_c06", "p_st_c07"]),
    ]

    // MARK: 竞赛段 👁（收尾：向上仰望，少而精）

    private static let olympiadNodes: [LearningNode] = [
        LearningNode(
            id: "cap", order: 0, stage: .olympiad, topic: .structure,
            title: "竞赛之窗 · 向上仰望",
            tagline: "山顶的风景：从「记性质」到「算性质」",
            knowledgePoints: [
                KnowledgePoint(
                    id: "kcap1", title: "为什么性质能「算」出来",
                    detail: "电负性、电离能、杂化、晶胞，决定了你在高中死记硬背的一切：键角、酸性、颜色、熔点。结构化学是化学从经验走向理论的入口——这就是上帝视角的降维。"),
                KnowledgePoint(
                    id: "kcap2", title: "晶胞计算与等电子原理",
                    detail: "晶胞密度 ρ=nM/(Nᴀ·V) 把微观结构与宏观可测量连起来。等电子体（原子数、价电子数相同）有相似构型，可预测陌生微粒——这些「算结构」的工具是竞赛与强基的入场券。"),
            ],
            problemIds: ["p_cap_01", "p_cap_02"]),
    ]
}
