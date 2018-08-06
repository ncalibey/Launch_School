const SCORES = {
  1: ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],
  2: ['D', 'G'],
  3: ['B', 'C', 'M', 'P'],
  4: ['F', 'H', 'V', 'W', 'Y'],
  5: ['K'],
  8: ['J', 'X'],
  10: ['Q', 'Z']
};

function Scrabble(word) {
  let score = 0;

  if (!word) return score;

  word.toUpperCase().split('').forEach(letter => {
    for (let point in SCORES) {
      if (SCORES[point].indexOf(letter) !== -1) {
        score += Number(point);
      }
    }
  });

  return score;
}

console.log(Scrabble('street'));
