import Foundation

// MARK: - 题库分批：选必2 物质结构与性质（原子/分子/晶体）
// 选必2 已入高考范围。红线：电子排布、杂化、晶体类型表述符合教材。

extension ProblemBank {
    static let structureBatch: [ChemProblem] = atomBatch + molBatch + crystalBatch + capstoneBatch

    // MARK: 原子结构 ★★★

    private static let atomBatch: [ChemProblem] = [
        ChemProblem(
            id: "p_st_a01", stage: .senior, topic: .structure,
            content: "基态氧原子（O，原子序数 8）的电子排布式是？",
            options: ["1s²2s²2p⁴", "1s²2s²2p⁶", "1s²2s⁴2p²", "1s²2p⁶"],
            answerIndex: 0,
            explanation: "按能量最低原理依次填充：1s²→2s²→2p⁴，共 8 个电子。2p⁴ 中按洪特规则先单占三个轨道再成对。基态电子排布式书写是结构题的基本功。",
            nodeId: "struct_atom"),
        ChemProblem(
            id: "p_st_a02", stage: .senior, topic: .structure,
            content: "下列关于能层和能级的说法正确的是？",
            options: ["第一能层（K）只有 1s 一个能级", "2p 能级最多容纳 2 个电子", "3d 能级在 4s 之前填充", "能层数越大，能级越少"],
            answerIndex: 0,
            explanation: "K 层只有 1s 能级（最多 2 个电子）。p 能级有 3 个轨道、最多 6 个电子；按构造原理 4s 先于 3d 填充（能量交错）；能层数越大包含的能级越多。",
            nodeId: "struct_atom"),
        ChemProblem(
            id: "p_st_a03", stage: .senior, topic: .structure,
            content: "基态原子核外电子排布遵循的原则不包括？",
            options: ["能量最低原理", "泡利不相容原理", "洪特规则", "质量守恒定律"],
            answerIndex: 3,
            explanation: "核外电子排布三原则：能量最低原理（先填低能级）、泡利原理（一个轨道最多 2 个自旋相反的电子）、洪特规则（简并轨道先单占且自旋平行）。质量守恒是化学反应规律，与电子排布无关。",
            nodeId: "struct_atom"),
        ChemProblem(
            id: "p_st_a04", stage: .senior, topic: .structure,
            content: "基态铬原子（Cr，24 号）的价电子排布式为 3d⁵4s¹ 而非 3d⁴4s²，原因是？",
            options: ["3d⁵4s¹ 是激发态", "半充满（3d⁵）结构更稳定", "违反能量最低原理", "4s 能级已满"],
            answerIndex: 1,
            explanation: "能级处于全充满（d¹⁰）、半充满（d⁵）、全空（d⁰）时较稳定。Cr 取 3d⁵4s¹（半满更稳）、Cu 取 3d¹⁰4s¹（全满更稳），是构造原理的两个著名特例。",
            nodeId: "struct_atom"),
        ChemProblem(
            id: "p_st_a05", stage: .senior, topic: .structure,
            content: "下列元素第一电离能的比较中，出现「反常」的是？",
            options: ["Na < Mg", "Mg < Al", "Li < Be", "B < C"],
            answerIndex: 1,
            explanation: "同周期第一电离能总体增大，但 Mg（3s²全满）比 Al（3s²3p¹）更稳定，出现 Mg > Al 的反常（即 Mg < Al 错误）。类似反常还有 N > O（N 的 2p³半满）。半满/全满结构格外稳定。",
            nodeId: "struct_atom"),
        ChemProblem(
            id: "p_st_a06", stage: .senior, topic: .structure,
            content: "关于电负性，下列说法正确的是？",
            options: ["金属元素的电负性一般较大", "同周期从左到右电负性减小", "电负性最大的元素是氟", "电负性用于比较金属的还原性"],
            answerIndex: 2,
            explanation: "电负性衡量原子吸引电子的能力，非金属性越强电负性越大，氟最大（4.0）。同周期从左到右增大、同主族从上到下减小。电负性差越大越倾向离子键（差>1.7）。",
            nodeId: "struct_atom"),
        ChemProblem(
            id: "p_st_a07", stage: .senior, topic: .structure,
            content: "s 原子轨道和 p 原子轨道的形状分别是？",
            options: ["都是球形", "s 球形、p 哑铃形（纺锤形）", "s 哑铃形、p 球形", "都是哑铃形"],
            answerIndex: 1,
            explanation: "s 轨道呈球形（每个能层 1 个）；p 轨道呈哑铃形（纺锤形），每个能层有 px、py、pz 三个相互垂直的轨道。轨道形状决定了成键的方向性。",
            nodeId: "struct_atom"),
        ChemProblem(
            id: "p_st_a08", stage: .senior, topic: .structure,
            content: "基态原子的核外电子优先占据能量最低的轨道，这一规则称为？",
            options: ["能量最低原理（构造原理）", "洪特规则", "泡利原理", "对角线规则"],
            answerIndex: 0,
            explanation: "能量最低原理（构造原理）：电子按能级能量由低到高的顺序（1s、2s、2p、3s、3p、4s、3d…）依次填充，使整个原子能量最低、最稳定。",
            nodeId: "struct_atom"),
        ChemProblem(
            id: "p_st_a09", stage: .senior, topic: .structure,
            content: "同一周期（稀有气体除外）从左到右，原子的下列性质变化正确的是？",
            options: ["电负性减小", "第一电离能总体增大", "原子半径增大", "金属性增强"],
            answerIndex: 1,
            explanation: "同周期从左到右：核电荷增大、半径减小、电负性增大、第一电离能总体增大（个别反常如 Mg>Al、N>O）、金属性减弱非金属性增强。掌握「两条总箭头」即可推导递变。",
            nodeId: "struct_atom"),
    ]

