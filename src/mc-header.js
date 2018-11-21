const magik = magikcraft.io

function main() {
    const app = module.exports.Elm.Main.init()

    magik.dixit('Started Elm')
    app.ports.fromElm.subscribe(function (data) {
        magik.dixit(data)
    })

    app.ports.toElm.send('World')
}
