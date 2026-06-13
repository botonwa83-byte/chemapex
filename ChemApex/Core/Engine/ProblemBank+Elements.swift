import Foundation

// MARK: - 题库分批：必修 元素化合物（钠/铝/铁/氯/硫/氮/硅）
// 高考主战场，每个核心元素独立成关。红线：现象/颜色/条件准确，方程式配平。

extension ProblemBank {
    static let elementsBatch: [ChemProblem] = naBatch + alBatch + feBatch
        + clBatch + sBatch + nBatch + siBatch

    // MARK: 钠 Na ★★★

    private static let naBatch: [ChemProblem] = [
        ChemProblem(
            id: "p_na_01", stage: .senior, topic: .metals,
            content: "把一小块金属钠放在空气中，下列说法正确的是？",
            options: ["钠不与空气反应", "切开后银白色断面迅速变暗，生成 Na₂O", "钠应保存在水中", "钠在空气中燃烧生成 Na₂O"],
            answerIndex: 1,
            explanation: "钠很活泼，切开后断面被 O₂ 缓慢氧化为 Na₂O（白色），表面变暗。钠保存在煤油中（不能用水，会反应）；在空气中点燃则生成淡黄色 Na₂O₂（不是 Na₂O）。",
            nodeId: "na"),
        ChemProblem(
            id: "p_na_02", stage: .senior, topic: .metals,
            content: "Na₂O₂ 可用作呼吸面具和潜艇的供氧剂，原理是它能与？",
            options: ["只与 H₂O 反应放 O₂", "只与 CO₂ 反应放 O₂", "与人呼出的 CO₂ 和 H₂O 都反应放出 O₂", "与 N₂ 反应放 O₂"],
            answerIndex: 2,
            explanation: "2Na₂O₂+2CO₂→2Na₂CO₃+O₂、2Na₂O₂+2H₂O→4NaOH+O₂。人呼出的 CO₂ 和水汽都能让 Na₂O₂ 放出 O₂，故作供氧剂。",
            nodeId: "na"),
        ChemProblem(
            id: "p_na_03", stage: .senior, topic: .metals,
            content: "1 mol Na₂O₂ 与足量 H₂O 完全反应，转移电子的物质的量为？",
            options: ["1 mol", "2 mol", "0.5 mol", "4 mol"],
            answerIndex: 0,
            explanation: "2Na₂O₂+2H₂O→4NaOH+O₂↑ 中，O 由 −1 价歧化为 −2（NaOH）和 0（O₂）。每 2 mol Na₂O₂ 转移 2 mol 电子，故 1 mol Na₂O₂ 转移 1 mol 电子。Na₂O₂ 既是氧化剂又是还原剂。",
            nodeId: "na", weapon: .electronConservation,
            dualSolution: DualSolution(
                standard: SolutionPath(
                    title: "常规解：标价态、数转移",
                    steps: [
                        "2Na₂O₂ + 2H₂O → 4NaOH + O₂↑",
                        "O₂²⁻ 中 O 为 −1 价：一半升到 0（O₂）、一半降到 −2（NaOH）",
                        "每 2 mol Na₂O₂ 生成 1 mol O₂，转移 2 mol 电子",
                        "故 1 mol Na₂O₂ 转移 1 mol 电子",
                    ],
                    timeMinutes: 3),
                descent: SolutionPath(
                    title: "电子守恒：盯生成的 O₂",
                    steps: [
                        "歧化反应中，得失电子都发生在 O 身上",
                        "每生成 1 mol O₂（O 升 2 价）转移 2 mol 电子",
                        "1 mol Na₂O₂ → 0.5 mol O₂ → 转移 1 mol 电子 ✓",
                    ],
                    timeMinutes: 1),
                weapon: .electronConservation,
                principle: "原理：歧化反应里氧化剂和还原剂是同一种元素（这里都是 −1 价的 O），但电子守恒照样成立——升价的 O 失去的电子，恰好等于降价的 O 得到的电子。所以只需盯「升价那部分」即生成的 O₂：每 1 mol O₂ 对应 2 mol 电子，不必把氧化、还原两端分开数。",
                keyInsight: "歧化反应转移电子数，按「升价产物」（O₂）算：每 mol O₂ 转移 2 mol 电子。",
                plainTalk: "过氧化钠里的氧很纠结，一半往上跳（变成 O₂）、一半往下走（变成 NaOH）。往上跳的交出多少电子，往下走的就接住多少。盯着跳成氧气的那部分数就行：1 摩尔氧气 = 2 摩尔电子。")),
        ChemProblem(
            id: "p_na_04", stage: .senior, topic: .metals,
            content: "用焰色反应检验钠元素，火焰呈现的颜色是？",
            options: ["紫色", "黄色", "砖红色", "绿色"],
            answerIndex: 1,
            explanation: "钠的焰色为黄色，是元素的性质（物理变化）。检验钾时要透过蓝色钴玻璃滤去钠的黄光（避免微量钠干扰）。",
            nodeId: "na"),
        ChemProblem(
            id: "p_na_05", stage: .senior, topic: .metals,
            content: "将一小块钠投入 CuSO₄ 溶液中，观察到的现象是？",
            options: ["置换出红色的铜", "钠浮在液面游动、有气体，并生成蓝色沉淀", "无明显现象", "生成黑色沉淀"],
            answerIndex: 1,
            explanation: "钠先与水剧烈反应（浮、游、响）放 H₂ 并生成 NaOH，NaOH 再与 CuSO₄ 反应生成蓝色 Cu(OH)₂ 沉淀。钠太活泼，不能从溶液中置换出铜。",
            nodeId: "na"),
        ChemProblem(
            id: "p_na_06", stage: .senior, topic: .metals,
            content: "除去 Na₂CO₃ 固体中混有的少量 NaHCO₃，最简便的方法是？",
            options: ["加水溶解后蒸发", "加盐酸", "直接加热", "加 NaOH 溶液"],
            answerIndex: 2,
            explanation: "2NaHCO₃ →(Δ) Na₂CO₃+H₂O+CO₂↑，直接加热即可把 NaHCO₃ 转化为 Na₂CO₃，不引入新杂质。加盐酸会把 Na₂CO₃ 也消耗；除杂第一原则是不损耗主体、不引入新杂质。",
            nodeId: "na"),
    ]

