
require ("moment")

import { Calendar } from '@fullcalendar/core';
import interactionPlugin from '@fullcalendar/interaction';
import dayGridPlugin from '@fullcalendar/daygrid';



function eventCalendar() {
  /* let path = window.location.pathname;
  let id = path.split("/") */
 
    var calendarEl = document.getElementById('calendar');
    var id = $("#branch_id").text();
    if (id){
    var calendar = new Calendar(calendarEl, {
        plugins: [ interactionPlugin, dayGridPlugin ],
        initialView: 'dayGridMonth',
        selectable: true,
        dateClick: function(info) {
            $("#add_event").append(modalAppointment(info));
            $('.modal').modal('show');
            console.log(info);
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

const modalAppointment = (date)=>{
    var modal = `<div class="modal" tabindex="-1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Appointment to ${date.dateStr}</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <p>Select to hours</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary">Save changes</button>
          </div>
        </div>
      </div>
    </div>`;
    return modal;
    }

    $('#add_event').on('click', '.modal button', function() {
        $(".modal").remove();
    });
$(document).on('turbolinks:load', eventCalendar);
