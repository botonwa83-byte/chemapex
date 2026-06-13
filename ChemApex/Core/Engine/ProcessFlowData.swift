import Foundation

// MARK: - 工艺流程题库（一期 4 流程）
// 红线：每步操作、试剂、产物、顺序理由必须符合教材标准；方程式配平核对。

enum ProcessFlowData {
    static let all: [ProcessFlow] = [crudeSalt, kelpIodine, seawaterBromine, bauxite, ethyleneRoute,
                                     contactSulfuric, solvaySoda]

    // MARK: 粗盐提纯（除杂顺序经典题）

    private static let crudeSalt = ProcessFlow(
        id: "pf_salt", title: "粗盐提纯", stage: .junior, topic: .acidBaseSalt,
        overview: "粗盐水中除 NaCl 外，还含 SO₄²⁻、Mg²⁺、Ca²⁺ 三种杂质离子。设计除杂流程，得到精盐。",
        nodes: [
            ProcessNode(id: "salt_n0", substance: "粗盐水\n（含 SO₄²⁻ / Mg²⁺ / Ca²⁺）"),
            ProcessNode(id: "salt_n1", substance: "溶液①\n（无 SO₄²⁻，多 Ba²⁺）"),
            ProcessNode(id: "salt_n2", substance: "溶液②\n（无 Mg²⁺）"),
            ProcessNode(id: "salt_n3", substance: "溶液③\n（无 Ca²⁺、Ba²⁺）"),
            ProcessNode(id: "salt_n4", substance: "滤液"),
            ProcessNode(id: "salt_n5", substance: "精盐水", highlight: true),
        ],
        steps: [
            ProcessStep(id: "salt_s0", operation: "加过量 BaCl₂ 溶液",
                sideNote: "Ba²⁺ + SO₄²⁻ → BaSO₄↓，除去 SO₄²⁻；过量是为了除尽，但引入了多余 Ba²⁺。",
                quiz: ProcessQuiz(prompt: "除去 SO₄²⁻ 应加入过量的？",
                    options: ["BaCl₂ 溶液", "Ba(NO₃)₂ 溶液", "稀硫酸", "BaSO₄ 固体"],
                    answerIndex: 0,
                    explanation: "用 BaCl₂ 而非 Ba(NO₃)₂——后者会引入新杂质 NO₃⁻。引入的 Cl⁻ 与目标产物 NaCl 同类，不算杂质。")),
            ProcessStep(id: "salt_s1", operation: "加过量 NaOH 溶液",
                sideNote: "Mg²⁺ + 2OH⁻ → Mg(OH)₂↓，除去 Mg²⁺。"),
            ProcessStep(id: "salt_s2", operation: "加过量 Na₂CO₃ 溶液",
                sideNote: "Ca²⁺、过量 Ba²⁺ 都与 CO₃²⁻ 生成沉淀——一步除两害。",
                quiz: ProcessQuiz(prompt: "加 Na₂CO₃ 的顺序必须？",
                    options: ["在加 BaCl₂ 之后", "在加 BaCl₂ 之前", "任意顺序均可", "在加盐酸之后"],
                    answerIndex: 0,
                    explanation: "Na₂CO₃ 要顺带除掉前面过量的 Ba²⁺，所以必须排在 BaCl₂ 之后。这是除杂顺序题的核心考点。")),
            ProcessStep(id: "salt_s3", operation: "过滤",
                sideNote: "除去 BaSO₄、Mg(OH)₂、CaCO₃、BaCO₃ 全部沉淀。"),
            ProcessStep(id: "salt_s4", operation: "加适量盐酸",
                sideNote: "中和除去过量的 NaOH 和 Na₂CO₃（生成 NaCl + H₂O + CO₂↑）。",
                quiz: ProcessQuiz(prompt: "最后加适量盐酸的目的？",
                    options: ["除去过量的 NaOH 和 Na₂CO₃", "把 BaSO₄ 溶解掉", "再次沉淀 Ca²⁺", "增大溶液酸性便于保存"],
                    answerIndex: 0,
                    explanation: "盐酸排在过滤之后、且只能加适量——除去过量的 NaOH 和 Na₂CO₃，引入的 Cl⁻ 与 NaCl 同类。盐酸过量会使精盐水显酸性。")),
        ],
        examPoint: "除杂顺序两条铁律：① 除 Ba²⁺ 的 Na₂CO₃ 必须在 BaCl₂ 之后；② 调 pH 的盐酸必须在过滤之后、且适量。加入的试剂只能过量不能不足，多余的由后续步骤清走。")

