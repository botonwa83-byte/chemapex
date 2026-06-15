import Foundation

// MARK: - 武器教学库：每把武器 = 何时用(识局) + 怎么用(步骤) + 对决例题
// 这是 ChemApex 从「题库」转向「方法教练」的内核。
// 红线：识局信号与方法步骤必须符合真实解题逻辑，不臆造。

enum WeaponGuideData {
    static let all: [WeaponGuide] = [
        electronConservation, differenceMethod, crossMethod, chargeConservation,
        extremeValue, relationMethod, atomConservation, averageMethod,
        threeStage, equivalentEquilibrium, graphReading, assignValue,
        valenceConvergence, numberLine,
        massConservation, valenceRule, solubilityCurve,
        hessCycle, orbitalSymmetry,
    ]

    static func guide(for weapon: ChemWeapon) -> WeaponGuide? {
        all.first { $0.weapon == weapon }
    }

    /// 已配教学的武器集合。
    static var taughtWeapons: Set<ChemWeapon> { Set(all.map(\.weapon)) }

    // MARK: 电子守恒（镇馆之宝）

    private static let electronConservation = WeaponGuide(
        weapon: .electronConservation,
        tagline: "氧化还原压轴，一行式子拿下",
        whenToUse: [
            "题目是氧化还原反应，且求某物质的量、体积或比例",
            "中间过程复杂、分几段反应、浓度边反应边变（如铜与浓→稀硝酸）",
            "出现「混合气体」「部分被氧化」「多步转化」等字眼",
        ],
        steps: [
            "① 找出失电子的（还原剂）和得电子的（氧化剂），标出化合价变化",
            "② 算还原剂失电子总数 = 还原剂物质的量 × 每个原子失电子数 × 原子个数",
            "③ 列守恒等式：氧化剂得电子总数 = 还原剂失电子总数",
            "④ 配合「总量方程」（如气体总物质的量）联立，一步解出",
        ],
        exampleCaseId: "boss_electron")

    // MARK: 差量法

    private static let differenceMethod = WeaponGuide(
        weapon: .differenceMethod,
        tagline: "盯住「差」，绕开繁琐的中间量",
        whenToUse: [
            "反应前后某个量（质量、体积、物质的量）发生了变化，题目给出这个「差值」",
            "金属与盐溶液反应后「增重/减重」、固体加热「失重」、气体反应「体积变化」",
        ],
        steps: [
            "① 写出反应方程式，标出与「差」相关的物质",
            "② 算出每 1 mol 反应对应的理论差值（如每 mol Fe 换 Cu 棒增重 8 g）",
            "③ 用「实际差值 ÷ 理论差值」求出反应的物质的量",
            "④ 由物质的量推所求量",
        ],
        exampleCaseId: "boss_diff")

    // MARK: 十字交叉法

    private static let crossMethod = WeaponGuide(
        weapon: .crossMethod,
        tagline: "平均值定比例，省去列方程",
        whenToUse: [
            "两组分混合，已知各自的「量」和混合后的「平均值」，求比例",
            "平均摩尔质量、平均相对分子质量、混合气体组成、溶液混合浓度",
        ],
        steps: [
            "① 把两个分量值和中间的平均值写成十字",
            "② 两个分量分别减平均值，取差的绝对值",
            "③ 交叉得到的差值之比 = 两组分的物质的量之比",
            "④ 注意：得到的是物质的量（或质量，依平均量类型）之比",
        ],
        exampleCaseId: "boss_cross")

    // MARK: 电荷守恒

    private static let chargeConservation = WeaponGuide(
        weapon: .chargeConservation,
        tagline: "溶液永远电中性，一条等式定乾坤",
        whenToUse: [
            "溶液中含多种离子，求某离子的量或浓度",
            "题目给出大部分离子、缺一个，且不告诉你来自哪种盐",
            "离子浓度大小比较、电荷/物料/质子三守恒题",
        ],
        steps: [
            "① 列出溶液中所有阳离子和阴离子",
            "② 阳离子正电荷总量 = 阴离子负电荷总量（浓度 × 电荷数求和）",
            "③ 代入已知量，解出未知离子",
            "④ 记住：与离子来自哪种盐无关，溶液整体电中性",
        ],
        exampleCaseId: "boss_charge")

    // MARK: 极值法

    private static let extremeValue = WeaponGuide(
        weapon: .extremeValue,
        tagline: "推到两个极端，真实答案夹在中间",
        whenToUse: [
            "混合物（合金、混合气体）求成分或范围，比例未知",
            "选择题判断「可能的组成」，多个选项要逐一排除",
        ],
        steps: [
            "① 假设混合物全部是组分 A，算出一个极值",
            "② 假设全部是组分 B，算出另一个极值",
            "③ 真实结果必落在两个极值之间",
            "④ 区间不包含目标值的选项直接排除",
        ],
        exampleCaseId: "boss_extreme")

    // MARK: 关系式法

