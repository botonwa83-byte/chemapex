import Foundation

// MARK: - 虚拟实验台关卡（一期 5 关：初中 3 + 高中 2）
// 红线：每个装置选择与拒绝理由必须符合教材标准（干燥剂酸碱配对、收集法三重判断等）。

enum LabBenchData {
    static let all: [LabSetup] = [oxygen, hydrogen, carbonDioxide, chlorine, ammonia]

    // MARK: 初中 · 制取氧气

    private static let oxygen = LabSetup(
        id: "lab_o2", title: "制取氧气", stage: .junior,
        targetDescription: "用高锰酸钾制取一瓶较纯净的氧气。按顺序搭好装置链。",
        slots: [
            LabSlot(id: "lab_o2_s1", role: "发生装置", correctCardId: "o2_gen",
                    successNote: "固体加热型：试管口略向下倾斜（防冷凝水倒流炸裂试管），管口塞一团棉花（防 KMnO₄ 粉末进入导管）。"),
            LabSlot(id: "lab_o2_s2", role: "收集装置", correctCardId: "o2_collect",
                    successNote: "O₂ 不易溶于水，排水法收集更纯净，且便于观察是否集满。"),
        ],
        pool: [
            ApparatusCard(id: "o2_gen", name: "KMnO₄ 固体 · 加热", detail: "紫黑色固体装入试管，酒精灯加热", icon: "flame"),
            ApparatusCard(id: "o2_collect", name: "排水法收集", detail: "集气瓶盛满水倒置于水槽", icon: "drop"),
            ApparatusCard(id: "o2_zn", name: "锌粒 + 稀硫酸", detail: "固液常温反应", icon: "testtube.2"),
            ApparatusCard(id: "o2_down", name: "向下排空气法", detail: "瓶口朝下收集", icon: "arrow.down.square"),
        ],
        rejections: [
            "o2_zn": "锌与稀硫酸是制氢气的发生装置——制氧气要加热高锰酸钾。",
            "o2_down": "O₂ 密度比空气大，向下排空气收集会全跑光；本关用更纯净的排水法。",
        ],
        examPoint: "发生装置看「反应物状态 + 反应条件」：固体加热型。结束时先撤导管再熄灯，防止水槽里的水倒吸炸裂热试管。")

    // MARK: 初中 · 制取氢气

    private static let hydrogen = LabSetup(
        id: "lab_h2", title: "制取干燥的氢气", stage: .junior,
        targetDescription: "制取一瓶干燥、较纯净的氢气。",
        slots: [
            LabSlot(id: "lab_h2_s1", role: "发生装置", correctCardId: "h2_gen",
                    successNote: "固液常温型。选锌是因为速率适中：镁太快难控制，铁太慢。"),
            LabSlot(id: "lab_h2_s2", role: "干燥", correctCardId: "h2_dry",
                    successNote: "浓硫酸有吸水性，且不与 H₂ 反应——干燥剂选择 = 酸碱配对。"),
            LabSlot(id: "lab_h2_s3", role: "收集装置", correctCardId: "h2_collect",
                    successNote: "H₂ 难溶于水，排水法收集纯度高；点燃前务必验纯。"),
        ],
        pool: [
            ApparatusCard(id: "h2_gen", name: "锌粒 + 稀硫酸", detail: "固液常温反应", icon: "testtube.2"),
            ApparatusCard(id: "h2_dry", name: "浓硫酸洗气", detail: "气体从长管进短管出", icon: "drop.triangle"),
            ApparatusCard(id: "h2_collect", name: "排水法收集", detail: "集气瓶盛满水倒置", icon: "drop"),
            ApparatusCard(id: "h2_conc", name: "锌粒 + 浓硫酸", detail: "固液反应", icon: "exclamationmark.triangle"),
            ApparatusCard(id: "h2_cu", name: "铜片 + 稀硫酸", detail: "固液常温", icon: "testtube.2"),
            ApparatusCard(id: "h2_up", name: "向上排空气法", detail: "瓶口朝上收集", icon: "arrow.up.square"),
        ],
        rejections: [
            "h2_conc": "浓硫酸有强氧化性，与锌反应放出的是 SO₂ 不是 H₂——浓稀有别！",
            "h2_cu": "铜排在金属活动性顺序氢之后，不与稀硫酸反应。",
            "h2_up": "H₂ 是最轻的气体，向上排空气收集会全跑光；本关用更纯的排水法。",
        ],
        examPoint: "氢气三件事：发生装置固液常温、点燃前验纯、还原性实验「先通气后点灯，先撤灯后停气」。")

