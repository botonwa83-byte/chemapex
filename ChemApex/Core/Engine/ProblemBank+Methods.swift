import Foundation

// MARK: - 题库分批：方法练习题（武器靶场）
// 专为各解题武器配的计算练习，每题带 weapon 标签，喂给武器教学页的「上靶场」。
// 红线：数据全部验算，方法符合真实解题逻辑。

extension ProblemBank {
    static let methodsBatch: [ChemProblem] = [

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
            nodeId: "n02", weapon: .massConservation),

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
            nodeId: "fe", weapon: .differenceMethod),
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
            nodeId: "n03", weapon: .averageMethod),
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
            nodeId: "fe", weapon: .electronConservation),

        // MARK: 关系式法（补强靶场）
        ChemProblem(
            id: "m_rel_01", stage: .senior, topic: .nonmetals,
            content: "工业合成氨再制硝酸：N₂ → NH₃ → NO → NO₂ → HNO₃。理论上 1 mol N₂ 最多可制得 HNO₃ 的物质的量为？",
            options: ["1 mol", "2 mol", "0.5 mol", "4 mol"],
            answerIndex: 1,
            explanation: "氮原子守恒：1 mol N₂ 含 2 mol N，最终全部进入 HNO₃，故 N₂ ~ 2HNO₃。1 mol N₂ → 2 mol HNO₃。多步流程用关系式法直接首尾相连。",
            nodeId: "n", weapon: .relationMethod),
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