    // MARK: 分子结构与性质 ★★★

    private static let molBatch: [ChemProblem] = [
        ChemProblem(
            id: "p_st_m01", stage: .senior, topic: .structure,
            content: "关于共价键，下列说法正确的是？",
            options: ["单键是 σ 键，双键是 2 个 π 键", "双键由 1 个 σ 键和 1 个 π 键组成", "三键由 3 个 σ 键组成", "σ 键不如 π 键牢固"],
            answerIndex: 1,
            explanation: "单键为 1 个 σ 键；双键 = 1σ + 1π；三键 = 1σ + 2π。σ 键「头碰头」重叠、较牢固，π 键「肩并肩」重叠、较易断（故不饱和键易发生加成）。",
            nodeId: "struct_mol"),
        ChemProblem(
            id: "p_st_m02", stage: .senior, topic: .structure,
            content: "下列分子中，中心原子为 sp³ 杂化的是？",
            options: ["CO₂", "BF₃", "CH₄", "C₂H₂（乙炔）"],
            answerIndex: 2,
            explanation: "CH₄ 中碳有 4 个 σ 键、0 孤对，σ键数+孤对数=4，sp³ 杂化（正四面体）。CO₂、C₂H₂ 是 sp（直线）；BF₃ 是 sp²（平面三角）。判断口诀：价层电子对数 2→sp、3→sp²、4→sp³。",
            nodeId: "struct_mol"),
        ChemProblem(
            id: "p_st_m03", stage: .senior, topic: .structure,
            content: "用价层电子对互斥理论（VSEPR）判断，H₂O 分子的空间构型为？",
            options: ["直线形", "平面三角形", "V 形（角形）", "正四面体形"],
            answerIndex: 2,
            explanation: "H₂O 中 O 有 2 个 σ 键、2 对孤对电子，价层电子对数 4、sp³ 杂化，但 2 对孤对占据后实际构型为 V 形（角形），键角约 105°。孤对电子参与杂化但不计入分子构型描述。",
            nodeId: "struct_mol"),
        ChemProblem(
            id: "p_st_m04", stage: .senior, topic: .structure,
            content: "键角大小：CH₄、NH₃、H₂O 由大到小的顺序是？",
            options: ["CH₄ > NH₃ > H₂O", "H₂O > NH₃ > CH₄", "NH₃ > CH₄ > H₂O", "三者相等"],
            answerIndex: 0,
            explanation: "三者中心原子都是 sp³ 杂化。孤对电子对成键电子的排斥更强，孤对越多键角越小：CH₄（0 孤对，109.5°）> NH₃（1 孤对，107°）> H₂O（2 孤对，105°）。",
            nodeId: "struct_mol"),
        ChemProblem(
            id: "p_st_m05", stage: .senior, topic: .structure,
            content: "下列分子中属于非极性分子的是？",
            options: ["HCl", "NH₃", "CCl₄", "H₂O"],
            answerIndex: 2,
            explanation: "CCl₄ 正四面体对称，4 个极性 C—Cl 键的极性相互抵消，是非极性分子。HCl、NH₃（三角锥）、H₂O（V 形）结构不对称，是极性分子。判断：键有极性 + 结构对称 → 非极性分子。",
            nodeId: "struct_mol"),
        ChemProblem(
            id: "p_st_m06", stage: .senior, topic: .structure,
            content: "H₂O 的沸点（100℃）显著高于 H₂S，主要原因是？",
            options: ["H₂O 相对分子质量大", "H₂O 分子间能形成氢键", "H₂O 是离子化合物", "H₂O 含极性键"],
            answerIndex: 1,
            explanation: "H₂O 分子间存在氢键（O—H…O），使其沸点反常地高。含 N、O、F 的氢化物（HF、H₂O、NH₃）因氢键沸点反常偏高。氢键是一种较强的分子间作用力，不是化学键。",
            nodeId: "struct_mol"),
        ChemProblem(
            id: "p_st_m07", stage: .senior, topic: .structure,
            content: "在配合物 [Cu(NH₃)₄]SO₄ 中，中心离子和配位数分别是？",
            options: ["Cu²⁺，4", "NH₃，4", "Cu²⁺，6", "SO₄²⁻，4"],
            answerIndex: 0,
            explanation: "配合物 [Cu(NH₃)₄]²⁺ 中，中心离子是提供空轨道的 Cu²⁺，配体是提供孤对电子的 NH₃，配位数 = 配体数 = 4。Cu²⁺ 与 NH₃ 之间是配位键（一种特殊共价键）。",
            nodeId: "struct_mol"),
        ChemProblem(
            id: "p_st_m08", stage: .senior, topic: .structure,
            content: "下列各组微粒互为等电子体（原子数相同、价电子总数相同）的是？",
            options: ["CO₂ 和 N₂O", "CO₂ 和 SO₂", "N₂ 和 O₂", "CH₄ 和 NH₃"],
            answerIndex: 0,
            explanation: "CO₂（3 原子、16 价电子）与 N₂O（3 原子、16 价电子）是等电子体，结构相似（都是直线形）。等电子体常有相似的空间构型和性质，是预测结构的有用工具。",
            nodeId: "struct_mol"),
        ChemProblem(
            id: "p_st_m09", stage: .senior, topic: .structure,
            content: "组成和结构相似的分子，相对分子质量越大，下列性质一般？",
            options: ["分子间作用力越小，沸点越低", "分子间作用力越大，沸点越高", "沸点与相对分子质量无关", "一定形成氢键"],
            answerIndex: 1,
            explanation: "组成结构相似的分子晶体，相对分子质量越大、分子间范德华力越大、熔沸点越高（如卤素单质 F₂<Cl₂<Br₂<I₂）。但若存在氢键则会反常（如 HF 沸点高于 HCl）。",
            nodeId: "struct_mol"),
    ]