    // MARK: 铝 Al ★★★

    private static let alBatch: [ChemProblem] = [
        ChemProblem(
            id: "p_al_01", stage: .senior, topic: .metals,
            content: "铝是较活泼金属，下列关于铝的两性的说法正确的是？",
            options: ["铝只与酸反应", "铝既能与盐酸反应，也能与 NaOH 溶液反应，都放出 H₂", "铝与 NaOH 反应放出 O₂", "Al₂O₃ 只溶于酸"],
            answerIndex: 1,
            explanation: "铝既溶于强酸（2Al+6HCl→2AlCl₃+3H₂↑）又溶于强碱（2Al+2NaOH+2H₂O→2NaAlO₂+3H₂↑），都放 H₂——这是铝两性的体现。Al₂O₃、Al(OH)₃ 同样两性。",
            nodeId: "al"),
        ChemProblem(
            id: "p_al_02", stage: .senior, topic: .metals,
            content: "Al₂O₃ 熔点高达 2050℃，工业上用作耐火材料（如坩埚、耐火砖）。Al₂O₃ 属于？",
            options: ["酸性氧化物", "碱性氧化物", "两性氧化物", "不成盐氧化物"],
            answerIndex: 2,
            explanation: "Al₂O₃ 既溶于强酸又溶于强碱，是两性氧化物：Al₂O₃+6HCl→2AlCl₃+3H₂O、Al₂O₃+2NaOH→2NaAlO₂+H₂O。其高熔点使它成为优良的耐火材料。",
            nodeId: "al"),
        ChemProblem(
            id: "p_al_03", stage: .senior, topic: .metals,
            content: "实验室制取 Al(OH)₃，最适宜的方法是向 AlCl₃ 溶液中加入？",
            options: ["过量 NaOH 溶液", "适量氨水", "过量盐酸", "过量氨水"],
            answerIndex: 3,
            explanation: "Al(OH)₃ 不溶于弱碱氨水，故用过量氨水也能得到沉淀：Al³⁺+3NH₃·H₂O→Al(OH)₃↓+3NH₄⁺。若用 NaOH，过量会把 Al(OH)₃ 溶解成 NaAlO₂——用量难控制。",
            nodeId: "al"),
        ChemProblem(
            id: "p_al_04", stage: .senior, topic: .metals,
            content: "明矾 KAl(SO₄)₂·12H₂O 可用作净水剂，其净水原理是？",
            options: ["明矾有杀菌消毒作用", "Al³⁺ 水解生成 Al(OH)₃ 胶体，吸附水中悬浮杂质", "明矾能氧化杂质", "明矾使水变软"],
            answerIndex: 1,
            explanation: "Al³⁺ 水解生成 Al(OH)₃ 胶体，胶体表面积大、吸附能力强，能吸附悬浮颗粒使其聚沉。明矾只净水（除浊），无杀菌消毒作用，也不能软化硬水。",
            nodeId: "al"),
        ChemProblem(
            id: "p_al_05", stage: .senior, topic: .metals,
            content: "常温下，可以用铝制容器盛装的是？",
            options: ["浓盐酸", "浓硝酸", "稀硫酸", "NaOH 溶液"],
            answerIndex: 1,
            explanation: "常温下铝遇浓硝酸、浓硫酸发生钝化（表面生成致密氧化膜阻止反应继续），故可用铝罐运输浓硝酸/浓硫酸。浓盐酸、稀硫酸、NaOH 都会与铝反应，不能盛装。",
            nodeId: "al"),
        ChemProblem(
            id: "p_al_06", stage: .senior, topic: .metals,
            content: "铝热反应 2Al+Fe₂O₃ →(高温) Al₂O₃+2Fe 的主要应用是？",
            options: ["实验室制氢气", "焊接铁轨、冶炼难熔金属", "制取氧化铝", "电解炼铝"],
            answerIndex: 1,
            explanation: "铝热反应放出大量热，足以使生成的铁熔化，故用于野外焊接钢轨、冶炼钒铬锰等难熔金属。引发需要镁条+氯酸钾作引燃剂。",
            nodeId: "al"),
    ]