    private static let relationMethod = WeaponGuide(
        weapon: .relationMethod,
        tagline: "多步反应找首尾，一条关系直达终点",
        whenToUse: [
            "多步连续反应（工业流程），求原料与产品的量关系",
            "某元素从头到尾守恒、不丢失（如 S 从 FeS₂ 到 H₂SO₄）",
        ],
        steps: [
            "① 找出贯穿首尾、守恒的元素或物质",
            "② 据原子守恒写出首尾物质的「关系式」（如 FeS₂ ~ 2H₂SO₄）",
            "③ 不必逐步配平中间反应，直接用关系式按比例算",
            "④ 注意系数比来自原子个数守恒",
        ],
        exampleCaseId: "boss_relation")

    // MARK: 原子守恒

    private static let atomConservation = WeaponGuide(
        weapon: .atomConservation,
        tagline: "某元素的原子，变化前后一个不少",
        whenToUse: [
            "复杂反应或多步过程，某元素全程不流失",
            "由产物推反应物的量、或由元素质量求组成",
        ],
        steps: [
            "① 锁定一种贯穿全程、守恒的元素",
            "② 列出含该元素的所有物质，写出原子个数守恒等式",
            "③ 代入已知量求未知量",
            "④ 常与质量守恒、电荷守恒配合使用",
        ],
        exampleCaseId: "boss_atom")

    // MARK: 平均值法

    private static let averageMethod = WeaponGuide(
        weapon: .averageMethod,
        tagline: "混合物的平均值，必在组分之间",
        whenToUse: [
            "两种或多种物质混合，已知混合物的平均摩尔质量/平均组成",
            "判断混合物可能的组成、或求某组分范围",
        ],
        steps: [
            "① 算出混合物的平均量（如平均摩尔质量 = 总质量/总物质的量）",
            "② 平均值必介于各组分的对应值之间",
            "③ 据此判断组成或排除不可能的选项",
            "④ 常与十字交叉法、极值法配合",
        ],
        exampleCaseId: "boss_average")

    // MARK: 三段式法（平衡/电离/水解计算框架）

    private static let threeStage = WeaponGuide(
        weapon: .threeStage,
        tagline: "平衡计算的万能模板：起始-转化-平衡三行排开",
        whenToUse: [
            "化学平衡、电离平衡、水解平衡求浓度/转化率/平衡常数",
            "已知起始量和某一平衡量，求其他量",
        ],
        steps: [
            "① 写出可逆反应方程式，列「起始、转化、平衡」三行",
            "② 转化量按系数比填（设一个未知数 x）",
            "③ 平衡量 = 起始量 ± 转化量",
            "④ 代入已知的平衡量解出 x，再求转化率 α=转化量/起始量 或 K",
        ],
        exampleCaseId: "boss_threestage")

    // MARK: 等效平衡法

    private static let equivalentEquilibrium = WeaponGuide(
        weapon: .equivalentEquilibrium,
        tagline: "换一种投料方式，平衡其实是同一个",
        whenToUse: [
            "两种不同投料，判断是否达到同一平衡状态",
            "把生成物「倒推」回反应物，比较是否等效",
        ],
        steps: [
            "① 把所有投料按方程式「一边倒」换算成同一边的物质",
            "② 恒温恒容：换算后各物质的量完全相同 → 等效平衡",
            "③ 恒温恒压：换算后各物质的量成相同比例即可 → 等效",
            "④ 等效平衡各组分的百分含量、转化率相同",
        ],
        exampleCaseId: nil)

    // MARK: 图像分析法

    private static let graphReading = WeaponGuide(
        weapon: .graphReading,
        tagline: "先看轴、再看点、后看拐点——图像题的破译术",
        whenToUse: [
            "平衡移动图（速率-时间、含量-温度/压强）、溶解度曲线、滴定曲线",
            "任何带坐标图的选择/填空题",
        ],
        steps: [
            "① 看清横纵坐标各代表什么量、单位",
            "② 找特殊点：起点、终点、交点、拐点、最高/最低点的含义",
            "③ 看趋势：上升/下降、陡/缓，对应什么变化",
            "④ 「先拐先平、数值大」判断条件高低（如温度、催化剂）",
        ],
        exampleCaseId: nil)

    // MARK: 赋值法（设特殊值）

    private static let assignValue = WeaponGuide(
        weapon: .assignValue,
        tagline: "比例题没数据？设个特殊值，抽象瞬间变具体",
        whenToUse: [
            "题目只给比例、百分数、没有具体数值",
            "求质量分数、体积比、平均值等「比值型」结果",
        ],
        steps: [
            "① 给未知量设一个方便计算的特殊值（常设 1 mol 或 100 g）",
            "② 按设定值算出各物理量",
            "③ 求比值/百分数（结果与所设值无关，故可任意设）",
            "④ 验证：换一个值结果应相同",
        ],
        exampleCaseId: "boss_assign")

    // MARK: 价态归中规律

