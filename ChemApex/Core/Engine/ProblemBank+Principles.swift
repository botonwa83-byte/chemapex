import Foundation

// MARK: - 题库分批：选必1 化学反应原理（高考压轴大题区，按权重配题）
// P1 反应热 / P2 速率 / P3 平衡 / P4 电离pH / P5 水解 / P6 沉淀溶解 / P7 原电池 / P8 电解腐蚀
// 红线：数据可验算，概念表述符合教材，不臆造真题出处。

extension ProblemBank {
    static let principlesBatch: [ChemProblem] = p1Heat + p2Rate + p3Equilibrium
        + p4Ionization + p5Hydrolysis + p6Precipitation + p7Galvanic + p8Electrolysis

    // MARK: P1 反应热与盖斯定律 ★★★

    private static let p1Heat: [ChemProblem] = [
        ChemProblem(
            id: "p_p1_01", stage: .senior, topic: .energy,
            content: "对于反应 CH₄(g) + 2O₂(g) → CO₂(g) + 2H₂O(l)　ΔH = −890 kJ/mol，下列说法正确的是？",
            options: ["该反应吸收热量", "该反应放出 890 kJ 热量（每 1 mol CH₄）", "ΔH 的单位错误", "该反应需要持续加热才能维持"],
            answerIndex: 1,
            explanation: "ΔH < 0 表示放热，数值即每 1 mol CH₄ 完全燃烧放出 890 kJ。ΔH 的「−」号是放热的标志，不能漏写；点燃只是引发，反应一旦开始自身放热维持。",
            nodeId: "p1"),
        ChemProblem(
            id: "p_p1_02", stage: .senior, topic: .energy,
            content: "化学反应的本质是旧键断裂、新键形成。下列关于反应热的说法正确的是？",
            options: ["断键放出能量，成键吸收能量", "ΔH = 反应物总键能 − 生成物总键能", "ΔH = 生成物总能量 − 反应物总能量", "放热反应中反应物总能量低于生成物"],
            answerIndex: 2,
            explanation: "从能量角度 ΔH =（生成物总能量）−（反应物总能量），放热时生成物能量更低、ΔH<0。从键能角度则 ΔH =（反应物总键能）−（生成物总键能）——B 把两者写反了。断键吸热、成键放热。",
            nodeId: "p1"),
        ChemProblem(
            id: "p_p1_03", stage: .senior, topic: .energy,
            content: "已知：H₂(g)+½O₂(g)→H₂O(g)　ΔH₁ = −242 kJ/mol；H₂O(g)→H₂O(l)　ΔH₂ = −44 kJ/mol。则 H₂(g)+½O₂(g)→H₂O(l) 的 ΔH 为？",
            options: ["−198 kJ/mol", "−286 kJ/mol", "−242 kJ/mol", "+286 kJ/mol"],
            answerIndex: 1,
            explanation: "盖斯定律：反应热只与始末状态有关。目标反应 = 反应1 + 反应2，故 ΔH = ΔH₁ + ΔH₂ = −242 +(−44) = −286 kJ/mol。这正是氢气的燃烧热（生成液态水）。",
            nodeId: "p1"),
        ChemProblem(
            id: "p_p1_04", stage: .senior, topic: .energy,
            content: "下列关于燃烧热的说法正确的是？",
            options: ["1 mol 物质燃烧放出的热量", "1 mol 可燃物完全燃烧生成稳定氧化物时放出的热量", "燃烧热的 ΔH 为正值", "氢气燃烧热对应生成气态水"],
            answerIndex: 1,
            explanation: "燃烧热定义：25℃、101 kPa 下，1 mol 可燃物完全燃烧生成稳定氧化物所放热量。要点：可燃物 1 mol、完全燃烧、稳定氧化物（C→CO₂、H→液态 H₂O、S→SO₂）。ΔH 为负（放热）。",
            nodeId: "p1"),
        ChemProblem(
            id: "p_p1_05", stage: .senior, topic: .energy,
            content: "强酸与强碱的稀溶液发生中和反应的中和热为 57.3 kJ/mol。下列热化学方程式正确的是？",
            options: ["HCl(aq)+NaOH(aq)→NaCl(aq)+H₂O(l)　ΔH=−57.3 kJ/mol", "½H₂SO₄(aq)+NaOH(aq)→½Na₂SO₄(aq)+H₂O(l)　ΔH=+57.3 kJ/mol", "浓硫酸与 NaOH 反应也放 57.3 kJ", "中和热与酸碱的强弱无关"],
            answerIndex: 0,
            explanation: "中和热指生成 1 mol 液态水所放热量，强酸强碱稀溶液为 57.3 kJ/mol，ΔH=−57.3 kJ/mol。浓硫酸稀释额外放热故偏大；弱酸弱碱电离吸热故偏小——中和热与强弱有关。",
            nodeId: "p1"),
        ChemProblem(
            id: "p_p1_06", stage: .senior, topic: .energy,
            content: "已知 ①C(s)+O₂(g)→CO₂(g)　ΔH₁；②C(s)+½O₂(g)→CO(g)　ΔH₂。下列关于 ΔH₁、ΔH₂ 的比较正确的是？",
            options: ["ΔH₁ > ΔH₂", "ΔH₁ < ΔH₂", "ΔH₁ = ΔH₂", "无法比较"],
            answerIndex: 1,
            explanation: "两者都放热（ΔH 为负）。完全燃烧生成 CO₂ 放热更多，|ΔH₁| > |ΔH₂|；但带上负号比较数值，放热越多 ΔH 越小，故 ΔH₁ < ΔH₂。带符号比较是高频陷阱。",
            nodeId: "p1"),
        ChemProblem(
            id: "p_p1_07", stage: .senior, topic: .energy,
            content: "对于一个放热反应，下列能量关系图描述正确的是？（E₁ 为正反应活化能，E₂ 为逆反应活化能）",
            options: ["反应物总能量低于生成物", "E₁ > E₂", "ΔH = E₁ − E₂", "催化剂能改变 ΔH"],
            answerIndex: 2,
            explanation: "ΔH = 正反应活化能 E₁ − 逆反应活化能 E₂。放热反应反应物能量高于生成物，E₁ < E₂，故 ΔH < 0。催化剂同等降低 E₁、E₂，加快速率但不改变 ΔH。",
            nodeId: "p1"),
        ChemProblem(
            id: "p_p1_08", stage: .senior, topic: .energy,
            content: "已知 2H₂(g)+O₂(g)→2H₂O(l)　ΔH=−572 kJ/mol。下列说法正确的是？",
            options: ["H₂(g)+½O₂(g)→H₂O(l)　ΔH=−572 kJ/mol", "2H₂O(l)→2H₂(g)+O₂(g)　ΔH=−572 kJ/mol", "H₂(g)+½O₂(g)→H₂O(l)　ΔH=−286 kJ/mol", "2H₂(g)+O₂(g)→2H₂O(g)　ΔH=−572 kJ/mol"],
            answerIndex: 2,
            explanation: "系数减半，ΔH 也减半为 −286 kJ/mol。逆反应 ΔH 变号（应为 +572）。生成气态水放热比液态水少（B、D 均错）。「系数变 ΔH 跟着变、逆向变号、聚集态影响数值」三条铁律。",
            nodeId: "p1"),
    ]

