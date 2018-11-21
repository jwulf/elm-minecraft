const {Elm} = require('./dst/elm.min.js')
function main() {
    const app = Elm.Main.init()

    app.ports.fromElm.subscribe(function(data) {
        console.log(data)
    })

    app.ports.toElm.send('World')
}