    // MARK: 海带提碘

    private static let kelpIodine = ProcessFlow(
        id: "pf_iodine", title: "海带提碘", stage: .senior, topic: .nonmetals,
        overview: "海带中的碘以 I⁻ 形式存在。从海带中提取碘单质。",
        nodes: [
            ProcessNode(id: "i_n0", substance: "干海带"),
            ProcessNode(id: "i_n1", substance: "海带灰"),
            ProcessNode(id: "i_n2", substance: "含 I⁻ 的滤液"),
            ProcessNode(id: "i_n3", substance: "含 I₂ 的溶液"),
            ProcessNode(id: "i_n4", substance: "碘的 CCl₄ 溶液\n（下层紫红）"),
            ProcessNode(id: "i_n5", substance: "碘单质 I₂", highlight: true),
        ],
        steps: [
            ProcessStep(id: "i_s0", operation: "灼烧成灰",
                sideNote: "把有机碘转化为可溶的碘化物；灼烧固体用坩埚。",
                quiz: ProcessQuiz(prompt: "灼烧海带应使用的仪器是？",
                    options: ["坩埚", "蒸发皿", "烧杯", "试管"],
                    answerIndex: 0,
                    explanation: "灼烧固体用坩埚（耐高温）；蒸发皿用于蒸发结晶溶液。仪器张冠李戴是流程题的常见陷阱。")),
            ProcessStep(id: "i_s1", operation: "加水浸泡、过滤",
                sideNote: "可溶的 I⁻ 进入滤液，不溶残渣被滤去。"),
            ProcessStep(id: "i_s2", operation: "加稀硫酸和适量 H₂O₂",
                sideNote: "2I⁻ + H₂O₂ + 2H⁺ → I₂ + 2H₂O，把 I⁻ 氧化为 I₂。",
                quiz: ProcessQuiz(prompt: "氧化 I⁻ 的氧化剂用量为何强调「适量」？",
                    options: ["过量氧化剂会把 I₂ 进一步氧化成 IO₃⁻", "过量会使溶液变酸", "适量是为了省钱", "过量会生成沉淀"],
                    answerIndex: 0,
                    explanation: "氧化剂过量会把生成的 I₂ 继续氧化成 IO₃⁻，反而拿不到碘单质——所以必须适量。若用 Cl₂ 作氧化剂同理。")),
            ProcessStep(id: "i_s3", operation: "加 CCl₄ 萃取、分液",
                sideNote: "碘在 CCl₄ 中溶解度远大于水，且 CCl₄ 与水不互溶；下层紫红色为碘的 CCl₄ 溶液。",
                quiz: ProcessQuiz(prompt: "下列可作萃取剂的是？",
                    options: ["四氯化碳", "酒精", "氢氧化钠溶液", "稀盐酸"],
                    answerIndex: 0,
                    explanation: "萃取剂两条件：与水不互溶、溶质在其中溶解度更大。酒精与水互溶不能用；CCl₄ 满足条件。")),
            ProcessStep(id: "i_s4", operation: "蒸馏",
                sideNote: "利用沸点差分离 CCl₄ 与 I₂，得到碘单质。"),
        ],
        examPoint: "提碘四步：灼烧（坩埚）→ 浸取过滤 → 氧化（适量氧化剂，过量会生成 IO₃⁻）→ 萃取分液 + 蒸馏。仪器选择和氧化剂用量是两大失分点。")

    // MARK: 海水提溴

