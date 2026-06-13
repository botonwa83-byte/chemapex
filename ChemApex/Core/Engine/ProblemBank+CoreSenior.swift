import Foundation

// MARK: - 题库分批：必修核心（物质的量 / 离子反应 / 氧化还原 / 周期律 / 化学键）
// 高考核心高频，补厚到每章 10-12 题。红线：数据可验算、概念符合教材。

extension ProblemBank {
    static let coreSeniorBatch: [ChemProblem] = moleBatch + ionBatch + redoxBatch
        + periodBatch + bondBatch

    // MARK: 物质的量 ★★★

    private static let moleBatch: [ChemProblem] = [
        ChemProblem(
            id: "p_mole_01", stage: .senior, topic: .mole,
            content: "9 g 水的物质的量是？（M(H₂O)=18 g/mol）",
            options: ["0.25 mol", "0.5 mol", "1 mol", "2 mol"],
            answerIndex: 1,
            explanation: "n = m/M = 9/18 = 0.5 mol。物质的量、质量、摩尔质量三者用 n=m/M 互算，是化学计算最基础的桥梁。",
            nodeId: "n03"),
        ChemProblem(
            id: "p_mole_02", stage: .senior, topic: .mole,
            content: "含有 3.01×10²³ 个 CO₂ 分子的气体的物质的量是？（Nᴀ≈6.02×10²³ mol⁻¹）",
            options: ["0.5 mol", "1 mol", "2 mol", "0.25 mol"],
            answerIndex: 0,
            explanation: "n = N/Nᴀ = 3.01×10²³ / 6.02×10²³ = 0.5 mol。微粒数与物质的量用 n=N/Nᴀ 互算。1 mol 任何微粒都约含 6.02×10²³ 个。",
            nodeId: "n03"),
        ChemProblem(
            id: "p_mole_03", stage: .senior, topic: .mole,
            content: "标准状况下，11.2 L O₂ 的物质的量是？",
            options: ["0.25 mol", "0.5 mol", "1 mol", "2 mol"],
            answerIndex: 1,
            explanation: "标准状况下气体摩尔体积约 22.4 L/mol，n = V/Vm = 11.2/22.4 = 0.5 mol。前提必须是「标准状况 + 气体」，二者缺一不可。",
            nodeId: "n03"),
        ChemProblem(
            id: "p_mole_04", stage: .senior, topic: .mole,
            content: "将 4 g NaOH 溶于水配成 500 mL 溶液，该溶液的物质的量浓度为？（M(NaOH)=40 g/mol）",
            options: ["0.1 mol/L", "0.2 mol/L", "0.4 mol/L", "0.8 mol/L"],
            answerIndex: 1,
            explanation: "n(NaOH)=4/40=0.1 mol，c=n/V=0.1/0.5=0.2 mol/L。注意 V 是溶液体积（0.5 L）不是水的体积。",
            nodeId: "n03"),
        ChemProblem(
            id: "p_mole_05", stage: .senior, topic: .mole,
            content: "同温同压下，体积相同的 O₂ 和 CO₂，下列相同的是？",
            options: ["质量", "分子数", "原子数", "密度"],
            answerIndex: 1,
            explanation: "阿伏加德罗定律：同温同压同体积的任何气体含相同的分子数。但 O₂、CO₂ 摩尔质量不同（32、44），故质量、密度不同；每分子原子数不同（2、3），原子数也不同。",
            nodeId: "n03"),
        ChemProblem(
            id: "p_mole_06", stage: .senior, topic: .mole,
            content: "配制 100 mL 1 mol/L NaCl 溶液，下列操作会使所配浓度偏低的是？",
            options: ["定容时俯视刻度线", "称量的 NaCl 中含有少量杂质 NaCl·H₂O 未折算", "定容摇匀后液面低于刻度线又加水", "溶解后未冷却即转移"],
            answerIndex: 2,
            explanation: "定容摇匀后液面略低是正常（少量液体附在瓶壁），再加水会使溶液体积偏大、浓度偏低。俯视定容使加水偏少、浓度偏高；未冷却转移使最终体积偏小、浓度偏高。",
            nodeId: "n03"),
        ChemProblem(
            id: "p_mole_07", stage: .senior, topic: .mole,
            content: "把 100 mL 2 mol/L 的盐酸稀释到 400 mL，稀释后盐酸的浓度为？",
            options: ["0.5 mol/L", "1 mol/L", "2 mol/L", "8 mol/L"],
            answerIndex: 0,
            explanation: "稀释前后溶质的物质的量不变：c₁V₁=c₂V₂，2×100=c₂×400，c₂=0.5 mol/L。稀释计算的核心是「溶质的量守恒」。",
            nodeId: "n03"),
        ChemProblem(
            id: "p_mole_08", stage: .senior, topic: .mole,
            content: "某气体在标准状况下密度为 1.25 g/L，则该气体的相对分子质量约为？",
            options: ["14", "28", "32", "44"],
            answerIndex: 1,
            explanation: "M = ρ×Vm = 1.25 g/L × 22.4 L/mol = 28 g/mol。标况下用「摩尔质量 = 密度 × 22.4」可快速求相对分子质量，28 对应 N₂ 或 CO。",
            nodeId: "n03"),
        ChemProblem(
            id: "p_mole_09", stage: .senior, topic: .mole,
            content: "下列说法正确的是（Nᴀ 为阿伏加德罗常数的值）？",
            options: ["1 mol Na 变成 Na⁺ 失去 Nᴀ 个电子", "1 mol H₂ 含 Nᴀ 个原子", "标准状况下 1 mol H₂O 体积约 22.4 L", "1 mol Cl₂ 含 Nᴀ 个 Cl⁻"],
            answerIndex: 0,
            explanation: "1 mol Na→Na⁺ 失 1 mol（Nᴀ 个）电子，正确。1 mol H₂ 含 2Nᴀ 个 H 原子；标况下 H₂O 是液态不能用 22.4；Cl₂ 是分子不含 Cl⁻。Nᴀ 题要警惕「分子/原子/离子/电子」数目陷阱。",
            nodeId: "n03"),
    ]

