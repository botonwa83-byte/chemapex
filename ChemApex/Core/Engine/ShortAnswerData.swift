import Foundation

// MARK: - 简答题库（高考高频文字题）
// 红线：标准答案用规范化学语言；采分点为真实评分要点。

enum ShortAnswerData {
    static let all: [ShortAnswer] = jianyan + jieshi + miaoshu + caozuo

    // MARK: 检验类
    private static let jianyan: [ShortAnswer] = [
        ShortAnswer(id: "sa_jy1", category: "检验", stage: .senior,
            question: "如何检验某溶液中含有 SO₄²⁻？",
            answer: "取少量待测液，先加入足量稀盐酸（无沉淀生成），再滴加 BaCl₂ 溶液，若产生白色沉淀，则证明含有 SO₄²⁻。",
            scorePoints: ["取样并先加足量稀盐酸（排除 CO₃²⁻、SO₃²⁻、Ag⁺ 干扰）", "再加 BaCl₂ 溶液", "出现白色沉淀即含 SO₄²⁻"],
            tip: "检验类通法：取样 → 排除干扰 → 加特征试剂 → 描述现象下结论。"),
        ShortAnswer(id: "sa_jy2", category: "检验", stage: .senior,
            question: "如何检验某溶液中含有 Fe²⁺（且不含 Fe³⁺）？",
            answer: "取少量待测液，先滴加 KSCN 溶液，溶液不变红（说明不含 Fe³⁺）；再滴入少量氯水，若溶液变红，则证明原溶液含 Fe²⁺。",
            scorePoints: ["先加 KSCN，溶液不变红（排除 Fe³⁺）", "再加氯水（氧化剂）", "溶液变红，证明含 Fe²⁺"],
            tip: "Fe²⁺ 检验是「先无后红」——先确认无 Fe³⁺，再氧化后显色。"),
        ShortAnswer(id: "sa_jy3", category: "检验", stage: .senior,
            question: "如何检验某铵盐中含有 NH₄⁺？",
            answer: "取少量样品于试管中，加入 NaOH 溶液并加热，将湿润的红色石蕊试纸靠近试管口，若试纸变蓝，则证明含 NH₄⁺。",
            scorePoints: ["加 NaOH 溶液并加热", "湿润红色石蕊试纸靠近试管口", "试纸变蓝即含 NH₄⁺"],
            tip: "NH₄⁺ 是唯一使湿润红色石蕊变蓝的——必须加热、试纸要湿润。"),
        ShortAnswer(id: "sa_jy4", category: "检验", stage: .junior,
            question: "如何检验一瓶无色气体是二氧化碳？",
            answer: "将气体通入澄清石灰水，若石灰水变浑浊，则该气体是二氧化碳。",
            scorePoints: ["通入澄清石灰水", "石灰水变浑浊", "得出是 CO₂"],
            tip: "CO₂ 标准检验法。注意 SO₂ 也能使石灰水变浑浊，需结合气味区分。"),
    ]

    // MARK: 解释原因类
    private static let jieshi: [ShortAnswer] = [
        ShortAnswer(id: "sa_js1", category: "解释原因", stage: .senior,
            question: "配制 FeCl₃ 溶液时，为什么要加入少量盐酸？",
            answer: "因为 Fe³⁺ 会发生水解（Fe³⁺ + 3H₂O ⇌ Fe(OH)₃ + 3H⁺），加入盐酸增大 c(H⁺)，抑制 Fe³⁺ 的水解，防止溶液变浑浊。",
            scorePoints: ["Fe³⁺ 会水解", "加盐酸（H⁺）抑制水解", "防止生成 Fe(OH)₃ 使溶液浑浊"],
            tip: "解释原因类：先点出本质（水解/平衡/守恒），再说措施如何影响它，最后说结果。"),
        ShortAnswer(id: "sa_js2", category: "解释原因", stage: .senior,
            question: "为什么不能用浓硫酸干燥氨气？",
            answer: "因为氨气是碱性气体，浓硫酸是酸性干燥剂，二者会发生反应（2NH₃ + H₂SO₄ → (NH₄)₂SO₄），所以浓硫酸不能干燥氨气。",
            scorePoints: ["NH₃ 是碱性气体", "浓硫酸是酸性干燥剂，二者反应", "故不能干燥（应改用碱石灰）"],
            tip: "干燥剂选择=酸碱配对：碱性气体用碱性干燥剂。"),
        ShortAnswer(id: "sa_js3", category: "解释原因", stage: .senior,
            question: "侯氏制碱法中，为什么先向饱和食盐水中通入氨气，再通入二氧化碳？",
            answer: "因为 CO₂ 在水中溶解度小，先通入极易溶的 NH₃ 使溶液呈碱性，能大量吸收 CO₂，从而生成更多 NaHCO₃。若先通 CO₂ 则吸收很少。",
            scorePoints: ["CO₂ 溶解度小，直接通吸收少", "先通 NH₃ 使溶液呈碱性", "利于大量吸收 CO₂、生成 NaHCO₃"],
            tip: "「先氨后碳」是工艺顺序题的经典，答出溶解度和碱性环境两点。"),
        ShortAnswer(id: "sa_js4", category: "解释原因", stage: .senior,
            question: "接触法制硫酸中，为什么用 98.3% 的浓硫酸吸收 SO₃ 而不用水？",
            answer: "因为 SO₃ 遇水放出大量热，会与水蒸气形成酸雾，吸收不完全且污染环境；改用浓硫酸吸收 SO₃ 可避免酸雾、吸收充分。",
            scorePoints: ["用水会形成酸雾", "吸收不完全（且污染）", "浓硫酸吸收可避免酸雾"],
            tip: nil),
        ShortAnswer(id: "sa_js5", category: "解释原因", stage: .junior,
            question: "金属钠为什么要保存在煤油中？",
            answer: "因为钠的化学性质很活泼，易与空气中的氧气、水蒸气反应；钠的密度比煤油大、且不与煤油反应，保存在煤油中可隔绝空气和水。",
            scorePoints: ["钠活泼，易与 O₂、水反应", "钠不与煤油反应、密度比煤油大", "煤油隔绝空气和水"],
            tip: nil),
    ]

