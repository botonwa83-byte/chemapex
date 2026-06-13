import Foundation

// MARK: - 题库分批：选必3 有机化学基础（有机基础/烃/烃的衍生物/营养物质与高分子）
// 红线：官能团、反应类型、鉴别现象符合教材；新旧教材差异标注。

extension ProblemBank {
    static let organicBatch: [ChemProblem] = orgBasicBatch + orgHydroBatch
        + orgDerivBatch + orgLifeBatch

    // MARK: 有机基础（分类/官能团/同分异构）★★★

    private static let orgBasicBatch: [ChemProblem] = [
        ChemProblem(
            id: "p_og_b01", stage: .senior, topic: .organic,
            content: "下列关于有机物的说法正确的是？",
            options: ["有机物都难溶于水", "有机物种类繁多，是因为碳原子能成 4 个键并相互连接", "有机物都不导电", "有机物一定含碳、氢两种元素"],
            answerIndex: 1,
            explanation: "碳原子最外层 4 个电子、能形成 4 个共价键，碳碳之间可成链成环，故有机物种类繁多。有机物不一定含氢（如 CCl₄），多数可燃、熔点低、难溶于水，但有反例（乙醇与水互溶）。",
            nodeId: "org_basic"),
        ChemProblem(
            id: "p_og_b02", stage: .senior, topic: .organic,
            content: "决定有机物化学特性的原子或原子团叫官能团。下列属于官能团的是？",
            options: ["—CH₃（甲基）", "—OH（羟基）", "苯环上的碳", "C—C 单键"],
            answerIndex: 1,
            explanation: "羟基 —OH 是醇、酚的官能团，决定其特性。常见官能团还有 —CHO（醛基）、—COOH（羧基）、C=C（碳碳双键）等。甲基、烷基、单键不是官能团（不决定特征性质）。",
            nodeId: "org_basic"),
        ChemProblem(
            id: "p_og_b03", stage: .senior, topic: .organic,
            content: "下列各组物质互为同系物的是？",
            options: ["CH₄ 和 C₂H₆", "O₂ 和 O₃", "正丁烷和异丁烷", "金刚石和石墨"],
            answerIndex: 0,
            explanation: "同系物：结构相似、组成相差若干 CH₂、通式相同的化合物。CH₄ 与 C₂H₆ 都是烷烃 CₙH₂ₙ₊₂，互为同系物。正丁烷与异丁烷是同分异构体；O₂/O₃、金刚石/石墨是同素异形体。",
            nodeId: "org_basic"),
        ChemProblem(
            id: "p_og_b04", stage: .senior, topic: .organic,
            content: "分子式为 C₅H₁₂ 的烷烃，其同分异构体共有？",
            options: ["2 种", "3 种", "4 种", "5 种"],
            answerIndex: 1,
            explanation: "C₅H₁₂ 有 3 种同分异构体：正戊烷（直链）、异戊烷（2-甲基丁烷）、新戊烷（2,2-二甲基丙烷）。书写同分异构体要按「主链由长到短、支链由整到散」有序进行，防止重复或遗漏。",
            nodeId: "org_basic"),
        ChemProblem(
            id: "p_og_b05", stage: .senior, topic: .organic,
            content: "下列各组物质互为同分异构体的是？",
            options: ["乙醇 C₂H₅OH 和二甲醚 CH₃OCH₃", "CH₄ 和 CCl₄", "乙烯和乙烷", "H₂O 和 H₂O₂"],
            answerIndex: 0,
            explanation: "乙醇与二甲醚分子式都是 C₂H₆O，但结构不同（官能团不同），互为同分异构体。同分异构体「分子式相同、结构不同」。乙烯 C₂H₄ 与乙烷 C₂H₆ 分子式不同，不是。",
            nodeId: "org_basic"),
        ChemProblem(
            id: "p_og_b06", stage: .senior, topic: .organic,
            content: "下列有机物命名正确的是？",
            options: ["CH₃CH₂CH₃ 叫丙烷", "CH₃CH₂OH 叫甲醇", "CH₂=CH₂ 叫乙烷", "CH₃COOH 叫乙醛"],
            answerIndex: 0,
            explanation: "CH₃CH₂CH₃（3 个碳的烷烃）叫丙烷。CH₃CH₂OH 是乙醇（2 个碳）；CH₂=CH₂ 是乙烯（含双键）；CH₃COOH 是乙酸。命名要看碳原子数（甲乙丙丁…）和官能团类别。",
            nodeId: "org_basic"),
        ChemProblem(
            id: "p_og_b07", stage: .senior, topic: .organic,
            content: "在有机物分子中，碳原子总是形成 4 个共价键。下列结构不可能存在的是？",
            options: ["CH₃—CH₃", "CH₂=CH₂", "CH≡CH", "CH₃=CH₂"],
            answerIndex: 3,
            explanation: "碳必须形成 4 个键。CH₃=CH₂ 中左碳已有 3 个 H 加 1 个双键（共 5 个键），不可能存在。乙烷（单键）、乙烯（双键）、乙炔（三键）都满足碳四价。判断有机结构合理性先数每个碳的键数。",
            nodeId: "org_basic"),
        ChemProblem(
            id: "p_og_b08", stage: .senior, topic: .organic,
            content: "下列有机反应类型与实例对应正确的是？",
            options: ["甲烷与氯气光照——加成反应", "乙烯与溴水——取代反应", "乙酸与乙醇——酯化反应（属取代）", "乙醇催化氧化——加成反应"],
            answerIndex: 2,
            explanation: "酯化反应是取代反应的一种（酸脱羟基、醇脱氢）。甲烷与氯气光照是取代；乙烯与溴水是加成；乙醇催化氧化是氧化反应。常见反应类型：取代、加成、消去、氧化、酯化、加聚。",
            nodeId: "org_basic"),
        ChemProblem(
            id: "p_og_b09", stage: .senior, topic: .organic,
            content: "确定有机物分子式时，常需先测定其实验式（最简式）。某有机物碳、氢质量分数分别为 85.7%、14.3%，其最简式为？",
            options: ["CH₂", "CH₃", "CH", "C₂H₃"],
            answerIndex: 0,
            explanation: "n(C):n(H) = (85.7/12):(14.3/1) ≈ 7.14:14.3 ≈ 1:2，最简式为 CH₂。再结合相对分子质量可定分子式（如 28 对应 C₂H₄）。这是有机物组成测定的基本方法。",
            nodeId: "org_basic"),
    ]