    // MARK: 铁 Fe ★★★

    private static let feBatch: [ChemProblem] = [
        ChemProblem(
            id: "p_fe_01", stage: .senior, topic: .metals,
            content: "下列关于 Fe²⁺ 和 Fe³⁺ 溶液颜色的描述正确的是？",
            options: ["Fe²⁺ 黄色，Fe³⁺ 浅绿色", "Fe²⁺ 浅绿色，Fe³⁺ 黄色", "两者都是棕黄色", "两者都无色"],
            answerIndex: 1,
            explanation: "Fe²⁺ 溶液呈浅绿色，Fe³⁺ 溶液呈黄（棕黄）色。颜色是初步判断铁元素价态的依据，常与 KSCN 等检验配合使用。",
            nodeId: "fe"),
        ChemProblem(
            id: "p_fe_02", stage: .senior, topic: .metals,
            content: "FeCl₃ 溶液能腐蚀铜制电路板，反应为 2FeCl₃+Cu→2FeCl₂+CuCl₂。由此判断氧化性？",
            options: ["Fe³⁺ > Cu²⁺", "Cu²⁺ > Fe³⁺", "Fe²⁺ > Cu²⁺", "无法判断"],
            answerIndex: 0,
            explanation: "反应中 Fe³⁺ 作氧化剂、Cu²⁺ 是氧化产物，故氧化性 Fe³⁺ > Cu²⁺。Fe³⁺ 有较强氧化性，还能氧化 Fe（2Fe³⁺+Fe→3Fe²⁺）、I⁻、SO₂ 等。",
            nodeId: "fe"),
        ChemProblem(
            id: "p_fe_03", stage: .senior, topic: .metals,
            content: "要把 FeCl₂ 溶液中的 Fe²⁺ 转化为 Fe³⁺，应加入的试剂是？",
            options: ["铁粉", "氯水", "铜", "盐酸"],
            answerIndex: 1,
            explanation: "Fe²⁺ 有还原性，需用氧化剂把它氧化为 Fe³⁺：2Fe²⁺+Cl₂→2Fe³⁺+2Cl⁻（也可用酸性 KMnO₄、H₂O₂）。加铁粉、铜反而会还原 Fe³⁺。氯水不引入杂质阴离子，最佳。",
            nodeId: "fe"),
        ChemProblem(
            id: "p_fe_04", stage: .senior, topic: .metals,
            content: "向 FeSO₄ 溶液中滴加 NaOH 溶液，正确的现象是？",
            options: ["立即生成红褐色沉淀", "先生成白色沉淀，迅速变灰绿，最终变红褐色", "生成蓝色沉淀", "无明显现象"],
            answerIndex: 1,
            explanation: "先生成白色 Fe(OH)₂，但它极易被空气中 O₂ 氧化：4Fe(OH)₂+O₂+2H₂O→4Fe(OH)₃，颜色白→灰绿→红褐。制备纯 Fe(OH)₂ 需隔绝空气（滴管插入液面下、液面覆煤油）。",
            nodeId: "fe"),
        ChemProblem(
            id: "p_fe_05", stage: .senior, topic: .metals,
            content: "铁与下列物质反应，能生成 +3 价铁的是？",
            options: ["稀盐酸", "稀硫酸", "Cl₂（点燃）", "CuSO₄ 溶液"],
            answerIndex: 2,
            explanation: "氧化剂强弱决定铁的价态：Cl₂ 氧化性强，铁在其中燃烧只生成 FeCl₃（即使铁过量）；非氧化性的稀盐酸、稀硫酸及 CuSO₄ 只能把铁氧化到 +2 价。",
            nodeId: "fe"),
        ChemProblem(
            id: "p_fe_06", stage: .senior, topic: .metals,
            content: "保存 FeCl₂ 溶液时，常加入少量铁钉，目的是？",
            options: ["加快溶解", "防止 Fe²⁺ 被空气氧化为 Fe³⁺", "防止水解", "增大浓度"],
            answerIndex: 1,
            explanation: "Fe²⁺ 易被空气氧化为 Fe³⁺，加铁钉可把生成的 Fe³⁺ 还原回 Fe²⁺（2Fe³⁺+Fe→3Fe²⁺），维持溶液中是 Fe²⁺。对比：保存 FeCl₃ 溶液加盐酸（抑制水解）。",
            nodeId: "fe"),
        ChemProblem(
            id: "p_fe_07", stage: .senior, topic: .metals,
            content: "检验某溶液中是否含有 Fe²⁺（不含 Fe³⁺），正确的操作是？",
            options: ["直接加 KSCN 溶液看是否变红", "先加 KSCN 无现象，再加氯水变红，证明含 Fe²⁺", "加 NaOH 看红褐色沉淀", "加盐酸"],
            answerIndex: 1,
            explanation: "Fe²⁺ 遇 KSCN 不变色，需先加 KSCN（确认原溶液无 Fe³⁺）、再加氯水把 Fe²⁺ 氧化成 Fe³⁺ 而变血红，才证明原溶液含 Fe²⁺。「先无后红」是检验 Fe²⁺ 的标准流程。",
            nodeId: "fe"),
    ]