    // MARK: 初中 · 制取二氧化碳

    private static let carbonDioxide = LabSetup(
        id: "lab_co2", title: "制取干燥的二氧化碳", stage: .junior,
        targetDescription: "用大理石制取干燥、纯净的 CO₂（混有 HCl 和水蒸气需净化）。",
        slots: [
            LabSlot(id: "lab_co2_s1", role: "发生装置", correctCardId: "co2_gen",
                    successNote: "固液常温型：大理石 + 稀盐酸。"),
            LabSlot(id: "lab_co2_s2", role: "除杂", correctCardId: "co2_purify",
                    successNote: "饱和 NaHCO₃ 溶液只吸收 HCl（生成 NaCl + CO₂），不吸收 CO₂ 本身——除杂不引新杂、不伤主气。"),
            LabSlot(id: "lab_co2_s3", role: "干燥", correctCardId: "co2_dry",
                    successNote: "浓硫酸是酸性干燥剂，与酸性气体 CO₂ 和平共处。"),
            LabSlot(id: "lab_co2_s4", role: "收集装置", correctCardId: "co2_collect",
                    successNote: "CO₂ 密度比空气大且能溶于水——向上排空气法。验满：燃着的木条放瓶口熄灭。"),
        ],
        pool: [
            ApparatusCard(id: "co2_gen", name: "大理石 + 稀盐酸", detail: "固液常温反应", icon: "testtube.2"),
            ApparatusCard(id: "co2_purify", name: "饱和 NaHCO₃ 溶液洗气", detail: "除去混入的 HCl", icon: "bubbles.and.sparkles"),
            ApparatusCard(id: "co2_dry", name: "浓硫酸洗气", detail: "吸收水蒸气", icon: "drop.triangle"),
            ApparatusCard(id: "co2_collect", name: "向上排空气法", detail: "瓶口朝上，导管伸到瓶底", icon: "arrow.up.square"),
            ApparatusCard(id: "co2_h2so4", name: "大理石 + 稀硫酸", detail: "固液常温反应", icon: "exclamationmark.triangle"),
            ApparatusCard(id: "co2_naoh", name: "NaOH 溶液洗气", detail: "强碱吸收酸性气体", icon: "bubbles.and.sparkles"),
            ApparatusCard(id: "co2_lime", name: "碱石灰干燥管", detail: "碱性固体干燥剂", icon: "cylinder"),
            ApparatusCard(id: "co2_water", name: "排水法收集", detail: "集气瓶盛满水倒置", icon: "drop"),
        ],
        rejections: [
            "co2_h2so4": "稀硫酸与大理石生成微溶的 CaSO₄，覆盖在大理石表面让反应很快停止。",
            "co2_naoh": "NaOH 会把 CO₂ 也吸收掉——除杂第一原则：不能伤害主气体。",
            "co2_lime": "碱石灰是碱性干燥剂，会吸收酸性的 CO₂——干燥剂要酸碱配对。",
            "co2_water": "CO₂ 能溶于水且与水反应，排水法损失太大。",
        ],
        examPoint: "净化顺序「先除杂后干燥」：洗气会带出水汽，干燥必须放在最后一站。")

