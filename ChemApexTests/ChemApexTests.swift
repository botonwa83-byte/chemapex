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
