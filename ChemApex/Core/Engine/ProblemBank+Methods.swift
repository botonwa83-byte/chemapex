import Foundation

// MARK: - 题库分批：方法练习题（武器靶场）
// 专为各解题武器配的计算练习，每题带 weapon 标签，喂给武器教学页的「上靶场」。
// 红线：数据全部验算，方法符合真实解题逻辑。

extension ProblemBank {
    // 新武器靶场练习
    private static let newWeaponsBatch: [ChemProblem] = [
        // 热力学循环（盖斯定律）
        ChemProblem(
            id: "m_hess_01", stage: .senior, topic: .energy,
            content: "已知 2H₂(g)+O₂(g)→2H₂O(l) ΔH=−571.6 kJ/mol，则 H₂(g)+½O₂(g)→H₂O(l) 的 ΔH 为？",
            options: ["−285.8 kJ/mol", "−571.6 kJ/mol", "−1143.2 kJ/mol", "+285.8 kJ/mol"],
            answerIndex: 0,
            explanation: "热化学方程式的化学计量数与 ΔH 成正比：系数整体减半，ΔH 也减半，−571.6/2 = −285.8 kJ/mol。",
            nodeId: nil, weapon: .hessCycle),
        ChemProblem(
            id: "m_hess_02", stage: .senior, topic: .energy,
            content: "已知：① C(s)+O₂(g)→CO₂(g) ΔH₁=−393.5 kJ/mol；② 2CO(g)+O₂(g)→2CO₂(g) ΔH₂=−566.0 kJ/mol。则 2C(s)+O₂(g)→2CO(g) 的 ΔH 为？",
            options: ["−221.0 kJ/mol", "−110.5 kJ/mol", "−960.5 kJ/mol", "+221.0 kJ/mol"],
            answerIndex: 0,
            explanation: "盖斯定律：目标反应 = ①×2 − ②。ΔH = 2×(−393.5) −(−566.0) = −787.0 + 566.0 = −221.0 kJ/mol。",
            nodeId: nil, weapon: .hessCycle),
        // 轨道与对称（结构化学）
        ChemProblem(
            id: "m_orbital_01", stage: .olympiad, topic: .structure,
            content: "氮原子的第一电离能反常地大于氧原子，主要原因是？",
            options: ["N 的 2p 轨道为半充满(2p³)，结构较稳定，失去电子更难",
                      "N 的原子半径比 O 大", "N 的核电荷数比 O 多", "O 的非金属性比 N 强"],
            answerIndex: 0,
            explanation: "N 的价电子排布为 2s²2p³，2p 轨道半充满，能量较低、较稳定，失去第一个电子更难，故第一电离能反常高于相邻的 O。半满/全满更稳定，是解释电离能反常的关键。",
            nodeId: nil, weapon: .orbitalSymmetry),
        ChemProblem(
            id: "m_orbital_02", stage: .olympiad, topic: .structure,
            content: "SO₃ 与下列微粒互为等电子体，且空间构型同为平面三角形的是？",
            options: ["NO₃⁻", "CO₂", "NH₃", "H₂O"],
            answerIndex: 0,
            explanation: "SO₃：4 原子、价电子 6+6×3=24，平面三角形。NO₃⁻：4 原子、价电子 5+6×3+1=24，等电子体→平面三角形。CO₂(直线)、NH₃(三角锥)、H₂O(V 形) 均不同。",
            nodeId: nil, weapon: .orbitalSymmetry),
        ChemProblem(
            id: "m_3stage_01", stage: .senior, topic: .equilibrium,
            content: "某温度下，2 mol SO₂ 与 1 mol O₂ 在 2 L 容器中反应，平衡时 SO₃ 为 1.6 mol。则 SO₂ 的转化率为？",
            options: ["40%", "60%", "80%", "100%"],
            answerIndex: 2,
            explanation: "三段式：生成 1.6 mol SO₃，由系数转化 SO₂ 也是 1.6 mol。SO₂ 转化率 = 1.6/2 = 80%。",
            nodeId: "p3", weapon: .threeStage),
        ChemProblem(
            id: "m_equiv_01", stage: .senior, topic: .equilibrium,
            content: "恒温恒容下，反应 N₂+3H₂⇌2NH₃。下列投料与「充入 1 mol N₂ 和 3 mol H₂」能建立等效平衡的是？",
            options: ["充入 2 mol NH₃", "充入 1 mol N₂、3 mol H₂、1 mol NH₃", "充入 2 mol N₂、6 mol H₂", "充入 1 mol NH₃"],
            answerIndex: 0,
            explanation: "把 2 mol NH₃ 按方程式「一边倒」换算回反应物：2 mol NH₃ → 1 mol N₂ + 3 mol H₂，与原投料完全相同，故恒温恒容下等效。其余换算后量不同。",
            nodeId: "p3", weapon: .equivalentEquilibrium),
        ChemProblem(
            id: "m_graph_01", stage: .senior, topic: .equilibrium,
            content: "可逆反应的速率-时间图中，t₁ 时刻改变某条件，正逆反应速率都突然增大且仍相等、平衡不移动。该条件最可能是？",
            options: ["升高温度", "增大压强", "使用催化剂", "增大反应物浓度"],
            answerIndex: 2,
            explanation: "正逆速率「同等增大、仍相等、平衡不移动」是催化剂的标志（同等加快正逆反应）。升温/加压/增浓都会使正逆速率不等、平衡移动。图像题先看「正逆速率是否仍相等」。",
            nodeId: "p3", weapon: .graphReading),
        ChemProblem(
            id: "m_numline_01", stage: .senior, topic: .nonmetals,
            content: "向含 1 mol FeBr₂ 的溶液中通入 1 mol Cl₂，已知还原性 Fe²⁺ > Br⁻。充分反应后，被氧化的离子是？",
            options: ["只有 Fe²⁺", "只有 Br⁻", "Fe²⁺ 全部、Br⁻ 部分", "Fe²⁺ 和 Br⁻ 全部"],
            answerIndex: 2,
            explanation: "还原性 Fe²⁺>Br⁻，Cl₂ 先氧化 Fe²⁺。1 mol Fe²⁺ 耗 0.5 mol Cl₂，剩 0.5 mol Cl₂ 再氧化 Br⁻（2 mol）中的 1 mol。故 Fe²⁺ 全部、Br⁻ 部分被氧化。数轴分段：先 Fe²⁺ 后 Br⁻。",
            nodeId: "n", weapon: .numberLine),
        ChemProblem(
            id: "m_assign_01", stage: .senior, topic: .organic,
            content: "某烃中碳元素的质量分数为 80%，则该烃的最简式（实验式）为？（C 12、H 1）",
            options: ["CH₃", "CH₄", "CH₂", "C₂H₅"],
            answerIndex: 0,
            explanation: "赋值法设烃 100 g：C 80 g = 80/12 ≈ 6.67 mol，H 20 g = 20 mol，n(C):n(H)=6.67:20=1:3，最简式 CH₃。设具体质量把百分数变成可算的量。",
            nodeId: "org_basic", weapon: .assignValue),
        ChemProblem(
            id: "m_converge_01", stage: .senior, topic: .nonmetals,
            content: "反应 KClO₃ + 6HCl(浓) → KCl + 3Cl₂↑ + 3H₂O 中，Cl₂ 既来自 +5 价的 Cl 也来自 −1 价的 Cl。下列说法正确的是？",
            options: ["氧化产物与还原产物之比为 5:1", "Cl₂ 全部是氧化产物", "被氧化的 Cl 与被还原的 Cl 之比为 5:1", "该反应不是氧化还原反应"],
            answerIndex: 2,
            explanation: "价态归中：+5（KClO₃）降、−1（HCl）升，都归到 0（Cl₂），只靠拢不交叉。1 个 +5 的 Cl 得 5 电子（被还原），需 5 个 −1 的 Cl 各失 1 电子（被氧化）配平。故被氧化:被还原 = 5:1。",
            nodeId: "cl", weapon: .valenceConvergence),
    ]

