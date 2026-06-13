import Foundation

// MARK: - 守恒之眼：双解对决战例
// 每个战例 = 常规硬解 vs 武器秒杀，timeRatio 由耗时自动计算。
// 全部数值均经过验算；不标注虚构出处。

enum DescentCases {
    static let all: [ChemProblem] = [

        // ===== Boss 1（N2）：差量法 =====
        ChemProblem(
            id: "boss_diff", stage: .junior, topic: .massConservation,
            content: "将质量为 10 g 的铁棒插入 CuSO₄ 溶液中，一段时间后取出、洗涤、干燥，称得质量为 10.8 g。参加反应的铁的质量是？",
            options: ["0.8 g", "5.6 g", "6.4 g", "2.8 g"],
            answerIndex: 1,
            explanation: "Fe + CuSO₄ → FeSO₄ + Cu：每反应 56 g Fe，棒上沉积 64 g Cu，净增 8 g。实际增重 0.8 g，是「每摩尔净增 8 g」的 0.1 倍，故反应了 0.1 mol 铁，即 5.6 g。",
            nodeId: "n02", weapon: .differenceMethod,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：设未知数列方程",
                    steps: [
                        "设参加反应的 Fe 为 x mol",
                        "Fe + CuSO₄ → FeSO₄ + Cu，析出 Cu 也是 x mol",
                        "棒的质量变化：10 − 56x + 64x = 10.8",
                        "解得 8x = 0.8，x = 0.1 mol",
                        "m(Fe) = 0.1 × 56 = 5.6 g",
                    ],
                    timeMinutes: 4),
                descent: SolutionPath(
                    title: "差量法：盯住那 0.8 g",
                    steps: [
                        "每 1 mol Fe 换成 Cu，棒净增 64 − 56 = 8 g",
                        "实际净增 0.8 g → 反应 0.1 mol → 5.6 g ✓",
                    ],
                    timeMinutes: 1),
                weapon: .differenceMethod,
                keyInsight: "不要追踪每个量，只追踪「差」——差与反应量严格成比例。",
                plainTalk: "把铁棒想成一杆秤：每做一笔「56 换 64」的交易就赚 8 克。现在总共赚了 0.8 克，那不就是做了 0.1 笔交易吗？一笔交易 = 1/10 摩尔铁。")),

        // ===== Boss 2（N3）：十字交叉法 =====
        ChemProblem(
            id: "boss_cross", stage: .senior, topic: .mole,
            content: "CO 与 CO₂ 的混合气体，平均摩尔质量为 36 g/mol。则 V(CO) : V(CO₂) 为？",
            options: ["1 : 1", "1 : 2", "2 : 1", "7 : 11"],
            answerIndex: 0,
            explanation: "M(CO) = 28，M(CO₂) = 44。十字交叉：n(CO) : n(CO₂) = (44 − 36) : (36 − 28) = 8 : 8 = 1 : 1。同温同压下体积比等于物质的量之比。",
            nodeId: "n03", weapon: .crossMethod,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：设比例列方程",
                    steps: [
                        "设 n(CO) = x mol，n(CO₂) = y mol",
                        "平均摩尔质量：(28x + 44y) / (x + y) = 36",
                        "展开：28x + 44y = 36x + 36y",
                        "整理：8y = 8x，即 x : y = 1 : 1",
                    ],
                    timeMinutes: 3),
                descent: SolutionPath(
                    title: "十字交叉：差值定比例",
                    steps: [
                        "28（CO）和 44（CO₂）夹住平均值 36",
                        "n(CO) : n(CO₂) = (44−36) : (36−28) = 1 : 1 ✓",
                    ],
                    timeMinutes: 0.5),
                weapon: .crossMethod,
                keyInsight: "平均值一定落在两个分量之间；谁离平均值越近，谁占的份额越大。",
                plainTalk: "班里两组同学考试，一组平均 28 分一组平均 44 分，全班平均 36 分——正好是正中间，说明两组人数一样多。气体也一样：36 离 28 和 44 一样远，所以两种气体一样多。")),

        // ===== Boss 3（N4）：电荷守恒 =====
        ChemProblem(
            id: "boss_charge", stage: .senior, topic: .ionReaction,
            content: "某溶液中含 Na⁺ 0.2 mol、Mg²⁺ 0.1 mol、Cl⁻ 0.1 mol，其余阴离子只有 SO₄²⁻。则 SO₄²⁻ 的物质的量为？",
            options: ["0.1 mol", "0.15 mol", "0.2 mol", "0.3 mol"],
            answerIndex: 1,
            explanation: "溶液整体不带电：正电荷 0.2×1 + 0.1×2 = 0.4 mol，负电荷 0.1×1 + n×2 = 0.4，解得 n(SO₄²⁻) = 0.15 mol。",
            nodeId: "n04", weapon: .chargeConservation,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：逐一配对找盐",
                    steps: [
                        "尝试推断溶液由哪些盐混合而成",
                        "设 NaCl a mol、Na₂SO₄ b mol、MgSO₄ c mol、MgCl₂ d mol…",
                        "列方程：a + 2b = 0.2，c + d = 0.1，a + 2d = 0.1，b + c = ?",
                        "未知数比方程多，还得讨论取值——越算越乱",
                    ],
                    timeMinutes: 8),
                descent: SolutionPath(
                    title: "电荷守恒：溶液永远不带电",
                    steps: [
                        "正电荷总量：0.2 + 0.1×2 = 0.4 mol",
                        "负电荷总量：0.1 + 2·n(SO₄²⁻) = 0.4 → n = 0.15 mol ✓",
                    ],
                    timeMinutes: 1),
                weapon: .chargeConservation,
                keyInsight: "别管离子来自哪种盐——溶液整体永远电中性，一条等式定乾坤。",
                plainTalk: "你不需要知道这锅汤是用哪几包调料冲出来的。只要记住一件事：汤不带电。把正电荷加一加、负电荷加一加，两边必须相等，缺多少硫酸根就是多少。")),

        // ===== Boss 4（N5）：电子守恒（镇馆之宝） =====
        ChemProblem(
            id: "boss_electron", stage: .senior, topic: .redox,
            content: "38.4 g 铜与适量浓硝酸反应，铜全部溶解，共收集到标准状况下 NO 和 NO₂ 的混合气体 22.4 L。则 V(NO) : V(NO₂) 为？",
            options: ["1 : 9", "9 : 1", "1 : 3", "3 : 1"],
            answerIndex: 0,
            explanation: "n(Cu) = 38.4/64 = 0.6 mol，失电子 1.2 mol。气体共 1 mol，设 NO x mol（得 3e⁻）、NO₂ y mol（得 1e⁻）：x + y = 1，3x + y = 1.2，解得 x = 0.1、y = 0.9，体积比 1:9。",
            nodeId: "n05", weapon: .electronConservation,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：写两个方程式联立",
                    steps: [
                        "浓硝酸阶段：Cu + 4HNO₃(浓) → Cu(NO₃)₂ + 2NO₂↑ + 2H₂O",
                        "变稀后：3Cu + 8HNO₃(稀) → 3Cu(NO₃)₂ + 2NO↑ + 4H₂O",
                        "设两个反应分别消耗 Cu 为 a、b mol",
                        "a + b = 0.6；气体 2a + (2/3)b = 1",
                        "解联立方程：a = 0.45，b = 0.15",
                        "n(NO₂) = 0.9，n(NO) = 0.1，比为 1 : 9",
                    ],
                    timeMinutes: 10),
                descent: SolutionPath(
                    title: "电子守恒：只看电子的账本",
                    steps: [
                        "Cu 共失电子：0.6 mol × 2 = 1.2 mol",
                        "设 NO x mol、NO₂ y mol：x + y = 1（总量）",
                        "得电子：3x + y = 1.2（守恒）→ x = 0.1，y = 0.9 ✓",
                    ],
                    timeMinutes: 2),
                weapon: .electronConservation,
                keyInsight: "中间过程再复杂，电子的总账只有一本：氧化剂得 = 还原剂失。",
                plainTalk: "别去管硝酸什么时候浓什么时候稀、反应分几段——那是过程戏码。只盯一件事：铜总共交出了 1.2 摩尔电子，这些电子最后全被氮收走了。NO 一个收 3 个电子，NO₂ 一个收 1 个，按总数分账就完了。")),

        // ===== Boss 5（N6）：极值法 =====
        ChemProblem(
            id: "boss_extreme", stage: .senior, topic: .metals,
            content: "由两种金属组成的合金 10 g，与足量稀盐酸反应，生成标准状况下 11.2 L（即 0.5 mol）H₂。该合金可能的组成是？",
            options: ["Mg 和 Al", "Fe 和 Zn", "Cu 和 Zn", "Mg 和 Cu"],
            answerIndex: 0,
            explanation: "极值法：10 g 纯金属产 H₂ 分别为 Mg 0.417 mol、Al 0.556 mol、Fe 0.179 mol、Zn 0.154 mol、Cu 0。混合物的产气量必介于两种纯金属之间，只有 Mg(0.417)–Al(0.556) 区间夹住 0.5。",
            nodeId: "al", weapon: .extremeValue,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：逐个选项设方程检验",
                    steps: [
                        "对选项 A：设 Mg x g、Al (10−x) g",
                        "产氢：x/24 + 1.5(10−x)/27 = 0.5",
                        "解得 x ≈ 4，0 < 4 < 10 成立 → A 可能",
                        "对 B、C、D 各再设一遍方程逐一排除…",
                        "四个选项四套方程，耗时且易错",
                    ],
                    timeMinutes: 10),
                descent: SolutionPath(
                    title: "极值法：假设全是一种金属",
                    steps: [
                        "算出 10 g 纯金属各产多少氢：Mg 0.417 / Al 0.556 / Fe 0.179 / Zn 0.154 / Cu 0（mol）",
                        "混合物结果必在两个极值之间",
                        "只有 [0.417, 0.556] 夹住 0.5 → 选 Mg 和 Al ✓",
                    ],
                    timeMinutes: 2.5),
                weapon: .extremeValue,
                keyInsight: "把混合物推到两个极端，真实答案必被夹在中间——区间不含目标值的直接排除。",
                plainTalk: "不知道两种金属各占多少？那就走极端：假设 10 克全是甲、再假设全是乙，算出两个「天花板和地板」。真实情况一定在两者之间。0.5 摩尔氢气只有镁和铝这对组合夹得住。")),

        // ===== Boss 6（N7）：关系式法 =====
        ChemProblem(
            id: "boss_relation", stage: .senior, topic: .nonmetals,
            content: "接触法制硫酸：FeS₂ → SO₂ → SO₃ → H₂SO₄。用 120 g 纯 FeS₂（M = 120 g/mol），假设各步转化完全，理论上可制得 H₂SO₄ 的质量为？",
            options: ["98 g", "196 g", "120 g", "245 g"],
            answerIndex: 1,
            explanation: "硫原子守恒：1 mol FeS₂ 含 2 mol S，最终全部进入 H₂SO₄，故 FeS₂ ~ 2H₂SO₄。120 g FeS₂ = 1 mol → 2 mol H₂SO₄ = 196 g。",
            nodeId: "s", weapon: .relationMethod,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：三个方程逐步换算",
                    steps: [
                        "4FeS₂ + 11O₂ →(高温) 2Fe₂O₃ + 8SO₂",
                        "2SO₂ + O₂ ⇌(催化剂,Δ) 2SO₃",
                        "SO₃ + H₂O → H₂SO₄",
                        "1 mol FeS₂ → 2 mol SO₂ → 2 mol SO₃ → 2 mol H₂SO₄",
                        "逐步换算，三次配平三次比例，链条越长越容易抄错",
                    ],
                    timeMinutes: 8),
                descent: SolutionPath(
                    title: "关系式法：首尾直连",
                    steps: [
                        "S 原子从头走到尾，一个不丢：FeS₂ ~ 2H₂SO₄",
                        "1 mol × 2 × 98 g/mol = 196 g ✓",
                    ],
                    timeMinutes: 1.5),
                weapon: .relationMethod,
                keyInsight: "多步反应不必步步为营——找到贯穿首尾的原子，写一条关系式直达终点。",
                plainTalk: "硫原子就像快递包裹，中间转了三个仓库，但一件都没丢。你不用管每个仓库怎么分拣，只要数清楚发货时有多少件（2 份硫），收货时就有多少件（2 份硫酸）。")),
    ] + batch2

    // MARK: 扩容对决（每把武器再补一道，覆盖更多题型）

    private static let batch2: [ChemProblem] = [

        // 电子守恒 · 金属与硝酸
        ChemProblem(
            id: "boss_electron2", stage: .senior, topic: .redox,
            content: "11.2 g 铁与足量稀硝酸完全反应（铁被氧化为 Fe³⁺），生成标准状况下 NO 气体的体积为？（Fe 56 g/mol）",
            options: ["2.24 L", "4.48 L", "6.72 L", "3.36 L"],
            answerIndex: 1,
            explanation: "n(Fe)=11.2/56=0.2 mol，Fe→Fe³⁺ 失 3 电子共 0.6 mol。NO 中 N 由 +5→+2 得 3 电子，n(NO)=0.6/3=0.2 mol，标况体积 0.2×22.4=4.48 L。",
            nodeId: "fe", weapon: .electronConservation,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：配平方程式再换算",
                    steps: [
                        "写出并配平：Fe + 4HNO₃(稀) → Fe(NO₃)₃ + NO↑ + 2H₂O",
                        "由方程式 1 mol Fe ~ 1 mol NO",
                        "n(Fe)=0.2 mol → n(NO)=0.2 mol",
                        "V=0.2×22.4=4.48 L",
                    ],
                    timeMinutes: 4),
                descent: SolutionPath(
                    title: "电子守恒：不用配平方程式",
                    steps: [
                        "Fe 失电子：0.2 mol × 3 = 0.6 mol",
                        "N 每个得 3 电子：n(NO)=0.6/3=0.2 mol → 4.48 L ✓",
                    ],
                    timeMinutes: 1),
                weapon: .electronConservation,
                keyInsight: "金属与硝酸/硫酸反应求气体，电子守恒一步到位，不必背配平后的系数。",
                plainTalk: "铁交出 0.6 个单位的电子，每个 NO 收 3 个，那能凑出多少个 NO？0.6÷3=0.2。气体在标况下一摩尔 22.4 升，乘一下就完了。")),

        // 差量法 · 固体加热失重
        ChemProblem(
            id: "boss_diff2", stage: .senior, topic: .metals,
            content: "加热一定量 NaHCO₃ 固体，完全分解后固体质量减少了 6.2 g。则原 NaHCO₃ 的物质的量为？（2NaHCO₃→Na₂CO₃+H₂O↑+CO₂↑）",
            options: ["0.1 mol", "0.2 mol", "0.4 mol", "0.62 mol"],
            answerIndex: 1,
            explanation: "每 2 mol NaHCO₃ 分解，逸出 H₂O(18)+CO₂(44)=62 g，固体减少 62 g。减少 6.2 g 对应 0.2 mol NaHCO₃。",
            nodeId: "na", weapon: .differenceMethod,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：设未知数列式",
                    steps: [
                        "设 NaHCO₃ 为 x mol，分解生成 Na₂CO₃ x/2 mol",
                        "固体减少 = 原质量 − 剩余 = 84x − 106·(x/2)",
                        "84x − 53x = 31x = 6.2，x = 0.2 mol",
                    ],
                    timeMinutes: 3),
                descent: SolutionPath(
                    title: "差量法：盯住逸出的气体",
                    steps: [
                        "固体减少的正是逸出的 H₂O + CO₂：每 2 mol NaHCO₃ 减 62 g",
                        "6.2 g ÷ (62 g / 2 mol) = 0.2 mol ✓",
                    ],
                    timeMinutes: 1),
                weapon: .differenceMethod,
                keyInsight: "固体加热失重题，「减少的质量」就是逸出物的质量——直接对应物质的量。",
                plainTalk: "固体轻了多少，就是跑掉的气体有多重。每分解 2 摩尔小苏打跑掉 62 克气体，现在跑了 6.2 克，正好是 1/10，也就是 0.2 摩尔。")),

        // 极值法 · 混合气体
        ChemProblem(
            id: "boss_extreme2", stage: .senior, topic: .nonmetals,
            content: "CO 和 CO₂ 的混合气体共 0.5 mol，质量为 18 g。要判断是否可能，下列说法正确的是？（CO 28、CO₂ 44 g/mol）",
            options: ["不可能，平均摩尔质量超出范围", "可能，CO 约 0.25 mol", "可能，全是 CO₂", "可能，全是 CO"],
            answerIndex: 1,
            explanation: "平均摩尔质量 = 18/0.5 = 36 g/mol，介于 28(CO) 和 44(CO₂) 之间，故混合可能。十字交叉得 n(CO):n(CO₂)=(44−36):(36−28)=1:1，各 0.25 mol。",
            nodeId: "n", weapon: .extremeValue,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：设二元一次方程组",
                    steps: [
                        "设 CO x mol、CO₂ y mol",
                        "x + y = 0.5；28x + 44y = 18",
                        "解得 x = 0.25，y = 0.25",
                    ],
                    timeMinutes: 3),
                descent: SolutionPath(
                    title: "极值法：先看平均值在不在区间内",
                    steps: [
                        "平均摩尔质量 = 18 / 0.5 = 36 g/mol",
                        "36 落在 [28, 44] 之间 → 混合可能",
                        "（要具体值再用十字交叉：1:1，各 0.25 mol）",
                    ],
                    timeMinutes: 1),
                weapon: .extremeValue,
                keyInsight: "判断混合物「可不可能」，先算平均值看它在不在两组分之间——超出即不可能，秒判。",
                plainTalk: "两种气体一个 28 一个 44，不管怎么混，平均都只能在 28 和 44 之间。算出平均是 36，在区间里，所以这事儿能成。")),
    ]

    static func bossCase(id: String) -> ChemProblem? {
        all.first { $0.id == id }
    }
}
