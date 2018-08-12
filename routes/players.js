// allplayers function
// function getAllPlayers() {
//     let allplayers = [];
//     anzahlitemsingamesarray = games.length;
//     for (i = 0; i < anzahlitemsingamesarray; i++) {
//         let resultplayera = allplayers.find(c => c === games[i].playerA);
//         if (!resultplayera) {  
//             allplayers.push(games[i].playerA);
//         }
//         let resultplayerb = allplayers.find(c => c === games[i].playerB);
//         if (!resultplayerb) {
//             allplayers.push(games[i].playerB);
//         }
//     }
//     sorted = allplayers.sort();
//     return sorted;
// }


// define routes




// here can go an endpoint to list all players
// that have played on the table
// app.get('/api/v1/players', (req, res) => {
//     const tmpplayers = getAllPlayers();
//     res.send(tmpplayers);
//     console.log('someone listed your players');
// });