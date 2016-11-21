function buildTourneyHtml (tournament) {
  return
    "<li>""
      "<a href=/tournaments/" + tournament.id + ">" + tournament.name +  "</a>"
      ""<%= link_to 'Destroy', tournament, method: :delete, data: { confirm: 'Are you sure?' }, :remote => true, :class => 'delete_tournament' %>'"
    "</li>"


  $('.ctrl-tournaments.actn-index').on('click', '[data-hook~=tourney-delete]', deleteTournament)
}

function deleteTournament(event){
  event.preventDefault()
  $.ajax({
      url: '/api/tournaments',
      type: 'DELETE',
      data: {id: tournament.id},
    });
}
