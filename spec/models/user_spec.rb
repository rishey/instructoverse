require 'spec_helper'

describe User do
  before do
    @user = User.create!(username: "tee", email: "tee@tee.tee", password: "123", password_confirmation: "123")
  end

  it "should not return an error when calling created_courses" do
    expect(@user.created_courses).to eq([])
  end

  it "should not return an error when calling attended_courses" do
    expect(@user.attended_courses).to eq([])
  end

  it "should allow a course to be added to created_courses" do
    @user.created_courses << Course.create(title: "df", description: "df", url: "http://www.google.com")
    expect(@user.created_courses.count).to eq(1)
  end

  it "should allow a course to be added to attended_courses" do
    @user.attended_courses << Course.create(title: 'sdfsdf', description: "adssd", url: "http://www.google.com")
    expect(@user.attended_courses.count). to eq(1)
  end

end
