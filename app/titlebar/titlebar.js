if (document.querySelectorAll('.titlebar').length == 0) {
    // document.appendChild(document.createElement('a'));
    //   document.addEventListener('load', (e) => {

    let path = window.require('path');
    let fs = window.require('fs');
    let { ipcRenderer } = window.require('electron');
    let head = document.getElementsByTagName('HEAD')[0];
    let link = document.createElement('style');
    try {
        link.innerHTML = fs.readFileSync(path.join(ipcRenderer.sendSync('getDir'), 'app/titlebar/titlebar.css')).toString();
    } catch (error) {
        escapeHTMLPolicy = trustedTypes.createPolicy("forceInner", {
            createHTML: (to_escape) => to_escape
        });
        link.innerHTML = escapeHTMLPolicy.createHTML(fs.readFileSync(path.join(ipcRenderer.sendSync('getDir'), 'app/titlebar/titlebar.css')));
    }
    head.appendChild(link);

    let titlebar = document.createElement('div');
    titlebar.classList.add('titlebar');
    document.body.insertBefore(titlebar, document.body.firstChild);
    let logo = document.createElement('img');
    logo.src = "data:image/x-icon;base64," + fs.readFileSync(path.join(ipcRenderer.sendSync('getDir'), 'app/titlebar/icon.png'), { encoding: 'base64' });
    titlebar.appendChild(logo);
    let title = document.createElement('label');
    title.id = 'headingofapp';
    title.innerText = 'LMS - By Saksham';
    titlebar.appendChild(title);
    let btn = document.createElement('button');
    btn.id = 'minimize';
    btn.innerText = '—';
    titlebar.appendChild(btn);
    btn = document.createElement('button');
    btn.id = 'maximize';
    btn.innerText = ipcRenderer.sendSync('ismaximized') ? '🗗' : '🗖';
    titlebar.appendChild(btn);
    btn = document.createElement('button');
    btn.id = 'quitapp';
    btn.classList.add('appquit');
    btn.innerText = 'X';
    titlebar.appendChild(btn);

    document.querySelector(".titlebar").style.height = 'auto';
    ipcRenderer.on('maximize', (event) => {
        document.querySelector('#maximize').innerHTML = '🗗';
    });
    ipcRenderer.on('unmaximize', (event) => {
        document.querySelector('#maximize').innerHTML = '🗖';
    });
    document.querySelector("#minimize").addEventListener('click', (e) => {

        console.log('sending');

        ipcRenderer.send('minimize', null);
        console.log("sent");
    });
    document.querySelector("#maximize").addEventListener('click', (e) => {

        console.log('sending');

        if (ipcRenderer.sendSync('maximize', null)) {
            document.querySelector('#maximize').innerHTML = '🗗';
        } else {
            document.querySelector('#maximize').innerHTML = '🗖';
        }
        console.log("sent");
    });
    document.querySelector("#quitapp").addEventListener('click', (e) => {

        console.log('sending');

        window.close()
        console.log("sent");
    });


    //   });

}