    // MARK: 离子反应 ★★★

    private static let ionBatch: [ChemProblem] = [
        ChemProblem(
            id: "p_ion_01", stage: .senior, topic: .ionReaction,
            content: "书写离子方程式时，下列物质应拆写成离子形式的是？",
            options: ["CaCO₃", "醋酸 CH₃COOH", "NaCl（可溶性盐）", "H₂O"],
            answerIndex: 2,
            explanation: "强酸、强碱、可溶性盐拆成离子；难溶物（CaCO₃）、弱电解质（醋酸、水）、气体、单质、氧化物保留化学式。NaCl 是可溶性盐，应拆为 Na⁺ 和 Cl⁻。",
            nodeId: "n04"),
        ChemProblem(
            id: "p_ion_02", stage: .senior, topic: .ionReaction,
            content: "稀硫酸与氢氧化钡溶液反应的离子方程式正确的是？",
            options: ["H⁺ + OH⁻ → H₂O", "Ba²⁺ + SO₄²⁻ → BaSO₄↓", "Ba²⁺ + 2OH⁻ + 2H⁺ + SO₄²⁻ → BaSO₄↓ + 2H₂O", "H₂SO₄ + Ba(OH)₂ → BaSO₄↓ + 2H₂O"],
            answerIndex: 2,
            explanation: "既生成 BaSO₄ 沉淀又生成水，两个反应同时发生，要合并：Ba²⁺+2OH⁻+2H⁺+SO₄²⁻→BaSO₄↓+2H₂O。只写中和或只写沉淀都不完整；D 没拆写。",
            nodeId: "n04"),
        ChemProblem(
            id: "p_ion_03", stage: .senior, topic: .ionReaction,
            content: "在强碱性溶液中能大量共存的离子组是？",
            options: ["Na⁺、K⁺、NO₃⁻、SO₄²⁻", "NH₄⁺、Na⁺、Cl⁻、SO₄²⁻", "Mg²⁺、Na⁺、Cl⁻、NO₃⁻", "Fe³⁺、K⁺、Cl⁻、SO₄²⁻"],
            answerIndex: 0,
            explanation: "强碱性即大量 OH⁻：NH₄⁺ 与 OH⁻ 反应、Mg²⁺/Fe³⁺ 与 OH⁻ 生成沉淀，都不能共存。A 组离子均不与 OH⁻ 反应、彼此也不反应，可大量共存。",
            nodeId: "n04"),
        ChemProblem(
            id: "p_ion_04", stage: .senior, topic: .ionReaction,
            content: "下列离子方程式书写正确的是？",
            options: ["铁与稀盐酸：Fe + 2H⁺ → Fe²⁺ + H₂↑", "碳酸钙与盐酸：CO₃²⁻ + 2H⁺ → H₂O + CO₂↑", "氢氧化钠与硫酸铜：OH⁻ + Cu²⁺ → Cu(OH)₂↓", "氯化钡与硫酸钠：BaCl₂ + SO₄²⁻ → BaSO₄↓ + 2Cl⁻"],
            answerIndex: 0,
            explanation: "A 正确。B 错：CaCO₃ 难溶应写化学式；C 错：电荷、原子不守恒，应是 Cu²⁺+2OH⁻→Cu(OH)₂↓；D 错：可溶的 BaCl₂ 应拆为 Ba²⁺。检查离子方程式要「质量守恒+电荷守恒」。",
            nodeId: "n04"),
        ChemProblem(
            id: "p_ion_05", stage: .senior, topic: .ionReaction,
            content: "下列物质的水溶液能导电，但本身属于非电解质的是？",
            options: ["NaCl", "CO₂", "盐酸", "NaOH"],
            answerIndex: 1,
            explanation: "CO₂ 水溶液能导电，但导电的是它与水反应生成的 H₂CO₃ 电离出的离子，CO₂ 自身不电离，是非电解质。NaCl、NaOH 是电解质；盐酸是混合物，不属于电解质分类。",
            nodeId: "n04"),
        ChemProblem(
            id: "p_ion_06", stage: .senior, topic: .ionReaction,
            content: "向某无色溶液中加入 BaCl₂ 溶液生成白色沉淀，再加足量稀硝酸沉淀不溶解。该溶液中一定含有？",
            options: ["CO₃²⁻", "SO₄²⁻", "Cl⁻", "Ag⁺"],
            answerIndex: 1,
            explanation: "白色沉淀不溶于稀硝酸，排除 CO₃²⁻（生成的 BaCO₃ 溶于硝酸）；不溶于硝酸的钡盐沉淀是 BaSO₄，故含 SO₄²⁻。无色排除有色离子。检验要靠「沉淀+是否溶于酸」双重判断。",
            nodeId: "n04"),
        ChemProblem(
            id: "p_ion_07", stage: .senior, topic: .ionReaction,
            content: "下列物质分类正确的是？",
            options: ["CO₂ 是酸", "NaOH 是碱", "纯碱 Na₂CO₃ 是碱", "CaO 是盐"],
            answerIndex: 1,
            explanation: "NaOH 电离出的阴离子全是 OH⁻，是碱。CO₂ 是酸性氧化物（不是酸）；纯碱 Na₂CO₃ 是盐（不是碱，尽管溶液显碱性）；CaO 是碱性氧化物。物质分类要看定义而非俗名或溶液酸碱性。",
            nodeId: "n04"),
        ChemProblem(
            id: "p_ion_08", stage: .senior, topic: .ionReaction,
            content: "向 Ca(HCO₃)₂ 溶液中加入少量 NaOH 溶液，离子方程式正确的是？",
            options: ["HCO₃⁻ + OH⁻ → CO₃²⁻ + H₂O", "Ca²⁺ + 2HCO₃⁻ + 2OH⁻ → CaCO₃↓ + CO₃²⁻ + 2H₂O", "Ca²⁺ + HCO₃⁻ + OH⁻ → CaCO₃↓ + H₂O", "HCO₃⁻ + OH⁻ → CO₂↑ + H₂O"],
            answerIndex: 2,
            explanation: "NaOH 少量，OH⁻ 与 HCO₃⁻ 反应生成 CO₃²⁻，立即与足量的 Ca²⁺ 结合成 CaCO₃ 沉淀：Ca²⁺+HCO₃⁻+OH⁻→CaCO₃↓+H₂O。「与量有关」的离子方程式要按少量者定系数——这是高频难点。",
            nodeId: "n04"),
    ]