    // MARK: 高中 · 制取氯气

    private static let chlorine = LabSetup(
        id: "lab_cl2", title: "制取干燥的氯气", stage: .senior,
        targetDescription: "实验室制取干燥纯净的 Cl₂（混有 HCl 和水蒸气），并处理有毒尾气。",
        slots: [
            LabSlot(id: "lab_cl2_s1", role: "发生装置", correctCardId: "cl2_gen",
                    successNote: "MnO₂ + 浓盐酸需要加热；4 mol HCl 中只有一半被氧化。"),
            LabSlot(id: "lab_cl2_s2", role: "除杂", correctCardId: "cl2_brine",
                    successNote: "饱和食盐水吸收 HCl，同时高浓度 Cl⁻ 抑制 Cl₂ 溶解——一举两得。"),
            LabSlot(id: "lab_cl2_s3", role: "干燥", correctCardId: "cl2_dry",
                    successNote: "浓硫酸与 Cl₂ 互不相犯——酸性干燥剂配酸性气体。"),
            LabSlot(id: "lab_cl2_s4", role: "收集装置", correctCardId: "cl2_collect",
                    successNote: "Cl₂ 密度比空气大——向上排空气法；黄绿色集满肉眼可见。"),
            LabSlot(id: "lab_cl2_s5", role: "尾气处理", correctCardId: "cl2_tail",
                    successNote: "NaOH 溶液吸收：Cl₂ + 2NaOH → NaCl + NaClO + H₂O。有毒气体必须有这一站。"),
        ],
        pool: [
            ApparatusCard(id: "cl2_gen", name: "MnO₂ + 浓盐酸 · 加热", detail: "圆底烧瓶 + 分液漏斗 + 酒精灯", icon: "flame"),
            ApparatusCard(id: "cl2_brine", name: "饱和食盐水洗气", detail: "除去混入的 HCl", icon: "bubbles.and.sparkles"),
            ApparatusCard(id: "cl2_dry", name: "浓硫酸洗气", detail: "吸收水蒸气", icon: "drop.triangle"),
            ApparatusCard(id: "cl2_collect", name: "向上排空气法", detail: "瓶口朝上收集黄绿色气体", icon: "arrow.up.square"),
            ApparatusCard(id: "cl2_tail", name: "NaOH 溶液尾气瓶", detail: "吸收多余 Cl₂", icon: "shield"),
            ApparatusCard(id: "cl2_dilute", name: "MnO₂ + 稀盐酸 · 加热", detail: "圆底烧瓶 + 酒精灯", icon: "exclamationmark.triangle"),
            ApparatusCard(id: "cl2_naoh_purify", name: "NaOH 溶液洗气", detail: "强碱洗气瓶", icon: "bubbles.and.sparkles"),
            ApparatusCard(id: "cl2_sodalime", name: "碱石灰干燥管", detail: "碱性固体干燥剂", icon: "cylinder"),
            ApparatusCard(id: "cl2_water_collect", name: "排水法收集", detail: "集气瓶盛满水倒置", icon: "drop"),
            ApparatusCard(id: "cl2_limewater", name: "澄清石灰水尾气瓶", detail: "Ca(OH)₂ 稀溶液", icon: "shield"),
        ],
        rejections: [
            "cl2_dilute": "稀盐酸的还原性不够，MnO₂ 氧化不动它——必须用浓盐酸，且随反应变稀后反应自动停止。",
            "cl2_naoh_purify": "NaOH 把 Cl₂ 本尊也吸收光了——除杂不能伤主气。",
            "cl2_sodalime": "碱石灰是碱性干燥剂，会与 Cl₂ 反应——只能用浓硫酸。",
            "cl2_water_collect": "Cl₂ 能溶于水且与水反应，排水法损失太大。",
            "cl2_limewater": "Ca(OH)₂ 溶解度太小，石灰水浓度太低，吸收不完全——尾气要用 NaOH 浓溶液。",
        ],
        examPoint: "一条龙顺序：发生 → 除杂（饱和食盐水）→ 干燥（浓硫酸）→ 收集 → 尾气（NaOH）。先除杂后干燥的顺序不能颠倒。")

