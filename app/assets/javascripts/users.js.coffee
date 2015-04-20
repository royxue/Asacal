# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).ready ->
    $('#calendar').fullCalendar {
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
      monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
      dayNames: ["日曜日", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日"],
      dayNamesShort: ["日曜日", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日"],
      events: window.location.href + '.json',
      eventRender: (event, element) ->
        element.attr 'href', 'javascript:void(0);'
        element.click ->
          if event.allDay
            $('#startTime').html moment(event.start).format('MMM Do')
            $('#endTime').html "All Day :)"
          else
            $('#startTime').html moment(event.start).format('MMM Do HH:mm A')
            $('#endTime').html moment(event.end).format('MMM Do HH:mm A')
          $('#eventTitle').html event.title
          $('#eventDes').html event.description
          $('#location').html event.allDay
          $('#eventModal').modal 'show'
    }
    return

  $('.special.cards .image').dimmer on: 'hover'