    // MARK: 氧化还原反应 ★★★

    private static let redoxBatch: [ChemProblem] = [
        ChemProblem(
            id: "p_redox_01", stage: .senior, topic: .redox,
            content: "反应 Fe + CuSO₄ → FeSO₄ + Cu 中，发生氧化反应的是？",
            options: ["Fe（化合价升高，被氧化）", "Cu²⁺", "SO₄²⁻", "Cu"],
            answerIndex: 0,
            explanation: "Fe 由 0 价升到 +2，化合价升高、失电子、被氧化（作还原剂）；Cu²⁺ 由 +2 降到 0，被还原。口诀：升·失·氧化（化合价升高的发生氧化反应、是还原剂）。",
            nodeId: "n05"),
        ChemProblem(
            id: "p_redox_02", stage: .senior, topic: .redox,
            content: "反应 2Na + Cl₂ →(点燃) 2NaCl 中，每生成 2 mol NaCl 转移电子的物质的量是？",
            options: ["1 mol", "2 mol", "4 mol", "0.5 mol"],
            answerIndex: 1,
            explanation: "每个 Na 失 1 个电子、每个 Cl 得 1 个电子。生成 2 mol NaCl，转移 2 mol 电子。先标化合价变化、再数每个原子转移几个电子、最后乘个数，是求转移电子数的通法。",
            nodeId: "n05", weapon: .electronConservation),
        ChemProblem(
            id: "p_redox_03", stage: .senior, topic: .redox,
            content: "配平反应 __Al + __HCl → __AlCl₃ + __H₂↑，正确的系数依次为？",
            options: ["1、3、1、1.5", "2、6、2、3", "1、6、1、3", "2、3、2、3"],
            answerIndex: 1,
            explanation: "Al→+3 失 3e⁻，H⁺→0 得 1e⁻；按电子守恒和原子守恒配平为 2Al+6HCl→2AlCl₃+3H₂↑。化学方程式系数应为最简整数比，故选 2、6、2、3。",
            nodeId: "n05"),
        ChemProblem(
            id: "p_redox_04", stage: .senior, topic: .redox,
            content: "反应 Cl₂ + 2NaOH → NaCl + NaClO + H₂O 中，氧化产物和还原产物分别是？",
            options: ["NaCl 和 NaClO", "NaClO 和 NaCl", "都是 NaCl", "都是 NaClO"],
            answerIndex: 1,
            explanation: "Cl₂ 中 Cl 为 0 价，一部分升到 +1（NaClO，氧化产物）、一部分降到 −1（NaCl，还原产物）——同种元素自身歧化。氧化产物来自被氧化（化合价升高）的产物。",
            nodeId: "n05"),
        ChemProblem(
            id: "p_redox_05", stage: .senior, topic: .redox,
            content: "下列反应属于歧化反应的是？",
            options: ["2H₂ + O₂ → 2H₂O", "Cl₂ + H₂O → HCl + HClO", "Fe + 2HCl → FeCl₂ + H₂↑", "2KClO₃ → 2KCl + 3O₂↑"],
            answerIndex: 1,
            explanation: "歧化反应：同一元素同一价态，一部分升高、一部分降低。Cl₂ 中 Cl（0 价）歧化为 +1（HClO）和 −1（HCl）。A、C 是不同元素间的氧化还原；D 中 Cl 降、O 升，是归中/分解但不是同种元素歧化。",
            nodeId: "n05"),
        ChemProblem(
            id: "p_redox_06", stage: .senior, topic: .redox,
            content: "一定条件下，0.2 mol KMnO₄（Mn 由 +7 降到 +2）完全反应，转移电子的物质的量为？",
            options: ["0.2 mol", "0.5 mol", "1 mol", "1.4 mol"],
            answerIndex: 2,
            explanation: "每个 Mn 由 +7 降到 +2 得 5 个电子，0.2 mol KMnO₄ 转移 0.2×5=1 mol 电子。氧化还原计算的核心是电子守恒，关键是数清每个原子的化合价变化数。",
            nodeId: "n05", weapon: .electronConservation,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：写出完整反应配平",
                    steps: [
                        "需先知道 KMnO₄ 与什么反应、产物是什么",
                        "配平整个氧化还原方程式",
                        "再由系数算转移电子——还原剂未知时很难下手",
                    ],
                    timeMinutes: 4),
                descent: SolutionPath(
                    title: "电子守恒：只看 Mn 的价态变化",
                    steps: [
                        "Mn 由 +7 → +2，每个得 5 个电子",
                        "0.2 mol KMnO₄ × 5 = 1 mol 电子 ✓",
                    ],
                    timeMinutes: 0.5),
                weapon: .electronConservation,
                principle: "原理：转移电子总数只取决于氧化剂得电子总数（= 还原剂失电子总数）。KMnO₄ 作氧化剂，得多少电子只由 Mn 的价态变化（+7→+2，得 5 个）和它的物质的量决定，与它具体氧化了谁、生成什么完全无关。所以连反应方程式都不用写，盯住 Mn 一个原子的「降几价」即可。",
                keyInsight: "求氧化剂转移电子数：盯中心元素降几价 × 物质的量，不必写方程式。",
                plainTalk: "高锰酸钾里的锰要从 +7 一路掉到 +2，掉了 5 个台阶，就得收 5 个电子。0.2 摩尔锰一共收 1 摩尔电子。它去氧化谁、变成什么，跟「收了多少电子」没关系。")),
        ChemProblem(
            id: "p_redox_07", stage: .senior, topic: .redox,
            content: "已知氧化性 Cl₂ > Br₂ > Fe³⁺ > I₂。则下列反应不能发生的是？",
            options: ["Cl₂ + 2Br⁻ → 2Cl⁻ + Br₂", "2Fe³⁺ + 2I⁻ → 2Fe²⁺ + I₂", "Br₂ + 2Fe²⁺ → 2Br⁻ + 2Fe³⁺", "I₂ + 2Fe²⁺ → 2I⁻ + 2Fe³⁺"],
            answerIndex: 3,
            explanation: "氧化剂氧化性必须强于氧化产物。D 中 I₂ 氧化性弱于 Fe³⁺，无法把 Fe²⁺ 氧化成 Fe³⁺，反应不能发生（实际是逆反应进行）。A、B、C 都满足「强氧化剂制弱氧化剂」。",
            nodeId: "n05"),
        ChemProblem(
            id: "p_redox_08", stage: .senior, topic: .redox,
            content: "下列物质在反应中只能作氧化剂的是？",
            options: ["浓硫酸", "SO₂", "Fe²⁺", "浓硝酸"],
            answerIndex: 3,
            explanation: "浓硝酸中 N 为最高价 +5，只能降价、只能作氧化剂。浓硫酸虽强氧化性但其中 H 也可作（一般仍归氧化性）；SO₂ 中 S 为 +4（中间价），Fe²⁺ 为中间价，都既能作氧化剂又能作还原剂。处于最高价的元素只能得电子。",
            nodeId: "n05"),
    ]

    // MARK: 元素周期律 ★★★

    private static let periodBatch: [ChemProblem] = [
        ChemProblem(
            id: "p_period_01", stage: .senior, topic: .periodicLaw,
            content: "某原子的质子数为 17、质量数为 35，则该原子中中子数为？",
            options: ["17", "18", "35", "52"],
            answerIndex: 1,
            explanation: "质量数 = 质子数 + 中子数，中子数 = 35 − 17 = 18。质子数 17 是氯元素。中性原子的电子数 = 质子数 = 17。",
            nodeId: "n08"),
        ChemProblem(
            id: "p_period_02", stage: .senior, topic: .periodicLaw,
            content: "某主族元素原子的电子层数为 3、最外层电子数为 7，它在周期表中的位置是？",
            options: ["第三周期第ⅤA族", "第三周期第ⅦA族", "第七周期第ⅢA族", "第三周期第Ⅶ族"],
            answerIndex: 1,
            explanation: "周期数 = 电子层数 = 3；主族序数 = 最外层电子数 = 7，即第ⅦA族。该元素是氯。「位置←→结构」的互推是元素推断题的基础。",
            nodeId: "n08"),
        ChemProblem(
            id: "p_period_03", stage: .senior, topic: .periodicLaw,
            content: "卤族元素（F、Cl、Br、I）从上到下，下列变化规律正确的是？",
            options: ["原子半径减小", "单质氧化性增强", "单质氧化性减弱", "非金属性增强"],
            answerIndex: 2,
            explanation: "同主族从上到下：电子层数增多、原子半径增大、得电子能力减弱，故非金属性减弱、单质氧化性减弱（F₂>Cl₂>Br₂>I₂）。这与同周期从左到右的递变方向要分清。",
            nodeId: "n08"),
        ChemProblem(
            id: "p_period_04", stage: .senior, topic: .periodicLaw,
            content: "下列微粒半径比较正确的是？",
            options: ["Na⁺ > Na", "Cl⁻ > Cl", "O²⁻ < F⁻", "K⁺ > K"],
            answerIndex: 1,
            explanation: "阴离子得电子、电子间斥力增大，半径比对应原子大：Cl⁻>Cl。阳离子失电子、半径比对应原子小：Na⁺<Na、K⁺<K。电子层结构相同的离子（O²⁻、F⁻、Na⁺、Mg²⁺），核电荷越大半径越小：O²⁻>F⁻，故 O²⁻<F⁻ 错误。",
            nodeId: "n08"),
        ChemProblem(
            id: "p_period_05", stage: .senior, topic: .periodicLaw,
            content: "X、Y 是同周期相邻的主族元素，X 的最高正价为 +5，Y 比 X 多一个质子。则 Y 的最高正价为？",
            options: ["+4", "+5", "+6", "+7"],
            answerIndex: 2,
            explanation: "X 最高正价 +5，处第ⅤA族；同周期相邻、质子数多 1 的 Y 在第ⅥA族，最高正价 = 主族序数 = +6。主族元素最高正价 = 最外层电子数（O、F 除外）。",
            nodeId: "n08"),
        ChemProblem(
            id: "p_period_06", stage: .senior, topic: .periodicLaw,
            content: "比较元素非金属性强弱，下列依据正确的是？",
            options: ["单质的熔点高低", "最高价氧化物对应水化物的酸性强弱", "气态氢化物的水溶液酸性强弱", "原子半径大小"],
            answerIndex: 1,
            explanation: "非金属性越强，其最高价氧化物对应水化物（含氧酸）酸性越强（如 HClO₄>H₂SO₄>H₃PO₄）。也可看单质与 H₂ 化合难易、气态氢化物稳定性。注意是「最高价含氧酸」，HClO 是弱酸不能用。",
            nodeId: "n08"),
        ChemProblem(
            id: "p_period_07", stage: .senior, topic: .periodicLaw,
            content: "某元素气态氢化物的化学式为 RH₃，则该元素最高价氧化物的化学式为？",
            options: ["RO₂", "R₂O₃", "R₂O₅", "RO₃"],
            answerIndex: 2,
            explanation: "RH₃ 说明 R 的最低负价为 −3，处第ⅤA族，最高正价 = 8−3 = +5，最高价氧化物为 R₂O₅（如 N、P）。最高正价 + |最低负价| = 8 是主族非金属的重要规律。",
            nodeId: "n08"),
    ]

    // MARK: 化学键 ★★

    private static let bondBatch: [ChemProblem] = [
        ChemProblem(
            id: "p_bond_01", stage: .senior, topic: .periodicLaw,
            content: "下列物质中只含离子键的是？",
            options: ["NaCl", "HCl", "NaOH", "H₂O"],
            answerIndex: 0,
            explanation: "NaCl 由活泼金属 Na 与活泼非金属 Cl 形成，只含离子键。HCl、H₂O 是共价化合物（共价键）；NaOH 既含离子键（Na⁺ 与 OH⁻）又含共价键（O—H）。",
            nodeId: "bond"),
        ChemProblem(
            id: "p_bond_02", stage: .senior, topic: .periodicLaw,
            content: "下列物质属于共价化合物的是？",
            options: ["MgCl₂", "CO₂", "NaF", "KOH"],
            answerIndex: 1,
            explanation: "只含共价键的化合物是共价化合物：CO₂ 由非金属元素以共价键结合。MgCl₂、NaF 是离子化合物；KOH 含离子键，是离子化合物。判断关键：是否含离子键——含则为离子化合物。",
            nodeId: "bond"),
        ChemProblem(
            id: "p_bond_03", stage: .senior, topic: .periodicLaw,
            content: "关于电子式，下列说法正确的是？",
            options: ["NaCl 的电子式中 Na 与 Cl 之间用一对共用电子", "HCl 是共价化合物，H 与 Cl 间有一对共用电子", "离子化合物不需要标离子电荷", "CO₂ 是离子化合物"],
            answerIndex: 1,
            explanation: "HCl 是共价化合物，H 与 Cl 间共用一对电子（H:Cl）。NaCl 是离子化合物，Na⁺ 与 [:Cl:]⁻ 间没有共用电子对、要标电荷；CO₂ 是共价化合物。电子式书写区分共价（共用电子对）与离子（电荷+方括号）。",
            nodeId: "bond"),
        ChemProblem(
            id: "p_bond_04", stage: .senior, topic: .periodicLaw,
            content: "下列分子中含有非极性共价键的是？",
            options: ["HCl", "H₂O", "Cl₂", "CO₂"],
            answerIndex: 2,
            explanation: "同种非金属原子间形成非极性键（共用电子对不偏移）：Cl₂ 中 Cl—Cl 是非极性键。HCl、H₂O、CO₂ 中不同元素间是极性键。「同种元素非极性、不同元素极性」。",
            nodeId: "bond"),
        ChemProblem(
            id: "p_bond_05", stage: .senior, topic: .periodicLaw,
            content: "下列物质中，既含离子键又含共价键的是？",
            options: ["CaCl₂", "Na₂O₂", "HCl", "Cl₂"],
            answerIndex: 1,
            explanation: "Na₂O₂ 由 Na⁺ 与 O₂²⁻ 构成（离子键），O₂²⁻ 中两个 O 之间是共价键，故既含离子键又含共价键。类似的还有 NaOH、Na₂SO₄、NH₄Cl。CaCl₂ 只有离子键，HCl、Cl₂ 只有共价键。",
            nodeId: "bond"),
        ChemProblem(
            id: "p_bond_06", stage: .senior, topic: .periodicLaw,
            content: "从化学键角度看，化学反应的本质是？",
            options: ["原子的重新组合，旧键断裂、新键形成", "电子的得失", "分子的聚集", "能量的转移"],
            answerIndex: 0,
            explanation: "化学反应的本质是反应物中旧化学键断裂、生成物中新化学键形成（原子重新组合）。断键吸收能量、成键放出能量，二者之差即反应的能量变化（ΔH）。",
            nodeId: "bond"),
        ChemProblem(
            id: "p_bond_07", stage: .senior, topic: .periodicLaw,
            content: "下列分子中，含有极性键但整个分子为非极性分子的是？",
            options: ["HCl", "H₂O", "CO₂", "NH₃"],
            answerIndex: 2,
            explanation: "CO₂ 是直线形对称结构，两个 C=O 极性键的极性相互抵消，整个分子为非极性分子。H₂O（V 形）、NH₃（三角锥）结构不对称，是极性分子；HCl 本身就是极性分子。键的极性与分子的极性是两个层次。",
            nodeId: "bond"),
    ]
}
