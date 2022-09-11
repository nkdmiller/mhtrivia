json.extract! question, :id, :room_id, :order, :prompt, :answers, :correct_answer, :created_at, :updated_at
json.url question_url(question, format: :json)