    // MARK: P2 化学反应速率 ★★★

    private static let p2Rate: [ChemProblem] = [
        ChemProblem(
            id: "p_p2_01", stage: .senior, topic: .equilibrium,
            content: "在 2 L 密闭容器中，某反应 4 s 内 N₂ 减少了 0.8 mol，则用 N₂ 表示的平均反应速率为？",
            options: ["0.1 mol/(L·s)", "0.2 mol/(L·s)", "0.4 mol/(L·s)", "0.8 mol/(L·s)"],
            answerIndex: 0,
            explanation: "v = Δc/Δt = (0.8 mol ÷ 2 L) ÷ 4 s = 0.4/4 = 0.1 mol/(L·s)。注意先把物质的量除以体积换成浓度，再除以时间。",
            nodeId: "p2"),
        ChemProblem(
            id: "p_p2_02", stage: .senior, topic: .equilibrium,
            content: "反应 N₂+3H₂⇌2NH₃ 中，若 v(H₂)=0.6 mol/(L·s)，则同一时间段内 v(NH₃) 为？",
            options: ["0.2 mol/(L·s)", "0.4 mol/(L·s)", "0.6 mol/(L·s)", "0.9 mol/(L·s)"],
            answerIndex: 1,
            explanation: "同一反应中各物质的速率之比等于化学计量数之比。v(H₂):v(NH₃)=3:2，故 v(NH₃)=0.6×2/3=0.4 mol/(L·s)。比较不同物质表示的速率快慢也要先换算成同一物质。",
            nodeId: "p2"),
        ChemProblem(
            id: "p_p2_03", stage: .senior, topic: .equilibrium,
            content: "其他条件不变时，下列措施一定能加快反应速率的是？",
            options: ["增大某气体反应物的浓度", "恒容时充入不参与反应的惰性气体", "增大固体反应物的质量", "减小压强"],
            answerIndex: 0,
            explanation: "增大反应物浓度一定加快速率。恒容充惰性气体：总压增大但各反应物浓度不变，速率不变；纯固体增加质量不改变浓度（只有增大表面积才影响）；减小压强使气体浓度减小、速率减慢。",
            nodeId: "p2"),
        ChemProblem(
            id: "p_p2_04", stage: .senior, topic: .equilibrium,
            content: "下列关于催化剂的说法正确的是？",
            options: ["催化剂能提高反应物的转化率", "催化剂通过降低反应的活化能加快速率", "催化剂改变反应的 ΔH", "催化剂使平衡正向移动"],
            answerIndex: 1,
            explanation: "催化剂降低活化能、使更多分子成为活化分子，从而加快速率。但它同等加快正逆反应，不改变平衡、不改变转化率、不改变 ΔH。「催化剂只改变到达平衡的快慢，不改变平衡本身」。",
            nodeId: "p2"),
        ChemProblem(
            id: "p_p2_05", stage: .senior, topic: .equilibrium,
            content: "用锌与稀硫酸制氢气，下列措施既能加快反应速率、又不影响生成 H₂ 总量的是？",
            options: ["改用浓硫酸", "加入少量 CuSO₄ 溶液", "适当升高温度", "加入少量 NaOH 固体"],
            answerIndex: 2,
            explanation: "升温加快速率且不改变 H₂ 总量。浓硫酸与锌反应生成 SO₂ 不放 H₂；加 CuSO₄ 形成原电池虽加快但消耗部分锌使 H₂ 减少；加 NaOH 会中和硫酸使 H₂ 减少。",
            nodeId: "p2"),
        ChemProblem(
            id: "p_p2_06", stage: .senior, topic: .equilibrium,
            content: "探究浓度对反应速率的影响，应采用的实验方法是？",
            options: ["同时改变浓度和温度", "只改变浓度，其他条件相同（控制变量）", "改变催化剂种类", "改变容器体积"],
            answerIndex: 1,
            explanation: "控制变量法：只改变要探究的因素（浓度），保持温度、催化剂等其他条件相同，才能把速率差异归因于浓度。同时改变多个变量则无法判断是哪个因素的作用。",
            nodeId: "p2"),
        ChemProblem(
            id: "p_p2_07", stage: .senior, topic: .equilibrium,
            content: "恒温下，对于有气体参加的反应，下列操作能加快反应速率的是？",
            options: ["恒容容器中充入 He 使压强增大", "恒压容器中充入 He（体积增大）", "缩小容器体积（增大压强）", "增大容器体积"],
            answerIndex: 2,
            explanation: "缩小体积→气体浓度增大→速率加快。恒容充 He：各组分浓度不变，速率不变；恒压充 He：容器变大、反应气体浓度减小，速率反而减慢。判断关键始终是「反应气体的浓度是否改变」。",
            nodeId: "p2"),
        ChemProblem(
            id: "p_p2_08", stage: .senior, topic: .equilibrium,
            content: "根据有效碰撞理论，下列说法正确的是？",
            options: ["反应物分子间的每次碰撞都能发生反应", "活化分子的碰撞一定是有效碰撞", "升高温度增大了活化分子的百分数", "增大浓度提高了活化分子的百分数"],
            answerIndex: 2,
            explanation: "只有活化分子且取向合适的碰撞才有效。升温使更多分子获得能量成为活化分子，活化分子百分数增大、速率加快；增大浓度只增加单位体积分子总数（活化分子数增多）但百分数不变。",
            nodeId: "p2"),
    ]

    // MARK: P3 化学平衡 ★★★

