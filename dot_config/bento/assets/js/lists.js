// ┬  ┬┌─┐┌┬┐┌─┐
// │  │└─┐ │ └─┐
// ┴─┘┴└─┘ ┴ └─┘
// Functions for printing both lists

const buildList = (list) => {
    const listContainer = document.createElement('div');
    listContainer.setAttribute('class', `card list list__${list.id}`)
    listContainer.setAttribute('id', `list_${list.id}`);
    const listIcon = document.createElement('i');
    listIcon.setAttribute('class', 'listIcon');
    listIcon.setAttribute('icon-name', list.icon);
    listContainer.appendChild(listIcon);
    for (const item of list.links) {
        listContainer.appendChild(buildLink(item));
    }
    return listContainer;
};

const buildLink = (item) => {
    const link = document.createElement('a');
    link.setAttribute('target', CONFIG.openInNewTab ? '_blank' : '');
    link.setAttribute('href', item.link);
    link.setAttribute('class', 'listItem');
    link.innerText = `${item.name}${item.key ? ' ('+item.key+')' : ''}`;
    return link;
};


const generateFirstListsContainer = () => {
	for (const list of CONFIG.firstlistsContainer) {
        item = buildList(list);
		const position = 'beforeend';
		lists_1.insertAdjacentHTML(position, item.outerHTML)
	}
};

const generateSecondListsContainer = () => {
	for (const list of CONFIG.secondListsContainer) {
        item = buildList(list);
		const position = 'beforeend';
		lists_2.insertAdjacentHTML(position, item.outerHTML)
	}
};

const generateLists = () => {
	switch (CONFIG.bentoLayout) {
		case 'bento':
			generateFirstListsContainer();
			break;
		case 'lists':
			generateFirstListsContainer();
			generateSecondListsContainer();
			break;
		default:
			break;
	}
};

generateLists();
