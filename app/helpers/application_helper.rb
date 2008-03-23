# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def random_quotes
    q = ["I, you, we love QC.","QC - the essence of life","Quincy QC"]
    q[rand(q.size)]
  end

end
