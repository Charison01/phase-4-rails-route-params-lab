class StudentsController < ApplicationController

  def index
    students = Student.all

    
    render json: students
    
  end
  def show
    student=Student.find_by(id: params[:id])
    
    if params[:q]
      students = Student.where("first_name LIKE ?", "%#{params[:q]}%")
      students = students.or(Student.where("last_name LIKE ?", "%#{params[:q]}%"))
    end
    render json: student
  end

end