    private static let p3Equilibrium: [ChemProblem] = [
        ChemProblem(
            id: "p_p3_01", stage: .senior, topic: .equilibrium,
            content: "恒温恒容下，反应 2SO₂(g)+O₂(g)⇌2SO₃(g) 达到平衡的标志是？",
            options: ["SO₂ 与 SO₃ 的浓度相等", "正反应速率等于逆反应速率", "SO₂、O₂、SO₃ 的浓度之比为 2:1:2", "混合气体的总质量不再改变"],
            answerIndex: 1,
            explanation: "平衡本质标志是正逆速率相等。浓度相等或某比例只是某一时刻的偶然值；总质量始终守恒（恒容封闭体系），不是变量。应找「随反应进行会变、变到不变」的量，如此反应中的总压、平均摩尔质量。",
            nodeId: "p3"),
        ChemProblem(
            id: "p_p3_02", stage: .senior, topic: .equilibrium,
            content: "反应 C(s)+H₂O(g)⇌CO(g)+H₂(g)（正反应吸热）达平衡后，下列措施能使平衡正向移动的是？",
            options: ["增大压强", "降低温度", "增大水蒸气浓度", "增加碳的质量"],
            answerIndex: 2,
            explanation: "增大反应物 H₂O(g) 浓度，平衡正向移动。增大压强（气体分子数：正向 1→2 增大）平衡逆向移动；正反应吸热，降温逆向；碳是固体，增加其量不影响平衡。",
            nodeId: "p3"),
        ChemProblem(
            id: "p_p3_03", stage: .senior, topic: .equilibrium,
            content: "对于放热反应 2NO₂(g)⇌N₂O₄(g)，升高温度后？",
            options: ["平衡正向移动，颜色变浅", "平衡逆向移动，颜色变深", "平衡不移动", "NO₂ 浓度减小"],
            answerIndex: 1,
            explanation: "正反应放热，升温使平衡向吸热的逆方向移动，NO₂（红棕色）增多，混合气体颜色变深。「升温向吸热方向移动」是勒夏特列原理对温度的应用。",
            nodeId: "p3"),
        ChemProblem(
            id: "p_p3_04", stage: .senior, topic: .equilibrium,
            content: "反应 N₂(g)+3H₂(g)⇌2NH₃(g) 达平衡后，缩小容器体积（增大压强），平衡？",
            options: ["正向移动（向气体分子数减小方向）", "逆向移动", "不移动", "无法判断"],
            answerIndex: 0,
            explanation: "增大压强，平衡向气体分子总数减小的方向移动。正向 4 mol 气体 → 2 mol 气体，故正向移动。若正逆两侧气体分子数相等（如 H₂+I₂⇌2HI），改变压强则平衡不移动。",
            nodeId: "p3"),
        ChemProblem(
            id: "p_p3_05", stage: .senior, topic: .equilibrium,
            content: "对于反应 CO(g)+H₂O(g)⇌CO₂(g)+H₂(g)，其平衡常数表达式 K 为？",
            options: ["c(CO₂)·c(H₂) / [c(CO)·c(H₂O)]", "c(CO)·c(H₂O) / [c(CO₂)·c(H₂)]", "c(CO₂)·c(H₂)", "c(CO₂)+c(H₂)"],
            answerIndex: 0,
            explanation: "平衡常数 K = 生成物浓度幂之积 / 反应物浓度幂之积（幂为化学计量数）。本反应各系数为 1，K = c(CO₂)·c(H₂)/[c(CO)·c(H₂O)]。纯固体、纯液体不写入表达式。",
            nodeId: "p3"),
        ChemProblem(
            id: "p_p3_06", stage: .senior, topic: .equilibrium,
            content: "关于化学平衡常数 K，下列说法正确的是？",
            options: ["K 越大，反应速率越快", "K 只受温度影响，与浓度、压强无关", "增大反应物浓度，K 增大", "使用催化剂，K 增大"],
            answerIndex: 1,
            explanation: "K 只是温度的函数，改变浓度、压强、加催化剂都不改变 K（只改变各物质浓度或速率）。K 越大表示反应进行得越完全（转化率高），与快慢无关。",
            nodeId: "p3"),
        ChemProblem(
            id: "p_p3_07", stage: .senior, topic: .equilibrium,
            content: "某温度下，向 1 L 容器中充入 2 mol A 和 2 mol B，发生 A(g)+B(g)⇌2C(g)，平衡时生成 1 mol C，则 A 的转化率为？",
            options: ["25%", "50%", "75%", "100%"],
            answerIndex: 0,
            explanation: "生成 1 mol C，由系数比知消耗 A 为 0.5 mol。转化率 = 转化量/起始量 = 0.5/2 = 25%。转化率反映反应进行的程度。",
            nodeId: "p3"),
        ChemProblem(
            id: "p_p3_08", stage: .senior, topic: .equilibrium,
            content: "恒温恒容下，向已达平衡的 2SO₂+O₂⇌2SO₃ 体系中再充入一定量 SO₂，下列说法正确的是？",
            options: ["平衡正向移动，SO₂ 的转化率增大", "平衡正向移动，SO₂ 的转化率减小", "平衡逆向移动", "平衡不移动"],
            answerIndex: 1,
            explanation: "增大 SO₂ 浓度，平衡正向移动、O₂ 转化率增大，但 SO₂ 自身的转化率反而减小（增大的量转化比例下降）。「增大某反应物浓度，提高的是另一反应物的转化率，自身转化率降低」是易错点。",
            nodeId: "p3"),
        ChemProblem(
            id: "p_p3_09", stage: .senior, topic: .equilibrium,
            content: "判断反应 mA(g)⇌nB(g) 中 m 与 n 的关系：达平衡后增大压强，A 的转化率不变。则？",
            options: ["m > n", "m < n", "m = n", "无法判断"],
            answerIndex: 2,
            explanation: "增大压强转化率不变，说明平衡不移动，即两侧气体分子数相等 m = n。若 m≠n，增大压强平衡会向分子数小的一方移动、转化率改变。「改变压强平衡不动 ⇔ 两侧气体系数相等」。",
            nodeId: "p3"),
        ChemProblem(
            id: "p_p3_10", stage: .senior, topic: .equilibrium,
            content: "某温度下反应 X(g)+Y(g)⇌2Z(g) 的 K=4。某时刻测得 c(X)=c(Y)=c(Z)=1 mol/L，此时反应？",
            options: ["处于平衡状态", "向正反应方向进行", "向逆反应方向进行", "无法判断方向"],
            answerIndex: 1,
            explanation: "计算浓度商 Q = c²(Z)/[c(X)·c(Y)] = 1/(1×1) = 1 < K=4。Q < K，反应正向进行直至 Q=K。「Q<K 正向、Q>K 逆向、Q=K 平衡」是判断方向的通法。",
            nodeId: "p3"),
        ChemProblem(
            id: "p_p3_11", stage: .senior, topic: .equilibrium,
            content: "工业合成氨 N₂+3H₂⇌2NH₃（放热）选择「高温」的主要原因是？",
            options: ["高温使平衡正向移动、提高产率", "高温加快反应速率，并使催化剂活性最高", "高温降低能耗", "高温提高 N₂ 转化率"],
            answerIndex: 1,
            explanation: "放热反应升温本会使平衡逆移、降低产率，但适当高温能加快速率、且使催化剂活性最佳，是速率与平衡的折中。工业条件常是「牺牲一点平衡换取速率和催化效率」的综合优化。",
            nodeId: "p3"),
    ]