    // MARK: 烃（烷烯炔芳香烃）★★★

    private static let orgHydroBatch: [ChemProblem] = [
        ChemProblem(
            id: "p_og_h01", stage: .senior, topic: .organic,
            content: "关于烷烃，下列说法正确的是？",
            options: ["都能使溴水褪色", "通式为 CₙH₂ₙ", "化学性质稳定，能与氯气在光照下发生取代反应", "都是气体"],
            answerIndex: 2,
            explanation: "烷烃通式 CₙH₂ₙ₊₂，碳碳单键，化学性质稳定，不与溴水/酸性 KMnO₄ 反应，但能在光照下与卤素取代。常温下 C₁~C₄ 是气体、更高的是液体或固体。",
            nodeId: "org_hydro"),
        ChemProblem(
            id: "p_og_h02", stage: .senior, topic: .organic,
            content: "乙烯能使溴水和酸性高锰酸钾溶液褪色，根本原因是分子中含有？",
            options: ["碳碳单键", "碳碳双键", "羟基", "羧基"],
            answerIndex: 1,
            explanation: "乙烯含碳碳双键（C=C），不饱和、化学性质活泼：与溴水加成而褪色、被酸性 KMnO₄ 氧化而褪色、能加聚成聚乙烯。双键是烯烃的官能团。",
            nodeId: "org_hydro"),
        ChemProblem(
            id: "p_og_h03", stage: .senior, topic: .organic,
            content: "乙炔（C₂H₂）分子中碳碳之间为三键。下列关于乙炔的说法正确的是？",
            options: ["不能发生加成反应", "能使溴水褪色", "是饱和烃", "通式为 CₙH₂ₙ₊₂"],
            answerIndex: 1,
            explanation: "乙炔含碳碳三键，不饱和，能与溴、氢气等加成而使溴水褪色，也能燃烧（氧炔焰用于焊接切割）。炔烃通式 CₙH₂ₙ₋₂。实验室用电石与水反应制乙炔（CaC₂+2H₂O→C₂H₂↑+Ca(OH)₂）。",
            nodeId: "org_hydro"),
        ChemProblem(
            id: "p_og_h04", stage: .senior, topic: .organic,
            content: "苯不能使溴水（因加成）褪色，也不能使酸性 KMnO₄ 褪色，说明苯环上的碳碳键？",
            options: ["是普通的碳碳双键", "是普通的碳碳单键", "是一种介于单键和双键之间的特殊化学键", "是离子键"],
            answerIndex: 2,
            explanation: "苯环中 6 个碳之间是一种特殊的、介于单键与双键之间的化学键（大 π 键），既不同于单键也不同于双键，故苯不发生加成褪色、也不被 KMnO₄ 氧化。这是苯结构的核心考点。",
            nodeId: "org_hydro"),
        ChemProblem(
            id: "p_og_h05", stage: .senior, topic: .organic,
            content: "苯能发生的反应是？",
            options: ["与溴水加成", "与液溴在 FeBr₃ 催化下发生取代（生成溴苯）", "使酸性 KMnO₄ 褪色", "与 NaOH 反应"],
            answerIndex: 1,
            explanation: "苯环稳定，主要发生取代反应：与液溴（FeBr₃ 催化）生成溴苯、与浓硝酸（浓硫酸催化）硝化生成硝基苯、与浓硫酸磺化。苯也能与 H₂ 加成（催化加氢成环己烷），但不与溴水、KMnO₄ 反应。",
            nodeId: "org_hydro"),
        ChemProblem(
            id: "p_og_h06", stage: .senior, topic: .organic,
            content: "甲苯能使酸性高锰酸钾溶液褪色，而苯不能，原因是？",
            options: ["甲苯含碳碳双键", "甲苯的甲基（侧链）受苯环影响能被 KMnO₄ 氧化", "甲苯是不饱和烃", "甲苯含羟基"],
            answerIndex: 1,
            explanation: "甲苯分子中与苯环直接相连的甲基侧链能被酸性 KMnO₄ 氧化（生成苯甲酸），使其褪色。苯环本身不被氧化，但它的存在活化了侧链。「苯不褪、甲苯褪」是芳香烃的对比考点。",
            nodeId: "org_hydro"),
        ChemProblem(
            id: "p_og_h07", stage: .senior, topic: .organic,
            content: "要鉴别己烷、己烯（CH₂=CH(CH₂)₃CH₃）和苯三瓶无色液体，可选用的试剂是？",
            options: ["蒸馏水", "溴的四氯化碳溶液", "NaOH 溶液", "盐酸"],
            answerIndex: 1,
            explanation: "加溴的 CCl₄ 溶液：己烯含双键能加成使其褪色；苯萃取使溴层颜色转移（分层但不属加成褪色）；己烷无明显变化。利用是否含不饱和键及萃取现象区分。三者也可用酸性 KMnO₄ 区分。",
            nodeId: "org_hydro"),
        ChemProblem(
            id: "p_og_h08", stage: .senior, topic: .organic,
            content: "下列关于煤和石油综合利用的说法正确的是？",
            options: ["石油分馏是化学变化", "石油裂化的目的是获得更多轻质液体燃料（如汽油）", "煤的干馏是物理变化", "石油裂解的目的是制汽油"],
            answerIndex: 1,
            explanation: "石油裂化把长链烃断成短链，提高汽油等轻质燃料产量（化学变化）。分馏是物理变化（按沸点分离）；煤的干馏是化学变化；石油裂解（深度裂化）目的是获得乙烯、丙烯等化工原料。",
            nodeId: "org_hydro"),
    ]

