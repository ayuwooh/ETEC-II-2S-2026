const dayofweek = document.getElementById('dayofweek')

dayofweek.addEventListener('click', function () {
  const input = prompt('Digite um número de 1 a 7 para o dia da semana:')

  if (input === null) {
    return
  }

  const day = Number(input.trim())

  if (day === 1) {
    alert('Domingo')
  } else if (day === 2) {
    alert('Segunda')
  } else if (day === 3) {
    alert('Terça')
  } else if (day === 4) {
    alert('Quarta')
  } else if (day === 5) {
    alert('Quinta')
  } else if (day === 6) {
    alert('Sexta')
  } else if (day === 7) {
    alert('Sábado')
  } else {
    alert('Dia Inválido')
  }
})

const dealcalc = document.getElementById('dealcalc')

dealcalc.addEventListener('click', function () {
  const input = prompt('Digite o valor de compra:')

  if (input === null) {
    return
  }

  const buyvalue = Number(input.trim())

  if (buyvalue > 500) {
    dealvalue = buyvalue - 0.1 * buyvalue
    alert(
      `Valor original: R$ ${buyvalue} | Valor com desconto: R$ ${dealvalue}`
    )
  } else if (buyvalue > 200 && buyvalue < 500) {
    dealvalue = buyvalue - 0.05 * buyvalue
    alert(
      `Valor original: R$ ${buyvalue} | Valor com desconto: R$ ${dealvalue}`
    )
  } else {
    alert(`Sem desconto aplicado`)
  }
})

const numbercomp = document.getElementById('numbercomp')

numbercomp.addEventListener('click', function () {
  const input1 = prompt('Digite um número:')
  const input2 = prompt('Digite outro número:')

  if (input1 === null || input2 === null) {
    return
  }

  const value1 = Number(input1.trim())
  const value2 = Number(input2.trim())

  if (value1 === value2) {
    alert('Os números são iguais.')
  } else if (value1 > value2) {
    alert('O primeiro número é maior.')
  } else {
    alert('O segundo número é maior.')
  }
})

const speedclass = document.getElementById('speedclass')

speedclass.addEventListener('click', function () {
  const input = prompt('Digite uma velocidade em KM:')

  if (input === null) {
    return
  }

  const speed = Number(input.trim())

  if (speed > 100) {
    alert('Velocidade Muito Grave')
  } else if (speed > 81) {
    alert('Multa leve')
  } else {
    alert('Velocidade Permitida')
  }
})

const tempverif = document.getElementById('tempverif')

tempverif.addEventListener('click', function () {
  const input = prompt('Digite uma temperatura em Celcius:')

  if (input === null) {
    return
  }

  const temp = Number(input.trim())

  if (temp > 25) {
    alert('Calor')
  } else if (temp > 16) {
    alert('Agradável')
  } else if (temp > 0) {
    alert('Frio')
  } else {
    alert('Muito Frio')
  }
})

const petage = document.getElementById('petage')

petage.addEventListener('click', function () {
  const input = prompt('Digite a idade do cão:')

  if (input === null) {
    return
  }

  let age = Number(input.trim())
  age = age * 7

  if (age > 50) {
    alert('Cão idoso')
  } else {
    alert('Cão jovem')
  }
})

const profession = document.getElementById('profession')

profession.addEventListener('click', function () {
  const input = prompt('Digite a profissão:')

  if (input === null) {
    return;
  }

  const prof = input.trim().toLowerCase();

  if (prof === 'gerente') {
    alert('Salário: R$5.000')
  } else if (prof === 'programador') {
    alert('Salário: R$4.000')
  } else if (prof === 'estagiário' || prof === 'estagiario') {
    alert('Salário: R$1.500')
  } else {
    alert('Cargo não identificado')
  }
})