    // MARK: 氯 Cl ★★★

    private static let clBatch: [ChemProblem] = [
        ChemProblem(
            id: "p_cl_01", stage: .senior, topic: .nonmetals,
            content: "下列关于氯气的物理性质，描述正确的是？",
            options: ["无色无味气体", "黄绿色、有刺激性气味、有毒的气体", "密度比空气小", "极易溶于水"],
            answerIndex: 1,
            explanation: "Cl₂ 是黄绿色、有强烈刺激性气味的有毒气体，密度比空气大，能溶于水（常温 1 体积水约溶 2 体积 Cl₂）。收集用向上排空气法，尾气用 NaOH 吸收。",
            nodeId: "cl"),
        ChemProblem(
            id: "p_cl_02", stage: .senior, topic: .nonmetals,
            content: "新制氯水中含有多种微粒。下列微粒在氯水中不存在的是？",
            options: ["Cl₂ 分子", "HClO 分子", "ClO₃⁻", "H⁺、Cl⁻、ClO⁻"],
            answerIndex: 2,
            explanation: "Cl₂+H₂O⇌HCl+HClO，氯水中有「三分子（Cl₂、HClO、H₂O）四离子（H⁺、Cl⁻、ClO⁻、OH⁻）」。常温下不会生成 ClO₃⁻（那需要更强条件）。",
            nodeId: "cl"),
        ChemProblem(
            id: "p_cl_03", stage: .senior, topic: .nonmetals,
            content: "久置的氯水最终变成稀盐酸，原因是？",
            options: ["Cl₂ 挥发完了", "HClO 见光分解（2HClO→2HCl+O₂↑），平衡右移，最终主要为 HCl", "水蒸发了", "生成了 NaCl"],
            answerIndex: 1,
            explanation: "HClO 不稳定见光分解放 O₂，使 Cl₂+H₂O⇌HCl+HClO 平衡不断右移，Cl₂ 和 HClO 耗尽，久置氯水最终变为稀盐酸。所以氯水要现配现用、棕色瓶避光保存。",
            nodeId: "cl"),
        ChemProblem(
            id: "p_cl_04", stage: .senior, topic: .nonmetals,
            content: "工业上用氯气和石灰乳制漂白粉，漂白粉的有效成分是？",
            options: ["CaCl₂", "Ca(ClO)₂", "CaCO₃", "Ca(OH)₂"],
            answerIndex: 1,
            explanation: "2Cl₂+2Ca(OH)₂→Ca(ClO)₂+CaCl₂+2H₂O，有效成分是 Ca(ClO)₂（漂白靠 ClO⁻）。使用时需与空气中 CO₂、水反应生成 HClO 才起漂白消毒作用。",
            nodeId: "cl"),
        ChemProblem(
            id: "p_cl_05", stage: .senior, topic: .nonmetals,
            content: "检验某溶液中是否含 Cl⁻，正确的操作是？",
            options: ["加 AgNO₃ 溶液看白色沉淀即可", "先加稀硝酸酸化，再加 AgNO₃，生成不溶于硝酸的白色沉淀", "加 BaCl₂ 溶液", "加石蕊试液"],
            answerIndex: 1,
            explanation: "先用稀硝酸酸化排除 CO₃²⁻ 等干扰，再加 AgNO₃ 生成不溶于稀硝酸的白色 AgCl 沉淀，才能确认 Cl⁻。直接加 AgNO₃ 无法排除 CO₃²⁻（也生成白色沉淀但溶于硝酸）。",
            nodeId: "cl"),
        ChemProblem(
            id: "p_cl_06", stage: .senior, topic: .nonmetals,
            content: "漂白粉长期露置在空气中会失效，主要原因是？",
            options: ["Ca(ClO)₂ 与空气中 CO₂、水反应生成 HClO，HClO 分解", "吸收了水分", "被氧化", "Ca(ClO)₂ 升华"],
            answerIndex: 0,
            explanation: "Ca(ClO)₂+CO₂+H₂O→CaCO₃+2HClO，生成的 HClO 见光分解放 O₂ 而失去漂白能力。故漂白粉要密封保存。这也说明 HClO 酸性比碳酸弱（强酸 CO₂ 制弱酸 HClO）。",
            nodeId: "cl"),
        ChemProblem(
            id: "p_cl_07", stage: .senior, topic: .nonmetals,
            content: "向 NaBr 溶液中通入足量氯气，溶液颜色变化及原因正确的是？",
            options: ["无变化", "变橙色，因 Cl₂ 把 Br⁻ 氧化为 Br₂（氧化性 Cl₂>Br₂）", "变蓝色", "变紫色，生成 I₂"],
            answerIndex: 1,
            explanation: "卤素氧化性 Cl₂>Br₂>I₂，活泼的氯能置换出溴：Cl₂+2Br⁻→2Cl⁻+Br₂，溶液变橙色。同理 Cl₂ 或 Br₂ 都能置换出 I₂（遇淀粉变蓝）。",
            nodeId: "cl"),
    ]

