import Foundation

// MARK: - 武器教学库：每把武器 = 何时用(识局) + 怎么用(步骤) + 对决例题
// 这是 ChemApex 从「题库」转向「方法教练」的内核。
// 红线：识局信号与方法步骤必须符合真实解题逻辑，不臆造。

enum WeaponGuideData {
    static let all: [WeaponGuide] = [
        electronConservation, differenceMethod, crossMethod, chargeConservation,
        extremeValue, relationMethod, atomConservation, averageMethod,
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
        exampleCaseId: nil)

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
        exampleCaseId: nil)
}