    private static let valenceConvergence = WeaponGuide(
        weapon: .valenceConvergence,
        tagline: "同种元素相邻价态相遇，只靠拢不交叉",
        whenToUse: [
            "同种元素的高价态与低价态物质反应（归中反应）",
            "判断产物价态、配平、计算转移电子数",
        ],
        steps: [
            "① 找出同种元素的两个价态（高价、低价）",
            "② 归中：两者向中间靠拢，生成中间价态产物",
            "③ 「只靠拢、不交叉」——高价不会降到比低价还低",
            "④ 据此定产物价态，再用电子守恒算量",
        ],
        exampleCaseId: "boss_converge")

    // MARK: 数轴分段法

    private static let numberLine = WeaponGuide(
        weapon: .numberLine,
        tagline: "过量、滴定、共存，画条数轴分段讨论",
        whenToUse: [
            "一种物质逐渐加入另一种，产物随用量变化（如 CO₂ 通入 NaOH、盐酸滴入碳酸钠）",
            "「少量/过量」分段、图像题分段、离子共存的范围讨论",
        ],
        steps: [
            "① 画一条数轴，横轴是加入物质的量",
            "② 标出各「临界点」（恰好完全反应的量）",
            "③ 分段写出每一段的反应和产物",
            "④ 对照所给条件落在哪一段，得出结论",
        ],
        exampleCaseId: "boss_numberline")

    // MARK: 质量守恒（初中基础武器）

    private static let massConservation = WeaponGuide(
        weapon: .massConservation,
        tagline: "参加反应的总质量，前后一克不差",
        whenToUse: [
            "求反应中某物质的质量（尤其是看不见的气体）",
            "由反应物/生成物的质量推未知量，或验证质量关系",
        ],
        steps: [
            "① 列出所有参加反应的物质和所有生成物（含气体）",
            "② 反应物总质量 = 生成物总质量",
            "③ 已知量代入，解出未知质量",
            "④ 注意「参加反应的」——剩余的反应物不算",
        ],
        exampleCaseId: nil)

    // MARK: 化合价规则（初中基础武器）

    private static let valenceRule = WeaponGuide(
        weapon: .valenceRule,
        tagline: "正负化合价代数和为零",
        whenToUse: [
            "求化合物中某元素的化合价",
            "由化合价书写化学式、判断化学式是否合理",
        ],
        steps: [
            "① 标出已知元素的化合价（H +1、O −2、金属正价等）",
            "② 设未知元素化合价为 x",
            "③ 各元素化合价 × 原子个数，代数和 = 0",
            "④ 解出 x；单质中元素化合价为 0",
        ],
        exampleCaseId: nil)

    // MARK: 溶解度曲线（初中基础武器）

    private static let solubilityCurve = WeaponGuide(
        weapon: .solubilityCurve,
        tagline: "曲线上的点 = 该温度的饱和状态",
        whenToUse: [
            "溶解度曲线读图：求某温度的溶解度、判断饱和/不饱和",
            "结晶方法选择、溶质质量分数计算",
        ],
        steps: [
            "① 曲线上的点表示该温度下的饱和溶液",
            "② 点在曲线下方=不饱和、上方=过饱和（有晶体析出）",
            "③ 溶解度受温度影响大→降温结晶；影响小→蒸发结晶",
            "④ 饱和溶液质量分数 = 溶解度/(100+溶解度)×100%",
        ],
        exampleCaseId: nil)

    // MARK: 热力学循环（盖斯定律进阶，竞赛）

    private static let hessCycle = WeaponGuide(
        weapon: .hessCycle,
        tagline: "状态函数只看始末，设计循环绕开未知",
        whenToUse: [
            "求某反应的反应热，但它难以直接测定",
            "已知几个相关反应的 ΔH，要拼出目标反应",
            "晶格能、键能、生成焓的循环计算（玻恩-哈伯循环）",
        ],
        steps: [
            "① 把目标反应的始态、末态画出来",
            "② 找一条由已知反应组成的「迂回路径」连接始末态",
            "③ 盖斯定律：两条路径的总 ΔH 相等",
            "④ 把已知反应像代数式一样加减，ΔH 同步加减，解出目标",
        ],
        exampleCaseId: "boss_hess")

    // MARK: 轨道与对称（结构化学，竞赛）

    private static let orbitalSymmetry = WeaponGuide(
        weapon: .orbitalSymmetry,
        tagline: "电子排布与对称性，决定性质",
        whenToUse: [
            "判断微粒的空间构型、键角、是否极性",
            "用等电子原理预测陌生微粒的结构",
            "由电子排布解释电离能/电负性的反常（半满全满）",
        ],
        steps: [
            "① 写出中心原子的电子排布、数出 σ 键与孤对电子",
            "② 由价层电子对数定杂化方式与空间构型（VSEPR）",
            "③ 看分子是否对称→判断极性；看排布是否半满/全满→判断稳定性",
            "④ 等电子体（原子数、价电子数相同）构型相似，可迁移预测",
        ],
        exampleCaseId: "boss_orbital")
}
