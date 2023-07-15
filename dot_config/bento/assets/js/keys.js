
const keys = new Map();

const registerKey = (key, url) => {
    keys.set(key, url);
}

const handleKey = (e) => {
    var key = e.key.toLowerCase()
    console.log(key);
    if (keys.has(key)) {
        if (e.shiftKey) {
            window.open(keys.get(key), '_blank');
        } else {
            window.open(keys.get(key), '_self');
        }
    }
}

document.onkeydown = function(e) {
    handleKey(e);
};

for (const item of CONFIG.firstlistsContainer) {
    for (const link of item.links) {
        if (link.key) {
            registerKey(link.key, link.link);
        }
    }
}

for (const item of CONFIG.secondListsContainer) {
    for (const link of item.links) {
        if (link.key) {
            registerKey(link.key, link.link);
        }
    }
}
