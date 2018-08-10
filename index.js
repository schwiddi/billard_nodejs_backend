// hol dir express
const express = require('express');
// das gibt ne funktion zurück also schreibe ich es in eine const

// gib hier mal express aus
//console.log(express);

// doku --> http://expressjs.com/de/4x/api.html

// nun nutze diese funktionen als app, das ist so konvention offensichtlich
const app = express();
// hier führst du express() aus, die klammern sagen ausführen heissen irgendwie parasynthese
// dann schreibst du den output in die const app

// gebe mal die app aus, um zu schauen was ide alles für funktionen oder methoden hat wie auch immer..
//console.log('##############################################');
//console.log(app);

const port = 3001

app.listen(1337, () => {
    //earlier usage
    console.log('listener started on ' + port ' ...')
    // now you can do this
    console.log('listener started on 1337...')
});