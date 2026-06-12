import Foundation

// MARK: - 化学神探案件库（一期 10 案：无机 8 + 有机 2）
// 红线：每条线索的现象/颜色/性质必须准确；deduction 必须讲清排除逻辑。

enum DetectiveData {
    static let all: [DetectiveCase] = inorganic + organic

    static func detectiveCase(id: String) -> DetectiveCase? { all.first { $0.id == id } }

    // MARK: 无机八案

    private static let inorganic: [DetectiveCase] = [
        DetectiveCase(
            id: "dt_01", title: "淡黄色嫌疑人", stage: .senior, topic: .metals,
            suspects: ["硫磺 S", "过氧化钠 Na₂O₂", "溴化银 AgBr", "氯化钠 NaCl"],
            answerIndex: 1,
            clues: [
                DetectiveClue(id: "dt_01_c1",
                    text: "目击者称，嫌疑人是一种淡黄色固体。",
                    deduction: "NaCl 是白色，当场出局。硫磺、Na₂O₂、AgBr 都是淡黄色系——还剩三个嫌疑人。"),
                DetectiveClue(id: "dt_01_c2",
                    text: "把它投入水中，剧烈反应并放出一种气体，带火星的木条凑近后复燃了。",
                    deduction: "放出 O₂！硫磺不溶于水，AgBr 几乎不溶也不反应——能与水反应放氧气的淡黄色固体，指向性已经极强。"),
                DetectiveClue(id: "dt_01_c3",
                    text: "反应后的溶液滴入酚酞，先变红，片刻后红色竟然褪去了。",
                    deduction: "变红说明生成了碱（NaOH）；褪色是反应中间产物的强氧化性所致——这是该物质的标志性现象。"),
                DetectiveClue(id: "dt_01_c4",
                    text: "档案显示，它常被安排在潜艇和呼吸面具里工作。",
                    deduction: "供氧剂的身份石锤：既吸收 CO₂ 又放出 O₂，舍它其谁。"),
            ],
            verdict: "谜底：过氧化钠 Na₂O₂。淡黄色固体 + 与水反应放 O₂（2Na₂O₂ + 2H₂O → 4NaOH + O₂↑）+ 酚酞先红后褪 + 供氧剂用途。注意 Na₂O₂ 中氧为 −1 价，反应是歧化：它既是氧化剂又是还原剂。"),

        DetectiveCase(
            id: "dt_02", title: "黄绿色毒雾", stage: .senior, topic: .nonmetals,
            suspects: ["氯气 Cl₂", "二氧化氮 NO₂", "二氧化硫 SO₂", "氨气 NH₃"],
            answerIndex: 0,
            clues: [
                DetectiveClue(id: "dt_02_c1",
                    text: "案发现场弥漫着一种有强烈刺激性气味的气体。",
                    deduction: "四位嫌疑人都有刺激性气味——这条线索还分不出胜负。"),
                DetectiveClue(id: "dt_02_c2",
                    text: "幸存者回忆，那团气体是黄绿色的。",
                    deduction: "NO₂ 是红棕色、SO₂ 和 NH₃ 无色——黄绿色一出，嫌疑人只剩一个，但谨慎的侦探还要物证。"),
                DetectiveClue(id: "dt_02_c3",
                    text: "它让湿润的淀粉碘化钾试纸变蓝了。",
                    deduction: "强氧化性把 I⁻ 氧化成 I₂，碘遇淀粉变蓝——这是它的标准检验法。"),
                DetectiveClue(id: "dt_02_c4",
                    text: "奇怪的是，它对干燥的有色布条毫无办法，沾水后却让布条瞬间褪色。",
                    deduction: "干燥时不漂白、遇水才漂白——真正动手的是它与水反应生成的 HClO。"),
            ],
            verdict: "谜底：氯气 Cl₂。黄绿色 + 湿润淀粉 KI 试纸变蓝 + 「干不漂湿漂」三证齐全。漂白的本质是 Cl₂ + H₂O ⇌ HCl + HClO 中 HClO 的强氧化性。"),

        DetectiveCase(
            id: "dt_03", title: "变色的目击者", stage: .senior, topic: .metals,
            suspects: ["Fe²⁺", "Fe³⁺", "Cu²⁺", "Mg²⁺"],
            answerIndex: 0,
            clues: [
                DetectiveClue(id: "dt_03_c1",
                    text: "嫌疑离子藏身的溶液呈浅绿色。",
                    deduction: "Cu²⁺ 是蓝色、Fe³⁺ 是黄色、Mg²⁺ 无色——浅绿色直指一位嫌疑人，但侦探需要化学证据。"),
                DetectiveClue(id: "dt_03_c2",
                    text: "向溶液中滴入 KSCN 溶液——毫无动静。",
                    deduction: "Fe³⁺ 遇 KSCN 会立刻变血红色。无现象，Fe³⁺ 的嫌疑解除。"),
                DetectiveClue(id: "dt_03_c3",
                    text: "再滴入几滴氯水，溶液猛地变成了血红色！",
                    deduction: "氯水把它氧化成了 Fe³⁺，Fe³⁺ 再与 KSCN 显色——「先无后红」正是检验它的标准流程。"),
                DetectiveClue(id: "dt_03_c4",
                    text: "另取原溶液加入 NaOH，白色沉淀迅速变灰绿，最终变成红褐色。",
                    deduction: "Fe(OH)₂ 白色 → 灰绿 → 红褐 Fe(OH)₃，三段变色是铁家族 +2 价的招牌动作。"),
            ],
            verdict: "谜底：Fe²⁺。浅绿色 + KSCN 先无现象、加氯水后变血红 + 氢氧化物三段变色。记住对照：检验 Fe³⁺ 直接 KSCN 变红；检验 Fe²⁺ 必须「先 KSCN 无现象，再氧化变红」。"),

        DetectiveCase(
            id: "dt_04", title: "两性公民档案", stage: .senior, topic: .metals,
            suspects: ["氢氧化铝 Al(OH)₃", "氢氧化镁 Mg(OH)₂", "氢氧化铁 Fe(OH)₃", "氢氧化铜 Cu(OH)₂"],
            answerIndex: 0,
            clues: [
                DetectiveClue(id: "dt_04_c1",
                    text: "嫌疑人是一种白色的不溶物。",
                    deduction: "Fe(OH)₃ 红褐色、Cu(OH)₂ 蓝色，双双出局。白色的 Al(OH)₃ 和 Mg(OH)₂ 仍在嫌疑名单上。"),
                DetectiveClue(id: "dt_04_c2",
                    text: "它毫无悬念地溶解在了稀盐酸中。",
                    deduction: "碱遇酸都得溶——这条线索分不出 Al(OH)₃ 和 Mg(OH)₂，侦探不能急。"),
                DetectiveClue(id: "dt_04_c3",
                    text: "关键证据来了：它居然也溶解在 NaOH 溶液中。",
                    deduction: "既溶于酸又溶于强碱——两性！Mg(OH)₂ 不溶于碱，嫌疑解除，真凶锁定。"),
                DetectiveClue(id: "dt_04_c4",
                    text: "它受热分解后留下的白色粉末，是一种耐高温的材料。",
                    deduction: "分解得 Al₂O₃——熔点极高的耐火材料，旁证坐实。"),
            ],
            verdict: "谜底：Al(OH)₃。白色 + 溶于酸 + 也溶于强碱（两性）。实验室制备它要用「铝盐 + 过量氨水」——若用 NaOH，过量时沉淀会被溶掉。"),

        DetectiveCase(
            id: "dt_05", title: "白烟信号弹", stage: .senior, topic: .nonmetals,
            suspects: ["氨气 NH₃", "氯化氢 HCl", "二氧化硫 SO₂", "二氧化碳 CO₂"],
            answerIndex: 0,
            clues: [
                DetectiveClue(id: "dt_05_c1",
                    text: "嫌疑人是无色气体，有强烈的刺激性气味。",
                    deduction: "CO₂ 无味，先行出局。NH₃、HCl、SO₂ 都刺鼻——还剩三位。"),
                DetectiveClue(id: "dt_05_c2",
                    text: "它极易溶于水——做喷泉实验时，烧瓶里喷出了红色的水柱（预先滴了酚酞）。",
                    deduction: "极易溶 + 水溶液使酚酞变红 = 碱性！HCl、SO₂ 溶液都是酸性——唯一的碱性气体浮出水面。"),
                DetectiveClue(id: "dt_05_c3",
                    text: "它让湿润的红色石蕊试纸变蓝了。",
                    deduction: "中学阶段唯一能使红色石蕊试纸变蓝的气体，身份几乎写在脸上。"),
                DetectiveClue(id: "dt_05_c4",
                    text: "当它遇到蘸有浓盐酸的玻璃棒时，空气中升起了大量白烟。",
                    deduction: "NH₃ + HCl → NH₄Cl 固体小颗粒——白烟是两位老对手见面的招牌动作。"),
            ],
            verdict: "谜底：氨气 NH₃。唯一碱性气体 + 喷泉实验 + 红色石蕊变蓝 + 遇浓盐酸冒白烟。注意「白烟」是固体颗粒，「白雾」才是小液滴——一字之差。"),

        DetectiveCase(
            id: "dt_06", title: "伪装的漂白师", stage: .senior, topic: .nonmetals,
            suspects: ["二氧化硫 SO₂", "氯气 Cl₂", "二氧化碳 CO₂", "臭氧 O₃"],
            answerIndex: 0,
            clues: [
                DetectiveClue(id: "dt_06_c1",
                    text: "嫌疑人是无色气体，闻起来刺鼻。",
                    deduction: "Cl₂ 黄绿色出局；CO₂ 无味出局。剩 SO₂ 和 O₃（低浓度有特殊腥味）。"),
                DetectiveClue(id: "dt_06_c2",
                    text: "它让品红溶液褪了色。",
                    deduction: "SO₂、Cl₂、O₃ 都能让品红褪色——漂白师不止一位，还要看手法。"),
                DetectiveClue(id: "dt_06_c3",
                    text: "侦探把褪色后的品红溶液加热，红色竟然回来了！",
                    deduction: "复原 = 可逆漂白！SO₂ 是「化合型」漂白（生成不稳定无色物质），加热就现原形；氯水和臭氧是氧化型，褪了就回不来——真凶锁定。"),
                DetectiveClue(id: "dt_06_c4",
                    text: "它还让澄清石灰水变浑浊，又是酸雨档案里的常客。",
                    deduction: "酸性氧化物 + 酸雨主犯，与 CO₂ 共享石灰水浑浊技能，但身份已经确认。"),
            ],
            verdict: "谜底：SO₂。「褪色后加热复原」是它与氯水漂白的本质区别：SO₂ 是化合型可逆漂白，HClO 是氧化型不可逆漂白。另记：SO₂ 不能漂白石蕊——石蕊只变红不褪色。"),

        DetectiveCase(
            id: "dt_07", title: "吞下去的造影剂", stage: .senior, topic: .ionReaction,
            suspects: ["硫酸钡 BaSO₄", "碳酸钡 BaCO₃", "氯化银 AgCl", "碳酸钙 CaCO₃"],
            answerIndex: 0,
            clues: [
                DetectiveClue(id: "dt_07_c1",
                    text: "嫌疑人是一种白色沉淀。",
                    deduction: "四位都是白色难溶物——这条线索一个都排除不了，好戏在后头。"),
                DetectiveClue(id: "dt_07_c2",
                    text: "把它丢进稀硝酸里，它纹丝不动。",
                    deduction: "BaCO₃ 和 CaCO₃ 都会冒泡溶解（碳酸盐遇酸放 CO₂）——双双出局。剩 BaSO₄ 与 AgCl。"),
                DetectiveClue(id: "dt_07_c3",
                    text: "光谱档案显示，它灼烧时火焰呈黄绿色。",
                    deduction: "黄绿色焰色是钡的签名——AgCl 嫌疑解除。"),
                DetectiveClue(id: "dt_07_c4",
                    text: "病历记录：患者上午把它喝了下去，下午照了 X 光，安然无恙。",
                    deduction: "可溶性钡盐剧毒，它却能入口——因为既不溶于水也不溶于胃酸，Ba²⁺ 根本出不来。"),
            ],
            verdict: "谜底：BaSO₄（钡餐）。白色 + 不溶于稀硝酸 + 钡的黄绿色焰色。检验 SO₄²⁻ 的终点站就是它：先加稀盐酸排干扰，再加 BaCl₂ 见白色沉淀。"),

        DetectiveCase(
            id: "dt_08", title: "会隐身的紫客", stage: .senior, topic: .nonmetals,
            suspects: ["碘 I₂", "高锰酸钾 KMnO₄", "溴 Br₂", "硫磺 S"],
            answerIndex: 0,
            clues: [
                DetectiveClue(id: "dt_08_c1",
                    text: "嫌疑人是一种紫黑色、有金属光泽的固体。",
                    deduction: "Br₂ 是深红棕色液体、硫磺是淡黄色固体——出局。紫黑色的 I₂ 和 KMnO₄ 还在场。"),
                DetectiveClue(id: "dt_08_c2",
                    text: "微微加热，它没有熔化，直接化作一缕紫色蒸气消失了。",
                    deduction: "升华！不经液态直接气化，紫色蒸气是它的招牌——KMnO₄ 受热是分解放氧气，不会升华。"),
                DetectiveClue(id: "dt_08_c3",
                    text: "它的蒸气飘过一张涂了淀粉糊的纸，纸面泛起了蓝色。",
                    deduction: "遇淀粉变蓝——全中学化学最专一的显色反应，身份已无悬念。"),
                DetectiveClue(id: "dt_08_c4",
                    text: "卷宗记载，人们常从海带灰里寻找它的踪迹。",
                    deduction: "海产品富集它；食盐里加的是它的化合物 KIO₃（不是单质）。"),
            ],
            verdict: "谜底：碘 I₂。紫黑色固体 + 易升华 + 遇淀粉变蓝 + 海带提碘。升华可用于分离提纯碘（物理变化）；加碘盐加的是 KIO₃。"),
    ]

