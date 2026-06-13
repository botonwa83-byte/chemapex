import Foundation

// MARK: - 守恒之眼：双解对决战例
// 每个战例 = 常规硬解 vs 武器秒杀，timeRatio 由耗时自动计算。
// 全部数值均经过验算；不标注虚构出处。

enum DescentCases {
    static let all: [ChemProblem] = {
        var list = batch1
        list += batch2
        list += batch3
        return list
    }()

    private static let batch1: [ChemProblem] = [

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
                principle: "原理：反应严格按方程式的系数比进行，所以「每反应 1 mol 对应的变化量」是一个固定常数。质量、体积这些量的「差」与反应进行的程度成正比——这不是巧合，是定量关系的必然。抓住那个差，就抓住了反应的进度条。",
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
                principle: "原理：平均值是按数量加权的结果。设两组分数量比 a:b，则 (M₁·a+M₂·b)/(a+b)=平均值，移项就得到 a:b=(M₂−平均):(平均−M₁)。十字交叉只是把这个代数式画成图——本质是加权平均的逆运算，数学上严格成立。",
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
                principle: "原理：任何溶液宏观上都电中性（否则会放电），这是物理定律不是化学巧合。所以不管离子来自哪些盐、经历过什么反应，正电荷总量永远等于负电荷总量。这条等式凭空就成立，不需要任何反应信息。",
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
                principle: "原理：氧化还原的本质就是电子从还原剂转移到氧化剂。电子不会凭空产生或消失（电荷守恒），所以「还原剂失去的电子总数」必然精确等于「氧化剂得到的电子总数」。中间分几步、浓度怎么变，都只是电子流动的路径，总账永远是平的——这才是敢跳过过程的底气。",
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
                principle: "原理：混合物的任何平均性质（产气量、平均摩尔质量）都是各组分的加权平均，而加权平均必然落在最小值与最大值之间——这是数学必然。所以推到「全是 A」「全是 B」两个极端，就框定了真实值的范围，区间外的选项在数学上不可能成立。",
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
                principle: "原理：多步反应中只要某元素不流失，它的原子个数从始至终守恒。所以首尾物质之间存在固定的摩尔比（由原子守恒锁定），与中间几步、每步系数无关。写一条关系式，等于一次性跳过所有中间环节。",
                keyInsight: "多步反应不必步步为营——找到贯穿首尾的原子，写一条关系式直达终点。",
                plainTalk: "硫原子就像快递包裹，中间转了三个仓库，但一件都没丢。你不用管每个仓库怎么分拣，只要数清楚发货时有多少件（2 份硫），收货时就有多少件（2 份硫酸）。")),
    ]

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
                principle: "原理：求气体量本质是求「氧化剂得了多少电子」。铁失多少电子是确定的（价态变化 × 物质的量），这些电子全被氮接收，所以无需写出配平方程式——电子守恒直接架起「失」与「得」的桥，绕开浓变稀的过程戏码。",
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
                principle: "原理：质量守恒决定了固体减少的质量正是逸出气体的质量。而逸出量与分解的物质的量成固定比例（由方程式系数定）。所以「减少的质量」就是一把直接量出反应进度的尺子，不必去算剩余固体到底是多少。",
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
                principle: "原理：平均摩尔质量 = 总质量 / 总物质的量，它必然落在两组分摩尔质量之间（加权平均的数学性质）。所以算出平均值看它在不在区间内，就能秒判混合是否可能——落在区间外，在数学上根本不存在这样的混合物。",
                keyInsight: "判断混合物「可不可能」，先算平均值看它在不在两组分之间——超出即不可能，秒判。",
                plainTalk: "两种气体一个 28 一个 44，不管怎么混，平均都只能在 28 和 44 之间。算出平均是 36，在区间里，所以这事儿能成。")),

        // 原子守恒 · 铁的一系列转化
        ChemProblem(
            id: "boss_atom", stage: .senior, topic: .metals,
            content: "11.2 g 铁与足量稀盐酸反应，向溶液中加入过量 NaOH，过滤得沉淀，将沉淀在空气中充分灼烧，最终得到红棕色固体 Fe₂O₃ 的质量为？（Fe 56）",
            options: ["8 g", "16 g", "32 g", "11.2 g"],
            answerIndex: 1,
            explanation: "铁原子守恒：所有铁最终都进入 Fe₂O₃。n(Fe)=11.2/56=0.2 mol，每 2 个 Fe 进 1 个 Fe₂O₃，n(Fe₂O₃)=0.1 mol，质量 0.1×160=16 g。",
            nodeId: "fe", weapon: .atomConservation,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：一步步追踪铁",
                    steps: [
                        "Fe + 2HCl → FeCl₂ + H₂↑，0.2 mol Fe → 0.2 mol FeCl₂",
                        "FeCl₂ + 2NaOH → Fe(OH)₂↓ + 2NaCl，得 0.2 mol Fe(OH)₂",
                        "4Fe(OH)₂ + O₂ + 2H₂O → 4Fe(OH)₃（灼烧前被氧化）",
                        "2Fe(OH)₃ →(灼烧) Fe₂O₃ + 3H₂O，0.2 mol Fe(OH)₃ → 0.1 mol Fe₂O₃",
                        "m = 0.1 × 160 = 16 g",
                    ],
                    timeMinutes: 5),
                descent: SolutionPath(
                    title: "原子守恒：铁一个都没丢",
                    steps: [
                        "铁原子守恒：0.2 mol Fe 全部进入 Fe₂O₃",
                        "2Fe ~ Fe₂O₃，n(Fe₂O₃)=0.2/2=0.1 mol → 16 g ✓",
                    ],
                    timeMinutes: 1),
                weapon: .atomConservation,
                principle: "原理：化学变化只是原子的重新组合，原子既不会消失也不会新生（道尔顿原子论）。所以铁原子总数从盐酸到氢氧化物再到氧化铁始终不变。盯住这个守恒的元素，首尾直接挂钩，中间所有步骤都可略过。",
                keyInsight: "中间转化再多步，铁原子总数不变——直接用首尾的「2Fe ~ Fe₂O₃」一步到位。",
                plainTalk: "铁从盐酸里走到氢氧化物再到氧化铁，换了好几身衣服，但人还是那些人。0.2 摩尔铁原子，两个铁配一个 Fe₂O₃，就是 0.1 摩尔，乘 160 就是 16 克。")),

        // 平均值法 · 混合烃平均组成
        ChemProblem(
            id: "boss_average", stage: .senior, topic: .organic,
            content: "两种气态烃组成的混合气体，测得其平均分子式为 C₁.₅H₅。则该混合气体中一定含有的气体是？",
            options: ["CH₄", "C₂H₄", "C₂H₆", "C₃H₈"],
            answerIndex: 0,
            explanation: "平均碳原子数 1.5，两组分的碳数必然一个大于 1.5、一个小于 1.5。气态烃中碳数小于 1.5 的只有 CH₄（C=1），故混合气体一定含 CH₄。",
            nodeId: "org_hydro", weapon: .averageMethod,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：逐个组合试算",
                    steps: [
                        "设两种烃为 CₐHᵦ 和 C꜀Hᵈ，按比例混合",
                        "列方程让平均碳为 1.5、平均氢为 5",
                        "逐一假设碳数组合（1与2、1与3…）验证",
                        "发现只有含 C=1 的 CH₄ 才能把平均拉到 1.5 以下",
                    ],
                    timeMinutes: 4),
                descent: SolutionPath(
                    title: "平均值法：平均必在两组分之间",
                    steps: [
                        "平均碳原子数 1.5，必有一组分碳数 < 1.5",
                        "气态烃中碳数 < 1.5 的只有 CH₄（C=1）→ 一定含 CH₄ ✓",
                    ],
                    timeMinutes: 0.5),
                weapon: .averageMethod,
                principle: "原理：混合物的平均碳数是各组分按数量的加权平均，必然介于最小与最大组分之间。所以平均碳数 1.5，数学上就强制要求「必有一个组分碳数小于 1.5」——这不是推测，是平均值定义的必然结果。气态烃里碳数小于 1.5 的只有甲烷。",
                keyInsight: "平均值卡在两组分之间——平均碳 1.5 就逼出「必有一个碳数 ≤1」，唯一答案 CH₄。",
                plainTalk: "全班平均身高 1.5 米，那肯定有人比 1.5 矮。气态烃里比「1.5 个碳」还少的，只有甲烷（1 个碳），所以一定有甲烷。")),
    ]

    // MARK: 付费专享对决（用「为什么能这么秒」格式，覆盖新题型）

    private static let batch3: [ChemProblem] = [

        // 关系式法 · 工业制硝酸（氮守恒）
        ChemProblem(
            id: "boss_relation2", stage: .senior, topic: .nonmetals,
            content: "标准状况下 11.2 L NH₃ 经催化氧化等一系列反应，假设氮元素全部转化为 HNO₃，理论上可制得 HNO₃ 的物质的量为？",
            options: ["0.25 mol", "0.5 mol", "1 mol", "2 mol"],
            answerIndex: 1,
            explanation: "n(NH₃)=11.2/22.4=0.5 mol。氮原子守恒：每 1 个 N 进 1 个 HNO₃，NH₃ ~ HNO₃，故得 0.5 mol HNO₃。",
            nodeId: "n", weapon: .relationMethod,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：逐个写工业反应",
                    steps: [
                        "4NH₃ + 5O₂ →(催化剂,Δ) 4NO + 6H₂O",
                        "2NO + O₂ → 2NO₂",
                        "3NO₂ + H₂O → 2HNO₃ + NO（NO 还要循环氧化）",
                        "逐步按系数换算，还要处理 NO 的循环——极易绕晕",
                    ],
                    timeMinutes: 6),
                descent: SolutionPath(
                    title: "关系式法：只认氮原子",
                    steps: [
                        "氮原子从 NH₃ 一路守恒到 HNO₃：NH₃ ~ HNO₃",
                        "0.5 mol NH₃ → 0.5 mol HNO₃ ✓",
                    ],
                    timeMinutes: 1),
                weapon: .relationMethod,
                principle: "原理：化学变化中原子既不消失也不新生（原子守恒），氮原子从 NH₃ 出发，无论中间变成 NO、NO₂ 还是循环几圈，最终都进入 HNO₃，总数不变。所以 NH₃ 与 HNO₃ 是 1:1 的固定关系，中间所有反应都可以略过——这就是关系式法的底气。",
                keyInsight: "多步工业流程，盯住守恒的氮原子，首尾直接 1:1 挂钩。",
                plainTalk: "氮原子像一个个乘客，从「氨气」站上车，中间换乘好几趟（NO、NO₂），但没人下车。上车 0.5 摩尔，到「硝酸」终点站还是 0.5 摩尔。")),

        // 电荷守恒 · 含 OH⁻ 溶液
        ChemProblem(
            id: "boss_charge2", stage: .senior, topic: .ionReaction,
            content: "某无色溶液中含 Na⁺ 0.3 mol、Ba²⁺ 0.1 mol、Cl⁻ 0.2 mol，其余阴离子只有 OH⁻。则 OH⁻ 的物质的量为？",
            options: ["0.1 mol", "0.3 mol", "0.5 mol", "0.2 mol"],
            answerIndex: 1,
            explanation: "电荷守恒：正电荷 0.3×1 + 0.1×2 = 0.5 mol，负电荷 0.2×1 + n(OH⁻)×1 = 0.5，解得 n(OH⁻)=0.3 mol。",
            nodeId: "n04", weapon: .chargeConservation,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：推测由哪些物质组成",
                    steps: [
                        "想溶液是 NaCl、NaOH、Ba(OH)₂、BaCl₂ 怎么配的",
                        "设各成分物质的量，列多个方程",
                        "未知数比方程多，要讨论——绕远路",
                    ],
                    timeMinutes: 5),
                descent: SolutionPath(
                    title: "电荷守恒：正负电荷相等",
                    steps: [
                        "正电荷：0.3×1 + 0.1×2 = 0.5 mol",
                        "负电荷：0.2 + n(OH⁻) = 0.5 → n(OH⁻)=0.3 mol ✓",
                    ],
                    timeMinutes: 1),
                weapon: .chargeConservation,
                principle: "原理：溶液宏观电中性是物理定律。无论这些离子来自 NaOH、Ba(OH)₂ 还是 BaCl₂，只要它们共处一溶液，全部正电荷与全部负电荷就必须严格相等。这条等式与「怎么配出来的」毫无关系，直接拿来用即可。",
                keyInsight: "多种离子混在一起求其一，正负电荷总量一拉平就出来。",
                plainTalk: "一杯水里漂着各种带电小球，正电球和负电球的总电量必须打平（不然杯子会带电放电）。正的一共 0.5，负的已知 0.2，那剩下的氢氧根必须补够 0.3。")),

        // 十字交叉 · 同位素丰度
        ChemProblem(
            id: "boss_cross2", stage: .senior, topic: .periodicLaw,
            content: "氯元素有 ³⁵Cl 和 ³⁷Cl 两种同位素，氯的相对原子质量为 35.5。则 ³⁵Cl 与 ³⁷Cl 的原子个数比（丰度比）约为？",
            options: ["3 : 1", "1 : 3", "1 : 1", "2 : 1"],
            answerIndex: 0,
            explanation: "十字交叉：³⁵Cl : ³⁷Cl =(37−35.5):(35.5−35)=1.5:0.5=3:1。元素的相对原子质量是各同位素按丰度的加权平均。",
            nodeId: "struct_atom", weapon: .crossMethod,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：设丰度列方程",
                    steps: [
                        "设 ³⁵Cl 占 x、³⁷Cl 占 (1−x)",
                        "加权平均：35x + 37(1−x) = 35.5",
                        "解得 x = 0.75，即 ³⁵Cl : ³⁷Cl = 0.75 : 0.25 = 3 : 1",
                    ],
                    timeMinutes: 3),
                descent: SolutionPath(
                    title: "十字交叉：离平均值越近占比越大",
                    steps: [
                        "35 和 37 夹住平均值 35.5",
                        "³⁵Cl : ³⁷Cl =(37−35.5):(35.5−35)=1.5:0.5=3:1 ✓",
                    ],
                    timeMinutes: 0.5),
                weapon: .crossMethod,
                principle: "原理：元素的相对原子质量本就是各同位素质量按丰度的加权平均值。加权平均必然偏向占比大的那一方——35.5 离 35 更近，说明 ³⁵Cl 更多。十字交叉把「加权平均」这个代数关系倒过来用，直接读出丰度比，数学上严格成立。",
                keyInsight: "相对原子质量是同位素的加权平均——离它越近的同位素，丰度越大。",
                plainTalk: "平均分 35.5 更靠近 35，说明考 35 分的人多。具体多多少？看距离的反比：到 37 的距离是 1.5、到 35 的距离是 0.5，所以 35 的人是 37 的人的 3 倍。")),

        // 原子守恒 · 燃烧求分子式
        ChemProblem(
            id: "boss_atom2", stage: .senior, topic: .organic,
            content: "0.1 mol 某气态烃完全燃烧，生成 0.3 mol CO₂ 和 0.4 mol H₂O。该烃的分子式为？",
            options: ["C₃H₈", "C₃H₆", "C₂H₆", "C₃H₄"],
            answerIndex: 0,
            explanation: "碳守恒：每分子含 C = 0.3/0.1 = 3 个；氢守恒：每分子含 H = 2×0.4/0.1 = 8 个。故分子式 C₃H₈（丙烷）。",
            nodeId: "org_hydro", weapon: .atomConservation,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：写燃烧方程式配平",
                    steps: [
                        "设烃为 CₓHᵧ，CₓHᵧ + O₂ → x CO₂ + (y/2) H₂O",
                        "0.1 mol 烃 → 0.1x mol CO₂ = 0.3 → x = 3",
                        "0.1 mol 烃 → 0.1·(y/2) mol H₂O = 0.4 → y = 8",
                        "分子式 C₃H₈",
                    ],
                    timeMinutes: 3),
                descent: SolutionPath(
                    title: "原子守恒：碳氢直接数",
                    steps: [
                        "碳守恒：C 数 = n(CO₂)/n(烃) = 0.3/0.1 = 3",
                        "氢守恒：H 数 = 2·n(H₂O)/n(烃) = 0.8/0.1 = 8 → C₃H₈ ✓",
                    ],
                    timeMinutes: 1),
                weapon: .atomConservation,
                principle: "原理：燃烧只是原子重新组合，碳原子全部跑进 CO₂、氢原子全部跑进 H₂O，一个不丢（原子守恒）。所以「1 个烃分子里有几个碳」就等于「生成的 CO₂ 分子数 ÷ 烃分子数」，氢同理。不必配平整个方程式，数原子即可定分子式。",
                keyInsight: "由燃烧产物反推分子式：碳进 CO₂、氢进 H₂O，按比例直接数原子。",
                plainTalk: "烧之前烧之后，碳原子和氢原子的数目都没变。0.1 摩尔烃烧出 0.3 摩尔 CO₂，说明平均每个烃分子掏出 3 个碳；烧出 0.4 摩尔水（含 0.8 摩尔氢），每个分子 8 个氢。拼起来就是 C₃H₈。")),
    ]

    static func bossCase(id: String) -> ChemProblem? {
        all.first { $0.id == id }
    }
}
