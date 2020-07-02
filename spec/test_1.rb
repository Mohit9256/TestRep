describe "Login into Salesforce", :type => :request do
#include_context "login" do
	it "Login into Salesforce" do
		begin
		message = 'Case Adjustors'
         visit "https://test.salesforce.com/"
	     sleep 2
		 find(:xpath, "//input[@name='username']").set 'mohit.khandelwal@assurant.com.twgqa1b'
		 find(:xpath, "//*[@id='Login']//preceding::input[1]").set 'metacube123'
	     find(:xpath,"//input[@name='Login']").click
         find(:xpath, "//input[@id='phSearchInput']").set 'Akshay Patel'
         find(:xpath, "//input[@value='Search']").click
		 find(:xpath, "//a[@title='Akshay Patel']").click
		 find(:xpath, "//a[@id='moderatorMutton']").click
		 find(:xpath, "//a[@id='USER_DETAIL']").click
		 sleep 3
         expect(message).to have_xpath("//a[@href='/00Ed0000000drua']", text: 'Case Adjustors')	 
		 sleep 3
		end
	end
end