    // MARK: 硫 S ★★★

    private static let sBatch: [ChemProblem] = [
        ChemProblem(
            id: "p_s_01", stage: .senior, topic: .nonmetals,
            content: "SO₂ 能使品红溶液褪色，加热后红色又恢复。这说明 SO₂ 的漂白特点是？",
            options: ["氧化型漂白，不可逆", "与有色物质化合生成不稳定无色物质，漂白可逆", "还原型漂白", "永久漂白"],
            answerIndex: 1,
            explanation: "SO₂ 与品红化合生成不稳定的无色物质，加热分解又恢复红色——化合型可逆漂白。这与氯水（HClO 氧化型不可逆漂白）有本质区别。SO₂ 不能漂白石蕊（只使其变红）。",
            nodeId: "s"),
        ChemProblem(
            id: "p_s_02", stage: .senior, topic: .nonmetals,
            content: "下列关于 SO₂ 和 Cl₂ 漂白性的比较，正确的是？",
            options: ["两者漂白原理相同", "SO₂ 漂白可逆、Cl₂(HClO) 漂白不可逆", "等体积混合漂白能力增强", "SO₂ 能漂白石蕊"],
            answerIndex: 1,
            explanation: "SO₂ 是化合型可逆漂白、HClO 是氧化型不可逆漂白，原理不同。两者按 1:1 混合通入溶液，会发生 SO₂+Cl₂+2H₂O→H₂SO₄+2HCl 互相消耗，反而都失去漂白性。",
            nodeId: "s"),
        ChemProblem(
            id: "p_s_03", stage: .senior, topic: .nonmetals,
            content: "浓硫酸滴到蔗糖上，蔗糖变黑并膨胀放出有刺激性气味的气体。变黑体现浓硫酸的？",
            options: ["吸水性", "脱水性", "强酸性", "难挥发性"],
            answerIndex: 1,
            explanation: "脱水性：把蔗糖中的 H、O 按 2:1 脱去留下黑色的碳（炭化）。随后浓硫酸氧化碳放出 SO₂、CO₂（刺激性气味）。脱水性（夺取化合态 H、O）与吸水性（吸收现成的水分子）一字之差。",
            nodeId: "s"),
        ChemProblem(
            id: "p_s_04", stage: .senior, topic: .nonmetals,
            content: "下列反应能体现浓硫酸强氧化性的是？",
            options: ["浓硫酸与 NaCl 固体加热制 HCl", "浓硫酸干燥 CO₂", "Cu 与浓硫酸加热反应放出 SO₂", "浓硫酸使蔗糖炭化"],
            answerIndex: 2,
            explanation: "Cu+2H₂SO₄(浓)→(Δ)CuSO₄+SO₂↑+2H₂O 中硫由 +6 降到 +4，体现强氧化性。制 HCl 体现难挥发性（高沸点制低沸点），干燥 CO₂ 体现吸水性，蔗糖炭化体现脱水性。",
            nodeId: "s"),
        ChemProblem(
            id: "p_s_05", stage: .senior, topic: .nonmetals,
            content: "检验某溶液中含 SO₄²⁻，正确的操作是？",
            options: ["加 BaCl₂ 看白色沉淀", "先加足量稀盐酸无沉淀，再加 BaCl₂ 生成白色沉淀", "加 AgNO₃ 溶液", "加石蕊"],
            answerIndex: 1,
            explanation: "先加足量稀盐酸排除 CO₃²⁻、SO₃²⁻、Ag⁺ 等干扰（它们也生成白色沉淀但溶于盐酸或本是杂质），再加 BaCl₂ 出现不溶的白色 BaSO₄，才能确认 SO₄²⁻。",
            nodeId: "s"),
        ChemProblem(
            id: "p_s_06", stage: .senior, topic: .nonmetals,
            content: "接触法制硫酸的三步主要反应顺序正确的是？",
            options: ["S/FeS₂ → SO₃ → SO₂ → H₂SO₄", "S/FeS₂ → SO₂ → SO₃ → H₂SO₄", "SO₂ → S → SO₃ → H₂SO₄", "H₂SO₄ → SO₃ → SO₂"],
            answerIndex: 1,
            explanation: "①燃烧 S 或煅烧 FeS₂ 得 SO₂ ②催化氧化 2SO₂+O₂⇌2SO₃ ③SO₃ 用浓硫酸吸收（不用水，防酸雾）得 H₂SO₄。硫原子守恒贯穿全程：FeS₂~2H₂SO₄（关系式法素材）。",
            nodeId: "s", weapon: .relationMethod),
    ]

