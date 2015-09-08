module QuoteHelper

def process_stage
 status = @quote.status
 stage = Array.new
 if status == "created"
 stage[0]="done" 
 stage[1] ="todo"
 stage[2]="todo"
 stage[3] ="todo"
 stage[4] ="todo"
 
 
 
 elsif status == "admin_sent" 
 stage[0]="done" 
 stage[1] ="done"
 stage[2]="done"
 stage[3] ="todo"
 stage[4] ="todo"
  
 
 elsif status == "released" 
 stage[0]="done" 
 stage[1] ="done"
 stage[2]="done"
 stage[3] ="done"
 stage[4] ="done"
 end
 
 
 stage
end



end
