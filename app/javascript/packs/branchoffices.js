require ("moment")

import { Calendar } from '@fullcalendar/core';
import interactionPlugin from '@fullcalendar/interaction';
import dayGridPlugin from '@fullcalendar/daygrid';



function eventCalendar() {
  /* let path = window.location.pathname;
  let id = path.split("/") */

  var calendarEl = document.getElementById('calendar');
  var id = $("#branch_id").text();
  if(id){

    var calendar = new Calendar(calendarEl, {
      validRange: { start: new Date(),
        end: '2040-01-01'},
      plugins: [ interactionPlugin, dayGridPlugin ],
      initialView: 'dayGridMonth',
      selectable: true,
      dateClick: function(info) {
        $('.modal').show();
        getAvailableSlots(id,info.dateStr);
        // console.log(info.dateStr);



        /*     alert('Clicked on: ' + info.dateStr);
            alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
            alert('Current view: ' + info.view.type);
// change the day's background color just for fun
            info.dayEl.style.backgroundColor = 'red'; */
},
  eventSources: [
    '/appointments_branchoffices/'+id
  ]
});
calendar.setOption('locale', 'es');
calendar.render();
}
};

const getAvailableSlots = (id,date) =>{
  // traer o buscar los slots disponible en rails
  //crear un metodo available slot en el controlador y en l modelo
  //crear la ruta get
  //parametro de date y retunr displonible (horas)
  $.ajax({
    url:`/available_slots/${id}/${date}`,
    type: 'GET'
  }).done(function (response) {
    response.forEach(function(slot) {
      var date_start = new Date(slot.start_time);
      var date_end = new Date(slot.end_time);
      var hours_start = date_start.getHours();
      var hours_end = date_end.getHours();
      $(".modal-body .row").append(`
            <div class="col-6">
              <button class="btn btn-select-appointment" data-start-time="${date_start}" data-end-time="${date_end}" >${hours_start}hrs - ${hours_end}hrs</button>
            </div>
          `);
    })
  }).fail(function (error) {
    console.error(error);
  });
}

$(document).on('click', '.btn-select-appointment', function() {
  var userResponse = confirm('Estás seguro que desear crear la cita?');
  if (!userResponse) {
    return;
  }

  var startTime = $(this).data('start-time');
  var endTime = $(this).data('end-time');
  var branchId = $("#branch_id").text();

  $.ajax({
    url: 'ruta',
    type: 'POST',
    dataType: 'json',
    data: {
      start_time: startTime,
      end_time: endTime,
      branch_id: branchId
    }
  }).done(function(response){
    console.log(response);
    // Feedback a usuario
    // Cerrar Modal quizás?
    // Re-renderizar fullcalendar para que se
    // muestre en el calendario
    // el nuevo appointment creado
  }).fail(function(error){
    console.warning(error);
  });
});


$('#add-event').on('click', '.modal button[data-bs-dismiss="modal"]', function() {
  $(".modal-body .row").empty();
  $(".modal").hide();
});
/* $(document).on('turbolinks:load', eventCalendar); */
$(document).ready(function(){
  eventCalendar();
});
