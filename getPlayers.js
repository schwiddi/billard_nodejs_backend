/*jshint esversion: 6 */
// temporar Database :)
const games = [
    { id: 1, playerA: 'Schwiddi', playerB: 'Basil', scorePlayerA: 1, scorePlayerB: 0 },
    { id: 2, playerA: 'Schwiddi', playerB: 'Basil', scorePlayerA: 0, scorePlayerB: 1 },
    { id: 3, playerA: 'Mani', playerB: 'Basil', scorePlayerA: 0, scorePlayerB: 1 },
    { id: 4, playerA: 'Hazem', playerB: 'Schwiddi', scorePlayerA: 1, scorePlayerB: 0 }, 
    { id: 5, playerA: 'Schwiddi', playerB: 'Hazem', scorePlayerA: 0, scorePlayerB: 1 }
];


// allplayers function
function getAllPlayers() {
    let allplayers = [];

    anzahlitemsingamesarray = games.length;
    
    for (i = 0; i < anzahlitemsingamesarray; i++) {
        let result = allplayers.find(c => c === games[i].playerA);
        if (!result) {  
            allplayers.push(games[i].playerA);
        }
    }
    
    for (i = 0; i < anzahlitemsingamesarray; i++) {
        let result = allplayers.find(c => c === games[i].playerB);
        if (!result) {
            allplayers.push(games[i].playerB);
        }
    }
    return allplayers;
}

const bla = getAllPlayers();
console.log(bla);