    private static let seawaterBromine = ProcessFlow(
        id: "pf_bromine", title: "海水提溴", stage: .senior, topic: .nonmetals,
        overview: "海水中溴以 Br⁻ 形式存在，浓度很低。工业上「吹出—吸收—再氧化」富集后提溴。",
        nodes: [
            ProcessNode(id: "br_n0", substance: "浓缩海水\n（含 Br⁻）"),
            ProcessNode(id: "br_n1", substance: "含 Br₂ 的溶液"),
            ProcessNode(id: "br_n2", substance: "含 Br₂ 的热空气"),
            ProcessNode(id: "br_n3", substance: "富集的 HBr 溶液"),
            ProcessNode(id: "br_n4", substance: "Br₂"),
            ProcessNode(id: "br_n5", substance: "液溴", highlight: true),
        ],
        steps: [
            ProcessStep(id: "br_s0", operation: "通入足量 Cl₂",
                sideNote: "Cl₂ + 2Br⁻ → Br₂ + 2Cl⁻，氯的氧化性强于溴，把 Br⁻ 氧化出来。",
                quiz: ProcessQuiz(prompt: "用 Cl₂ 氧化 Br⁻ 的依据是？",
                    options: ["氧化性 Cl₂ > Br₂", "氧化性 Br₂ > Cl₂", "Cl₂ 溶解度更大", "Br⁻ 半径更小"],
                    answerIndex: 0,
                    explanation: "卤素氧化性 Cl₂ > Br₂ > I₂，活泼的氯单质才能把溴从其离子中置换出来。注意 F₂ 例外（会先与水反应）。")),
            ProcessStep(id: "br_s1", operation: "通入热空气吹出",
                sideNote: "Br₂ 易挥发，用热空气把它从溶液中吹出，与大量水分离。"),
            ProcessStep(id: "br_s2", operation: "用 SO₂ 吸收",
                sideNote: "Br₂ + SO₂ + 2H₂O → 2HBr + H₂SO₄，把稀薄的 Br₂ 转成溶液富集（浓缩）。",
                quiz: ProcessQuiz(prompt: "吹出的 Br₂ 用 SO₂ 吸收，目的是？",
                    options: ["将稀薄的溴富集浓缩", "除去溴中的氯气", "防止溴挥发污染", "把溴还原成溴化氢便于储存"],
                    answerIndex: 0,
                    explanation: "吹出的 Br₂ 很稀，SO₂ 吸收生成 HBr 溶液实现富集；之后再用 Cl₂ 氧化 HBr 得到更浓的 Br₂——「吹出—吸收—再氧化」是富集的核心思路。")),
            ProcessStep(id: "br_s3", operation: "再通入 Cl₂ 氧化",
                sideNote: "Cl₂ + 2HBr → Br₂ + 2HCl，把富集后的 Br⁻ 再次氧化为 Br₂。"),
            ProcessStep(id: "br_s4", operation: "蒸馏（或萃取）",
                sideNote: "分离得到液溴。"),
        ],
        examPoint: "海水提溴的灵魂是「富集」：直接提取太稀，先吹出、用 SO₂ 吸收成 HBr 浓缩、再用 Cl₂ 氧化。两次用到 Cl₂ 氧化，依据都是卤素氧化性 Cl₂ > Br₂。")

    // MARK: 铝土矿提取氧化铝