    // MARK: 烃的衍生物（卤代烃/醇酚/醛酮/羧酸酯）★★★

    private static let orgDerivBatch: [ChemProblem] = [
        ChemProblem(
            id: "p_og_d01", stage: .senior, topic: .organic,
            content: "溴乙烷（CH₃CH₂Br）在 NaOH 水溶液中加热，主要发生？",
            options: ["取代（水解）反应，生成乙醇", "消去反应，生成乙烯", "加成反应", "氧化反应"],
            answerIndex: 0,
            explanation: "卤代烃在 NaOH 水溶液中加热发生取代（水解）：CH₃CH₂Br+NaOH→(水、Δ)CH₃CH₂OH+NaBr。若在 NaOH 醇溶液中加热则发生消去反应生成乙烯——「水解看水、消去看醇」是关键区分。",
            nodeId: "org_deriv"),
        ChemProblem(
            id: "p_og_d02", stage: .senior, topic: .organic,
            content: "乙醇与金属钠反应，下列说法正确的是？",
            options: ["反应比钠与水更剧烈", "生成乙醇钠和氢气，断的是 O—H 键", "乙醇不与钠反应", "生成乙烷"],
            answerIndex: 1,
            explanation: "2CH₃CH₂OH+2Na→2CH₃CH₂ONa+H₂↑，断裂的是羟基 O—H 键。反应比钠与水缓和（钠沉在乙醇底部缓慢放气），说明乙醇羟基氢不如水中的氢活泼。",
            nodeId: "org_deriv"),
        ChemProblem(
            id: "p_og_d03", stage: .senior, topic: .organic,
            content: "苯酚的下列性质中，能说明它具有弱酸性的是？",
            options: ["遇 FeCl₃ 溶液显紫色", "与浓溴水生成白色沉淀", "能与 NaOH 溶液反应生成苯酚钠", "常温下在水中溶解度不大"],
            answerIndex: 2,
            explanation: "苯酚显弱酸性（俗称石炭酸），能与 NaOH 反应：C₆H₅OH+NaOH→C₆H₅ONa+H₂O。遇 FeCl₃ 显紫色是检验酚的方法、与浓溴水生成三溴苯酚白色沉淀是取代反应，都不直接体现酸性。",
            nodeId: "org_deriv"),
        ChemProblem(
            id: "p_og_d04", stage: .senior, topic: .organic,
            content: "乙醇和苯酚都含羟基，但性质有差异。下列说法正确的是？",
            options: ["两者都显酸性", "苯酚能与 NaOH 反应，乙醇不能", "乙醇能使石蕊变红", "两者遇 FeCl₃ 都显紫色"],
            answerIndex: 1,
            explanation: "苯酚羟基受苯环影响显弱酸性，能与 NaOH 反应；乙醇羟基为中性，不与 NaOH 反应、不使石蕊变红。只有酚遇 FeCl₃ 显紫色（检验酚）。同是羟基，环境不同性质迥异。",
            nodeId: "org_deriv"),
        ChemProblem(
            id: "p_og_d05", stage: .senior, topic: .organic,
            content: "乙醛（CH₃CHO）能发生银镜反应，是因为它含有？",
            options: ["羟基", "醛基（—CHO）", "羧基", "碳碳双键"],
            answerIndex: 1,
            explanation: "醛基 —CHO 有还原性，能发生银镜反应、与新制 Cu(OH)₂ 加热生成砖红色 Cu₂O，用于检验醛基。乙醛也能被氧化成乙酸、被 H₂ 还原（加成）成乙醇。",
            nodeId: "org_deriv"),
        ChemProblem(
            id: "p_og_d06", stage: .senior, topic: .organic,
            content: "下列能证明乙酸酸性比碳酸强的实验是？",
            options: ["乙酸能使石蕊变红", "乙酸滴入 Na₂CO₃ 溶液产生气泡（放出 CO₂）", "乙酸能与乙醇反应", "乙酸能溶于水"],
            answerIndex: 1,
            explanation: "强酸制弱酸：乙酸 + Na₂CO₃ → 乙酸钠 + H₂O + CO₂↑，能放出 CO₂ 说明乙酸酸性强于碳酸。仅使石蕊变红只能说明显酸性，不能比较强弱。",
            nodeId: "org_deriv"),
        ChemProblem(
            id: "p_og_d07", stage: .senior, topic: .organic,
            content: "乙酸乙酯在 NaOH 溶液中加热水解，产物是？",
            options: ["乙酸和乙醇", "乙酸钠和乙醇", "乙醛和乙醇", "乙酸和乙醛"],
            answerIndex: 1,
            explanation: "酯在碱性条件下水解（皂化型）较彻底：CH₃COOC₂H₅+NaOH→(Δ)CH₃COONa+C₂H₅OH，生成乙酸钠和乙醇。在酸性条件下水解则生成乙酸和乙醇（可逆）。碱性水解更完全。",
            nodeId: "org_deriv"),
        ChemProblem(
            id: "p_og_d08", stage: .senior, topic: .organic,
            content: "乙烯为原料合成乙酸乙酯，官能团转化顺序正确的是？",
            options: ["双键→羟基→醛基→羧基→酯基", "双键→羧基→醛基→酯基", "羟基→双键→酯基", "醛基→羟基→羧基"],
            answerIndex: 0,
            explanation: "乙烯→（加成）乙醇（羟基）→（催化氧化）乙醛（醛基）→（氧化）乙酸（羧基）→（与乙醇酯化）乙酸乙酯（酯基）。官能团沿「双键→醇→醛→酸→酯」转化，是有机合成的主线。",
            nodeId: "org_deriv"),
        ChemProblem(
            id: "p_og_d09", stage: .senior, topic: .organic,
            content: "用一种试剂区别乙酸、乙醇、苯酚三种溶液，最合适的是？",
            options: ["石蕊试液", "FeCl₃ 溶液", "NaCl 溶液", "蒸馏水"],
            answerIndex: 1,
            explanation: "加 FeCl₃ 溶液：苯酚显紫色；乙酸显酸性可使 FeCl₃ 水解受抑制但主要是不显紫色、且可另由气味/与碳酸盐反应区分；乙醇无明显变化。更稳妥可用石蕊（乙酸变红）+ FeCl₃（苯酚紫色）+ Na₂CO₃ 综合区分。",
            nodeId: "org_deriv"),
    ]