    // MARK: 描述现象类
    private static let miaoshu: [ShortAnswer] = [
        ShortAnswer(id: "sa_ms1", category: "描述现象", stage: .senior,
            question: "描述钠与水反应的实验现象。",
            answer: "钠浮在水面上，熔成银白色小球，四处游动并发出嘶嘶响声，最后消失；若滴有酚酞，溶液变红。",
            scorePoints: ["浮（密度比水小）", "熔（反应放热、熔点低）", "游、响（生成气体）", "（滴酚酞）变红（生成碱）"],
            tip: "「浮熔游响红」五字诀，每个字对应一条性质，描述现象要写「看到的」不写结论。"),
        ShortAnswer(id: "sa_ms2", category: "描述现象", stage: .senior,
            question: "向 FeSO₄ 溶液中加入 NaOH 溶液，描述观察到的现象。",
            answer: "先生成白色絮状沉淀，迅速变为灰绿色，最终变为红褐色。",
            scorePoints: ["先生成白色沉淀 Fe(OH)₂", "迅速变灰绿", "最终变红褐色 Fe(OH)₃"],
            tip: "「白→灰绿→红褐」三段变色，是 Fe(OH)₂ 被氧化的招牌现象。"),
        ShortAnswer(id: "sa_ms3", category: "描述现象", stage: .junior,
            question: "描述铁丝在氧气中燃烧的现象。",
            answer: "铁丝剧烈燃烧，火星四射，放出大量热，生成黑色固体（Fe₃O₄）。",
            scorePoints: ["剧烈燃烧、火星四射", "放出大量热", "生成黑色固体"],
            tip: "描述现象不要写「生成 Fe₃O₄」（那是结论），应写「黑色固体」。"),
    ]

    // MARK: 实验操作类
    private static let caozuo: [ShortAnswer] = [
        ShortAnswer(id: "sa_cz1", category: "实验操作", stage: .senior,
            question: "如何检查（带分液漏斗的）气体发生装置的气密性？",
            answer: "关闭分液漏斗活塞，将导管口插入水中，用手（或微热）捂热烧瓶，若导管口有气泡冒出，松手后导管内形成一段水柱，则气密性良好。",
            scorePoints: ["形成密闭体系（导管插入水中）", "手捂或微热使气体膨胀", "导管口冒气泡 / 冷却后形成水柱即气密性好"],
            tip: "检查气密性通法：密闭—改变压强（手捂/微热）—看气泡或水柱。"),
        ShortAnswer(id: "sa_cz2", category: "实验操作", stage: .senior,
            question: "用萃取分液法从碘水中提取碘，简述分液操作。",
            answer: "向碘水中加入 CCl₄，盖好玻璃塞充分振荡并放气，静置分层后，将分液漏斗下层（碘的 CCl₄ 溶液）从下口放出，上层水从上口倒出。",
            scorePoints: ["加 CCl₄ 振荡（萃取）", "静置分层", "下层从下口放出、上层从上口倒出"],
            tip: "分液要点：下层下口放、上层上口倒，防止互相污染。"),
        ShortAnswer(id: "sa_cz3", category: "实验操作", stage: .senior,
            question: "配制一定物质的量浓度的溶液，定容时的正确操作是？",
            answer: "向容量瓶中加水至接近刻度线时，改用胶头滴管滴加蒸馏水，使凹液面最低处与刻度线相切，然后盖塞摇匀。",
            scorePoints: ["接近刻度线改用胶头滴管", "凹液面最低处与刻度线相切（平视）", "盖塞摇匀"],
            tip: "定容关键：平视、凹液面相切、最后用滴管。俯视偏高、仰视偏低。"),
    ]
}
