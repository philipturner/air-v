import XCTest
@testable import AIRV
import Metal

final class AIRVTests: XCTestCase {
  func testMetallibWorks() {
    // Test that resources are copied into test suite.
    let metallibPath = fetchPath(forResource: "vecAdd_msl", ofType: "metallib")
    
    // Initialize Metal resources
    let device = MTLCreateSystemDefaultDevice()!
    let commandQueue = device.makeCommandQueue()!
    let library = try! device.makeLibrary(URL: URL(filePath: metallibPath))
    let function = library.makeFunction(name: "vecAdd")!
    let pipeline = try! device.makeComputePipelineState(function: function)
    
    // Prepare sample data.
    let bufferLength = 20 * MemoryLayout<Float>.stride
    let bufferA = device.makeBuffer(length: bufferLength)!
    let bufferB = device.makeBuffer(length: bufferLength)!
    let bufferC = device.makeBuffer(length: bufferLength)!
    
    let inputA = (0..<20).map { Float($0) }
    let inputB = (20..<40).map { Float($0) }
    let inputC = [Float](repeating: 0, count: 20)
    memcpy(bufferA.contents(), inputA, bufferLength)
    memcpy(bufferB.contents(), inputB, bufferLength)
    memcpy(bufferC.contents(), inputC, bufferLength)
    
    // Run sample command through, modifying only floats at index 10 and 11.
    let commandBuffer = commandQueue.makeCommandBuffer()!
    let computeEncoder = commandBuffer.makeComputeCommandEncoder()!
    computeEncoder.setComputePipelineState(pipeline)
    computeEncoder.setBuffer(bufferA, offset: 0, index: 0)
    computeEncoder.setBuffer(bufferB, offset: 0, index: 1)
    computeEncoder.setBuffer(bufferC, offset: 0, index: 2)
    
    var n: UInt32 = 1000
    computeEncoder.setBytes(&n, length: 4, index: 3)
    computeEncoder.dispatchThreads(
      MTLSizeMake(1,1,1), threadsPerThreadgroup: MTLSizeMake(1,1,1))
    computeEncoder.endEncoding()
    commandBuffer.commit()
    commandBuffer.waitUntilCompleted()
    
    // Validate the outputs.
    var outputC = inputC
    outputC[10] = inputA[10] + inputB[10]
    outputC[11] = inputA[11] + inputB[11]
    let result = memcmp(bufferC.contents(), outputC, bufferLength)
    XCTAssertEqual(result, 0, "Shader produced unexpected outputs.")
  }
}
