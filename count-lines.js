const fs = require('fs')

const inputFolder = '/data/inputs'
const outputFolder = '/data/outputs'

function countLines(file) {
  console.log(`Start counting for ${file}`)
  const fileBuffer = fs.readFileSync(file)
  const toString = fileBuffer.toString()
  const splitLines = toString.split('\n')
  const noLines = splitLines.length
  fs.appendFileSync(`${outputFolder}/output.log`, `${file},${noLines}\r\n`)
  console.log(`Finished. We have ${noLines} lines in ${file}` )
}

function processFolder(folder) {
  const files = fs.readdirSync(folder)

  for (let i = 0; i < files.length; i++) {
    const file = files[i]
    const fullPath = `${folder}/${file}`
    if (fs.statSync(fullPath).isDirectory()) {
      processFolder(fullPath)
    } else {
      countLines(fullPath)
    }
  }
}

processFolder(inputFolder)
