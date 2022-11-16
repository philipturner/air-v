//
//  BitcodeReader.swift
//  
//
//  Created by Philip Turner on 11/15/22.
//

import Foundation

// Not a fully functional reader, just enough to parse the tested ".air" file.
internal func readBitcode(_ bitcodeData: Data, isMetal: Bool) {
  let numBytes = bitcodeData.count
  print()
  print("Number of bytes: \(numBytes)")
  
  var bitcode = malloc(bitcodeData.count)!
  let originalBitcode = bitcode
  defer { free(originalBitcode) }
  bitcodeData.copyBytes(
    to: bitcode.assumingMemoryBound(to: UInt8.self), count: numBytes)
  
  do {
    
  }
}