    // MARK: 晶体结构 ★★★

    private static let crystalBatch: [ChemProblem] = [
        ChemProblem(
            id: "p_st_c01", stage: .senior, topic: .structure,
            content: "下列物质属于共价晶体（原子晶体）的是？",
            options: ["干冰（CO₂）", "金刚石", "氯化钠", "金属铜"],
            answerIndex: 1,
            explanation: "金刚石中碳原子以共价键形成空间网状结构，是共价晶体，熔点极高、硬度极大。干冰是分子晶体、NaCl 是离子晶体、铜是金属晶体。SiO₂、SiC、晶体硅也是共价晶体。",
            nodeId: "struct_crystal"),
        ChemProblem(
            id: "p_st_c02", stage: .senior, topic: .structure,
            content: "下列物质熔点由高到低排列正确的是？",
            options: ["金刚石 > NaCl > 干冰", "干冰 > NaCl > 金刚石", "NaCl > 金刚石 > 干冰", "三者相近"],
            answerIndex: 0,
            explanation: "熔沸点一般：共价晶体 > 离子晶体 ≈ 金属晶体 > 分子晶体。金刚石（共价晶体，破坏共价键）> NaCl（离子晶体，破坏离子键）> 干冰（分子晶体，只破坏分子间作用力）。先判断晶体类型再比较。",
            nodeId: "struct_crystal"),
        ChemProblem(
            id: "p_st_c03", stage: .senior, topic: .structure,
            content: "SiO₂ 晶体熔点高、硬度大，这是因为？",
            options: ["SiO₂ 是离子晶体", "SiO₂ 是共价晶体，Si—O 共价键贯穿整个晶体", "SiO₂ 分子间作用力大", "SiO₂ 是分子晶体"],
            answerIndex: 1,
            explanation: "SiO₂ 是共价晶体，每个 Si 与 4 个 O、每个 O 与 2 个 Si 以共价键连成空间网状，熔化需破坏大量共价键，故熔点高硬度大。注意：「CO₂ 是分子晶体」不能类推到 SiO₂。",
            nodeId: "struct_crystal"),
        ChemProblem(
            id: "p_st_c04", stage: .senior, topic: .structure,
            content: "下列关于分子晶体的说法正确的是？",
            options: ["分子晶体一定含金属", "分子晶体熔化时破坏共价键", "分子晶体熔沸点一般较低", "所有分子晶体都能导电"],
            answerIndex: 2,
            explanation: "分子晶体由分子构成、分子间靠较弱的分子间作用力结合，熔沸点一般较低、硬度小、固态和熔融态都不导电（如干冰、冰、I₂）。熔化只破坏分子间作用力，分子内共价键不变。",
            nodeId: "struct_crystal"),
        ChemProblem(
            id: "p_st_c05", stage: .senior, topic: .structure,
            content: "金属能导电、有延展性，从结构角度看是因为金属晶体中存在？",
            options: ["自由移动的电子（金属键）", "自由移动的离子", "共价键", "氢键"],
            answerIndex: 0,
            explanation: "金属晶体由金属阳离子和自由电子（电子气）构成，金属键使其具有导电、导热、延展性和金属光泽。自由电子在外加电场下定向移动而导电。",
            nodeId: "struct_crystal"),
        ChemProblem(
            id: "p_st_c06", stage: .senior, topic: .structure,
            content: "NaCl 晶体中，每个 Na⁺ 周围最近且等距的 Cl⁻ 有几个（配位数）？",
            options: ["4", "6", "8", "12"],
            answerIndex: 1,
            explanation: "NaCl 晶体中，每个 Na⁺ 周围有 6 个最近等距的 Cl⁻（上下左右前后），配位数为 6；每个 Cl⁻ 周围也有 6 个 Na⁺。配位数是晶胞分析的重要参数。",
            nodeId: "struct_crystal"),
        ChemProblem(
            id: "p_st_c07", stage: .senior, topic: .structure,
            content: "用均摊法计算：NaCl 晶胞中含 4 个 Na⁺ 和 4 个 Cl⁻。处于晶胞顶点的微粒对该晶胞的贡献是？",
            options: ["1", "1/2", "1/4", "1/8"],
            answerIndex: 3,
            explanation: "均摊法：顶点微粒被 8 个晶胞共用，对一个晶胞贡献 1/8；棱上贡献 1/4；面上贡献 1/2；体内贡献 1。这是晶胞中微粒数和化学式、密度计算的基础。",
            nodeId: "struct_crystal"),
    ]

