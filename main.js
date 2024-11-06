const {app, BrowserWindow, ipcMain} = require('electron')
const path = require('path')
const fs = require("fs");

function createWindow () {
  const mainWindow = new BrowserWindow({
    width: 1000,
    height: 600,
    webPreferences: {
      nodeIntegration:true,
      contextIsolation:false
    },
    icon:path.join(__dirname, "app/titlebar/icon.png"),
    frame: false,
  })
  mainWindow.webContents.on("did-finish-load", (e, i) => {
    mainWindow.webContents.executeJavaScript(
        fs.readFileSync(path.join(__dirname, "app/titlebar/titlebar.js")).toString()
    );
  });
  mainWindow.hide();
    mainWindow.webContents.on("did-finish-load", (e, i) => {
        mainWindow.show();
    });
  mainWindow.on('close', (e) => {
    app.quit();
  });
  ipcMain.on("minimize", (event, args) => {
    mainWindow.minimize();
  });
  ipcMain.on("maximize", (event, args) => {
    if (mainWindow.isMaximized()) {
        mainWindow.unmaximize();
        event.returnValue = false;
    } else {
        mainWindow.maximize();
        event.returnValue = true;
    }
  });
  ipcMain.on("ismaximized", (event) => {
    event.returnValue = mainWindow.isMaximized();
  });
  ipcMain.on("getDir", (event, args) => {
    event.returnValue = __dirname;
  });
  mainWindow.loadFile('app/home.html')
 // mainWindow.setMenu(null);
  
}



app.on('ready', createWindow)