    private static let bauxite = ProcessFlow(
        id: "pf_bauxite", title: "铝土矿提氧化铝", stage: .senior, topic: .metals,
        overview: "铝土矿主要成分 Al₂O₃，含杂质 Fe₂O₃、SiO₂。用碱溶法提取纯净的 Al₂O₃。",
        nodes: [
            ProcessNode(id: "al_n0", substance: "铝土矿\n（Al₂O₃ / Fe₂O₃ / SiO₂）"),
            ProcessNode(id: "al_n1", substance: "滤液\n（NaAlO₂ / Na₂SiO₃）"),
            ProcessNode(id: "al_n2", substance: "Al(OH)₃ 沉淀"),
            ProcessNode(id: "al_n3", substance: "Al₂O₃", highlight: true),
        ],
        steps: [
            ProcessStep(id: "al_s0", operation: "加过量 NaOH 溶液、过滤",
                sideNote: "Al₂O₃、SiO₂ 是酸性/两性氧化物，溶于 NaOH；Fe₂O₃ 是碱性氧化物不溶，作滤渣除去。",
                quiz: ProcessQuiz(prompt: "加过量 NaOH 能分离出谁？",
                    options: ["不溶的 Fe₂O₃ 留作滤渣", "不溶的 Al₂O₃ 留作滤渣", "SiO₂ 不反应被滤去", "三者全部溶解"],
                    answerIndex: 0,
                    explanation: "Al₂O₃（两性）和 SiO₂（酸性）都溶于强碱，Fe₂O₃（碱性氧化物）不溶——过滤即把铁杂质除去。")),
            ProcessStep(id: "al_s1", operation: "通入过量 CO₂",
                sideNote: "NaAlO₂ + CO₂ + 2H₂O → Al(OH)₃↓ + NaHCO₃；Na₂SiO₃ 不反应留在溶液中。",
                quiz: ProcessQuiz(prompt: "从滤液中析出 Al(OH)₃，为什么通 CO₂ 而不加盐酸？",
                    options: ["盐酸过量会溶解 Al(OH)₃，且无法与硅酸盐分离", "CO₂ 更便宜", "盐酸不与 NaAlO₂ 反应", "CO₂ 能氧化铝"],
                    answerIndex: 0,
                    explanation: "CO₂ 是弱酸，只把 AlO₂⁻ 转成 Al(OH)₃（不溶于碳酸，不会再溶解），硅酸钠留在溶液实现分离；盐酸过量会把 Al(OH)₃ 也溶掉。")),
            ProcessStep(id: "al_s2", operation: "过滤、灼烧",
                sideNote: "2Al(OH)₃ →(Δ) Al₂O₃ + 3H₂O，得到纯净氧化铝（再电解熔融制铝）。"),
        ],
        examPoint: "碱溶法分两关：① 过量 NaOH 溶铝留铁，靠「两性 vs 碱性」分离；② 通过量 CO₂（弱酸）析出 Al(OH)₃ 而不用强酸——既不溶解产物，又把硅酸盐留在液中。")

    // MARK: 有机合成路线（选必3，乙烯出发）

    private static let ethyleneRoute = ProcessFlow(
        id: "pf_ethylene", title: "乙烯合成路线", stage: .senior, topic: .organic,
        overview: "以石油裂解得到的乙烯为原料，一步步合成乙酸乙酯。看官能团如何沿途转化。",
        nodes: [
            ProcessNode(id: "et_n0", substance: "乙烯\nCH₂=CH₂"),
            ProcessNode(id: "et_n1", substance: "乙醇\nCH₃CH₂OH"),
            ProcessNode(id: "et_n2", substance: "乙醛\nCH₃CHO"),
            ProcessNode(id: "et_n3", substance: "乙酸\nCH₃COOH"),
            ProcessNode(id: "et_n4", substance: "乙酸乙酯\nCH₃COOC₂H₅", highlight: true),
        ],
        steps: [
            ProcessStep(id: "et_s0", operation: "与水加成（催化剂）",
                sideNote: "CH₂=CH₂ + H₂O →(催化剂) CH₃CH₂OH，双键打开、引入羟基。",
                quiz: ProcessQuiz(prompt: "乙烯→乙醇属于哪类反应？",
                    options: ["加成反应", "取代反应", "氧化反应", "酯化反应"],
                    answerIndex: 0,
                    explanation: "碳碳双键打开，H 和 OH 各加到一个碳上——加成反应。这也是工业制乙醇的乙烯水化法。")),
            ProcessStep(id: "et_s1", operation: "催化氧化（Cu/Ag 催化、Δ）",
                sideNote: "2CH₃CH₂OH + O₂ →(Cu,Δ) 2CH₃CHO + 2H₂O，羟基被氧化成醛基。",
                quiz: ProcessQuiz(prompt: "乙醇→乙醛，分子里减少的是？",
                    options: ["羟基上的 H 和 α-碳上的 H（共 2 个 H）", "一个氧原子", "一个碳原子", "整个羟基"],
                    answerIndex: 0,
                    explanation: "醇的催化氧化脱去羟基氢和与羟基相连碳上的氢（共 2 个 H），−CH₂OH 变成 −CHO。铜丝「黑→红」循环说明 Cu 是催化剂。")),
            ProcessStep(id: "et_s2", operation: "继续氧化",
                sideNote: "2CH₃CHO + O₂ →(催化剂) 2CH₃COOH，醛基被氧化成羧基。"),
            ProcessStep(id: "et_s3", operation: "与乙醇酯化（浓硫酸、Δ）",
                sideNote: "CH₃COOH + C₂H₅OH ⇌ CH₃COOC₂H₅ + H₂O，酸脱羟基醇脱氢。",
                quiz: ProcessQuiz(prompt: "酯化反应中浓硫酸的作用是？",
                    options: ["催化剂和吸水剂", "只作催化剂", "只作吸水剂", "氧化剂"],
                    answerIndex: 0,
                    explanation: "酯化可逆，浓硫酸既加快反应（催化）又吸收生成的水使平衡正移（吸水）。同位素 ¹⁸O 示踪证明：酸脱羟基、醇脱氢。")),
        ],
        examPoint: "官能团转化主线：烯烃 →(加成) 醇 →(氧化) 醛 →(氧化) 羧酸 →(酯化) 酯。乙醇是枢纽——向上氧化成酸，横向酯化成酯。记住每步的反应类型和条件就掌握了有机合成的骨架。")