    // MARK: P4 电离平衡与 pH ★★★

    private static let p4Ionization: [ChemProblem] = [
        ChemProblem(
            id: "p_p4_01", stage: .senior, topic: .solution,
            content: "下列物质属于弱电解质的是？",
            options: ["NaCl", "HCl", "CH₃COOH", "NaOH"],
            answerIndex: 2,
            explanation: "弱电解质在水中只部分电离，存在电离平衡。醋酸是弱酸（CH₃COOH⇌CH₃COO⁻+H⁺）；NaCl、HCl、NaOH 都完全电离，是强电解质。判断强弱看「是否完全电离」，与溶解性、导电性强弱无关。",
            nodeId: "p4"),
        ChemProblem(
            id: "p_p4_02", stage: .senior, topic: .solution,
            content: "关于水的离子积 Kw，下列说法正确的是？",
            options: ["Kw 只与温度有关，升温 Kw 增大", "常温下任何水溶液中 c(H⁺)=c(OH⁻)", "向水中加酸，Kw 减小", "Kw 的数值在任何条件下都是 10⁻¹⁴"],
            answerIndex: 0,
            explanation: "水的电离吸热，升温促进电离、Kw 增大（100℃约 10⁻¹²）。Kw 只与温度有关，加酸加碱不改变 Kw（只改变 c(H⁺)、c(OH⁻) 的相对大小）。10⁻¹⁴ 是常温（25℃）的值。",
            nodeId: "p4"),
        ChemProblem(
            id: "p_p4_03", stage: .senior, topic: .solution,
            content: "常温下，将 pH=2 的盐酸与 pH=12 的 NaOH 溶液等体积混合，混合后溶液的 pH 约为？",
            options: ["2", "7", "12", "10"],
            answerIndex: 1,
            explanation: "pH=2 盐酸 c(H⁺)=10⁻² mol/L，pH=12 的 NaOH c(OH⁻)=10⁻² mol/L，两者浓度相等、等体积，恰好完全中和，混合后呈中性 pH=7。「强酸强碱等浓等体积恰好中和」。",
            nodeId: "p4"),
        ChemProblem(
            id: "p_p4_04", stage: .senior, topic: .solution,
            content: "常温下，分别将 pH=3 的盐酸和醋酸加水稀释 100 倍，稀释后？",
            options: ["两者 pH 都等于 5", "盐酸 pH=5，醋酸 pH<5", "盐酸 pH=5，醋酸 pH>5（在 3~5 之间）", "醋酸 pH 比盐酸更大"],
            answerIndex: 2,
            explanation: "盐酸是强酸，稀释 100 倍 pH 增大 2 个单位变为 5。醋酸是弱酸，稀释促进电离补充 H⁺，pH 变化小于 2，稀释后 pH 在 3~5 之间（小于 5）。「同 pH 稀释，弱酸 pH 变化更小」。",
            nodeId: "p4"),
        ChemProblem(
            id: "p_p4_05", stage: .senior, topic: .solution,
            content: "用已知浓度的 NaOH 标准液滴定未知浓度的盐酸，最适宜的指示剂及终点现象是？",
            options: ["石蕊，变蓝", "酚酞，溶液由无色变浅红色且半分钟不褪色", "甲基橙，变红", "不需要指示剂"],
            answerIndex: 1,
            explanation: "强酸强碱滴定常用酚酞（变色范围 8~10）或甲基橙；用 NaOH 滴定盐酸，终点时溶液由无色变浅红色、半分钟不褪即为终点。石蕊变色范围宽、终点不敏锐，一般不用作滴定指示剂。",
            nodeId: "p4"),
        ChemProblem(
            id: "p_p4_06", stage: .senior, topic: .solution,
            content: "用 NaOH 标准液滴定盐酸时，下列操作会使所测盐酸浓度偏高的是？",
            options: ["滴定前碱式滴定管尖嘴有气泡，滴定后消失", "锥形瓶用蒸馏水洗后未干燥", "滴定终点俯视读数", "盛盐酸的锥形瓶用盐酸润洗过"],
            answerIndex: 0,
            explanation: "尖嘴气泡在滴定后消失，使读取的 NaOH 体积偏大，算得盐酸浓度偏高。锥形瓶残留蒸馏水不影响盐酸的物质的量（不影响结果）；锥形瓶用盐酸润洗会使盐酸偏多，也偏高——但 D 描述的是结果偏高的另一来源，本题最直接的是气泡。",
            nodeId: "p4"),
        ChemProblem(
            id: "p_p4_07", stage: .senior, topic: .solution,
            content: "对醋酸的电离平衡 CH₃COOH⇌CH₃COO⁻+H⁺，下列操作能促进电离的是？",
            options: ["加入少量冰醋酸", "加水稀释", "加入少量 NaOH 固体", "加入醋酸钠固体"],
            answerIndex: 1,
            explanation: "加水稀释促进电离（虽然 c(H⁺) 减小，但电离程度增大）；加 NaOH 消耗 H⁺ 也促进电离——B、C 都促进。但加 NaOH 引入了新反应；最典型的「促进电离」是稀释。加冰醋酸、加醋酸钠（同离子效应）都抑制电离。",
            nodeId: "p4"),
        ChemProblem(
            id: "p_p4_08", stage: .senior, topic: .solution,
            content: "相同温度、相同浓度的盐酸和醋酸，下列比较正确的是？",
            options: ["导电能力：盐酸 > 醋酸", "c(H⁺)：醋酸 > 盐酸", "与足量锌反应最终产生 H₂：盐酸 > 醋酸", "pH：盐酸 > 醋酸"],
            answerIndex: 0,
            explanation: "同浓度时盐酸完全电离、离子浓度大，导电能力强、c(H⁺) 大、pH 小。与足量锌反应，等浓等体积时两者提供的 H⁺ 总量相同（醋酸边反应边电离），产 H₂ 一样多。",
            nodeId: "p4"),
    ]

    // MARK: P5 盐类水解 ★★★

