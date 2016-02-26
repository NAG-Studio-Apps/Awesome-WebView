'use strict';

const origin = 'https://github.com/sn0w/Awesome-WebView/archive';

let yargs = require('yargs')
    .usage('$0 <command> [args]')
    .command('init', 'Init a project in the current directory', {}, (args) => {

    })
    .command('download', 'Download the sources but don\'t install anything', {}, (args) => {
        const got = require('got');
        const Spinner = require('cli-spinner').Spinner;

        let spinner = new Spinner('Downloading latest release... %s');
        spinner.setSpinnerString(Spinner.spinners[9]);
        spinner.start();

        var remote = typeof args['branch'] === typeof undefined ? `${origin}/develop.zip` : `${origin}/${args['branch']}.zip`;
        got(remote).then(res => {
            spinner.stop();

            let fsSpinner = new Spinner('Saving file... %s');
            fsSpinner.setSpinnerString(Spinner.spinners[9]);
            fsSpinner.start();

            const fs = require('fs');
            fs.writeFileSync('TMP.GHDL', res.body);

            fsSpinner.stop();
        }).catch(err => {
            spinner.stop();
            console.log('Error getting the latest release!');
            console.error(err);
        });
    })
    .option('name', {
        alias: 'n',
        describe: 'The name of your App',
        default: 'Awesome-WebView'
    })
    .option('id', {
        alias: 'd',
        describe: 'The id of your app',
        default: 'moe.lukas.awesomewebview'
    })
    .option('branch', {
        alias: 'b',
        describe: 'The branch of Awesome-WebView to use',
        default: 'develop'
    })
    .option('android-resources', {
        alias: 'android-res',
        describe: 'The folder where the resources (Images/Icons/etc.) for android are located',
        default: 'res/android'
    })
    .option('ios-resources', {
        alias: 'ios-res',
        describe: 'Works like --android-res but for ios',
        default: 'res/ios'
    })
    .option('only-ios', {
        alias: 'o-i',
        describe: 'Don\'t do anything involving android',
        default: false
    })
    .option('only-android', {
        alias: 'o-a',
        describe: 'The opposite of --only-ios (obviously)',
        default: false
    })
    .help()
    .alias('help', 'h');

if (yargs.argv._.length == 0) {
    yargs.showHelp();
}