    // MARK: 有机两案

    private static let organic: [DetectiveCase] = [
        DetectiveCase(
            id: "dt_09", title: "催熟的隐形手", stage: .senior, topic: .organic,
            suspects: ["乙烯 C₂H₄", "甲烷 CH₄", "乙烷 C₂H₆", "苯 C₆H₆"],
            answerIndex: 0,
            clues: [
                DetectiveClue(id: "dt_09_c1",
                    text: "嫌疑人是一种无色气体，密度与空气接近。",
                    deduction: "苯常温下是液体——出局。三种气态烃还在嫌疑名单上。"),
                DetectiveClue(id: "dt_09_c2",
                    text: "把它通入溴的四氯化碳溶液，橙色褪去了。",
                    deduction: "褪色 = 与 Br₂ 加成 = 含不饱和键！甲烷、乙烷是饱和烷烃，对溴无动于衷——双双出局。"),
                DetectiveClue(id: "dt_09_c3",
                    text: "酸性高锰酸钾溶液也被它褪了色。",
                    deduction: "双键被氧化——印证不饱和身份。注意：这一手「除杂」不能用，因为会把它氧化成 CO₂。"),
                DetectiveClue(id: "dt_09_c4",
                    text: "果农档案：把它和生香蕉关在一起，香蕉几天就黄了。",
                    deduction: "植物催熟剂的身份——也是石油化工的「第一基石」，产量衡量一国石化水平。"),
            ],
            verdict: "谜底：乙烯 C₂H₄。使溴的 CCl₄ 溶液褪色（加成）+ 使酸性 KMnO₄ 褪色（氧化）+ 催熟剂。鉴别用溴水/KMnO₄ 都行，但除杂只能用溴水——KMnO₄ 会把乙烯氧化成气体 CO₂ 引入新杂质。"),

        DetectiveCase(
            id: "dt_10", title: "镜子背后的客人", stage: .senior, topic: .organic,
            suspects: ["乙醛 CH₃CHO", "乙醇 C₂H₅OH", "乙酸 CH₃COOH", "乙酸乙酯"],
            answerIndex: 0,
            clues: [
                DetectiveClue(id: "dt_10_c1",
                    text: "嫌疑人是无色、有刺激性气味的液体。",
                    deduction: "四位都是无色液体，乙酸乙酯是香味不是刺激性——初步排除一位。"),
                DetectiveClue(id: "dt_10_c2",
                    text: "把它滴进 Na₂CO₃ 溶液——没有气泡。",
                    deduction: "乙酸会与碳酸钠反应冒 CO₂（酸性：乙酸 > 碳酸）——乙酸出局。"),
                DetectiveClue(id: "dt_10_c3",
                    text: "它与银氨溶液一起水浴加热后，试管内壁亮起了一面银镜。",
                    deduction: "银镜反应 = 含醛基！乙醇没有醛基不显银镜——真凶锁定。"),
                DetectiveClue(id: "dt_10_c4",
                    text: "档案补充：它可以由乙醇在铜催化下氧化而来，再氧化一步就变成乙酸。",
                    deduction: "乙醇 → 乙醛 → 乙酸的氧化链条中间站，身份完全吻合。"),
            ],
            verdict: "谜底：乙醛 CH₃CHO。不与 Na₂CO₃ 反应（排乙酸）+ 银镜反应（锁定醛基）+ 居于乙醇氧化链中间。银镜反应务必水浴加热、银氨溶液现配现用。"),
    ]
}
