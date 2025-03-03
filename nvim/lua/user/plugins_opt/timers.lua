require('pomo').setup({
  notifiers = {
    {
      name = 'Default',
      opts = {
        sticky = false,
        title_icon = '󱎫',
        text_icon = '󰄉',
      },
    },
  },
  sessions = {
    pomodoro = {
      { name = 'Work', duration = '25m' },
      { name = 'Short Break', duration = '5m' },
      { name = 'Work', duration = '25m' },
      { name = 'Short Break', duration = '5m' },
      { name = 'Work', duration = '25m' },
      { name = 'Long Break', duration = '15m' },
    },
  },
})