    static let methodsBatch: [ChemProblem] = newWeaponsBatch + [

        // MARK: 质量守恒
        ChemProblem(
            id: "m_mass_01", stage: .junior, topic: .massConservation,
            content: "A + B → C + D 的反应中，10 g A 与 8 g B 恰好完全反应，生成 12 g C，则生成 D 的质量为？",
            options: ["6 g", "18 g", "30 g", "2 g"],
            answerIndex: 0,
            explanation: "质量守恒：反应物总质量 = 生成物总质量。10+8 = 12 + m(D)，故 m(D) = 6 g。「恰好完全反应」说明 A、B 都无剩余。",
            nodeId: "n02", weapon: .massConservation),
        ChemProblem(
            id: "m_mass_02", stage: .junior, topic: .massConservation,
            content: "在密闭容器中点燃 4 g 氢气和 40 g 氧气，充分反应后容器内物质的总质量为？",
            options: ["36 g", "44 g", "44 g 且有氧气剩余", "无法确定"],
            answerIndex: 2,
            explanation: "2H₂+O₂→2H₂O。4 g H₂（2 mol）只需 1 mol（32 g）O₂，氧气过量 8 g。但密闭容器内总质量始终守恒 = 4+40 = 44 g（含剩余的 8 g O₂ 和 36 g 水）。",
            nodeId: "n02", weapon: .massConservation,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：算反应、算剩余",
                    steps: [
                        "2H₂+O₂→2H₂O，4 g H₂ = 2 mol，需 1 mol O₂ = 32 g",
                        "生成水：2 mol × 18 = 36 g；氧气剩 40−32 = 8 g",
                        "容器内 = 36（水）+ 8（剩余 O₂）= 44 g",
                    ],
                    timeMinutes: 3),
                descent: SolutionPath(
                    title: "质量守恒：密闭容器总质量不变",
                    steps: [
                        "密闭容器，物质没进没出",
                        "反应前后总质量恒定 = 4 + 40 = 44 g ✓（无需算谁过量）",
                    ],
                    timeMinutes: 0.5),
                weapon: .massConservation,
                principle: "原理：质量守恒的前提是「参加反应的所有物质」，在密闭容器里没有任何物质逸出或进入，所以不管反应进行到什么程度、谁过量谁剩余，容器内物质的总质量永远等于一开始投入的总质量。这道题的「坑」是诱导你去算过量——其实根本不用，守恒一句话搞定。",
                keyInsight: "密闭容器里的总质量永远 = 投入的总质量，跟反应程度、谁过量都无关。",
                plainTalk: "把氢气和氧气关进一个密封罐子里点燃，不管烧成什么样、剩多少氧气，罐子连里面的东西一起称，重量一点不变——4 加 40 还是 44 克。别被「氧气过量」带偏去算细账。")),

        // MARK: 化合价规则
        ChemProblem(
            id: "m_val_01", stage: .junior, topic: .phenomena,
            content: "高锰酸钾 KMnO₄ 中锰元素的化合价为？（K +1，O −2）",
            options: ["+2", "+4", "+6", "+7"],
            answerIndex: 3,
            explanation: "设 Mn 为 x：(+1)+x+(−2)×4 = 0，x = +7。KMnO₄ 中锰为最高价 +7，故有强氧化性。",
            nodeId: "jr_micro", weapon: .valenceRule),
        ChemProblem(
            id: "m_val_02", stage: .junior, topic: .phenomena,
            content: "在 Na₂S₂O₃ 中，硫元素的平均化合价为？（Na +1，O −2）",
            options: ["+2", "+4", "+6", "−2"],
            answerIndex: 0,
            explanation: "设 S 为 x：(+1)×2 + 2x + (−2)×3 = 0，2x = 4，x = +2。这是硫的平均化合价（实际两个 S 价态不同，但代数和规则求平均价仍成立）。",
            nodeId: "jr_micro", weapon: .valenceRule),

        // MARK: 溶解度曲线
        ChemProblem(
            id: "m_sol_01", stage: .junior, topic: .acidBaseSalt,
            content: "60℃ 时 KNO₃ 的溶解度为 110 g。该温度下 KNO₃ 饱和溶液中溶质的质量分数约为？",
            options: ["110%", "52.4%", "47.6%", "11%"],
            answerIndex: 1,
            explanation: "饱和溶液质量分数 = 溶解度/(100+溶解度)×100% = 110/(100+110)×100% ≈ 52.4%。注意分母是「溶质+溶剂」即溶液质量。",
            nodeId: "jr_solution", weapon: .solubilityCurve),
        ChemProblem(
            id: "m_sol_02", stage: .junior, topic: .acidBaseSalt,
            content: "某温度下把 30 g KNO₃ 加入 50 g 水中充分搅拌，剩余 5 g 未溶解。该温度下 KNO₃ 的溶解度为？",
            options: ["30 g", "50 g", "60 g", "25 g"],
            answerIndex: 1,
            explanation: "实际溶解 30−5 = 25 g 于 50 g 水中达饱和。溶解度是 100 g 水中的饱和溶解量：25 g/50 g 水 = 50 g/100 g 水。溶解度 = 50 g。",
            nodeId: "jr_solution", weapon: .solubilityCurve),

        // MARK: 差量法
        ChemProblem(
            id: "m_diff_01", stage: .senior, topic: .metals,
            content: "把一定量铁片放入 CuSO₄ 溶液中，反应后铁片质量增加了 1.6 g。则参加反应的 CuSO₄ 的物质的量为？",
            options: ["0.1 mol", "0.2 mol", "0.4 mol", "1.6 mol"],
            answerIndex: 1,
            explanation: "Fe+CuSO₄→FeSO₄+Cu，每 1 mol 反应铁片增重 64−56 = 8 g。增重 1.6 g 对应 0.2 mol，故 CuSO₄ 也是 0.2 mol。",
            nodeId: "fe", weapon: .differenceMethod,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：设反应量列式",
                    steps: [
                        "设参加反应的 CuSO₄ 为 x mol，析出 Cu 也是 x mol、溶解 Fe x mol",
                        "铁片质量变化：+64x − 56x = 8x",
                        "8x = 1.6 → x = 0.2 mol",
                    ],
                    timeMinutes: 3),
                descent: SolutionPath(
                    title: "差量法：每摩尔增重 8 g",
                    steps: [
                        "每 1 mol Fe 换成 Cu，铁片净增 64−56 = 8 g",
                        "增重 1.6 g → 反应 0.2 mol → CuSO₄ 0.2 mol ✓",
                    ],
                    timeMinutes: 1),
                weapon: .differenceMethod,
                principle: "原理：铁片增重的根源是「每溶解 56 g Fe、就沉积 64 g Cu」，净增 8 g 是个固定常数（由反应 1:1 决定）。增重总量与反应进行的摩尔数严格成正比，所以拿「实际增重 ÷ 每摩尔增重」就直接得到反应量——不用分别算溶解了多少铁、沉积了多少铜。",
                keyInsight: "金属片增重/减重题，「每摩尔的固定差值」就是换算反应量的尺子。",
                plainTalk: "铁片就像一杆秤，每做成一笔「掉 56 克铁、长 64 克铜」的买卖就净赚 8 克。现在赚了 1.6 克，那就是做了 0.2 笔买卖——硫酸铜也消耗 0.2 摩尔。")),
        ChemProblem(
            id: "m_diff_02", stage: .senior, topic: .metals,
            content: "将 Na₂CO₃ 和 NaHCO₃ 的混合物加热至质量不再变化，固体质量减少了 3.1 g（只有 NaHCO₃ 分解）。则原混合物中 NaHCO₃ 为？",
            options: ["0.05 mol", "0.1 mol", "0.2 mol", "0.62 mol"],
            answerIndex: 1,
            explanation: "2NaHCO₃→Na₂CO₃+H₂O↑+CO₂↑，每 2 mol NaHCO₃ 逸出 62 g（H₂O+CO₂），固体减 62 g。减 3.1 g 对应 NaHCO₃ 0.1 mol。Na₂CO₃ 受热不分解、不参与差量。",
            nodeId: "na", weapon: .differenceMethod),

        // MARK: 十字交叉 / 平均值
        ChemProblem(
            id: "m_cross_01", stage: .senior, topic: .mole,
            content: "N₂ 和 CO 的混合气体平均摩尔质量为 28 g/mol，则关于其组成正确的是？（N₂ 28、CO 28 g/mol）",
            options: ["无法确定比例", "N₂ : CO = 1 : 1", "全是 N₂", "任意比例都成立"],
            answerIndex: 3,
            explanation: "N₂ 和 CO 摩尔质量都是 28，无论怎么混合平均摩尔质量都是 28。这是「等摩尔质量组分」的特殊情形——比例任意。提醒：十字交叉只在两组分值不同时才能定比例。",
            nodeId: "n03", weapon: .averageMethod,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：尝试十字交叉",
                    steps: [
                        "想用十字交叉：(28−28):(28−28)=0:0",
                        "比例算不出来——十字交叉在这里失效",
                        "改用平均值思想分析",
                    ],
                    timeMinutes: 2),
                descent: SolutionPath(
                    title: "平均值法：两组分相等则比例任意",
                    steps: [
                        "N₂ 与 CO 摩尔质量都是 28",
                        "无论怎么混，平均值恒为 28 → 比例无法确定（任意）✓",
                    ],
                    timeMinutes: 0.5),
                weapon: .averageMethod,
                principle: "原理：平均值必然落在两组分之间。当两组分的值相等时，平均值被「夹死」在这个唯一的数上，与混合比例完全无关——所以反过来由平均值也定不出比例。这正是平均值法的边界：值不同才能定比例，值相同则比例任意。看清这一点，就不会在这类陷阱题上硬套十字交叉。",
                keyInsight: "两组分数值相等时，平均值恒定、与比例无关——十字交叉失效，比例任意。",
                plainTalk: "两组同学都考 28 分，那不管两组各多少人，全班平均永远是 28。反过来，知道平均 28 也猜不出两组人数比——因为怎么分都一样。这题的「坑」就在这儿：别硬算比例。")),
        ChemProblem(
            id: "m_cross_02", stage: .senior, topic: .mole,
            content: "由 CH₄ 和 CO₂ 组成的混合气体，平均摩尔质量为 20 g/mol，则 n(CH₄) : n(CO₂) 为？（CH₄ 16、CO₂ 44 g/mol）",
            options: ["6 : 1", "1 : 6", "3 : 1", "1 : 3"],
            answerIndex: 0,
            explanation: "十字交叉：n(CH₄):n(CO₂) = (44−20):(20−16) = 24:4 = 6:1。平均值 20 离 16 近、离 44 远，故离得近的 CH₄ 占多数，符合 6:1。",
            nodeId: "n03", weapon: .crossMethod,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：设比例列方程",
                    steps: [
                        "设 n(CH₄)=x、n(CO₂)=y",
                        "平均摩尔质量：(16x + 44y)/(x + y) = 20",
                        "展开：16x + 44y = 20x + 20y → 24y = 4x",
                        "x : y = 24 : 4 = 6 : 1",
                    ],
                    timeMinutes: 3),
                descent: SolutionPath(
                    title: "十字交叉：差值交叉定比例",
                    steps: [
                        "16 和 44 夹住平均值 20",
                        "n(CH₄):n(CO₂)=(44−20):(20−16)=24:4=6:1 ✓",
                    ],
                    timeMinutes: 0.5),
                weapon: .crossMethod,
                principle: "原理：平均摩尔质量是两组分按物质的量加权的平均值，移项 (16x+44y)/(x+y)=20 就直接得到 x:y=(44−20):(20−16)。十字交叉只是这个代数式的图形化——平均值离哪个组分近，哪个组分就多，距离的反比就是数量比。",
                keyInsight: "平均值离谁近谁就多；两个「距离」交叉一比，就是物质的量之比。",
                plainTalk: "平均 20 离 16 很近、离 44 很远，说明便宜的甲烷占大头。到底多几倍？看距离：到 44 是 24、到 16 是 4，所以甲烷是二氧化碳的 6 倍。")),

        // MARK: 电荷守恒
        ChemProblem(
            id: "m_charge_01", stage: .senior, topic: .ionReaction,
            content: "某溶液中含 K⁺ 0.3 mol、Mg²⁺ 0.2 mol、Cl⁻ 0.4 mol，其余为 NO₃⁻。则 NO₃⁻ 的物质的量为？",
            options: ["0.3 mol", "0.4 mol", "0.5 mol", "0.7 mol"],
            answerIndex: 0,
            explanation: "电荷守恒：正电荷 0.3×1+0.2×2 = 0.7 mol，负电荷 0.4×1+n(NO₃⁻)×1 = 0.7，解得 n(NO₃⁻) = 0.3 mol。溶液整体电中性。",
            nodeId: "n04", weapon: .chargeConservation,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：拆成盐去凑",
                    steps: [
                        "想 K⁺、Mg²⁺、Cl⁻、NO₃⁻ 由哪些盐组成",
                        "设若干盐的物质的量、列方程组",
                        "未知数多、要讨论——绕远",
                    ],
                    timeMinutes: 4),
                descent: SolutionPath(
                    title: "电荷守恒：正负电荷拉平",
                    steps: [
                        "正电荷：0.3×1 + 0.2×2 = 0.7 mol",
                        "负电荷：0.4 + n(NO₃⁻) = 0.7 → 0.3 mol ✓",
                    ],
                    timeMinutes: 1),
                weapon: .chargeConservation,
                principle: "原理：溶液宏观电中性是物理定律——正电荷总量永远等于负电荷总量，与这些离子来自哪些盐毫无关系。所以哪怕完全不知道溶液怎么配出来的，也能凭「正=负」这一条直接解出缺失的离子。",
                keyInsight: "求溶液里缺的那个离子，正负电荷一拉平就出来，不必管它来自哪种盐。",
                plainTalk: "一杯溶液不带电，正电荷加起来 0.7，负电荷里氯离子只占 0.4，剩下 0.3 必须由硝酸根补上，否则这杯水就「带电」了——那不可能。")),

        // MARK: 原子守恒
        ChemProblem(
            id: "m_atom_01", stage: .senior, topic: .mole,
            content: "把 1 mol CO₂ 通入足量 NaOH 溶液完全吸收，生成 Na₂CO₃。则消耗 NaOH 的物质的量为？",
            options: ["1 mol", "2 mol", "0.5 mol", "4 mol"],
            answerIndex: 1,
            explanation: "CO₂+2NaOH→Na₂CO₃+H₂O。由钠/碳原子守恒：1 mol CO₂ 生成 1 mol Na₂CO₃，含 2 mol Na，故需 2 mol NaOH。原子守恒省去配平细节。",
            nodeId: "n03", weapon: .atomConservation,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：写方程式按系数算",
                    steps: [
                        "CO₂ + 2NaOH → Na₂CO₃ + H₂O",
                        "由系数 1 mol CO₂ ~ 2 mol NaOH",
                        "故消耗 NaOH 2 mol",
                    ],
                    timeMinutes: 2),
                descent: SolutionPath(
                    title: "原子守恒：盯住钠和碳",
                    steps: [
                        "碳守恒：1 mol CO₂ → 1 mol Na₂CO₃",
                        "钠守恒：1 mol Na₂CO₃ 含 2 mol Na → 需 2 mol NaOH ✓",
                    ],
                    timeMinutes: 1),
                weapon: .atomConservation,
                principle: "原理：化学变化只是原子重新组合，钠原子和碳原子都不会消失或新生。碳全部进入 Na₂CO₃，钠也全部进入 Na₂CO₃，所以由「1 个 Na₂CO₃ 带走 2 个 Na」就能反推需要多少 NaOH，不必依赖配平好的方程式系数。",
                keyInsight: "盯住守恒的元素（钠、碳），由产物直接反推反应物的量。",
                plainTalk: "碳全跑进了碳酸钠，钠也全跑进了碳酸钠。一个碳酸钠要拉走两个钠，那这些钠原来都在 NaOH 里，所以得用 2 摩尔 NaOH。")),
        ChemProblem(
            id: "m_atom_02", stage: .senior, topic: .mole,
            content: "某有机物 1 mol 完全燃烧生成 3 mol CO₂ 和 4 mol H₂O，则该有机物分子中碳、氢原子数为？",
            options: ["C 3、H 8", "C 3、H 4", "C 4、H 3", "C 6、H 8"],
            answerIndex: 0,
            explanation: "碳守恒：生成 3 mol CO₂ → 分子含 3 个 C。氢守恒：4 mol H₂O 含 8 mol H → 分子含 8 个 H。故 C₃H₈（丙烷）。由燃烧产物用原子守恒反推分子组成是常用手法。",
            nodeId: "n03", weapon: .atomConservation),

        // MARK: 电子守恒
        ChemProblem(
            id: "m_elec_01", stage: .senior, topic: .redox,
            content: "5.4 g 铝与足量稀硝酸完全反应（生成 Al³⁺ 和 NO），转移电子的物质的量为？（Al 27 g/mol）",
            options: ["0.2 mol", "0.6 mol", "0.3 mol", "0.9 mol"],
            answerIndex: 1,
            explanation: "n(Al)=5.4/27=0.2 mol，Al→Al³⁺ 每个失 3 电子，转移电子 0.2×3 = 0.6 mol。求转移电子数只需盯还原剂失电子总数，不必写完整方程式。",
            nodeId: "n05", weapon: .electronConservation,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：配平方程式再看电子",
                    steps: [
                        "Al + 4HNO₃(稀) → Al(NO₃)₃ + NO↑ + 2H₂O",
                        "标价态：Al 0→+3、N +5→+2",
                        "1 mol Al 转移 3 mol 电子",
                        "0.2 mol Al → 0.6 mol 电子",
                    ],
                    timeMinutes: 3),
                descent: SolutionPath(
                    title: "电子守恒：只数还原剂失电子",
                    steps: [
                        "Al → Al³⁺，每个失 3 电子",
                        "0.2 mol × 3 = 0.6 mol 电子 ✓",
                    ],
                    timeMinutes: 0.5),
                weapon: .electronConservation,
                principle: "原理：转移电子总数就等于还原剂失去的电子总数（= 氧化剂得到的，二者守恒）。铝失多少电子，只由它的价态变化（0→+3）和物质的量决定，与硝酸是浓是稀、生成 NO 还是 NO₂ 都无关。所以盯住还原剂一端就够，不必配平整个方程式。",
                keyInsight: "求转移电子数，盯还原剂：价态变化 × 物质的量，一乘就得。",
                plainTalk: "每个铝原子要交出 3 个电子才能变成 Al³⁺。有 0.2 摩尔铝，一共交出 0.6 摩尔电子。至于这些电子被谁收走、生成什么气体，跟「交了多少」没关系。")),
        ChemProblem(
            id: "m_elec_02", stage: .senior, topic: .redox,
            content: "铁与足量氯气完全反应。若有 0.3 mol 电子转移，则参加反应的铁为？（Fe→FeCl₃）",
            options: ["0.1 mol", "0.15 mol", "0.2 mol", "0.3 mol"],
            answerIndex: 0,
            explanation: "Fe→Fe³⁺ 每个失 3 电子。转移 0.3 mol 电子 → n(Fe) = 0.3/3 = 0.1 mol。注意铁与 Cl₂ 反应生成 +3 价（不是 +2），每个铁失 3 电子。",
            nodeId: "fe", weapon: .electronConservation,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：配平再算",
                    steps: [
                        "2Fe + 3Cl₂ →(点燃) 2FeCl₃",
                        "Fe 0→+3，每个失 3 电子",
                        "转移 0.3 mol 电子 → n(Fe) = 0.3 ÷ 3",
                        "= 0.1 mol",
                    ],
                    timeMinutes: 2),
                descent: SolutionPath(
                    title: "电子守恒：反推还原剂的量",
                    steps: [
                        "Fe → Fe³⁺，每 mol Fe 失 3 mol 电子",
                        "0.3 mol 电子 ÷ 3 = 0.1 mol Fe ✓",
                    ],
                    timeMinutes: 0.5),
                weapon: .electronConservation,
                principle: "原理：转移的电子全部由铁失去（Cl₂ 接收）。每个铁原子失几个电子，由它的价态变化定死——与 Cl₂ 反应生成 +3 价，所以每个铁失 3 个，绝不是 2 个。知道了「单位失电子数」，用电子总数反除就得铁的量。关键是别把价态记错（Fe+Cl₂→FeCl₃ 而非 FeCl₂）。",
                keyInsight: "已知转移电子数反求金属量：电子总数 ÷ 每原子失电子数（看准价态）。",
                plainTalk: "铁被氯气「逼」着交出 3 个电子变成 Fe³⁺。一共收到 0.3 摩尔电子，每个铁贡献 3 个，那就是 0.1 摩尔铁。千万记住是 +3 价（不是和盐酸反应的 +2）。")),

        // MARK: 关系式法（补强靶场）
        ChemProblem(
            id: "m_rel_01", stage: .senior, topic: .nonmetals,
            content: "工业合成氨再制硝酸：N₂ → NH₃ → NO → NO₂ → HNO₃。理论上 1 mol N₂ 最多可制得 HNO₃ 的物质的量为？",
            options: ["1 mol", "2 mol", "0.5 mol", "4 mol"],
            answerIndex: 1,
            explanation: "氮原子守恒：1 mol N₂ 含 2 mol N，最终全部进入 HNO₃，故 N₂ ~ 2HNO₃。1 mol N₂ → 2 mol HNO₃。多步流程用关系式法直接首尾相连。",
            nodeId: "n", weapon: .relationMethod,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：逐步写四个反应",
                    steps: [
                        "N₂+3H₂⇌2NH₃；4NH₃+5O₂→4NO+6H₂O",
                        "2NO+O₂→2NO₂；3NO₂+H₂O→2HNO₃+NO（循环）",
                        "一步步按系数换算，还要处理 NO 循环——极易出错",
                    ],
                    timeMinutes: 6),
                descent: SolutionPath(
                    title: "关系式法：氮原子首尾守恒",
                    steps: [
                        "氮从 N₂ 一路守恒到 HNO₃：N₂ ~ 2HNO₃",
                        "1 mol N₂ → 2 mol HNO₃ ✓",
                    ],
                    timeMinutes: 1),
                weapon: .relationMethod,
                principle: "原理：1 个 N₂ 分子含 2 个氮原子，原子守恒保证这 2 个氮无论中间变成 NO、NO₂、循环几圈，最终都进入 HNO₃。所以 N₂ 与 HNO₃ 的关系是 1:2（由氮原子个数定），与中间所有反应的系数无关。注意起点是 N₂（2 个氮）而非 NH₃（1 个氮），关系式不同。",
                keyInsight: "关系式看「守恒的原子个数」：N₂ 含 2 个氮，所以 N₂ ~ 2HNO₃。",
                plainTalk: "一个氮气分子里坐着 2 个氮原子，中间换乘多少趟车都不下来，最后都到「硝酸」终点。所以 1 摩尔氮气能产 2 摩尔硝酸——别忘了氮气是「双人座」，和单个氮的氨气不一样。")),
        ChemProblem(
            id: "m_rel_02", stage: .senior, topic: .metals,
            content: "用 CO 还原 Fe₂O₃ 炼铁：要炼得 11.2 g 铁，理论上需要 CO 的物质的量为？（3CO+Fe₂O₃→2Fe+3CO₂，Fe 56）",
            options: ["0.1 mol", "0.2 mol", "0.3 mol", "0.6 mol"],
            answerIndex: 2,
            explanation: "n(Fe)=11.2/56=0.2 mol。由方程式 2Fe ~ 3CO，关系式 n(CO)=0.2×3/2 = 0.3 mol。多步或一步反应均可用关系式按系数比直接换算。",
            nodeId: "jr_metal", weapon: .relationMethod,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：按方程式逐步换算",
                    steps: [
                        "3CO + Fe₂O₃ →(高温) 2Fe + 3CO₂",
                        "n(Fe)=11.2/56=0.2 mol",
                        "由系数 2Fe ~ 3CO，n(CO)=0.2 × 3/2",
                        "= 0.3 mol",
                    ],
                    timeMinutes: 2),
                descent: SolutionPath(
                    title: "关系式法：CO 与 Fe 直接挂钩",
                    steps: [
                        "关系式 3CO ~ 2Fe（系数比锁定）",
                        "0.2 mol Fe × 3/2 = 0.3 mol CO ✓",
                    ],
                    timeMinutes: 1),
                weapon: .relationMethod,
                principle: "原理：方程式的系数比本质是参加反应的微粒个数比，它是固定的。只要确定首尾两种物质（CO 和 Fe）的系数比 3:2，就能跳过中间一切，直接由 Fe 的量算 CO。多步连续反应也一样——只要找到贯穿首尾的守恒桥，关系式一拉到底。",
                keyInsight: "由产物的量反求原料：找到两者的系数比（关系式），一步换算。",
                plainTalk: "方程式写着「3 个 CO 换 2 个铁」，这是死规矩。要 0.2 摩尔铁，按 3:2 的比例，就得 0.3 摩尔 CO，不用管中间 CO₂ 怎么跑。")),

        // MARK: 电荷守恒（补强靶场）
        ChemProblem(
            id: "m_charge_02", stage: .senior, topic: .solution,
            content: "0.1 mol/L 的 Na₂SO₄ 溶液中，c(Na⁺) 与 c(SO₄²⁻) 的关系是？",
            options: ["c(Na⁺) = c(SO₄²⁻)", "c(Na⁺) = 2c(SO₄²⁻)", "2c(Na⁺) = c(SO₄²⁻)", "无法确定"],
            answerIndex: 1,
            explanation: "Na₂SO₄ 完全电离，1 个 Na₂SO₄ 给 2 个 Na⁺ 和 1 个 SO₄²⁻，故 c(Na⁺)=2c(SO₄²⁻)=0.2 mol/L。也可由电荷守恒 c(Na⁺)=2c(SO₄²⁻) 直接得到（强电解质不水解）。",
            nodeId: "p4", weapon: .chargeConservation),

        // MARK: 差量法（补强靶场）
        ChemProblem(
            id: "m_diff_03", stage: .senior, topic: .nonmetals,
            content: "把 2 mol SO₂ 和 1 mol O₂ 通入密闭容器，催化反应一段时间后气体总物质的量变为 2.4 mol。则生成 SO₃ 的物质的量为？（2SO₂+O₂⇌2SO₃）",
            options: ["0.6 mol", "1.2 mol", "0.4 mol", "0.8 mol"],
            answerIndex: 1,
            explanation: "起始总量 3 mol，反应后 2.4 mol，减少 0.6 mol。每生成 2 mol SO₃ 气体总量减少 1 mol（3 mol 气体变 2 mol）。减 0.6 → 生成 SO₃ 1.2 mol。气体物质的量「差量法」。",
            nodeId: "s", weapon: .differenceMethod,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：设转化量列三段式",
                    steps: [
                        "设生成 SO₃ 为 2a mol，则消耗 SO₂ 2a、O₂ a",
                        "反应后总量：(2−2a)+(1−a)+2a = 3−a",
                        "3−a = 2.4 → a = 0.6，SO₃ = 2a = 1.2 mol",
                    ],
                    timeMinutes: 4),
                descent: SolutionPath(
                    title: "差量法：盯气体总量的减少",
                    steps: [
                        "每生成 2 mol SO₃，气体总量减少 1 mol（3→2）",
                        "实际减少 3−2.4 = 0.6 mol → SO₃ = 0.6×2 = 1.2 mol ✓",
                    ],
                    timeMinutes: 1),
                weapon: .differenceMethod,
                principle: "原理：可逆反应里 SO₂、O₂、SO₃ 各自的量都在变，单独追踪很麻烦。但「气体总物质的量的减少」与「反应进行的程度」严格成正比——因为方程式系数定死了「每生成 2 mol SO₃ 总量必减 1 mol」。抓住这个不变的比例关系，一步就从总量变化算出产物。",
                keyInsight: "气体反应前后分子数变化时，「总量的差」是直接量出反应进度的尺子。",
                plainTalk: "三个气体分子撞一撞变成两个，每反应一轮就「少一个」。现在总共少了 0.6 个单位，说明反应了 0.6 轮，每轮产出 2 个 SO₃，所以 1.2 摩尔。")),
    ]
}
