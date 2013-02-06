module ApplicationHelper

  def putActiveClass(controller_name)
    h (controller.controller_name==controller_name ? ' class="active"' : '').html_safe
  end
  
  def showCardHeader
    html = <<-EOF
    <tr>
      <th>ID</th>
      <th>CreatedBy (User)</th>
      <th>Player name</th>
      <th>Game title</th>
      <th>Character</th>
      <th>Comment</th>
      <th>Latitude, Longitude</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
    EOF
  
  h html.html_safe
  end
  
  def showCard(card)
    
    mId = card.id.to_s
    mCreatedBy = card.user.username.to_s
    mPlayerName = card.player_name.to_s
    mGameTitle = card.game_title.to_s
    mCharacter = card.character.to_s
    mComment = card.comment.to_s
    mLatitude = card.latitude.to_s
    mLongitude = card.longitude.to_s
    
    html = []
    html << '<tr>'
    html << '<th>'+ mId +'</th>'
    html << '<td>'+ (link_to mCreatedBy, card.user) +'</td>'
    html << '<td>'+ mPlayerName +'</td>'
    html << '<td>'+ mGameTitle +'</td>'
    html << '<td>'+ mCharacter +'</td>'
    html << '<td>'+ mComment +'</td>'
    html << '<td>'+ mLatitude + ", " + mLongitude +'</td>'
    html << '<td>'+ (link_to 'Show card', card) +'</td>'
    html << '<td>'+ (link_to 'Edit', edit_card_path(card)) +'</td>'
    html << '<td>'+ (link_to 'Delete', card, :method => :delete, :data => { :confirm => 'Are you sure?' }) +'</td>'
    html << '</tr>'
    
    h html.join.html_safe
  end
  
  def heading(str="")
    html = []
    html << '<div class="hero-unit"><h1>'
    html << '<small>' + controller.controller_name + ' &raquo; ' + controller.action_name + '</small> '
    html << str.to_s
    html << '</h1></div>'
    
    h html.join.html_safe
  end
end
