
function main() {
    const app = Elm.Main.worker()

    app.ports.say.subscribe(function(data) {
        console.log(data)
    })

    app.ports.hello.send('World')
}