    // MARK: 接触法制硫酸

    private static let contactSulfuric = ProcessFlow(
        id: "pf_h2so4", title: "接触法制硫酸", stage: .senior, topic: .nonmetals,
        overview: "以黄铁矿（FeS₂）为原料，经「三炉一塔」工业制硫酸。看硫元素如何一路升价。",
        nodes: [
            ProcessNode(id: "su_n0", substance: "黄铁矿 FeS₂"),
            ProcessNode(id: "su_n1", substance: "SO₂\n（炉气，需净化）"),
            ProcessNode(id: "su_n2", substance: "SO₃"),
            ProcessNode(id: "su_n3", substance: "H₂SO₄", highlight: true),
        ],
        steps: [
            ProcessStep(id: "su_s0", operation: "沸腾炉灼烧（粉碎矿石）",
                sideNote: "4FeS₂+11O₂ →(高温) 2Fe₂O₃+8SO₂。矿石粉碎、用沸腾炉是为了增大接触面积、加快反应。",
                quiz: ProcessQuiz(prompt: "矿石要先粉碎成细粒，目的是？",
                    options: ["增大接触面积、加快反应、使氧化更充分", "降低反应温度", "防止矿石爆炸", "便于运输"],
                    answerIndex: 0,
                    explanation: "粉碎增大固体反应物的接触面积，加快灼烧速率、提高原料利用率。这是固气反应提速的通用手段（与铝热剂、催化剂载体同理）。")),
            ProcessStep(id: "su_s1", operation: "接触室催化氧化",
                sideNote: "2SO₂+O₂ ⇌(催化剂 V₂O₅, Δ) 2SO₃。可逆反应，需控制温度并循环未反应气体。",
                quiz: ProcessQuiz(prompt: "接触室中促使 SO₂ 充分转化，措施是？",
                    options: ["用催化剂并将未反应气体循环利用", "升到很高温度", "加大压强到极限", "通入大量水蒸气"],
                    answerIndex: 0,
                    explanation: "该反应放热、可逆，温度过高平衡逆移。工业上用 V₂O₅ 催化、适宜温度、并把未转化的 SO₂ 循环回接触室——速率与平衡的折中。")),
            ProcessStep(id: "su_s2", operation: "吸收塔用 98.3% 浓硫酸吸收",
                sideNote: "SO₃+H₂O→H₂SO₄。但工业上用浓硫酸吸收 SO₃（再兑水），不直接用水。",
                quiz: ProcessQuiz(prompt: "吸收 SO₃ 为什么用浓硫酸而不用水？",
                    options: ["用水会形成酸雾，吸收不完全", "浓硫酸更便宜", "水不与 SO₃ 反应", "防止 SO₃ 分解"],
                    answerIndex: 0,
                    explanation: "SO₃ 直接遇水放出大量热，水汽与 SO₃ 形成酸雾（小液滴），既吸收不完全又污染。改用浓硫酸吸收 SO₃ 生成发烟硫酸，再稀释，安全高效。")),
        ],
        examPoint: "三炉一塔：沸腾炉（制 SO₂）→ 接触室（催化氧化 SO₃）→ 吸收塔（浓硫酸吸收）。两大采分点：粉碎增大接触面积、SO₃ 用浓硫酸吸收防酸雾。硫元素 −1/+2 → +4 → +6 一路升价。")