    // MARK: 营养物质与高分子（糖/油脂/蛋白质/合成材料）★★

    private static let orgLifeBatch: [ChemProblem] = [
        ChemProblem(
            id: "p_og_l01", stage: .senior, topic: .organic,
            content: "下列物质属于单糖的是？",
            options: ["蔗糖", "麦芽糖", "葡萄糖", "淀粉"],
            answerIndex: 2,
            explanation: "葡萄糖（C₆H₁₂O₆）是单糖，不能再水解。蔗糖、麦芽糖是二糖（C₁₂H₂₂O₁₁，互为同分异构体）；淀粉、纤维素是多糖 [(C₆H₁₀O₅)ₙ]。糖类是多羟基醛或多羟基酮及其脱水缩合物。",
            nodeId: "org_life"),
        ChemProblem(
            id: "p_og_l02", stage: .senior, topic: .organic,
            content: "葡萄糖能发生银镜反应，是因为其分子中含有？",
            options: ["多个羟基", "醛基（—CHO）", "羧基", "酯基"],
            answerIndex: 1,
            explanation: "葡萄糖是多羟基醛，含醛基，能发生银镜反应、还原新制 Cu(OH)₂（医学上检验糖尿病）。它含 5 个羟基，可与羧酸酯化、与钠反应。蔗糖无醛基，不能直接银镜（需先水解）。",
            nodeId: "org_life"),
        ChemProblem(
            id: "p_og_l03", stage: .senior, topic: .organic,
            content: "检验某食物中是否含有淀粉，最简便的方法是滴加？",
            options: ["碘水，若变蓝则含淀粉", "银氨溶液", "NaOH 溶液", "石蕊试液"],
            answerIndex: 0,
            explanation: "淀粉遇碘（碘单质）变蓝，是检验淀粉的专属方法。淀粉在酸或酶催化下水解，最终生成葡萄糖（可用银镜反应检验水解产物）。淀粉、纤维素都是多糖，但 n 不同、不是同分异构体。",
            nodeId: "org_life"),
        ChemProblem(
            id: "p_og_l04", stage: .senior, topic: .organic,
            content: "油脂在 NaOH 溶液中加热水解（皂化反应），产物是？",
            options: ["高级脂肪酸和甘油", "高级脂肪酸钠（肥皂主要成分）和甘油", "葡萄糖和甘油", "氨基酸"],
            answerIndex: 1,
            explanation: "油脂是高级脂肪酸甘油酯，在碱性条件下水解（皂化）生成高级脂肪酸钠（肥皂主要成分）和甘油。油脂属于酯类、是重要的营养物质和工业原料；不饱和油脂可氢化成饱和（硬化油）。",
            nodeId: "org_life"),
        ChemProblem(
            id: "p_og_l05", stage: .senior, topic: .organic,
            content: "下列关于蛋白质的说法正确的是？",
            options: ["蛋白质水解的最终产物是葡萄糖", "重金属盐能使蛋白质变性", "蛋白质遇浓硝酸变蓝", "盐析是不可逆的化学变化"],
            answerIndex: 1,
            explanation: "重金属盐、加热、强酸强碱、酒精等能使蛋白质变性（不可逆，失去生理活性）。蛋白质水解最终生成氨基酸；遇浓硝酸变黄（颜色反应）；盐析是可逆的物理变化（用于分离提纯蛋白质）。",
            nodeId: "org_life"),
        ChemProblem(
            id: "p_og_l06", stage: .senior, topic: .organic,
            content: "氨基酸分子中既含 —COOH 又含 —NH₂，因此氨基酸具有？",
            options: ["只有酸性", "只有碱性", "两性（既能与酸又能与碱反应）", "氧化性"],
            answerIndex: 2,
            explanation: "氨基酸含羧基（—COOH，酸性）和氨基（—NH₂，碱性），是两性化合物，既能与盐酸又能与 NaOH 反应。氨基酸通过肽键缩合成蛋白质，是构成蛋白质的基本单位。",
            nodeId: "org_life"),
        ChemProblem(
            id: "p_og_l07", stage: .senior, topic: .organic,
            content: "聚乙烯由乙烯通过加聚反应制得。下列说法正确的是？",
            options: ["聚乙烯能使溴水褪色", "乙烯是聚乙烯的单体", "加聚反应有小分子生成", "聚乙烯是小分子"],
            answerIndex: 1,
            explanation: "nCH₂=CH₂ →(催化剂) [—CH₂—CH₂—]ₙ，乙烯是单体、聚乙烯是高分子化合物。加聚反应中双键打开首尾相连、无小分子生成；产物聚乙烯无双键，不能使溴水褪色。缩聚反应则会生成小分子（如水）。",
            nodeId: "org_life"),
    ]
}
