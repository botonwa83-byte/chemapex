import Foundation

// MARK: - 登顶之路：学习主线 13 关
// 节点 = 学(知识点) → 练(题目) → 战(Boss 守恒之眼)。
// 顺序即学习顺序：初中直觉 → 高中主战场 → 竞赛仰望。

enum MainLineData {
    static let nodes: [LearningNode] = juniorNodes + seniorNodes1 + seniorNodes2 + olympiadNodes

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
            ],
            problemIds: ["p_sr_01", "p_sr_02", "p_sr_03"],
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
            ],
            problemIds: ["p_sr_04", "p_sr_05", "p_sr_06"],
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
            ],
            problemIds: ["p_sr_07", "p_sr_08", "p_sr_09"],
            bossCaseId: "boss_electron",
            weaponUnlocked: .electronConservation),

        LearningNode(
            id: "n06", order: 7, stage: .senior, topic: .metals,
            title: "金属王国 · Na / Al / Fe",
            tagline: "三大金属各有性格：暴烈、两性、变价",
            knowledgePoints: [
                KnowledgePoint(
                    id: "k0601", title: "钠：暴烈的碱金属",
                    detail: "与水反应「浮、熔、游、响、红」；Na₂O₂ 淡黄色，与 H₂O、CO₂ 反应都放 O₂，作供氧剂。钠保存在煤油中。",
                    pitfall: "Na₂O₂ 中氧为 −1 价，与水反应是歧化，Na₂O₂ 既是氧化剂又是还原剂。"),
                KnowledgePoint(
                    id: "k0602", title: "铝：两性的代表",
                    detail: "Al、Al₂O₃、Al(OH)₃ 都既溶于强酸又溶于强碱。AlCl₃ 加 NaOH：少量生成白色沉淀，过量则沉淀溶解——图像题的常客。",
                    pitfall: "「少量/过量」决定产物：CO₂ 通入 NaOH 同理（Na₂CO₃ vs NaHCO₃）。"),
                KnowledgePoint(
                    id: "k0603", title: "铁：变价的艺术",
                    detail: "Fe²⁺ 浅绿、Fe³⁺ 黄色。Fe³⁺ 遇 KSCN 血红；Fe²⁺ 先加 KSCN 无现象再加氯水变红。铁与氯气燃烧只生成 FeCl₃（即使铁过量），与稀盐酸只生成 FeCl₂。"),
                KnowledgePoint(
                    id: "k0604", title: "Na₂CO₃ 与 NaHCO₃",
                    detail: "鉴别三法：①加热（NaHCO₃ 分解放 CO₂，Na₂CO₃ 不分解）②与盐酸反应剧烈程度（NaHCO₃ 更快）③CaCl₂ 溶液（Na₂CO₃ 出沉淀）。向 Na₂CO₃ 溶液逐滴加盐酸：先 CO₃²⁻→HCO₃⁻ 无气泡，后放 CO₂——滴加顺序决定现象。",
                    pitfall: "稳定性：正盐 > 酸式盐；溶解度 Na₂CO₃ > NaHCO₃（与多数「酸式盐更易溶」直觉相反）。"),
            ],
            problemIds: ["p_sr_10", "p_sr_11", "p_sr_12"],
            bossCaseId: "boss_extreme",
            weaponUnlocked: .extremeValue),

        LearningNode(
            id: "n07", order: 8, stage: .senior, topic: .nonmetals,
            title: "非金属群雄 · Cl / S / N / Si",
            tagline: "气体、酸与漂白——非金属的舞台",
            knowledgePoints: [
                KnowledgePoint(
                    id: "k0701", title: "氯：黄绿色的强者",
                    detail: "Cl₂ 黄绿色有毒。溶于水部分反应生成 HCl 和 HClO，漂白靠 HClO。实验室制法 MnO₂+4HCl(浓)，必须用浓盐酸且加热。",
                    pitfall: "干燥的氯气不能漂白干燥布条——漂白的是 HClO 不是 Cl₂。"),
                KnowledgePoint(
                    id: "k0702", title: "硫：浓硫酸三性",
                    detail: "浓硫酸：吸水性（作干燥剂）、脱水性（蔗糖炭化）、强氧化性（与 Cu 加热反应放 SO₂，常温使 Fe/Al 钝化）。SO₂ 漂白品红可逆，加热复原。",
                    pitfall: "吸水性与脱水性的区别：吸现成的水 vs 把 H、O 从有机物里夺出来。"),
                KnowledgePoint(
                    id: "k0703", title: "氮：从 NH₃ 到 HNO₃",
                    detail: "NH₃ 极易溶于水（喷泉实验）、唯一碱性气体，干燥用碱石灰。NO 无色不溶、NO₂ 红棕色。硝酸与铜：浓出 NO₂、稀出 NO。",
                    pitfall: "收集 NH₃ 用向下排空气法，不能排水；NO 只能排水收集（遇空气变红棕）。"),
                KnowledgePoint(
                    id: "k0704", title: "硅：信息时代的基石",
                    detail: "硅是半导体材料（芯片、太阳能电池）；SiO₂ 是光导纤维原料。SiO₂ 是酸性氧化物，却有两个「叛逆」：能与氢氟酸反应（刻蚀玻璃），能与 NaOH 反应（所以碱液瓶用橡胶塞）。",
                    pitfall: "「硅」做半导体、「SiO₂」做光纤——材料与用途别张冠李戴。"),
            ],
            problemIds: ["p_sr_13", "p_sr_14", "p_sr_15"],
            bossCaseId: "boss_relation",
            weaponUnlocked: .relationMethod),
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
            ],
            problemIds: ["p_sr_16", "p_sr_17"]),

        LearningNode(
            id: "n09", order: 10, stage: .senior, topic: .energy,
            title: "能量与平衡 · 反应的方向盘",
            tagline: "反应放不放热、走多快、到哪停",
            knowledgePoints: [
                KnowledgePoint(
                    id: "k0901", title: "放热与吸热",
                    detail: "放热：燃烧、中和、活泼金属与酸、铝热。吸热：Ba(OH)₂·8H₂O 与 NH₄Cl、大多数分解反应、C 与 CO₂/H₂O 的反应。键能角度：断键吸热、成键放热。",
                    pitfall: "需要加热才能发生 ≠ 吸热反应——燃烧也要点燃，但它放热。"),
                KnowledgePoint(
                    id: "k0902", title: "平衡的标志",
                    detail: "本质标志：正逆速率相等。判断技巧：找「变量」——随反应进行会变的量（如变气体分子数反应的压强、平均摩尔质量）不再变化，即达平衡。",
                    pitfall: "「浓度比等于系数比」「速率比等于系数比（同向）」都不是平衡标志。"),
                KnowledgePoint(
                    id: "k0903", title: "勒夏特列原理",
                    detail: "改变条件，平衡向「削弱这种改变」的方向移动——只削弱，不抵消。升温向吸热方向、加压向气体分子数减小方向移动。"),
                KnowledgePoint(
                    id: "k0904", title: "热化学方程式与盖斯定律",
                    detail: "热化学方程式三要素：标聚集态(g/l/s)、ΔH 带符号和单位、系数只表示物质的量（可为分数）。盖斯定律：反应热只与始末状态有关——方程式可以像代数式一样加减，ΔH 跟着加减。",
                    pitfall: "燃烧热对应生成液态水；中和热对应生成 1 mol 液态水。聚集态写错是最高频失分点。"),
                KnowledgePoint(
                    id: "k0905", title: "反应速率及影响因素",
                    detail: "v = Δc/Δt，单位 mol/(L·s)。同一反应中各物质速率之比 = 化学计量数之比。影响因素：浓度、压强（仅气体）、温度、催化剂、接触面积。",
                    pitfall: "固体和纯液体的「浓度」视为常数——增加固体的量不改变速率（增大接触面积才会）。"),
            ],
            problemIds: ["p_sr_18", "p_sr_19", "p_sr_26"]),

        LearningNode(
            id: "n10", order: 11, stage: .senior, topic: .solution,
            title: "水溶液 · 离子的平衡术",
            tagline: "pH、弱电解质与三大守恒的主场",
            knowledgePoints: [
                KnowledgePoint(
                    id: "k1001", title: "水的离子积与 pH",
                    detail: "常温下 c(H⁺)·c(OH⁻) = 10⁻¹⁴，pH = −lg c(H⁺)。酸性 pH<7、碱性 pH>7（仅限常温）。",
                    pitfall: "升温后纯水 pH < 7 但仍是中性——中性的标准是 c(H⁺)=c(OH⁻)，不是 pH=7。"),
                KnowledgePoint(
                    id: "k1002", title: "强酸与弱酸",
                    detail: "同浓度：强酸 c(H⁺) 大、pH 小；同 pH：弱酸「储备」多，稀释后 pH 变化小、与足量金属反应产气多。"),
                KnowledgePoint(
                    id: "k1003", title: "溶液三大守恒",
                    detail: "电荷守恒（正=负）、物料守恒（元素总量不变）、质子守恒（得失 H⁺ 相等）。离子浓度大小比较题的三把钥匙。"),
                KnowledgePoint(
                    id: "k1004", title: "盐类水解",
                    detail: "口诀：有弱才水解，越弱越水解，谁强显谁性。强碱弱酸盐（Na₂CO₃、CH₃COONa）显碱性；强酸弱碱盐（NH₄Cl、FeCl₃）显酸性。升温促进水解；FeCl₃ 净水、明矾净水都是水解的应用。",
                    pitfall: "水解是微弱的、可逆的——离子方程式用 ⇌，一般不标 ↑↓（双水解相互促进进行到底的除外）。"),
                KnowledgePoint(
                    id: "k1005", title: "沉淀溶解平衡与 Ksp",
                    detail: "难溶电解质在水中存在溶解平衡，Ksp 只与温度有关。Q > Ksp 沉淀生成，Q < Ksp 沉淀溶解。沉淀转化向更难溶的方向进行（如 AgCl → AgBr → AgI，颜色白→浅黄→黄）。",
                    pitfall: "Ksp 小不一定溶解度小——只有同类型（如都是 AB 型）才能直接比较。"),
            ],
            problemIds: ["p_sr_20", "p_sr_21", "p_sr_27"]),

        LearningNode(
            id: "n11", order: 12, stage: .senior, topic: .electrochem,
            title: "电化学 · 电子的迁徙",
            tagline: "原电池与电解池：一个放电，一个充电",
            knowledgePoints: [
                KnowledgePoint(
                    id: "k1101", title: "原电池：负失氧",
                    detail: "自发氧化还原 → 电能。负极失电子（氧化），正极得电子（还原）；电子走外电路，阴离子在溶液中流向负极。",
                    pitfall: "电子不下水！电子只走导线，溶液中靠离子定向移动导电。"),
                KnowledgePoint(
                    id: "k1102", title: "电解池：阳氧阴还",
                    detail: "外加电源强制反应。阳极氧化（接正极）、阴极还原。阴极放电顺序：Ag⁺ > Cu²⁺ > H⁺；水溶液中 Na⁺、Mg²⁺、Al³⁺ 不放电。"),
                KnowledgePoint(
                    id: "k1103", title: "电解饱和食盐水",
                    detail: "阳极 Cl₂、阴极 H₂、阴极区生成 NaOH——氯碱工业。两极产物先判断、再用电子守恒算量。"),
            ],
            problemIds: ["p_sr_22", "p_sr_23"]),

        LearningNode(
            id: "n12", order: 13, stage: .senior, topic: .organic,
            title: "有机入门 · 碳的王国",
            tagline: "四价碳搭出的无限世界",
            knowledgePoints: [
                KnowledgePoint(
                    id: "k1201", title: "碳四价与同分异构",
                    detail: "碳永远四个键。分子式相同、结构不同 = 同分异构体（如正丁烷与异丁烷）。",
                    pitfall: "同分异构 ≠ 同素异形体（金刚石/石墨）≠ 同位素（¹²C/¹³C）——三个「同」字辈各管各的。"),
                KnowledgePoint(
                    id: "k1202", title: "取代与加成",
                    detail: "取代：换下来（甲烷+Cl₂ 光照）；加成：加上去（乙烯+Br₂ 使溴水褪色）。鉴别烷烃与烯烃就靠这一手。"),
                KnowledgePoint(
                    id: "k1203", title: "乙醇与乙酸",
                    detail: "乙醇：与钠反应放 H₂、催化氧化成乙醛。乙酸：弱酸性、与乙醇发生酯化（浓硫酸催化，酸脱羟基醇脱氢）。"),
                KnowledgePoint(
                    id: "k1204", title: "苯与基本营养物质",
                    detail: "苯环上的碳碳键介于单双键之间——苯不能使溴水和酸性 KMnO₄ 褪色，但能与液溴（FeBr₃ 催化）发生取代。糖类、油脂、蛋白质：葡萄糖银镜反应检验醛基，蛋白质灼烧有烧焦羽毛味、遇浓硝酸变黄。",
                    pitfall: "苯使溴水「褪色」是萃取（物理过程），不是反应——和乙烯的加成褪色本质不同。"),
            ],
            problemIds: ["p_sr_24", "p_sr_25", "p_sr_28"]),

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

    private static let olympiadNodes: [LearningNode] = [
        LearningNode(
            id: "n13", order: 15, stage: .olympiad, topic: .structure,
            title: "结构之眼 · 晶体与轨道",
            tagline: "山顶的风景：从「记性质」到「算性质」",
            knowledgePoints: [
                KnowledgePoint(
                    id: "k1301", title: "电子排布式",
                    detail: "按能量最低原理填充：1s → 2s → 2p → 3s → 3p → 4s → 3d…。洪特规则：简并轨道先单占、自旋平行。",
                    pitfall: "Cr 和 Cu 特例：3d⁵4s¹、3d¹⁰4s¹——半满全满更稳定。"),
                KnowledgePoint(
                    id: "k1302", title: "为什么性质能「算」出来",
                    detail: "电负性、电离能、轨道杂化决定了你在高中死记硬背的一切：键角、酸性、颜色。结构化学是化学从经验走向理论的入口——这就是降维视角。"),
            ],
            problemIds: ["p_oly_01"]),
    ]
}
