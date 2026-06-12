import XCTest
@testable import ChemApex

final class ChemApexTests: XCTestCase {

    /// 主线节点引用的题目和 Boss 战例必须真实存在。
    func testMainLineReferencesResolve() {
        let problemIds = Set(ProblemBank.all.map(\.id))
        for node in MainLineData.nodes {
            XCTAssertFalse(node.problemIds.isEmpty, "节点 \(node.id) 没有配题")
            for pid in node.problemIds {
                XCTAssertTrue(problemIds.contains(pid), "节点 \(node.id) 引用了不存在的题 \(pid)")
            }
            if let boss = node.bossCaseId {
                let bossProblem = DescentCases.bossCase(id: boss)
                XCTAssertNotNil(bossProblem, "节点 \(node.id) 引用了不存在的 Boss \(boss)")
                XCTAssertNotNil(bossProblem?.dualSolution, "Boss \(boss) 缺少双解")
            }
        }
    }

    /// 主线顺序必须严格递增且节点 ID 唯一。
    func testMainLineOrdering() {
        let orders = MainLineData.nodes.map(\.order)
        XCTAssertEqual(orders, Array(1...MainLineData.nodes.count))
        XCTAssertEqual(Set(MainLineData.nodes.map(\.id)).count, MainLineData.nodes.count)
    }

    /// 所有 ID 全局唯一；答案下标必须落在选项范围内。
    func testProblemBankIntegrity() {
        let ids = ProblemBank.all.map(\.id)
        XCTAssertEqual(Set(ids).count, ids.count, "题目 ID 重复")
        for p in ProblemBank.all {
            XCTAssertTrue(p.options.indices.contains(p.answerIndex), "题 \(p.id) 答案下标越界")
            XCTAssertGreaterThanOrEqual(p.options.count, 2)
        }
    }

    /// 题目声明的 nodeId 必须与主线节点的配题双向一致。
    func testNodeIdsConsistent() {
        let nodeIds = Set(MainLineData.nodes.map(\.id))
        for p in ProblemBank.all {
            if let nid = p.nodeId {
                XCTAssertTrue(nodeIds.contains(nid), "题 \(p.id) 的 nodeId \(nid) 不存在")
            }
        }
    }

    /// 双解战例耗时比必须 > 1（秒杀必须真的快）。
    func testDescentCasesFaster() {
        XCTAssertFalse(DescentCases.all.isEmpty)
        for p in DescentCases.all {
            guard let dual = p.dualSolution else {
                XCTFail("战例 \(p.id) 缺少双解"); continue
            }
            XCTAssertGreaterThan(dual.timeRatio, 1, "战例 \(p.id) 的秒杀解不比常规解快")
            XCTAssertFalse(dual.plainTalk.isEmpty, "战例 \(p.id) 缺少说人话")
        }
    }

    /// 化学神探案件完整性：答案下标合法、线索 ≥3、嫌疑人不重复、星级规则单调。
    func testDetectiveCasesIntegrity() {
        XCTAssertFalse(DetectiveData.all.isEmpty)
        let ids = DetectiveData.all.map(\.id)
        XCTAssertEqual(Set(ids).count, ids.count, "案件 ID 重复")
        for c in DetectiveData.all {
            XCTAssertTrue(c.suspects.indices.contains(c.answerIndex), "案件 \(c.id) 答案下标越界")
            XCTAssertGreaterThanOrEqual(c.clues.count, 3, "案件 \(c.id) 线索太少")
            XCTAssertEqual(Set(c.suspects).count, c.suspects.count, "案件 \(c.id) 嫌疑人重复")
            XCTAssertFalse(c.verdict.isEmpty, "案件 \(c.id) 缺结案陈词")
            for clue in c.clues {
                XCTAssertFalse(clue.deduction.isEmpty, "线索 \(clue.id) 缺推理价值")
            }
        }
        // 星级规则：2 条线索零失误 = 3 星；错猜降星但保底 1 星
        XCTAssertEqual(DetectiveManager.stars(cluesRevealed: 2, wrongGuesses: 0), 3)
        XCTAssertEqual(DetectiveManager.stars(cluesRevealed: 3, wrongGuesses: 0), 2)
        XCTAssertEqual(DetectiveManager.stars(cluesRevealed: 4, wrongGuesses: 0), 1)
        XCTAssertEqual(DetectiveManager.stars(cluesRevealed: 2, wrongGuesses: 5), 1)
    }

    /// 元素与方程式数据完整性。
    func testAtlasDataIntegrity() {
        let numbers = ElementData.all.map(\.number)
        XCTAssertEqual(Set(numbers).count, numbers.count, "元素重复")
        // 前四周期必须完整（36 个）
        XCTAssertEqual(ElementData.gridElements.count, 36)
        let eqIds = EquationLibrary.all.map(\.id)
        XCTAssertEqual(Set(eqIds).count, eqIds.count, "方程式 ID 重复")
    }
}
