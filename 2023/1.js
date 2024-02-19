import { readFileSync } from "fs"
import downloadInput from "../DownloadInput.js"

const test = 
`1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet`
// const input = await downloadInput('http://adventofcode.com/2023/day/1/input')
const input = readFileSync('2023/1.txt', 'utf8')
const lines = input.split('\n')

const digits = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']
let sum = 0
for (const line of lines) {
  const numbers = line.split('').filter(c => digits.includes(c))
  if (numbers.length == 0) {
    continue
  }
  const a = numbers[0]
  const b = numbers[numbers.length - 1]
  const c = Number(a+b)
  sum += c
}
console.log(sum)