    // MARK: 侯氏制碱法

    private static let solvaySoda = ProcessFlow(
        id: "pf_soda", title: "侯氏制碱法", stage: .senior, topic: .metals,
        overview: "侯德榜改进的联合制碱法：以饱和食盐水、氨、CO₂ 为原料制纯碱，副产氮肥 NH₄Cl。",
        nodes: [
            ProcessNode(id: "so_n0", substance: "饱和食盐水"),
            ProcessNode(id: "so_n1", substance: "氨盐水\n（NaCl + NH₃）"),
            ProcessNode(id: "so_n2", substance: "NaHCO₃ 晶体\n（+ 母液 NH₄Cl）"),
            ProcessNode(id: "so_n3", substance: "Na₂CO₃（纯碱）", highlight: true),
        ],
        steps: [
            ProcessStep(id: "so_s0", operation: "先通入 NH₃",
                sideNote: "氨极易溶，使溶液呈碱性，为后续大量吸收 CO₂ 创造条件。",
                quiz: ProcessQuiz(prompt: "为什么先通 NH₃ 而不是先通 CO₂？",
                    options: ["NH₃ 极易溶、先造碱性环境，CO₂ 才能大量吸收", "NH₃ 比 CO₂ 轻", "CO₂ 有毒", "先通 CO₂ 会爆炸"],
                    answerIndex: 0,
                    explanation: "CO₂ 在水中溶解度小，直接通吸收很少。先通极易溶的 NH₃ 使溶液呈碱性，能大量吸收 CO₂ 生成 HCO₃⁻——「先氨后碳」是侯氏制碱的关键顺序。")),
            ProcessStep(id: "so_s1", operation: "通入 CO₂，析出 NaHCO₃",
                sideNote: "NaCl+NH₃+CO₂+H₂O→NaHCO₃↓+NH₄Cl。NaHCO₃ 溶解度最小，先结晶析出。",
                quiz: ProcessQuiz(prompt: "四种产物中为什么是 NaHCO₃ 先析出？",
                    options: ["NaHCO₃ 在该体系中溶解度最小", "NaHCO₃ 密度最大", "NaHCO₃ 不溶于水", "NH₄Cl 会挥发"],
                    answerIndex: 0,
                    explanation: "同温下 NaHCO₃ 的溶解度在 NaCl、NH₄Cl、NaHCO₃ 中最小，故率先达到饱和、结晶析出，过滤即可分离。NH₄Cl 留在母液中。")),
            ProcessStep(id: "so_s2", operation: "过滤、煅烧",
                sideNote: "2NaHCO₃ →(Δ) Na₂CO₃+H₂O↑+CO₂↑。煅烧 NaHCO₃ 得纯碱，放出的 CO₂ 可循环利用。",
                quiz: ProcessQuiz(prompt: "煅烧 NaHCO₃ 放出的 CO₂ 如何处理？",
                    options: ["循环回通气工序，重复利用", "直接排空", "通入石灰水", "用于灭火"],
                    answerIndex: 0,
                    explanation: "煅烧产生的 CO₂ 通回前面的吸收工序循环利用，提高原子利用率。母液中的 NH₄Cl 加 NaCl 冷却结晶分离，作氮肥——这正是侯氏制碱「联合」与「不浪费」的精髓。")),
        ],
        examPoint: "侯氏制碱三步：通氨 → 通 CO₂ 析出 NaHCO₃ → 煅烧得 Na₂CO₃。三大采分点：先氨后碳（CO₂ 才吸得多）、NaHCO₃ 溶解度最小先析出、CO₂ 循环 + 副产 NH₄Cl 氮肥。侯德榜打破了国外技术封锁。")
}