    private static let p5Hydrolysis: [ChemProblem] = [
        ChemProblem(
            id: "p_p5_01", stage: .senior, topic: .solution,
            content: "常温下，下列盐溶液显碱性的是？",
            options: ["NH₄Cl", "Na₂CO₃", "NaCl", "(NH₄)₂SO₄"],
            answerIndex: 1,
            explanation: "口诀「有弱才水解，谁强显谁性」：Na₂CO₃ 是强碱弱酸盐，CO₃²⁻ 水解显碱性。NH₄Cl、(NH₄)₂SO₄ 是强酸弱碱盐显酸性；NaCl 是强酸强碱盐不水解、显中性。",
            nodeId: "p5"),
        ChemProblem(
            id: "p_p5_02", stage: .senior, topic: .solution,
            content: "NH₄Cl 溶液显酸性，其水解离子方程式正确的是？",
            options: ["NH₄⁺ + H₂O ⇌ NH₃·H₂O + H⁺", "NH₄⁺ + H₂O → NH₃↑ + H₃O⁺", "NH₄⁺ + OH⁻ → NH₃·H₂O", "NH₄⁺ + 2H₂O ⇌ NH₃·H₂O + H₃O⁺"],
            answerIndex: 0,
            explanation: "弱碱阳离子 NH₄⁺ 结合水电离出的 OH⁻，生成弱碱 NH₃·H₂O 并释放 H⁺，显酸性。水解微弱可逆用「⇌」，且一般不标↑↓：NH₄⁺+H₂O⇌NH₃·H₂O+H⁺。",
            nodeId: "p5"),
        ChemProblem(
            id: "p_p5_03", stage: .senior, topic: .solution,
            content: "下列应用与盐类水解无关的是？",
            options: ["明矾净水", "用热的纯碱溶液去油污", "配制 FeCl₃ 溶液时加少量盐酸", "用 NaCl 给食物调味"],
            answerIndex: 3,
            explanation: "明矾中 Al³⁺ 水解生成 Al(OH)₃ 胶体吸附杂质；纯碱 CO₃²⁻ 水解显碱性、加热促进、利于去油污；FeCl₃ 水解，加盐酸抑制水解防止变浑浊。NaCl 不水解，调味与水解无关。",
            nodeId: "p5"),
        ChemProblem(
            id: "p_p5_04", stage: .senior, topic: .solution,
            content: "把 AlCl₃ 溶液与 NaHCO₃ 溶液混合（泡沫灭火器原理），现象及原因是？",
            options: ["无明显现象", "产生大量气泡和白色沉淀，因 Al³⁺ 与 HCO₃⁻ 相互促进水解", "只生成白色沉淀", "只产生气泡"],
            answerIndex: 1,
            explanation: "Al³⁺ 与 HCO₃⁻ 双水解相互促进、进行到底：Al³⁺+3HCO₃⁻→Al(OH)₃↓+3CO₂↑，既有白色沉淀又有气泡。这是泡沫灭火器的原理，双水解离子方程式用「→」并标↑↓。",
            nodeId: "p5"),
        ChemProblem(
            id: "p_p5_05", stage: .senior, topic: .solution,
            content: "常温下 0.1 mol/L CH₃COONa 溶液中，离子浓度由大到小的顺序正确的是？",
            options: ["c(Na⁺)>c(CH₃COO⁻)>c(OH⁻)>c(H⁺)", "c(CH₃COO⁻)>c(Na⁺)>c(H⁺)>c(OH⁻)", "c(Na⁺)>c(CH₃COO⁻)>c(H⁺)>c(OH⁻)", "c(Na⁺)>c(OH⁻)>c(CH₃COO⁻)>c(H⁺)"],
            answerIndex: 0,
            explanation: "CH₃COO⁻ 部分水解，故 c(Na⁺)>c(CH₃COO⁻)；水解显碱性故 c(OH⁻)>c(H⁺)。综合：c(Na⁺)>c(CH₃COO⁻)>c(OH⁻)>c(H⁺)。「不水解的阳离子最大，谁性谁的离子次大」。",
            nodeId: "p5"),
        ChemProblem(
            id: "p_p5_06", stage: .senior, topic: .solution,
            content: "0.1 mol/L Na₂CO₃ 溶液中，下列关系式正确的是（物料守恒）？",
            options: ["c(Na⁺) = 2[c(CO₃²⁻)+c(HCO₃⁻)+c(H₂CO₃)]", "c(Na⁺) = c(CO₃²⁻)", "c(Na⁺) = 2c(CO₃²⁻)", "c(OH⁻) = c(H⁺)"],
            answerIndex: 0,
            explanation: "物料守恒：碳元素以 CO₃²⁻、HCO₃⁻、H₂CO₃ 三种形式存在，钠碳原子比 2:1 不变，故 c(Na⁺)=2[c(CO₃²⁻)+c(HCO₃⁻)+c(H₂CO₃)]。这是离子浓度比较题的三大守恒之一。",
            nodeId: "p5"),
        ChemProblem(
            id: "p_p5_07", stage: .senior, topic: .solution,
            content: "关于盐类水解，下列说法正确的是？",
            options: ["升高温度抑制水解", "加水稀释抑制水解", "盐类水解一般是吸热的，升温促进水解", "水解程度都很大"],
            answerIndex: 2,
            explanation: "水解是中和反应的逆过程，中和放热故水解吸热，升温促进水解。加水稀释也促进水解。盐类水解一般程度很微弱（双水解相互促进的除外）。",
            nodeId: "p5"),
        ChemProblem(
            id: "p_p5_08", stage: .senior, topic: .solution,
            content: "已知酸性 HClO < H₂CO₃ < CH₃COOH，则相同浓度的下列钠盐溶液 pH 由大到小的顺序是？",
            options: ["NaClO > Na₂CO₃ > CH₃COONa", "Na₂CO₃ > NaClO > CH₃COONa", "CH₃COONa > NaClO > Na₂CO₃", "三者相等"],
            answerIndex: 1,
            explanation: "「越弱越水解，对应盐碱性越强」。但 Na₂CO₃ 是二元弱酸盐、水解能力强，碱性最强；同为一元的 NaClO（HClO 更弱）碱性强于 CH₃COONa。综合 pH：Na₂CO₃>NaClO>CH₃COONa。",
            nodeId: "p5"),
        ChemProblem(
            id: "p_p5_09", stage: .senior, topic: .solution,
            content: "NaHCO₃ 溶液显碱性，而 NaHSO₃ 溶液显酸性，原因是？",
            options: ["两者都只水解", "HCO₃⁻ 水解程度大于电离，HSO₃⁻ 电离程度大于水解", "两者都只电离", "NaHSO₃ 不是电解质"],
            answerIndex: 1,
            explanation: "酸式酸根既能电离（显酸性）又能水解（显碱性），看谁占优：HCO₃⁻ 水解 > 电离，溶液显碱性；HSO₃⁻ 电离 > 水解，溶液显酸性。「酸式盐酸碱性取决于电离与水解的相对强弱」。",
            nodeId: "p5"),
    ]

