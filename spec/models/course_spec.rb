require 'spec_helper'
  describe Course do
    # before do
    
    # end
    it "should not save a course without a title" do
      @course = Course.new(url:"http://www.youtube.com", description: "yadda") 
      expect(@course.save).should eq(false)
    end  

    it "should not save a course without a valid url" do
      @course = Course.new(title:"candyland", url:"www.youtube.com", description: "yadda") 
      expect(@course.save).should eq(false)
    end   

    it "should not save a course without a description" do
      @course = Course.new(title:"candyland", url:"http://www.youtube.com") 
      expect(@course.save).should eq(false)
    end  

    it "has an enrollments method that returns an array" do
      @course = Course.new(title:"candyland", url:"http://www.youtube.com", description: "yadda")
      @course.save
      expect(@course.enrollments).should eq([])
    end  

    it "has an attendees method that returns an array" do
      @course = Course.new(title:"candyland", url:"http://www.youtube.com", description: "yadda")
      @course.save
      expect(@course.attendees).should eq([])
    end  

    it "should have a creator" do
      @user = User.create!(username: "tee", email: "tee@tee.tee", password: "123", password_confirmation: "123")
      @course = Course.new(title:"candyland", url:"http://www.youtube.com", description: "yadda")
      @course.save
      @user.created_courses << @course
      expect(@course.creator_id).should eq(@user.id)
    end  

  end  