    // MARK: 氮 N ★★★

    private static let nBatch: [ChemProblem] = [
        ChemProblem(
            id: "p_n_01", stage: .senior, topic: .nonmetals,
            content: "N₂ 的化学性质很稳定，主要原因是？",
            options: ["N₂ 是单质", "N≡N 三键键能很大，难以断裂", "N₂ 密度小", "N₂ 不溶于水"],
            answerIndex: 1,
            explanation: "N₂ 分子中氮氮三键键能极大（约 946 kJ/mol），断键需很高能量，故常温下很稳定、常作保护气。只有放电/高温或固氮酶催化等苛刻条件才能使 N₂ 反应。",
            nodeId: "n"),
        ChemProblem(
            id: "p_n_02", stage: .senior, topic: .nonmetals,
            content: "氨气的喷泉实验能成功，根本原因是？",
            options: ["NH₃ 密度小", "NH₃ 极易溶于水，使烧瓶内压强骤减", "NH₃ 有刺激性", "NH₃ 是碱性气体"],
            answerIndex: 1,
            explanation: "NH₃ 极易溶于水（1 体积水约溶 700 体积 NH₃），少量水进入烧瓶即溶解大量 NH₃，瓶内压强骤减、外界大气压把水压入形成喷泉。滴入酚酞的水会变红（NH₃ 水溶液显碱性）。",
            nodeId: "n"),
        ChemProblem(
            id: "p_n_03", stage: .senior, topic: .nonmetals,
            content: "实验室用加热 NH₄Cl 和 Ca(OH)₂ 固体混合物制取 NH₃，收集和验满的方法是？",
            options: ["向上排空气法，湿润蓝色石蕊试纸验满", "向下排空气法，湿润红色石蕊试纸变蓝验满", "排水法收集", "向下排空气法，带火星木条验满"],
            answerIndex: 1,
            explanation: "NH₃ 密度比空气小，用向下排空气法收集；NH₃ 是唯一能使湿润红色石蕊试纸变蓝的气体，可用于验满（试纸放瓶口变蓝即满）。NH₃ 极易溶于水不能排水收集。",
            nodeId: "n"),
        ChemProblem(
            id: "p_n_04", stage: .senior, topic: .nonmetals,
            content: "检验铵盐中 NH₄⁺ 的方法是，向样品中加入？",
            options: ["稀盐酸，产生气泡", "NaOH 溶液并加热，产生使湿润红色石蕊试纸变蓝的气体", "BaCl₂ 溶液", "AgNO₃ 溶液"],
            answerIndex: 1,
            explanation: "NH₄⁺+OH⁻ →(Δ) NH₃↑+H₂O，放出的 NH₃ 使湿润红色石蕊试纸变蓝——这是检验 NH₄⁺ 的专属方法。铵盐受热易分解（NH₄Cl 加热分解又在管口重新化合）。",
            nodeId: "n"),
        ChemProblem(
            id: "p_n_05", stage: .senior, topic: .nonmetals,
            content: "铜与浓硝酸、稀硝酸反应的气体产物分别是？",
            options: ["都是 NO", "都是 NO₂", "浓硝酸生成 NO₂，稀硝酸生成 NO", "浓硝酸生成 NO，稀硝酸生成 NO₂"],
            answerIndex: 2,
            explanation: "Cu+4HNO₃(浓)→Cu(NO₃)₂+2NO₂↑+2H₂O（红棕色）；3Cu+8HNO₃(稀)→3Cu(NO₃)₂+2NO↑+4H₂O（无色，遇空气变红棕）。硝酸越浓氧化性越强、氮被还原的价态越高。",
            nodeId: "n"),
        ChemProblem(
            id: "p_n_06", stage: .senior, topic: .nonmetals,
            content: "浓硝酸通常保存在棕色试剂瓶并置于阴凉处，原因是？",
            options: ["浓硝酸易挥发", "浓硝酸不稳定，见光或受热分解（4HNO₃→4NO₂↑+O₂↑+2H₂O）", "浓硝酸有强氧化性", "防止吸水"],
            answerIndex: 1,
            explanation: "HNO₃ 不稳定，光照或受热分解生成 NO₂、O₂、H₂O，使浓硝酸常带黄色（溶有 NO₂）。故用棕色瓶避光、阴凉保存。这与氯水避光保存同理。",
            nodeId: "n"),
        ChemProblem(
            id: "p_n_07", stage: .senior, topic: .nonmetals,
            content: "雷雨天气有利于「雷雨发庄稼」，其第一步发生的反应是？",
            options: ["N₂ + O₂ →(放电) 2NO", "N₂ + 3H₂ → 2NH₃", "2NO + O₂ → 2NO₂", "3NO₂ + H₂O → 2HNO₃ + NO"],
            answerIndex: 0,
            explanation: "放电使 N₂+O₂→2NO（自然固氮第一步），随后 2NO+O₂→2NO₂、3NO₂+H₂O→2HNO₃+NO，硝酸随雨水进入土壤形成硝酸盐被作物吸收。注意氮氧化物也是酸雨和光化学烟雾的成因。",
            nodeId: "n"),
    ]