    // MARK: P6 沉淀溶解平衡 ★★

    private static let p6Precipitation: [ChemProblem] = [
        ChemProblem(
            id: "p_p6_01", stage: .senior, topic: .solution,
            content: "难溶电解质 AgCl 在水中存在沉淀溶解平衡 AgCl(s)⇌Ag⁺+Cl⁻，其溶度积 Ksp 表达式为？",
            options: ["Ksp = c(Ag⁺)·c(Cl⁻)", "Ksp = c(Ag⁺)/c(Cl⁻)", "Ksp = c(AgCl)", "Ksp = c(Ag⁺)+c(Cl⁻)"],
            answerIndex: 0,
            explanation: "溶度积 Ksp 等于饱和溶液中各离子浓度幂之积，固体不计入：Ksp(AgCl)=c(Ag⁺)·c(Cl⁻)。Ksp 只与温度有关，反映难溶物的溶解能力。",
            nodeId: "p6"),
        ChemProblem(
            id: "p_p6_02", stage: .senior, topic: .solution,
            content: "已知 Ksp(AgCl)=1.8×10⁻¹⁰。向某溶液中 c(Ag⁺)=10⁻⁴ mol/L、c(Cl⁻)=10⁻⁴ mol/L，则？",
            options: ["Q < Ksp，无沉淀", "Q = Ksp，恰饱和", "Q > Ksp，生成 AgCl 沉淀", "无法判断"],
            answerIndex: 2,
            explanation: "离子积 Q = c(Ag⁺)·c(Cl⁻) = 10⁻⁴×10⁻⁴ = 10⁻⁸ > Ksp(1.8×10⁻¹⁰)，故有 AgCl 沉淀生成。判据：「Q>Ksp 生成沉淀，Q<Ksp 沉淀溶解，Q=Ksp 平衡」。",
            nodeId: "p6"),
        ChemProblem(
            id: "p_p6_03", stage: .senior, topic: .solution,
            content: "向含有 AgCl 沉淀的浊液中滴加 NaI 溶液，白色沉淀逐渐变为黄色，原因是？",
            options: ["Ksp(AgI) < Ksp(AgCl)，沉淀向更难溶方向转化", "Ksp(AgI) > Ksp(AgCl)", "AgCl 溶解度增大", "发生了氧化还原反应"],
            answerIndex: 0,
            explanation: "AgI 比 AgCl 更难溶（Ksp 更小），沉淀向溶解度更小的方向转化：AgCl+I⁻→AgI+Cl⁻。沉淀转化总是朝更难溶的方向进行，这也是 AgCl→AgBr→AgI 颜色逐渐加深的原因。",
            nodeId: "p6"),
        ChemProblem(
            id: "p_p6_04", stage: .senior, topic: .solution,
            content: "已知某温度下 Ksp(BaSO₄)=1×10⁻¹⁰。该温度下 BaSO₄ 饱和溶液中 c(Ba²⁺) 约为？",
            options: ["10⁻⁵ mol/L", "10⁻¹⁰ mol/L", "10⁻⁴ mol/L", "1×10⁻²⁰ mol/L"],
            answerIndex: 0,
            explanation: "BaSO₄ 溶解出等量 Ba²⁺ 和 SO₄²⁻，设浓度为 s，则 Ksp=s²=10⁻¹⁰，s=10⁻⁵ mol/L。对 AB 型难溶物，溶解度 s=√Ksp。",
            nodeId: "p6"),
        ChemProblem(
            id: "p_p6_05", stage: .senior, topic: .solution,
            content: "检验 SO₄²⁻ 时加入过量 BaCl₂，使 SO₄²⁻ 沉淀更完全，依据的原理是？",
            options: ["同离子效应：增大 Ba²⁺ 使沉淀溶解平衡逆向移动", "盐效应", "氧化还原", "酸碱中和"],
            answerIndex: 0,
            explanation: "加入过量 Ba²⁺，使 BaSO₄(s)⇌Ba²⁺+SO₄²⁻ 平衡逆向移动，c(SO₄²⁻) 进一步减小、沉淀更完全——同离子效应。工业上沉淀洗涤、除杂常利用此原理。",
            nodeId: "p6"),
        ChemProblem(
            id: "p_p6_06", stage: .senior, topic: .solution,
            content: "工业上用 MgO 或 Mg(OH)₂ 调节溶液 pH 除去 Fe³⁺（生成 Fe(OH)₃ 沉淀）而不引入新杂质，依据是？",
            options: ["Fe(OH)₃ 比 Mg(OH)₂ 更难溶，且不引入新阳离子杂质", "MgO 是氧化剂", "Fe³⁺ 被还原", "Mg²⁺ 与 Fe³⁺ 反应"],
            answerIndex: 0,
            explanation: "Fe(OH)₃ 的 Ksp 远小于 Mg(OH)₂，调高 pH 时 Fe³⁺ 先沉淀完全；用 MgO/Mg(OH)₂ 消耗 H⁺ 升 pH，引入的 Mg²⁺ 往往是体系本身的成分（如制镁盐），不带入新杂质。这是工业除铁的常用手段。",
            nodeId: "p6"),
        ChemProblem(
            id: "p_p6_07", stage: .senior, topic: .solution,
            content: "锅炉水垢中含 CaSO₄，可先用 Na₂CO₃ 溶液处理使其转化为疏松的 CaCO₃ 再用酸除去，能转化的原因是？",
            options: ["Ksp(CaCO₃) < Ksp(CaSO₄)，向更难溶方向转化", "CaSO₄ 溶于水", "CaCO₃ 溶解度更大", "发生了中和反应"],
            answerIndex: 0,
            explanation: "CaCO₃ 比 CaSO₄ 更难溶（Ksp 更小），用 Na₂CO₃ 把 CaSO₄ 转化为 CaCO₃：CaSO₄+CO₃²⁻→CaCO₃+SO₄²⁻。CaCO₃ 可溶于盐酸而 CaSO₄ 微溶难除，转化后便于清除。",
            nodeId: "p6"),
        ChemProblem(
            id: "p_p6_08", stage: .senior, topic: .solution,
            content: "向 0.1 mol/L MgCl₂ 溶液中滴加 NaOH 溶液，开始出现白色沉淀。下列说法正确的是？",
            options: ["c(Mg²⁺)·c²(OH⁻) 达到 Ksp[Mg(OH)₂] 时开始沉淀", "任意微量 NaOH 都立即沉淀完全", "Mg(OH)₂ 不存在溶解平衡", "增大 c(OH⁻) 不影响 c(Mg²⁺)"],
            answerIndex: 0,
            explanation: "当离子积 Q=c(Mg²⁺)·c²(OH⁻) 达到 Ksp 时开始析出 Mg(OH)₂。继续增大 c(OH⁻)，平衡使 c(Mg²⁺) 减小（沉淀更完全）。Mg(OH)₂ 是 AB₂ 型，Ksp=c(Mg²⁺)·c²(OH⁻)。",
            nodeId: "p6"),
    ]

