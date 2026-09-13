document.addEventListener('DOMContentLoaded', function () {
  const linhas = document.querySelectorAll('.linha');

  linhas.forEach(function (linha) {
    const valor1 = linha.querySelector('.valor1');
    const valor2 = linha.querySelector('.valor2');
    const botaoOp = linha.querySelector('.op');
    const resultado = linha.querySelector('.resultado');
    const botaoLimpar = linha.querySelector('.limpar');

    botaoOp.addEventListener('click', function () {
      const num1 = parseFloat(valor1.value);
      const num2 = parseFloat(valor2.value);
      const operacao = botaoOp.dataset.op;

      if (isNaN(num1) || isNaN(num2)) {
        resultado.value = 'Erro';
        return;
      }

      let res;
      switch (operacao) {
        case '+':
          res = num1 + num2;
          break;
        case '-':
          res = num1 - num2;
          break;
        case '*':
          res = num1 * num2;
          break;
        case '/':
          res = num2 === 0 ? 'Erro' : num1 / num2;
          break;
      }

      resultado.value = res;
    });

    botaoLimpar.addEventListener('click', function () {
      valor1.value = '';
      valor2.value = '';
      resultado.value = '';
    });
  });
});