    // MARK: 竞赛之窗 · 向上仰望 👁（收尾，少而精）

    private static let capstoneBatch: [ChemProblem] = [
        ChemProblem(
            id: "p_cap_01", stage: .olympiad, topic: .structure,
            content: "已知某金属晶体为面心立方堆积，晶胞棱长为 a cm、金属摩尔质量 M g/mol、阿伏加德罗常数 Nᴀ。面心立方晶胞含 4 个原子，则其密度为？",
            options: ["4M/(Nᴀ·a³)", "M/(Nᴀ·a³)", "2M/(Nᴀ·a³)", "8M/(Nᴀ·a³)"],
            answerIndex: 0,
            explanation: "晶胞密度 ρ = 晶胞质量/晶胞体积 = (晶胞内原子数 × M/Nᴀ) / a³ = 4M/(Nᴀ·a³)。晶胞计算的通法：先用均摊法数清原子数，再套 ρ=nM/(Nᴀ·V)。这类计算是结构题压轴。",
            nodeId: "cap"),
        ChemProblem(
            id: "p_cap_02", stage: .olympiad, topic: .structure,
            content: "从能量角度看，「等电子原理」能预测分子的空间构型。与 CO₂ 互为等电子体的离子 N₃⁻、CNO⁻ 的空间构型应为？",
            options: ["直线形", "V 形", "平面三角形", "四面体形"],
            answerIndex: 0,
            explanation: "等电子体（原子数相同、价电子总数相同）具有相似的空间构型。CO₂ 是直线形，故等电子的 N₃⁻、CNO⁻ 也是直线形。等电子原理是预测陌生微粒结构的「降维」工具——这正是结构化学的上帝视角。",
            nodeId: "cap"),

        // ===== 竞赛之窗扩充：热力学/结构/动力学的"上帝视角" =====
        ChemProblem(
            id: "p_cap_03", stage: .olympiad, topic: .structure,
            content: "高中靠「放热有利、熵增有利」定性判断反应方向，竞赛用 ΔG = ΔH − TΔS 精确判断。某反应 ΔH > 0、ΔS > 0，则它？",
            options: ["任何温度都自发", "任何温度都不自发", "高温下自发（T 足够大时 ΔG<0）", "低温下自发"],
            answerIndex: 2,
            explanation: "ΔG < 0 反应自发。ΔH>0、ΔS>0 时，ΔG = ΔH − TΔS，只有当温度 T 足够高、TΔS 超过 ΔH 时 ΔG 才<0。所以这类反应「高温自发」（如 CaCO₃ 高温分解）。一条公式取代了高中所有定性口诀——这就是热力学的降维。",
            nodeId: "cap"),
        ChemProblem(
            id: "p_cap_04", stage: .olympiad, topic: .structure,
            content: "金属铜为面心立方最密堆积。其晶胞中每个铜原子周围最近邻的铜原子数（配位数）为？",
            options: ["6", "8", "12", "4"],
            answerIndex: 2,
            explanation: "面心立方（A1）和六方最密堆积（A3）的配位数都是 12——这是球的最密堆积所能达到的最大配位数，空间利用率 74%。高中只背「金属晶体」，竞赛能算出它堆得多紧、利用率多高。",
            nodeId: "cap"),
        ChemProblem(
            id: "p_cap_05", stage: .olympiad, topic: .structure,
            content: "高中杂化只学到 sp³。SF₆ 分子中硫原子有 6 个 σ 键、无孤对，其杂化方式与空间构型为？",
            options: ["sp³，四面体", "sp³d，三角双锥", "sp³d²，正八面体", "sp²，平面三角"],
            answerIndex: 2,
            explanation: "价层电子对数 = σ键数 + 孤对数 = 6 → sp³d² 杂化，正八面体构型。同理 PCl₅ 是 sp³d（三角双锥）。杂化理论从 sp 一路延伸到 sp³d²，把各种「怪构型」都算得明明白白。",
            nodeId: "cap"),
        ChemProblem(
            id: "p_cap_06", stage: .olympiad, topic: .structure,
            content: "配合物 [Cu(NH₃)₄]²⁺ 中，中心离子 Cu²⁺ 的配位数及该配离子的空间构型分别是？",
            options: ["4，正四面体", "4，平面正方形", "6，正八面体", "2，直线形"],
            answerIndex: 1,
            explanation: "Cu²⁺（d⁹）与 4 个 NH₃ 以配位键结合，配位数为 4，采取 dsp² 杂化，空间构型为平面正方形（不是四面体）。配合物的中心离子、配体、配位数、构型，是结构化学和无机化学的交汇点。",
            nodeId: "cap"),
        ChemProblem(
            id: "p_cap_07", stage: .olympiad, topic: .structure,
            content: "对基元反应 2NO + O₂ → 2NO₂，其速率方程可直接由方程式系数写出为 v = k·c²(NO)·c(O₂)。若 NO 浓度增大到原来的 2 倍（其他不变），反应速率变为原来的？",
            options: ["2 倍", "4 倍", "6 倍", "8 倍"],
            answerIndex: 1,
            explanation: "基元反应的速率方程中，各物质浓度的幂等于其化学计量数。v = k·c²(NO)·c(O₂)，c(NO) 变 2 倍 → 速率变 2² = 4 倍。高中只定性说「增大浓度加快速率」，化学动力学能精确算出快几倍——这是速率的降维视角。",
            nodeId: "cap"),
    ]
}