    // MARK: P7 原电池与化学电源 ★★★

    private static let p7Galvanic: [ChemProblem] = [
        ChemProblem(
            id: "p_p7_01", stage: .senior, topic: .electrochem,
            content: "下列装置能构成原电池的是？",
            options: ["两个相同的铜电极插入稀硫酸并用导线连接", "锌、铜电极插入稀硫酸并用导线连接", "锌、铜电极插入酒精并用导线连接", "锌、铜电极不接触、分别插入稀硫酸"],
            answerIndex: 1,
            explanation: "构成原电池四条件：①两个活泼性不同的电极 ②电解质溶液 ③形成闭合回路 ④能自发进行氧化还原反应。锌铜插入稀硫酸并连接导线全部满足。相同电极无电势差、酒精非电解质、未闭合回路都不行。",
            nodeId: "p7"),
        ChemProblem(
            id: "p_p7_02", stage: .senior, topic: .electrochem,
            content: "在铜锌稀硫酸原电池中，下列判断正确的是？",
            options: ["锌为正极", "铜电极上发生氧化反应", "锌为负极，发生氧化反应", "电流由锌流向铜（外电路）"],
            answerIndex: 2,
            explanation: "活泼金属锌作负极，失电子被氧化（Zn−2e⁻→Zn²⁺）；铜作正极，H⁺ 得电子还原放 H₂。外电路电流方向与电子相反：由正极(铜)流向负极(锌)。口诀「负失氧、正得还」。",
            nodeId: "p7"),
        ChemProblem(
            id: "p_p7_03", stage: .senior, topic: .electrochem,
            content: "氢氧燃料电池（KOH 溶液作电解质）的负极电极反应式正确的是？",
            options: ["H₂ − 2e⁻ → 2H⁺", "2H₂ + 4OH⁻ − 4e⁻ → 4H₂O", "O₂ + 2H₂O + 4e⁻ → 4OH⁻", "2H₂O − 4e⁻ → O₂ + 4H⁺"],
            answerIndex: 1,
            explanation: "燃料（H₂）在负极失电子被氧化。碱性介质中产物不能是 H⁺，应结合 OH⁻ 生成水：2H₂+4OH⁻−4e⁻→4H₂O。电极式书写要根据电解质环境（碱性写 OH⁻、酸性写 H⁺）。",
            nodeId: "p7"),
        ChemProblem(
            id: "p_p7_04", stage: .senior, topic: .electrochem,
            content: "原电池工作时，电解质溶液中阴、阳离子的移动方向是？",
            options: ["阳离子移向正极，阴离子移向负极", "阳离子移向负极，阴离子移向正极", "阴阳离子都移向正极", "离子不移动"],
            answerIndex: 0,
            explanation: "原电池中正极得电子、附近正电荷消耗，阳离子向正极移动补充；阴离子向负极移动。可记「同性相吸」逆推：内电路阳离子奔正极、阴离子奔负极，与外电路电子流向构成闭合回路。",
            nodeId: "p7"),
        ChemProblem(
            id: "p_p7_05", stage: .senior, topic: .electrochem,
            content: "带盐桥的铜锌原电池（Zn|ZnSO₄‖CuSO₄|Cu）中，盐桥的作用是？",
            options: ["提供电子通路", "沟通内电路、平衡两池电荷，使反应持续", "作为电极参与反应", "防止溶液蒸发"],
            answerIndex: 1,
            explanation: "盐桥中的离子定向移动沟通内电路、中和两池因放电产生的电荷失衡（负极池积累 Zn²⁺、正极池消耗 Cu²⁺），从而维持电流持续。电子只走外电路导线，不经过盐桥。",
            nodeId: "p7"),
        ChemProblem(
            id: "p_p7_06", stage: .senior, topic: .electrochem,
            content: "铅蓄电池放电时总反应为 Pb+PbO₂+2H₂SO₄→2PbSO₄+2H₂O，则负极是？",
            options: ["PbO₂，被还原", "Pb，被氧化（Pb−2e⁻+SO₄²⁻→PbSO₄）", "PbSO₄", "H₂SO₄"],
            answerIndex: 1,
            explanation: "放电时 Pb（0 价）失电子升为 +2，是负极被氧化：Pb+SO₄²⁻−2e⁻→PbSO₄；PbO₂ 是正极被还原。两极都生成 PbSO₄，硫酸被消耗、密度下降，可据此判断电量。",
            nodeId: "p7"),
        ChemProblem(
            id: "p_p7_07", stage: .senior, topic: .electrochem,
            content: "实验发现，锌与稀硫酸反应时滴入几滴 CuSO₄ 溶液后产气明显加快，原因是？",
            options: ["CuSO₄ 是催化剂", "置换出的铜与锌、稀硫酸构成原电池，加快反应", "硫酸浓度增大", "温度升高"],
            answerIndex: 1,
            explanation: "Zn 置换出 Cu 附着在锌表面，Zn-Cu-稀硫酸构成原电池，化学能转电能、反应速率加快。这是「形成原电池可加快反应速率」的应用（但会消耗部分锌，使最终 H₂ 略减）。",
            nodeId: "p7"),
        ChemProblem(
            id: "p_p7_08", stage: .senior, topic: .electrochem,
            content: "某原电池总反应为 2Fe³⁺+Fe→3Fe²⁺（设计成原电池），则正极反应为？",
            options: ["Fe − 2e⁻ → Fe²⁺", "Fe³⁺ + e⁻ → Fe²⁺", "2Fe³⁺ + 2e⁻ → 2Fe²⁺，正极得电子", "Fe²⁺ − e⁻ → Fe³⁺"],
            answerIndex: 2,
            explanation: "总反应中 Fe³⁺ 得电子被还原，发生在正极：2Fe³⁺+2e⁻→2Fe²⁺（或写 Fe³⁺+e⁻→Fe²⁺）。负极是 Fe 失电子：Fe−2e⁻→Fe²⁺。把总反应拆成「氧化半反应=负极、还原半反应=正极」。",
            nodeId: "p7"),
        ChemProblem(
            id: "p_p7_09", stage: .senior, topic: .electrochem,
            content: "关于一次电池和二次电池，下列说法正确的是？",
            options: ["一次电池可以反复充电使用", "二次电池放电是化学能转电能、充电是电能转化学能", "锌锰干电池是二次电池", "所有电池都能充电"],
            answerIndex: 1,
            explanation: "二次电池（如铅蓄电池、锂离子电池）可充电反复使用：放电为原电池（化学能→电能），充电为电解池（电能→化学能）。一次电池（锌锰干电池）放电后不能充电复原。",
            nodeId: "p7"),
    ]