    // MARK: 高中 · 制取氨气

    private static let ammonia = LabSetup(
        id: "lab_nh3", title: "制取干燥的氨气", stage: .senior,
        targetDescription: "实验室制取干燥的 NH₃——唯一的碱性气体，装置链处处反着来。",
        slots: [
            LabSlot(id: "lab_nh3_s1", role: "发生装置", correctCardId: "nh3_gen",
                    successNote: "固固加热型（同制 O₂）：NH₄Cl 与 Ca(OH)₂ 混合加热，试管口略向下倾斜。"),
            LabSlot(id: "lab_nh3_s2", role: "干燥", correctCardId: "nh3_dry",
                    successNote: "碱性气体配碱性干燥剂——碱石灰是 NH₃ 唯一的标准答案。"),
            LabSlot(id: "lab_nh3_s3", role: "收集装置", correctCardId: "nh3_collect",
                    successNote: "NH₃ 密度比空气小——向下排空气法。验满：湿润红色石蕊试纸放瓶口变蓝。"),
            LabSlot(id: "lab_nh3_s4", role: "尾气处理", correctCardId: "nh3_tail",
                    successNote: "倒扣漏斗口接近水面：既吸收 NH₃ 又防倒吸——极易溶气体的标配。"),
        ],
        pool: [
            ApparatusCard(id: "nh3_gen", name: "NH₄Cl + Ca(OH)₂ · 加热", detail: "固体混合装入试管加热", icon: "flame"),
            ApparatusCard(id: "nh3_dry", name: "碱石灰干燥管", detail: "碱性固体干燥剂", icon: "cylinder"),
            ApparatusCard(id: "nh3_collect", name: "向下排空气法", detail: "瓶口朝下收集", icon: "arrow.down.square"),
            ApparatusCard(id: "nh3_tail", name: "倒扣漏斗 · 水面吸收", detail: "漏斗口接近水面", icon: "shield"),
            ApparatusCard(id: "nh3_only", name: "单独加热 NH₄Cl", detail: "固体加热", icon: "exclamationmark.triangle"),
            ApparatusCard(id: "nh3_h2so4", name: "浓硫酸洗气", detail: "酸性液体干燥剂", icon: "drop.triangle"),
            ApparatusCard(id: "nh3_cacl2", name: "无水 CaCl₂ 干燥管", detail: "中性固体干燥剂", icon: "cylinder"),
            ApparatusCard(id: "nh3_water_collect", name: "排水法收集", detail: "集气瓶盛满水倒置", icon: "drop"),
            ApparatusCard(id: "nh3_direct", name: "导管直接插入水中", detail: "尾气导管入水", icon: "exclamationmark.triangle"),
        ],
        rejections: [
            "nh3_only": "NH₄Cl 受热分解出的 NH₃ 和 HCl 在试管口遇冷又重新化合成 NH₄Cl——白忙一场。",
            "nh3_h2so4": "NH₃ 是碱性气体，会被浓硫酸吸收——酸碱不配对。",
            "nh3_cacl2": "CaCl₂ 会与 NH₃ 结合生成 CaCl₂·8NH₃——专门坑 NH₃ 的「中性」干燥剂。",
            "nh3_water_collect": "NH₃ 极易溶于水（1 体积水溶 700 体积 NH₃），排水法颗粒无收。",
            "nh3_direct": "极易溶气体的导管直接插入水中会发生倒吸——必须加防倒吸装置。",
        ],
        examPoint: "NH₃ 全程反常：碱性干燥剂、向下排空气、防倒吸尾气——「唯一碱性气体」四个字贯穿装置链每一站。")
}
