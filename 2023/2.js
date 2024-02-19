import { readFileSync } from "fs"
import downloadInput from "../DownloadInput.js"

const test = 
`two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen`
// const input = await downloadInput('http://adventofcode.com/2023/day/1/input')
const input = readFileSync('1.txt', 'utf8')
const lines = input.split('\n')

const digits = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']
const spelledOut = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'zero']
const digitMap = {
  'one': '1',
  'two': '2',
  'three': '3',
  'four': '4',
  'five': '5',
  'six': '6',
  'seven': '7',
  'eight': '8',
  'nine': '9',
  'zero': '0'
}

function extractDigits(line) {
  // console.log(line)
  for (let i = 0; i<line.length; i++) {
    // console.log(i, line[i])
    for (const [number, digit] of Object.entries(digitMap)) {
      const substr = line.substring(i)
      if (substr.startsWith(number)) {
        line = line.replace(number, digit)
        // console.log(line)
      }
    }
  }
  const numbers = line.split('').filter(c => digits.includes(c))
  return numbers
}

let sum = 0
for (const line of lines) {
  const numbers = extractDigits(line)
  console.log(`${line}: ${numbers}`)
  if (numbers.length == 0) {
    continue
  }
  const a = numbers[0]
  const b = numbers[numbers.length - 1]
  const c = Number(a+b)
  console.log(`${a} + ${b} = ${c}`)
  sum += c
}
console.log(sum)