    // MARK: P8 电解与金属腐蚀 ★★★

    private static let p8Electrolysis: [ChemProblem] = [
        ChemProblem(
            id: "p_p8_01", stage: .senior, topic: .electrochem,
            content: "电解池中，与外加电源正极相连的电极是？",
            options: ["阴极，发生还原反应", "阳极，发生氧化反应", "负极", "不发生反应"],
            answerIndex: 1,
            explanation: "电解池中接电源正极的是阳极，发生氧化反应（失电子）；接电源负极的是阴极，发生还原反应（得电子）。口诀「阳氧阴还」。注意与原电池的「正负极」称呼区分。",
            nodeId: "p8"),
        ChemProblem(
            id: "p_p8_02", stage: .senior, topic: .electrochem,
            content: "用惰性电极电解 CuSO₄ 溶液，阴极和阳极的产物分别是？",
            options: ["阴极 H₂，阳极 O₂", "阴极 Cu，阳极 O₂", "阴极 Cu，阳极 SO₂", "阴极 Na，阳极 Cl₂"],
            answerIndex: 1,
            explanation: "阴极放电顺序 Ag⁺>Cu²⁺>H⁺，Cu²⁺ 先放电析出铜；阳极（惰性电极）放电顺序 含氧酸根 < OH⁻，故 OH⁻（水）放电生成 O₂。总反应使溶液变稀硫酸。",
            nodeId: "p8"),
        ChemProblem(
            id: "p_p8_03", stage: .senior, topic: .electrochem,
            content: "用惰性电极电解下列溶液，电解一段时间后溶液 pH 增大的是？",
            options: ["CuSO₄ 溶液", "NaCl 溶液", "稀 H₂SO₄", "NaOH 溶液（电解水）"],
            answerIndex: 1,
            explanation: "电解 NaCl 溶液：阴极 H₂、阳极 Cl₂、阴极区生成 NaOH，溶液变碱性 pH 增大（属「放氢生碱」型）。电解 CuSO₄ 生成硫酸 pH 减小；电解稀硫酸/NaOH 是电解水型，溶质浓度增大但类型不同。",
            nodeId: "p8"),
        ChemProblem(
            id: "p_p8_04", stage: .senior, topic: .electrochem,
            content: "用惰性电极电解足量 CuSO₄ 溶液，当阴极析出 6.4 g Cu 时，阳极产生 O₂ 的物质的量为？（Cu 64 g/mol）",
            options: ["0.025 mol", "0.05 mol", "0.1 mol", "0.2 mol"],
            answerIndex: 1,
            explanation: "电子守恒：n(Cu)=6.4/64=0.1 mol，阴极得电子 0.1×2=0.2 mol。阳极 2H₂O−4e⁻→O₂↑+4H⁺，每生成 1 mol O₂ 转移 4 mol 电子，故 n(O₂)=0.2/4=0.05 mol。电解计算的核心是「两极转移电子数相等」。",
            nodeId: "p8"),
        ChemProblem(
            id: "p_p8_05", stage: .senior, topic: .electrochem,
            content: "电解精炼铜时，下列说法正确的是？",
            options: ["纯铜作阳极", "粗铜作阳极、纯铜作阴极，电解质为含 Cu²⁺ 溶液", "电解质是稀硫酸", "比铜活泼的杂质会在阴极析出"],
            answerIndex: 1,
            explanation: "电解精炼：粗铜作阳极溶解，纯铜作阴极析出，电解质为 CuSO₄ 溶液。比铜活泼的杂质（Zn、Fe）溶入溶液但不在阴极析出；比铜不活泼的（Ag、Au）沉为阳极泥。电镀同理（镀层金属作阳极）。",
            nodeId: "p8"),
        ChemProblem(
            id: "p_p8_06", stage: .senior, topic: .electrochem,
            content: "钢铁在潮湿空气中发生电化学腐蚀，主要是吸氧腐蚀。其正极（被腐蚀金属作负极）反应为？",
            options: ["2H⁺ + 2e⁻ → H₂↑", "O₂ + 2H₂O + 4e⁻ → 4OH⁻", "Fe − 2e⁻ → Fe²⁺", "Fe − 3e⁻ → Fe³⁺"],
            answerIndex: 1,
            explanation: "中性或弱酸性潮湿环境主要是吸氧腐蚀：负极 Fe−2e⁻→Fe²⁺，正极 O₂+2H₂O+4e⁻→4OH⁻。只有较强酸性环境才以析氢腐蚀（正极放 H₂）为主。日常铁生锈绝大多数是吸氧腐蚀。",
            nodeId: "p8"),
        ChemProblem(
            id: "p_p8_07", stage: .senior, topic: .electrochem,
            content: "为防止海轮船体（钢铁）被腐蚀，在船体上镶嵌锌块，这种防护方法是？",
            options: ["牺牲阳极的阴极保护法", "外加电流的阴极保护法", "覆盖保护层", "电镀"],
            answerIndex: 0,
            explanation: "锌比铁活泼，与铁构成原电池时锌作负极（阳极）被优先腐蚀，铁作正极（阴极）受保护——牺牲阳极的阴极保护法。另一种是外加电流法（把被保护金属接电源负极）。",
            nodeId: "p8"),
        ChemProblem(
            id: "p_p8_08", stage: .senior, topic: .electrochem,
            content: "用惰性电极电解 NaCl 溶液一段时间后，要使溶液恢复到电解前的状态，应加入的物质是？",
            options: ["适量 NaCl 固体", "适量盐酸（HCl）", "适量 NaOH", "适量水"],
            answerIndex: 1,
            explanation: "电解 NaCl 溶液：阴极 2H₂O+2e⁻→H₂↑+2OH⁻，阳极 2Cl⁻−2e⁻→Cl₂↑，相当于消耗了 HCl（H 和 Cl）和水。要复原，「出什么补什么」——补充逸出的 H₂ 和 Cl₂ 即补 HCl（盐酸）。",
            nodeId: "p8"),
    ]
}