    // MARK: 硅 Si ★

    private static let siBatch: [ChemProblem] = [
        ChemProblem(
            id: "p_si_01", stage: .senior, topic: .nonmetals,
            content: "硅在现代信息技术中的主要用途是？",
            options: ["制光导纤维", "作半导体材料（芯片、太阳能电池）", "制玻璃", "作耐火材料"],
            answerIndex: 1,
            explanation: "高纯硅是优良的半导体，用于制造芯片、太阳能电池。制光导纤维的是 SiO₂（二氧化硅）——「硅」和「SiO₂」用途不同，是易混点。",
            nodeId: "si"),
        ChemProblem(
            id: "p_si_02", stage: .senior, topic: .nonmetals,
            content: "SiO₂ 是酸性氧化物，但它有两个「反常」反应。下列属于 SiO₂ 反常性质的是？",
            options: ["与水反应生成硅酸", "与氢氟酸反应（SiO₂+4HF→SiF₄↑+2H₂O）", "与盐酸反应", "与硫酸反应"],
            answerIndex: 1,
            explanation: "SiO₂ 一般不与酸反应（酸性氧化物的常态），但能与氢氟酸反应——这是它的「反常」，用于刻蚀玻璃，故 HF 保存在塑料瓶中。SiO₂ 也不溶于水（酸性氧化物中的特例）。",
            nodeId: "si"),
        ChemProblem(
            id: "p_si_03", stage: .senior, topic: .nonmetals,
            content: "盛放 NaOH 溶液的试剂瓶要用橡胶塞而不用玻璃塞，原因是？",
            options: ["玻璃塞太重", "NaOH 与玻璃中的 SiO₂ 反应生成有黏性的 Na₂SiO₃，使瓶塞与瓶口黏结", "NaOH 腐蚀橡胶", "便于密封"],
            answerIndex: 1,
            explanation: "SiO₂+2NaOH→Na₂SiO₃+H₂O，玻璃含 SiO₂，生成的硅酸钠（水玻璃）有黏性会把玻璃塞与瓶口黏死。故盛碱液用橡胶塞。这体现 SiO₂ 能与强碱反应。",
            nodeId: "si"),
        ChemProblem(
            id: "p_si_04", stage: .senior, topic: .nonmetals,
            content: "下列硅及其化合物的用途对应正确的是？",
            options: ["硅酸钠水溶液（水玻璃）可作矿物胶和防火剂", "SiO₂ 作半导体", "硅作光导纤维", "硅胶用于制玻璃"],
            answerIndex: 0,
            explanation: "硅酸钠水溶液俗称水玻璃，是矿物胶（黏合剂）和防火材料。SiO₂ 制光导纤维/光学仪器；硅作半导体；硅胶（多孔 SiO₂）作干燥剂和催化剂载体。用途配对是硅一章的高频考点。",
            nodeId: "si"),
        ChemProblem(
            id: "p_si_05", stage: .senior, topic: .nonmetals,
            content: "工业上用石英砂和焦炭在高温下制粗硅，反应为 SiO₂+2C →(高温) Si+2CO↑。该反应中碳的作用是？",
            options: ["氧化剂", "还原剂", "催化剂", "既不是氧化剂也不是还原剂"],
            answerIndex: 1,
            explanation: "碳由 0 价升到 +2（CO），失电子作还原剂，把 Si 从 +4 还原为 0 价单质。注意产物是 CO 不是 CO₂（高温、碳过量）。粗硅再经 SiCl₄ 提纯可得高纯硅。",
            nodeId: "si"),
    ]
}
