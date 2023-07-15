const CONFIG = {

    // General
    name: 'Mac',
    imageBackground: true,
    openInNewTab: false,
    twelveHourFormat: true,

    // Greetings
    greetingMorning: 'Good morning!',
    greetingAfternoon: 'Good afternoon,',
    greetingEvening: 'Good evening,',
    greetingNight: 'Go to Sleep!',

    // Layout
    bentoLayout: 'lists', // 'bento', 'lists', 'buttons'

    // Weather
    weatherKey: 'f4901f20bd57da8804b62dd579c52198',
    weatherIcons: 'OneDark', // 'Onedark', 'Nord', 'Dark', 'White'
    weatherUnit: 'C', // 'F', 'C'
    language: 'en', // More languages in https://openweathermap.org/current#multi

    trackLocation: false, // If false or an error occurs, the app will use the lat/lon below
    defaultLatitude: '45.421532',
    defaultLongitude: '-75.697189',

    // Autochange
    autoChangeTheme: false,

    // Autochange by OS
    changeThemeByOS: false,

    // Autochange by hour options (24hrs format, string must be in: hh:mm)
    changeThemeByHour: true,
    hourDarkThemeActive: '18:30',
    hourDarkThemeInactive: '07:00',

    // ┬  ┬┌─┐┌┬┐┌─┐
    // │  │└─┐ │ └─┐
    // ┴─┘┴└─┘ ┴ └─┘

    // First Links Container
    firstlistsContainer: [
        {
            icon: 'newspaper',
            id: '1',
            links: [
                {
                    name: 'Current Events',
                    link: 'https://en.wikipedia.org/wiki/Portal:Current_events',
                    key: 'q',
                }, {
                    name: 'Hackernews',
                    link: 'https://news.ycombinator.com/',
                    key: 'a',
                }, {
                    name: 'Pocket',
                    link: 'https://getpocket.com/saves?src=recent-saves',
                    key: 'z',
                }, 
            ],
        },
        {
            icon: 'calendar',
            id: '2',
            links: [
                {
                    name: 'Outlook wip',
                    link: 'https://outlook.live.com/mail/0/inbox',
                    key: 'w',
                }, {
                    name: 'Calendar wip',
                    link: 'https://calendar.google.com/calendar',
                    key: 's',
                }, {
                    name: 'wip',
                    link: 'https://news.ycombinator.com/',
                    key: 'x',
                }, 
            ],
        },
    ],

    // Second Links Container
    secondListsContainer: [
        {
            icon: 'coffee',
            id: '1',
            links: [
                {
                    name: 'Youtube',
                    link: 'https://www.youtube.com',
                    key: 'e',
                },
                {
                    name: 'Reddit',
                    link: 'https://www.reddit.com',
                    key: 'd',
                },
                {
                    name: 'Podcasts',
                    link: 'https://play.pocketcasts.com/podcasts',
                    key: 'c',
                },
            ],
        },
        {
            icon: 'github',
            id: '2',
            links: [
                {
                    name: 'Github',
                    link: 'https://github.com/macstewart',
                    key: 'r',
                },
                {
                    name: 'wip',
                    link: 'https://www.reddit.com/r/rust/',
                    key: 'f',
                },
                {
                    name: 'wip',
                    link: 'https://www.reddit.com/r/golang/',
                    key: 'v',
                },
            ],
        },
    ],
};
