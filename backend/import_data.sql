SET NOCOUNT ON;
BEGIN TRANSACTION;
DELETE FROM dbo.StudentAnswer;
DELETE FROM dbo.ExamAttempt;
DELETE FROM dbo.AnswerOption;
DELETE FROM dbo.Question;
DELETE FROM dbo.QuestionGroup;
DELETE FROM dbo.Exam;
SET IDENTITY_INSERT dbo.Exam ON;
INSERT INTO dbo.Exam (Id, Title, TimeLimitMinutes, IsPublished) VALUES (1, N'TOEIC Reading Test 7', 75, 0);
SET IDENTITY_INSERT dbo.Exam OFF;
SET IDENTITY_INSERT dbo.QuestionGroup ON;
INSERT INTO dbo.QuestionGroup (Id, ExamId, Part, PassageText, OrderIndex, ShuffleQuestions) VALUES (1, 1, 6, N'Dear PGD Account Holder,
PGD Bank strives _______ the highest levels of client security and service. This applies not only to online- and telephone-based services, but also to our brick-and-mortar locations. Our three branch offices have proudly been a part of the community _______ a combined total of 40 years.
To assist you even better in the future, our Smithville branch will be temporarily closed for renovations July 8-22. _______ In the meantime, our other two regional branches in Pine Grove and Bradford will maintain normal business _______. We value your feedback and will respond to any concerns that you may have as soon as possible.
Sincerely,
Edwin Chen, Operations Manager
PGD Bank', 1, 1);
INSERT INTO dbo.QuestionGroup (Id, ExamId, Part, PassageText, OrderIndex, ShuffleQuestions) VALUES (2, 1, 6, N'To: Samuel Archerson <sarcherson@vona.co.uk>
From: James Darrers <jdarrers@sky.co.uk>
Date: 10 January
Subject: Cost Accountant position
Dear Mr. Archerson,
Thank you for taking the time to meet with me today. I _______ our conversation, and I remain very interested in the position of cost accountant. I would welcome the opportunity to return for the third and final round of _______.
I am confident my years of accounting experience would benefit your firm. As discussed, over the last ten years, I have helped many companies save a _______ amount of money. I am especially adept at analysing the day-to-day operations of a business and helping to determine more cost-effective methods.
I checked regarding your question about a potential start date. _______ I hope to hear from you in the near future.
Sincerely,
James Darrers', 2, 1);
INSERT INTO dbo.QuestionGroup (Id, ExamId, Part, PassageText, OrderIndex, ShuffleQuestions) VALUES (3, 1, 6, N'To: Mason Wu <mwu@wustudios.co.nz>
From: Trent Tuiloma <ttuiloma@canterburyairport.co.nz>
Subject: Canterbury Airport project
Date: Monday, 2 July
Dear Mr. Wu,
Thank you for agreeing to consult on the Canterbury Airport redesign project. _______ As a result, I am particularly eager to hear your ideas about upgrading our main terminal.
Can we meet this week? There are a number of _______ restaurants near my office. If you are available this Friday, we could meet at Celia''s Cafe on Cumberland Street. I would also like a few of my colleagues to _______ us. They would appreciate _______ ways to enhance the airport user''s experience.
I look forward to hearing from you soon.
Sincerely,
Trent Tuiloma
Chairman, Canterbury Airport Redesign Team', 3, 1);
INSERT INTO dbo.QuestionGroup (Id, ExamId, Part, PassageText, OrderIndex, ShuffleQuestions) VALUES (4, 1, 6, N'SHIRES BERRY (February 15) - The second annual Shiresberry Film Festival begins on April 18 and _______ for five weeks. This year''s offerings will not be limited to entries from North America and Europe. We will also be presenting _______ from Asia and South America. And everyone''s favorite feature from last year''s festival will be back: directors and screenwriters will hold question-and-answer sessions after their films'' initial screening. Make sure you do not miss this _______ event. Tickets always sell out quickly. _______ Shiresberry Film Club members can now purchase priority tickets. Visit the Shiresberry Theater box office or www.shiresberrytheater.com.', 4, 1);
INSERT INTO dbo.QuestionGroup (Id, ExamId, Part, PassageText, OrderIndex, ShuffleQuestions) VALUES (5, 1, 7, N'Sedwick Electronics Hiring Event
March 2, 10 A.M.-5 P.M.
22 Myer Street, Hanover, PA 17331
Sedwick Electronics is opening a new manufacturing facility in Hanover, Pennsylvania, and we need to fill many positions. We offer a wonderful work environment and great benefits to our employees.
Come to the event and hear from employees from our Lancaster facility about their experience, learn about the open positions, and speak with our recruiters. No RSVP is necessary. Bring copies of your resume.', 5, 1);
INSERT INTO dbo.QuestionGroup (Id, ExamId, Part, PassageText, OrderIndex, ShuffleQuestions) VALUES (6, 1, 7, N'Aguni Plumbing Supply Returns
Beginning March 1 at all Aguni Plumbing Supply locations, customers will be able to come to our stores to return purchases made online. For a complete refund, the return must be made within 30 days of purchase and must be accompanied by a receipt. In addition, the merchandise must be returned in the original packaging, and all components must be included. After 30 days, refunds will be limited to in-store credit only. Defective items may be exchanged for the same item only.', 6, 1);
INSERT INTO dbo.QuestionGroup (Id, ExamId, Part, PassageText, OrderIndex, ShuffleQuestions) VALUES (7, 1, 7, N'Springfield Community School Computer Courses
Course: Internet Safety
This course teaches students everything they need to navigate the Web safely.
Course ID: 249800:01 | Class Time: Tuesday 5:30-7:30 PM | Instructor: Patrick McCann | Room: 211
Course ID: 249800:02 | Class Time: Saturday 1:00-3:00 PM | Instructor: Nora Farid | Room: 166
Course: Spreadsheet Basics
This course teaches the basics of online spreadsheets. Students will learn how to create effective charts for calculating and analyzing data clearly and easily.
Course ID: 225810:01 | Class Time: Thursday 5:30-8:30 PM | Instructor: Remi Sanders | Room: 118
Course ID: 225810:02 | Class Time: Sunday 1:00-4:00 PM | Instructor: Nora Farid | Room: 315', 7, 1);
INSERT INTO dbo.QuestionGroup (Id, ExamId, Part, PassageText, OrderIndex, ShuffleQuestions) VALUES (8, 1, 7, N'Sally Witham (4:47 P.M.) Hi Wakiko. I just finished up here at the Kyoto store. I''ll be on the train that arrives in Tokyo at 11:35 tomorrow morning. How should I get to your location?
Wakiko Ohara (4:48 P.M.) I''ll have an associate pick you up at the station. How do things look in Kyoto?
Sally Witham (4:49 P.M.) The Kyoto store is doing a great job. It has everything that we at the home office are looking for. Athletic shoes and sandals are displayed according to specifications, and sales associates are friendly and knowledgeable.
Wakiko Ohara (4:51 P.M.) You should like things here, too. Do you want to begin your visit after lunch, say at 2:00?
Sally Witham (4:52 P.M.) Sounds good. See you tomorrow.', 8, 1);
INSERT INTO dbo.QuestionGroup (Id, ExamId, Part, PassageText, OrderIndex, ShuffleQuestions) VALUES (9, 1, 7, N'Bridge Inspection Report
Structure: Blaine River Drawbridge
Location: Ridgeline Highway, KM 147
Owner: State Highway Agency
Report completed by: Vivian Tulio
Date: October 17
Main span material: Steel girder
Age of structure: 30 years
Component | Rating
Support elements | 4
Towers | 4
Road surface | 3
Drainage features | 4
Safety barriers | 5
Sidewalk or walkway | 6
Key to ratings:
1 = Failed; immediate closure required
2 = Deteriorated; may fail soon
3 = Shows deterioration but still functions within acceptable parameters
4 = Shows minor wear
5 = New condition
6 = Not applicable
Notes: Small cracks in asphalt. The bridge is overall structurally sound. Inform the Department of Transportation about the small cracks in the asphalt.', 9, 1);
INSERT INTO dbo.QuestionGroup (Id, ExamId, Part, PassageText, OrderIndex, ShuffleQuestions) VALUES (10, 1, 7, N'Subway Sound to be Upgraded
BOSTON (April 1) - The public address systems at selected subway stations are scheduled to be refurbished, the Transit Authority announced this week. The systems are used to make announcements to commuters both on the platforms and in the stations.
Local commuters welcomed the news, although for some it was long overdue. "It can be pretty difficult to understand the announcements at some of the stations I use most frequently," said Ian Miller, who has taken the subway to work nearly every week for the past eighteen years. "I had heard the reports about it on TV, and all I can say is that it is about time!"
Some of the systems currently in use are more than 30 years old. Worn-out speakers, wiring, microphones, and amplifiers will be replaced with new, more reliable devices. The work should be completed in October and cost more than $11 million.
Boston''s subway system came together in stages over the course of several years. The foundational component of the system''s Green Line first opened on Tremont Street in the late 1890s. It was the first of its kind in the United States.', 10, 1);
INSERT INTO dbo.QuestionGroup (Id, ExamId, Part, PassageText, OrderIndex, ShuffleQuestions) VALUES (11, 1, 7, N'To: All Staff
From: Selene Hong
Date: March 25
Subject: Reminder
Dear Staff,
I would like to draw your attention to several new procedures regarding business trip expense reports. [1] Beginning next month, business-related dining receipts must be accompanied by a listing of each dinner attendee. Also, please make sure that you do not include receipts for any non-work-related items or activities with your report. [2] Finally, note that our accounting software will now automatically calculate for you the total to be reimbursed. You need only to upload images of your receipts for the software to do this. I will be happy to respond to your questions. [3] However, I will be flying to Tokyo this Friday to meet clients, so I will not be checking e-mail that day. [4]
Sincerely,
Selene Hong
Assistant Director, Human Resources Department
Datoric Systems', 11, 1);
INSERT INTO dbo.QuestionGroup (Id, ExamId, Part, PassageText, OrderIndex, ShuffleQuestions) VALUES (12, 1, 7, N'E-Commerce Opening Doors for African Fashion Industry
ADDIS ABABA (6 May) - Africa''s role as a consumer of fashion has been on the rise in recent years. This trend is largely due to the emergence of e-commerce, which provides Africans the opportunity to buy clothing from retailers with no physical presence on the continent. Perhaps more importantly, though, the growth of e-commerce is enabling small-scale African designers to also become producers of fashion, as they showcase their collections to consumers worldwide. African shopping Web sites like Jumjum and Longa are making the work of African designers available for purchase not just throughout the continent, but also as far away as London and New York. [1] "African designers are finally gaining visibility," says Mazaa Absher, founder of Abbi Sportscore, Africa''s fastest-growing athletic footwear company. "We have always had terrific design and production capacity here on the continent, but it was hard getting it out into the world. Now we are generating more sales online than we are in our stores." [2] Even as Ms. Absher has transformed her company into an international powerhouse, she continues to highlight the advantages of manufacturing its products in her home city of Nazret. [3] Africa''s strong textile sector and innovative designs combine tradition and wearability, and this formula is allowing companies like hers to set their sights beyond the continent. "As more cities in Ethiopia-and all over Africa-improve their manufacturing capacity, it will become easier to reach the rest of the world," says Ms. Absher. [4]', 12, 1);
INSERT INTO dbo.QuestionGroup (Id, ExamId, Part, PassageText, OrderIndex, ShuffleQuestions) VALUES (13, 1, 7, N'Gary Park (10:23 A.M.) I e-mailed you the cover design for our September issue a few minutes ago. Did you receive it?
Jill Riley (10:26 A.M.) Yes, but is this the latest version? I thought we agreed that the background color should be lighter so the article titles are more visible.
Gary Park (10:28 A.M.) I forgot-sorry about that! I''m just now sending the file with the most recent version.
Jill Riley (10:30 A.M.) Opening it now... That''s more like it. I''ll forward it to Graphics and request a sample printout.
Jill Riley (10:35 A.M.) Good morning, Mr. Ojeda. Our new cover design is ready. When do you think you''ll have a chance to work on it?
Frank Ojeda (10:38 A.M.) Send it to me now. I''ll have a print copy ready for your approval after lunch.', 13, 1);
INSERT INTO dbo.QuestionGroup (Id, ExamId, Part, PassageText, OrderIndex, ShuffleQuestions) VALUES (14, 1, 7, N'8 February
Ms. Mala Chelvi
60 Jalan Tun Razak
54200 Kuala Lumpur
Dear Ms. Chelvi,
We are delighted to inform you that you have been nominated as a finalist for the Small Business Challenge competition this year. Now in its fifth year, this competition is designed to highlight innovative products and services launched by young entrepreneurs. The Web application that you developed, which provides a means of matching charitable organizations with volunteers, earned one of the top scores from our panel of judges.
In the next round of the challenge, you will participate in a live presentation about your product before a panel of expert judges. The three people with the best presentations will receive one-time grants of MYR 10,000 each to invest in their businesses.
Please go to sbc.org/competition and submit an outline of your presentation, a brief video that clearly illustrates the use of your application, and a passport-sized photograph of yourself. You will also need to sign a consent form allowing us to use your name and photo, if needed, in promotional materials on our Web site. The deadline for submission of these materials is 10 March.
Best regards,
Felix Pang
Chairperson, Small Business Challenge Committee', 14, 1);
INSERT INTO dbo.QuestionGroup (Id, ExamId, Part, PassageText, OrderIndex, ShuffleQuestions) VALUES (15, 1, 7, N'To: friedewald@parasur.net.sr
From: client services@mhf.ca
Date: April 2, 12:21 P.M.
Subject: Your feedback
Dear Mr. Riedewald,
Thank you for filling out the McMann Home Furnishings (MHF) survey. To show our appreciation, we have added reward points to your account. They can be applied to the purchase of products offered online as well as those offered in our retail stores. Clearance items and those priced $15.00 and above may not be purchased using credits.
To use your reward points for an online purchase, select the items you would like to purchase and then check out. At the bottom of the page, select "Apply credits." The value of the applied credits will appear on your order receipt as a special discount.
If you would prefer to use reward points at one of our retail locations, you can do so by logging in to your account on our Web site. Go to the My Rewards page, and then select "Print as a coupon." The coupon will have a bar code that can be scanned at the store''s checkout counter.
Sincerely,
Client Services, McMann Home Furnishings
Online Order #1157
McMann Home Furnishings Store
March 19, 11:31 A.M.
Hand-Painted Picture Frame | Quantity: 1 | Price: 10.00 | Special Discount: -10.00
Sailboat Ceramic Mug | Quantity: 4 | Price: 40.00 | Clearance Discount: -20.00
Floral Blanket | Quantity: 1 | Price: 25.00 | Seasonal Item Discount: -17.00
Photo Album | Quantity: 1 | Price: 34.00
Item total: 62.00 | Shipping: Free | Total: 62.00', 15, 1);
INSERT INTO dbo.QuestionGroup (Id, ExamId, Part, PassageText, OrderIndex, ShuffleQuestions) VALUES (16, 1, 7, N'4 December
Mr. Albert Morello
17 Peyton Avenue
Kingston 5
Jamaica, W.I.
Dear Mr. Morello:
Enclosed please find your royalty payment for Understanding Our Oceans. You should have recently received an e-mail that listed the sales figures and the royalties due to you for the print and electronic versions of your book.
We are proud to announce that Two Swan Press was given the Publisher of the Year Award by the UK Book Industry in October. We thank the authors who have worked with us since our founding five years ago.
All Two Swan Press authors are entitled to an author discount of 40 percent off any title on our Web site. Simply use the code AUX1417 for your discount.
If you have any questions at all, please do not hesitate to contact me.
Kind regards,
Sarah Wicklin
Encl.
Two Swan Press
72 Holywell Road, Edinburgh EH8 8PJ
THANK YOU FOR YOUR ORDER!
Special December Offer - free shipping on all orders over £35
Name: Duncan Booth
E-mail: mbooth@silvertech.co.uk
Date of purchase: 12 December
Ship to: Duncan Booth, 321 Maslin St., Coatbridge ML5 1LZ, Scotland, UK
Business in Our Lives by Elaine Schuyler | £75.00
Discount Applied (AUX1417) | -30.00
Balance Due | £45.00
Paid by Credit Card **5732
Items from multiple orders may be combined in the same package. We will notify you when your order has shipped.', 16, 1);
INSERT INTO dbo.QuestionGroup (Id, ExamId, Part, PassageText, OrderIndex, ShuffleQuestions) VALUES (17, 1, 7, N'To: All Staff
From: Personnel Department
Date: 11 June
Subject: Mentoring Program
Attachment: Application
Employees who have been with Broadside Electronics for less than eighteen months are invited to apply to participate in a new mentoring program that will match a maximum of ten junior employees with long-term company veterans. The goal is that junior employees will sharpen corporate skills, better understand company culture, and develop a more focused career path. Mentees will be assigned to a mentor based strictly on their work assignment and professional interests. The pairs will meet at mutually convenient times throughout the year, from three to five hours per month. To be considered for participation in this initiative, complete the attached application and return to Mentoring Program Director Tim Wrigley at t.wrigley@broadsideelec.com by July 1. Mr. Wrigley will send notification of his selections by July 15.
MENTORING PROGRAM APPLICATION
Name: Cora Drummond
Division: Sales
Extension: 144
Professional areas of interest: I am most interested in learning about our markets abroad and developing my sales-presentation abilities for these international markets. I am also interested in general career guidance.
Best workdays and times for meeting: Any weekday morning except Monday.
The Broadside Company Newsletter
Mentoring Program Sees Results
Long-time employee and Vice President of Sales Alena Russo was intrigued when a Personnel Department director approached her about mentoring a less experienced employee under a program that began last year. She is glad to have accepted the assignment. "After working with Ms. Drummond, I am more satisfied with my own duties, because I know I have helped a professional who is just getting started. I only wish that I had had someone looking out for me in my early years," remarked Ms. Russo.
Ms. Drummond explains that she "needed pointers on how to make better sales pitches." She reports that her sales are up by 20 percent now. She better understands the opportunities Broadside Electronics has to offer and what is required to become a manager. "Thanks to Ms. Russo, I have been able to define my career goals, and I am a happier person when I arrive to work every day."
New mentorship pairs are now being formed. Interested parties should contact Tim Wrigley in the Personnel Department.', 17, 1);
INSERT INTO dbo.QuestionGroup (Id, ExamId, Part, PassageText, OrderIndex, ShuffleQuestions) VALUES (18, 1, 7, N'https://www.runklefencing.co.uk
Temporary Fencing Service
Need a temporary fence installed at your residence, workplace, or special event? Our expert team will deliver and install chain-link fencing on the booked date and time. When the fence is no longer needed, we will take it down and haul it away.
Like our residential and commercial fencing, our temporary fences are obtained from the best manufacturers using the finest materials. Our fences have a tidy, sturdy, professional appearance that local residents and businesses appreciate. We also see to all legally required inspections and certifications.
Ready for a price quote? Contact us today via our Online Quote service. Be sure to provide the following information so we can provide an accurate estimate:
1. The preferred height of your fence (Be aware that local regulations commonly allow a maximum height of three metres.)
2. The perimeter of the area you need to enclose
3. The number of gated entrances needed
4. The number of days the fence needs to be up
Phone: (0117) 555-9102
Online Quote Form
Name: Marguerite Carhart
Installation Address: 438 Stretford Way, Bristol BS5 7TB
E-mail: mcarhart@stockporteventcentre.co.uk
Today''s date: 8 August
Fence Details: I need a temporary three-metre-tall fence installed around the Stockport Event Centre within the next two weeks. This is to prevent the public from entering while we make renovations from 18 to 30 August. Two gates are needed so that workers and vehicles may enter and leave the location.
To: mcarhart@stockporteventcentre.co.uk
From: hmontalbo@runklefencing.co.uk
Date: 9 August
Subject: Quote Number 080817
Attachment: fencequote_mcarhart
Dear Ms. Carhart,
Thank you for your enquiry. Please see the attached estimate for the work you requested. Note that the price of delivery is included at no further charge unless a rush order-one providing less than three weeks'' notice-is required. This is a rough estimate based on the information you provided. If you ring us at (0117) 555-2938 and provide us with a missing detail, I can give you a more accurate quote.
You might also consider including a plastic curtain with your order. This would be wrapped around and fastened to the fence, hiding the construction site from the view of pedestrians. If this interests you, we can include it in the revised quote.
Best Regards,
Howard Montalbo', 18, 1);
INSERT INTO dbo.QuestionGroup (Id, ExamId, Part, PassageText, OrderIndex, ShuffleQuestions) VALUES (19, 1, 7, N'To: Daniel Rodrigues Pereira
From: Livia Romero
Subject: Company outing
Date: August 5
Hello Daniel,
I hope you are settling in well. I''m sure you have had a busy few weeks. Around this time of year, the office manager typically begins arranging our annual company outing. I think we mentioned this during your interview in June. Previously, we have done things like going to a concert and taking a local river cruise. The outing is always great for morale, and everyone looks forward to it.
This year, I think it would be a good idea to get tickets to a sporting event. I know that many staff members are fans of the San Jose Starlings baseball team. It should be an evening game when the team is playing at home. We have a budget of $600.00 this year. Looking at the ticket prices, it seems that will be just enough to get a ticket for every staff member. I''m sure Elise can assist you with this; she has often helped organize the outings. Let me know if you have any questions.
Best,
Livia Romero
Director of Administration, Loftgren Consulting
San Jose Starlings
Plan your next event with the San Jose Starlings! Discounted tickets are available for groups of ten or more. The more tickets you buy, the more you save-perfect for family gatherings, company outings, or charity fund-raisers! Get perks such as free tickets for the organizer, discounts on food, and your group''s name displayed on the scoreboard.
Group Ticket Pricing
10 tickets: $130.00
30 tickets: $360.00
50 tickets: $550.00
70 tickets: $700.00
Contact grouptickets@sanjosestarlings.com or call 408-555-0101 for more information.
San Jose Starlings - August Schedule
Date | Day | Time | Opposing Team | Home or Away
August 13 | Sunday | 1:05 P.M. | Aspen Monarchs | Home
August 15 | Tuesday | 7:05 P.M. | Aspen Monarchs | Home
August 19 | Saturday | 1:05 P.M. | Philipsburg Pinstripes | Away
August 22 | Tuesday | 7:05 P.M. | Philipsburg Pinstripes | Away
Purchase tickets online at www.sanjosestarlings.com/tickets.', 19, 1);
SET IDENTITY_INSERT dbo.QuestionGroup OFF;
SET IDENTITY_INSERT dbo.Question ON;
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (1, 1, NULL, 5, 101, N'If ------- are not satisfied with an item, return it for a full refund within 30 days of purchase.', NULL, 'A', N'Cần đại từ nhân xưng làm chủ ngữ cho "are not satisfied" → "you".', 1, 1);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (2, 1, NULL, 5, 102, N'The location of next month''s online gaming forum is yet to be -------.', NULL, 'D', N'"yet to be decided" = chưa được quyết định; các từ còn lại không hợp nghĩa.', 1, 2);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (3, 1, NULL, 5, 103, N'Guests were ------- with the table decorations for the company banquet.', NULL, 'B', N'Bị động "were impressed with" = bị ấn tượng bởi → cần quá khứ phân từ.', 1, 3);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (4, 1, NULL, 5, 104, N'The Shubert Company is ------- effective at helping power plants reduce their carbon dioxide emissions.', NULL, 'D', N'Cần trạng từ chỉ mức độ trước tính từ "effective": "very effective".', 1, 4);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (5, 1, NULL, 5, 105, N'Mr. Hodges ------- that volunteers sign up to assist with the Hannock River cleanup by Friday.', NULL, 'C', N'Chủ ngữ số ít + hiện tại đơn → "requests" (động từ chia). "requesting" thiếu trợ động từ.', 1, 5);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (6, 1, NULL, 5, 106, N'Last year, the Daejeon English News ------- the number of readers by adding a digital subscription option.', NULL, 'B', N'"increased the number of readers" = tăng số độc giả (hợp với "adding a digital option").', 1, 6);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (7, 1, NULL, 5, 107, N'Before the updated design can go into -------, it must be approved by management.', NULL, 'D', N'"go into production" = đi vào sản xuất → cần danh từ "production".', 1, 7);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (8, 1, NULL, 5, 108, N'The economic development summit will be held ------- the Xi''an Trade Tower on September 22.', NULL, 'B', N'Giới từ chỉ địa điểm cụ thể: "held at the Xi''an Trade Tower".', 1, 8);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (9, 1, NULL, 5, 109, N'Inclement weather was ------- responsible for the low turnout at Saturday''s Exton Music Festival.', NULL, 'A', N'Cần trạng từ bổ nghĩa cho tính từ "responsible": "largely responsible".', 1, 9);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (10, 1, NULL, 5, 110, N'Our most recent survey was sent to clients just last week, ------- it is too soon to send another one.', NULL, 'C', N'Quan hệ nhân quả: đã gửi tuần trước → VÌ VẬY (so) còn quá sớm để gửi tiếp.', 1, 10);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (11, 1, NULL, 5, 111, N'------- necklace that is shipped from Gillis Designers is given a thorough quality check.', NULL, 'D', N'"Each necklace" (số ít) đi với động từ "is" → "Each" + danh từ đếm được số ít.', 1, 11);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (12, 1, NULL, 5, 112, N'Ms. Valdez'' sales numbers are good ------- for her to be considered for the employee-of-the-month award.', NULL, 'D', N'"good enough for her to be considered" = đủ tốt để được cân nhắc.', 1, 12);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (13, 1, NULL, 5, 113, N'Aaron Park''s new book features photographs of homes designed and built by the homeowners -------.', NULL, 'C', N'Đại từ phản thân số nhiều chỉ "the homeowners" → "themselves".', 1, 13);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (14, 1, NULL, 5, 114, N'It is ------- for the audience to hold its applause until the speaker has finished.', NULL, 'D', N'"It is customary for... to..." = theo thông lệ, khán giả giữ tiếng vỗ tay.', 1, 14);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (15, 1, NULL, 5, 115, N'Despite ------- that Legend Air would perform poorly with the entry of cheaper competition, it posted strong second-quarter earnings.', NULL, 'D', N'"Despite + danh từ" → "Despite predictions that..." = bất chấp những dự đoán.', 1, 15);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (16, 1, NULL, 5, 116, N'Mr. Nigam was ------- retirement when his boss asked him to be the head of security at the new facility.', NULL, 'D', N'"was close to retirement" = sắp nghỉ hưu.', 1, 16);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (17, 1, NULL, 5, 117, N'Main Street Restaurant offers a menu of ------- prepared lunch and dinner meals.', NULL, 'D', N'Cần trạng từ bổ nghĩa cho "prepared": "thoughtfully prepared" = chuẩn bị chu đáo.', 1, 17);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (18, 1, NULL, 5, 118, N'------- our public relations manager, Ms. Ghazarian has just been appointed vice president of media relations.', NULL, 'D', N'"Formerly our PR manager... has just been appointed VP" = trước đây là..., nay được bổ nhiệm.', 1, 18);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (19, 1, NULL, 5, 119, N'Videos of Korean pop music have become very popular ------- adolescents worldwide.', NULL, 'C', N'"popular among adolescents" = phổ biến trong giới thanh thiếu niên.', 1, 19);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (20, 1, NULL, 5, 120, N'Milante Shoes ------- altered the firm''s marketing strategy after a recent economic shift.', NULL, 'C', N'Cần trạng từ bổ nghĩa cho "altered": "quickly altered" = nhanh chóng thay đổi.', 1, 20);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (21, 1, NULL, 5, 121, N'The annual report has been posted online, ------- the director''s office has not yet received a printed copy.', NULL, 'A', N'Tương phản: đã đăng online, NHƯNG (but) văn phòng giám đốc chưa nhận bản in.', 1, 21);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (22, 1, NULL, 5, 122, N'Hasin Fariz turned a study on the ------- effects of sleep into a best-selling book.', NULL, 'A', N'Tính từ bổ nghĩa cho danh từ "effects": "favorable effects" = tác động tích cực.', 1, 22);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (23, 1, NULL, 5, 123, N'Wynston Containers is ------- a yearly shutdown of its factory so that it can be evaluated for safety and efficiency.', NULL, 'C', N'"implementing a yearly shutdown" = thực hiện việc đóng cửa hàng năm.', 1, 23);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (24, 1, NULL, 5, 124, N'The Girard Botanical Archive has almost 300,000 plant -------, all neatly pressed onto archival paper.', NULL, 'B', N'"300,000 plant specimens" = 300.000 mẫu thực vật (ép lên giấy lưu trữ).', 1, 24);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (25, 1, NULL, 5, 125, N'Hotels and universities are ------- to recycle their used mattresses through the city''s recycling program.', NULL, 'B', N'"are eligible to recycle" = đủ điều kiện để tái chế.', 1, 25);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (26, 1, NULL, 5, 126, N'The ------- to review plans to replace the Tronton Bridge will be scheduled soon.', NULL, 'C', N'"The hearing to review plans" = buổi điều trần xem xét kế hoạch (danh từ).', 1, 26);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (27, 1, NULL, 5, 127, N'Kovox Ltd. aims to optimize quality ------- reducing the impact on the environment.', NULL, 'B', N'"optimize quality while reducing..." = tối ưu chất lượng ĐỒNG THỜI giảm tác động.', 1, 27);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (28, 1, NULL, 5, 128, N'The grocery store ------- vegetables from out of town until local prices went down last month.', NULL, 'D', N'Hành động kéo dài rồi kết thúc trước "prices went down last month" → quá khứ hoàn thành tiếp diễn.', 1, 28);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (29, 1, NULL, 5, 129, N'All Hershel Industries employees must have a valid ID card ------- enter the building.', NULL, 'A', N'"must have a valid ID card in order to enter" = phải có thẻ ĐỂ vào tòa nhà.', 1, 29);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (30, 1, NULL, 5, 130, N'------- and cost factored equally in choosing Cantavox as our main supplier.', NULL, 'A', N'"Reliability and cost factored equally" = Độ tin cậy và chi phí được cân nhắc như nhau.', 1, 30);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (31, 1, 1, 6, 131, NULL, 42, 'A', N'"strives to provide" = nỗ lực cung cấp (strive + to V).', 1, 31);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (32, 1, 1, 6, 132, NULL, 277, 'D', N'"a part of the community for a combined total of 40 years" → "for" + khoảng thời gian.', 1, 32);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (33, 1, 1, 6, 133, NULL, 434, 'C', N'Thông báo đóng cửa để sửa chữa → câu xin lỗi vì sự bất tiện là hợp ngữ cảnh nhất.', 1, 33);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (34, 1, 1, 6, 134, NULL, 550, 'C', N'"maintain normal business hours" = duy trì giờ làm việc bình thường.', 1, 34);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (35, 1, 2, 6, 135, NULL, 212, 'B', N'Cuộc gặp đã xảy ra → quá khứ: "I enjoyed our conversation".', 1, 35);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (36, 1, 2, 6, 136, NULL, 380, 'C', N'"the third and final round of interviews" = vòng phỏng vấn thứ ba và cuối.', 1, 36);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (37, 1, 2, 6, 137, NULL, 540, 'D', N'Tính từ trước danh từ "amount": "a substantial amount of money".', 1, 37);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (38, 1, 2, 6, 138, NULL, 760, 'B', N'Đoạn trước hỏi về "start date" → câu trả lời về thời gian bắt đầu làm việc.', 1, 38);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (39, 1, 3, 6, 139, NULL, 238, 'C', N'Câu sau nói "đặc biệt muốn nghe ý tưởng nâng cấp nhà ga" → trước đó khen công việc của đối phương.', 1, 39);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (40, 1, 3, 6, 140, NULL, 384, 'B', N'Tính từ trước danh từ "restaurants": "a number of excellent restaurants".', 1, 40);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (41, 1, 3, 6, 141, NULL, 552, 'A', N'"colleagues to join us" = đồng nghiệp tham gia cùng chúng tôi.', 1, 41);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (42, 1, 3, 6, 142, NULL, 588, 'A', N'"would appreciate + to V" (appreciate + to discuss): đánh giá cao việc thảo luận.', 1, 42);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (43, 1, 4, 6, 143, NULL, 96, 'C', N'"begins on April 18 and will run for five weeks" = bắt đầu... và sẽ kéo dài 5 tuần (tương lai).', 1, 43);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (44, 1, 4, 6, 144, NULL, 233, 'A', N'Liên hoan phim → "presenting movies from Asia and South America".', 1, 44);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (45, 1, 4, 6, 145, NULL, 480, 'B', N'"this popular event" = sự kiện nổi tiếng/phổ biến này.', 1, 45);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (46, 1, 4, 6, 146, NULL, 530, 'D', N'Câu sau nói "members can now purchase priority tickets" → trước đó vé mở bán cho công chúng.', 1, 46);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (47, 1, 5, 7, 147, N'For whom is the advertisement intended?', NULL, 'B', N'Quảng cáo "Hiring Event" mời người đến nghe về vị trí tuyển, gặp nhà tuyển dụng, mang hồ sơ → dành cho người tìm việc.', 1, 47);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (48, 1, 5, 7, 148, N'What is stated about Sedwick Electronics?', NULL, 'D', N'"opening a new manufacturing facility in Hanover" + nhân viên từ "Lancaster facility" → có nhiều hơn một địa điểm.', 1, 48);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (49, 1, 6, 7, 149, N'What will happen on March 1?', NULL, 'B', N'"Beginning March 1... customers will be able to return purchases made online" → chính sách mới có hiệu lực.', 1, 49);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (50, 1, 6, 7, 150, N'What is NOT a requirement for a complete refund?', NULL, 'A', N'Đề KHÔNG yêu cầu trả tại nơi mua ban đầu (ngược lại cho phép trả online tại cửa hàng).', 1, 50);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (51, 1, 7, 7, 151, N'Why would people enroll in the course taught by Ms. Sanders?', NULL, 'C', N'Khóa của Ms. Sanders là "Spreadsheet Basics" → học cách tạo biểu đồ/charts.', 1, 51);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (52, 1, 7, 7, 152, N'What is indicated about Ms. Farid?', NULL, 'C', N'Ms. Farid dạy Spreadsheet Basics (Sunday) và Internet Safety (Saturday) → dạy 2 buổi/tuần.', 1, 52);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (53, 1, 8, 7, 153, N'Why did Ms. Witham contact Ms. Ohara?', NULL, 'B', N'Bà báo giờ tàu đến Tokyo và hỏi "How should I get to your location?" → sắp xếp chuyến thăm cửa hàng.', 1, 53);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (54, 1, 8, 7, 154, N'At 4:51 P.M., what does Ms. Ohara most likely mean when she writes, "You should like things here, too"?', NULL, 'A', N'Sau khi bà Witham khen Kyoto store tuân thủ "specifications", bà Ohara ngụ ý Tokyo cũng vận hành đúng chính sách.', 1, 54);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (55, 1, 9, 7, 155, N'What did Ms. Tulio most likely do?', NULL, 'C', N'"Report completed by: Vivian Tulio" + bảng chấm điểm từng bộ phận → cô thực hiện kiểm tra (thanh tra).', 1, 55);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (56, 1, 9, 7, 156, N'What part of the structure is in most need of maintenance?', NULL, 'B', N'"Road surface" có rating 3 (thấp nhất, "Shows deterioration") → cần bảo trì nhất.', 1, 56);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (57, 1, 9, 7, 157, N'What is probably true about the Blaine River Drawbridge?', NULL, 'A', N'"Sidewalk or walkway: 6 = Not applicable" → cầu không dành cho người đi bộ.', 1, 57);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (58, 1, 10, 7, 158, N'What is the purpose of the article?', NULL, 'B', N'Bài nói hệ thống loa "scheduled to be refurbished... replaced with new devices" → mô tả việc nâng cấp.', 1, 58);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (59, 1, 10, 7, 159, N'How does Mr. Miller feel about the plans?', NULL, 'D', N'"I had heard the reports... all I can say is that it is about time!" → ông đã chờ đợi sự thay đổi.', 1, 59);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (60, 1, 10, 7, 160, N'The word "stages" in paragraph 5, line 2, is closest in meaning to', NULL, 'A', N'"came together in stages" = hình thành theo từng giai đoạn → "steps".', 1, 60);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (61, 1, 11, 7, 161, N'What is indicated about Datoric Systems?', NULL, 'B', N'Email thông báo "several new procedures regarding business trip expense reports".', 1, 61);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (62, 1, 11, 7, 162, N'Why is the accounting software mentioned?', NULL, 'A', N'"the software will now automatically calculate... You need only to upload images" → nêu tính năng đặc biệt.', 1, 62);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (63, 1, 11, 7, 163, N'In which of the positions marked [1], [2], [3], and [4] does the following sentence best belong? "Following these steps will enable us to quickly issue your reimbursement payment."', NULL, 'C', N'Câu tóm tắt "Following these steps..." đặt sau khi liệt kê đủ các bước → vị trí [3].', 1, 63);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (64, 1, 12, 7, 164, N'What is the main topic of the article?', NULL, 'C', N'Chủ đề: "Africa''s role as a consumer of fashion has been on the rise... designers to become producers" → tăng trưởng ngành thời trang châu Phi.', 1, 64);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (65, 1, 12, 7, 165, N'What is indicated about Abbi Sportscore?', NULL, 'B', N'"manufacturing its products in her home city of Nazret" → sản xuất giày ở Nazret.', 1, 65);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (66, 1, 12, 7, 166, N'What is suggested about the Jumjum and Longa Web sites?', NULL, 'B', N'"available for purchase... as far away as London and New York" → nhận đơn hàng toàn cầu.', 1, 66);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (67, 1, 12, 7, 167, N'In which of the positions marked [1], [2], [3], and [4] does the following sentence best belong? "The city boasts four garment factories, with a fifth scheduled to be built this year in nearby Wonji."', NULL, 'C', N'Câu về "garment factories" nói về thành phố Nazret → đặt sau "her home city of Nazret" ở [3].', 1, 67);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (68, 1, 13, 7, 168, N'Where do the people most likely work?', NULL, 'D', N'Họ bàn về "cover design", "September issue", "article titles", "Graphics", "printout" → nhà xuất bản tạp chí.', 1, 68);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (69, 1, 13, 7, 169, N'Why does Mr. Park apologize?', NULL, 'A', N'"I forgot... I''m just now sending the file with the most recent version" → gửi nhầm file cũ.', 1, 69);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (70, 1, 13, 7, 170, N'At 10:30 A.M., what does Ms. Riley most likely mean when she writes, "That''s more like it"?', NULL, 'B', N'Trước đó bà yêu cầu "background color should be lighter" → "That''s more like it" = màu trông đẹp hơn.', 1, 70);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (71, 1, 13, 7, 171, N'What will Mr. Ojeda do by the afternoon?', NULL, 'B', N'"I''ll have a print copy ready for your approval after lunch" → tạo bản in mẫu.', 1, 71);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (72, 1, 14, 7, 172, N'What is the purpose of the letter?', NULL, 'B', N'"you have been nominated as a finalist for the Small Business Challenge" → thông báo lọt vào chung kết.', 1, 72);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (73, 1, 14, 7, 173, N'What does Ms. Chelvi most likely specialize in?', NULL, 'B', N'"The Web application that you developed" → chuyên về công nghệ.', 1, 73);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (74, 1, 14, 7, 174, N'The word "illustrates" in paragraph 3, line 2, is closest in meaning to', NULL, 'A', N'"a video that clearly illustrates the use" = minh họa/thể hiện → "represents".', 1, 74);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (75, 1, 14, 7, 175, N'What is Ms. Chelvi asked to do by March 10?', NULL, 'C', N'"You will also need to sign a consent form... The deadline... is 10 March."', 1, 75);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (76, 1, 15, 7, 176, N'According to the e-mail, how did Mr. Riedewald receive reward points?', NULL, 'B', N'"Thank you for filling out the MHF survey. To show our appreciation, we have added reward points."', 1, 76);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (77, 1, 15, 7, 177, N'In the e-mail, the phrase "filling out" in paragraph 1, line 1, is closest in meaning to', NULL, 'C', N'"filling out (a survey)" = điền/hoàn thành → "completing".', 1, 77);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (78, 1, 15, 7, 178, N'How can customers apply their reward points in an MHF retail store?', NULL, 'C', N'"select ''Print as a coupon.'' The coupon will have a bar code that can be scanned at the store''s checkout counter."', 1, 78);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (79, 1, 15, 7, 179, N'According to the receipt, what is true about Mr. Riedewald?', NULL, 'D', N'Frame $10-10=0; mug $40-20=20; blanket $25-17=8; photo album $34 (không giảm) → chỉ 1 món giá gốc.', 1, 79);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (80, 1, 15, 7, 180, N'What item did Mr. Riedewald most likely purchase using reward credits?', NULL, 'A', N'Picture frame $10 có "Special Discount -10.00" = $0 → mua bằng điểm thưởng (credit).', 1, 80);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (81, 1, 16, 7, 181, N'What is a purpose of the letter?', NULL, 'C', N'"Enclosed please find your royalty payment" → thông báo khoản thanh toán nhuận bút.', 1, 81);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (82, 1, 16, 7, 182, N'What was sent in a previous message to Mr. Morello?', NULL, 'B', N'"recently received an e-mail that listed the sales figures and the royalties" → số liệu bán hàng.', 1, 82);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (83, 1, 16, 7, 183, N'What does Ms. Wicklin mention about Two Swan Press?', NULL, 'C', N'"Two Swan Press was given the Publisher of the Year Award by the UK Book Industry."', 1, 83);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (84, 1, 16, 7, 184, N'What is suggested about Mr. Booth?', NULL, 'A', N'Đơn hàng áp "Discount Applied (AUX1417)" — mã giảm giá dành riêng cho tác giả → ông Booth là tác giả.', 1, 84);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (85, 1, 16, 7, 185, N'What is indicated about the order?', NULL, 'D', N'Order "Shipping: Free" + web "free shipping on all orders over £35" (balance £45).', 1, 85);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (86, 1, 17, 7, 186, N'What does the e-mail indicate about the mentoring program?', NULL, 'B', N'"will match a maximum of ten junior employees" → số người tham gia có giới hạn.', 1, 86);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (87, 1, 17, 7, 187, N'How will the junior employees most likely be selected?', NULL, 'C', N'"complete the attached application and return to... Tim Wrigley... Mr. Wrigley will send notification of his selections."', 1, 87);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (88, 1, 17, 7, 188, N'What is suggested about Ms. Drummond?', NULL, 'A', N'Chương trình dành cho người "less than eighteen months" và Ms. Drummond nộp đơn tham gia.', 1, 88);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (89, 1, 17, 7, 189, N'What is most likely true about Ms. Russo?', NULL, 'B', N'Ms. Russo là VP of Sales; Ms. Drummond muốn học về "markets abroad" → VP Sales có kinh nghiệm bán hàng quốc tế.', 1, 89);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (90, 1, 17, 7, 190, N'What benefit from the mentoring program have both Ms. Drummond and Ms. Russo enjoyed?', NULL, 'A', N'Ms. Drummond "happier person when I arrive to work" + Ms. Russo "more satisfied with my own duties" → cả hai tăng sự hài lòng.', 1, 90);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (91, 1, 18, 7, 191, N'What does the Web site indicate about fences taller than three meters?', NULL, 'B', N'"local regulations commonly allow a maximum height of three metres" → cao hơn 3m thường bị cấm.', 1, 91);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (92, 1, 18, 7, 192, N'According to the form, why does Ms. Carhart need a temporary fence installed?', NULL, 'D', N'"This is to prevent the public from entering while we make renovations."', 1, 92);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (93, 1, 18, 7, 193, N'What information does Ms. Carhart fail to give about the fence she needs?', NULL, 'C', N'Cô đã cho chiều cao (3m), ngày (18-30 Aug), số cổng (2) nhưng THIẾU chu vi khu vực.', 1, 93);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (94, 1, 18, 7, 194, N'What is implied about Ms. Carhart''s fence project?', NULL, 'A', N'Email: giao miễn phí "unless a rush order... less than three weeks'' notice"; cô cần trong 2 tuần → rush order → tính phí giao.', 1, 94);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (95, 1, 18, 7, 195, N'Why does Mr. Montalbo recommend adding a curtain?', NULL, 'C', N'"hiding the construction site from the view of pedestrians" → tấm chắn thị giác.', 1, 95);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (96, 1, 19, 7, 196, N'Why did Ms. Romero send the e-mail to Mr. Rodrigues Pereira?', NULL, 'D', N'Bà gợi ý vé thể thao và nhờ anh lo sự kiện ("I''m sure Elise can assist you with this") → nhờ anh sắp xếp.', 1, 96);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (97, 1, 19, 7, 197, N'What does the e-mail imply about Mr. Rodrigues Pereira?', NULL, 'D', N'"I hope you are settling in well... your interview in June" → anh mới bắt đầu làm việc.', 1, 97);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (98, 1, 19, 7, 198, N'According to the flyer, what is a benefit of buying tickets as a group?', NULL, 'A', N'"Discounted tickets are available for groups of ten or more."', 1, 98);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (99, 1, 19, 7, 199, N'How many employees does Loftgren Consulting most likely have?', NULL, 'C', N'Budget $600; 50 vé = $550 (vừa đủ), 70 vé = $700 (vượt ngân sách) → 50 nhân viên.', 1, 99);
INSERT INTO dbo.Question (Id, ExamId, GroupId, Part, QuestionNumber, StemText, GapPosition, CorrectOptionKey, Hint, ShuffleAnswers, OrderIndex) VALUES (100, 1, 19, 7, 200, N'On what date could Loftgren Consulting employees attend a game?', NULL, 'B', N'Cần "evening game when the team is playing at home" → Aug 15 (7:05 P.M., Home).', 1, 100);
SET IDENTITY_INSERT dbo.Question OFF;
SET IDENTITY_INSERT dbo.AnswerOption ON;
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (1, 1, 'A', N'you', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (2, 1, 'B', N'your', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (3, 1, 'C', N'yours', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (4, 1, 'D', N'yourself', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (5, 2, 'A', N'concluded', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (6, 2, 'B', N'prevented', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (7, 2, 'C', N'invited', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (8, 2, 'D', N'decided', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (9, 3, 'A', N'impressive', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (10, 3, 'B', N'impressed', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (11, 3, 'C', N'impressing', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (12, 3, 'D', N'impressively', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (13, 4, 'A', N'once', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (14, 4, 'B', N'far', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (15, 4, 'C', N'early', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (16, 4, 'D', N'very', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (17, 5, 'A', N'requesting', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (18, 5, 'B', N'to be requested', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (19, 5, 'C', N'requests', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (20, 5, 'D', N'to request', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (21, 6, 'A', N'needed', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (22, 6, 'B', N'increased', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (23, 6, 'C', N'joined', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (24, 6, 'D', N'asked', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (25, 7, 'A', N'product', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (26, 7, 'B', N'producer', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (27, 7, 'C', N'productive', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (28, 7, 'D', N'production', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (29, 8, 'A', N'to', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (30, 8, 'B', N'at', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (31, 8, 'C', N'down', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (32, 8, 'D', N'of', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (33, 9, 'A', N'largely', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (34, 9, 'B', N'large', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (35, 9, 'C', N'largest', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (36, 9, 'D', N'larger', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (37, 10, 'A', N'when', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (38, 10, 'B', N'since', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (39, 10, 'C', N'so', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (40, 10, 'D', N'finally', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (41, 11, 'A', N'Whenever', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (42, 11, 'B', N'Also', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (43, 11, 'C', N'All', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (44, 11, 'D', N'Each', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (45, 12, 'A', N'forward', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (46, 12, 'B', N'even', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (47, 12, 'C', N'ahead', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (48, 12, 'D', N'enough', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (49, 13, 'A', N'itself', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (50, 13, 'B', N'himself', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (51, 13, 'C', N'themselves', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (52, 13, 'D', N'ourselves', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (53, 14, 'A', N'enthusiastic', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (54, 14, 'B', N'casual', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (55, 14, 'C', N'exclusive', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (56, 14, 'D', N'customary', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (57, 15, 'A', N'predicted', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (58, 15, 'B', N'predictable', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (59, 15, 'C', N'predicts', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (60, 15, 'D', N'predictions', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (61, 16, 'A', N'under', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (62, 16, 'B', N'ahead of', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (63, 16, 'C', N'nearby', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (64, 16, 'D', N'close to', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (65, 17, 'A', N'thought', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (66, 17, 'B', N'thoughtfulness', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (67, 17, 'C', N'thoughts', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (68, 17, 'D', N'thoughtfully', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (69, 18, 'A', N'Sincerely', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (70, 18, 'B', N'Immediately', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (71, 18, 'C', N'Solely', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (72, 18, 'D', N'Formerly', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (73, 19, 'A', N'including', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (74, 19, 'B', N'whereas', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (75, 19, 'C', N'among', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (76, 19, 'D', N'within', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (77, 20, 'A', N'quick', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (78, 20, 'B', N'quickest', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (79, 20, 'C', N'quickly', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (80, 20, 'D', N'quicken', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (81, 21, 'A', N'but', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (82, 21, 'B', N'why', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (83, 21, 'C', N'with', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (84, 21, 'D', N'once', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (85, 22, 'A', N'favorable', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (86, 22, 'B', N'favor', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (87, 22, 'C', N'favors', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (88, 22, 'D', N'favorably', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (89, 23, 'A', N'involving', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (90, 23, 'B', N'participating', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (91, 23, 'C', N'implementing', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (92, 23, 'D', N'producing', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (93, 24, 'A', N'authorities', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (94, 24, 'B', N'specimens', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (95, 24, 'C', N'founders', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (96, 24, 'D', N'specifics', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (97, 25, 'A', N'systematic', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (98, 25, 'B', N'eligible', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (99, 25, 'C', N'familiar', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (100, 25, 'D', N'successful', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (101, 26, 'A', N'heard', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (102, 26, 'B', N'hears', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (103, 26, 'C', N'hearing', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (104, 26, 'D', N'hear', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (105, 27, 'A', N'which', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (106, 27, 'B', N'while', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (107, 27, 'C', N'because', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (108, 27, 'D', N'unless', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (109, 28, 'A', N'is buying', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (110, 28, 'B', N'will be buying', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (111, 28, 'C', N'has been buying', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (112, 28, 'D', N'had been buying', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (113, 29, 'A', N'in order to', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (114, 29, 'B', N'as long as', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (115, 29, 'C', N'regarding', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (116, 29, 'D', N'always', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (117, 30, 'A', N'Reliability', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (118, 30, 'B', N'Allowance', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (119, 30, 'C', N'Dependence', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (120, 30, 'D', N'Estimation', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (121, 31, 'A', N'to provide', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (122, 31, 'B', N'provided', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (123, 31, 'C', N'providing', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (124, 31, 'D', N'to be provided', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (125, 32, 'A', N'except', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (126, 32, 'B', N'amid', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (127, 32, 'C', N'near', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (128, 32, 'D', N'for', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (129, 33, 'A', N'Unfortunately, services will be limited.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (130, 33, 'B', N'We thank you for trusting in PGD Bank over these years.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (131, 33, 'C', N'We apologize for any inconvenience this may cause.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (132, 33, 'D', N'Traffic on the boulevard has increased lately.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (133, 34, 'A', N'investments', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (134, 34, 'B', N'hiring', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (135, 34, 'C', N'hours', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (136, 34, 'D', N'interests', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (137, 35, 'A', N'enjoy', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (138, 35, 'B', N'enjoyed', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (139, 35, 'C', N'enjoying', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (140, 35, 'D', N'will enjoy', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (141, 36, 'A', N'revisions', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (142, 36, 'B', N'promotions', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (143, 36, 'C', N'interviews', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (144, 36, 'D', N'receptions', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (145, 37, 'A', N'substance', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (146, 37, 'B', N'substantiate', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (147, 37, 'C', N'substantially', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (148, 37, 'D', N'substantial', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (149, 38, 'A', N'I have four additional questions to ask you.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (150, 38, 'B', N'I would be able to begin during the first week of February.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (151, 38, 'C', N'I am confident I have the potential for this position.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (152, 38, 'D', N'Thank you for the offer of employment.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (153, 39, 'A', N'I can meet you when you arrive.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (154, 39, 'B', N'Scheduling flights can be quite tricky.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (155, 39, 'C', N'I have long admired your work on regional airports.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (156, 39, 'D', N'There are several dining options at the airport.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (157, 40, 'A', N'excel', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (158, 40, 'B', N'excellent', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (159, 40, 'C', N'excellently', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (160, 40, 'D', N'excelled', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (161, 41, 'A', N'join', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (162, 41, 'B', N'pay', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (163, 41, 'C', N'remind', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (164, 41, 'D', N'defend', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (165, 42, 'A', N'to discuss', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (166, 42, 'B', N'discussing', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (167, 42, 'C', N'discuss', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (168, 42, 'D', N'discussed', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (169, 43, 'A', N'run', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (170, 43, 'B', N'has run', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (171, 43, 'C', N'will run', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (172, 43, 'D', N'ran', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (173, 44, 'A', N'movies', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (174, 44, 'B', N'clothing', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (175, 44, 'C', N'food', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (176, 44, 'D', N'books', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (177, 45, 'A', N'political', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (178, 45, 'B', N'popular', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (179, 45, 'C', N'practical', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (180, 45, 'D', N'preliminary', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (181, 46, 'A', N'The awards will be presented by Hunter Johns.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (182, 46, 'B', N'Renovations to the space are nearly complete.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (183, 46, 'C', N'The later offerings were an even bigger success.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (184, 46, 'D', N'Sales are open to the general public on March 3.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (185, 47, 'A', N'Recruiters', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (186, 47, 'B', N'Job seekers', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (187, 47, 'C', N'Local business owners', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (188, 47, 'D', N'Current Sedwick Electronics employees', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (189, 48, 'A', N'It is moving its headquarters.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (190, 48, 'B', N'It offers a training program for new employees.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (191, 48, 'C', N'It requires employees to wear uniforms.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (192, 48, 'D', N'It will have more than one location.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (193, 49, 'A', N'A shipment will be returned.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (194, 49, 'B', N'A new policy will go into effect.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (195, 49, 'C', N'A promotional sale will take place.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (196, 49, 'D', N'A customer survey will be published.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (197, 50, 'A', N'The return must be made at the original purchase location.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (198, 50, 'B', N'The return must be made within a certain time frame.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (199, 50, 'C', N'The item must be returned with all its components.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (200, 50, 'D', N'The item must be returned in the original packaging.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (201, 51, 'A', N'To practice designing Web sites', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (202, 51, 'B', N'To improve their Internet searches', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (203, 51, 'C', N'To get tips on creating spreadsheets', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (204, 51, 'D', N'To learn how to advertise on the Internet', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (205, 52, 'A', N'She also teaches children.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (206, 52, 'B', N'She is Ms. Sanders'' supervisor.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (207, 52, 'C', N'She teaches twice a week.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (208, 52, 'D', N'She used to work as a data analyst.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (209, 53, 'A', N'To review sales figures', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (210, 53, 'B', N'To arrange a store visit', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (211, 53, 'C', N'To discuss employee performance reviews', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (212, 53, 'D', N'To determine the most convenient train to take', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (213, 54, 'A', N'The Tokyo store is being run according to corporate policy.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (214, 54, 'B', N'Ms. Witham will find the athletic shoes she needs.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (215, 54, 'C', N'Ms. Ohara''s associate is always punctual.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (216, 54, 'D', N'The Tokyo store is located next to a popular restaurant.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (217, 55, 'A', N'Make repairs', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (218, 55, 'B', N'Hire a contractor', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (219, 55, 'C', N'Perform an inspection', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (220, 55, 'D', N'Authorize a construction plan', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (221, 56, 'A', N'The support elements', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (222, 56, 'B', N'The road surface', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (223, 56, 'C', N'The drainage features', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (224, 56, 'D', N'The safety barriers', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (225, 57, 'A', N'It was not designed for pedestrian use.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (226, 57, 'B', N'It will be closed for the month of October.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (227, 57, 'C', N'It does not have the required signage.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (228, 57, 'D', N'It is the oldest bridge on the Ridgeline Highway.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (229, 58, 'A', N'To clarify where subway riders can locate information', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (230, 58, 'B', N'To describe improvements at some subway stations', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (231, 58, 'C', N'To announce the creation of a new subway line', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (232, 58, 'D', N'To explain why subway schedules will be revised', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (233, 59, 'A', N'He expects the project to fail.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (234, 59, 'B', N'He is concerned about the cost.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (235, 59, 'C', N'He believes the work is unnecessary.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (236, 59, 'D', N'He has been waiting for the changes.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (237, 60, 'A', N'steps', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (238, 60, 'B', N'scenes', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (239, 60, 'C', N'train cars', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (240, 60, 'D', N'platforms', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (241, 61, 'A', N'It has increased the spending amount allowed for business dinners.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (242, 61, 'B', N'It will adopt new procedures for filing travel expense reports.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (243, 61, 'C', N'It has office locations in several countries.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (244, 61, 'D', N'It plans to hold a company celebration.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (245, 62, 'A', N'To highlight a special capability it has', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (246, 62, 'B', N'To encourage staff to install it', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (247, 62, 'C', N'To help employees log on to it', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (248, 62, 'D', N'To point out that it will be replaced', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (249, 63, 'A', N'[1]', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (250, 63, 'B', N'[2]', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (251, 63, 'C', N'[3]', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (252, 63, 'D', N'[4]', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (253, 64, 'A', N'New trends in marketing athletic footwear', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (254, 64, 'B', N'Increased competition in the African clothing market', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (255, 64, 'C', N'Recent growth in the African fashion industry', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (256, 64, 'D', N'The largest clothing companies in Africa', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (257, 65, 'A', N'It sells its products only online.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (258, 65, 'B', N'It manufactures its shoes in Nazret.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (259, 65, 'C', N'It will be moving its main offices soon.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (260, 65, 'D', N'It was the first shoe company in Ethiopia.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (261, 66, 'A', N'They sell only handcrafted goods.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (262, 66, 'B', N'They receive orders from around the world.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (263, 66, 'C', N'They offer free shipping to London and New York.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (264, 66, 'D', N'They are planning to open retail stores.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (265, 67, 'A', N'[1]', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (266, 67, 'B', N'[2]', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (267, 67, 'C', N'[3]', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (268, 67, 'D', N'[4]', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (269, 68, 'A', N'At a bookstore', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (270, 68, 'B', N'At a public library', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (271, 68, 'C', N'At a television studio', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (272, 68, 'D', N'At a magazine publisher', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (273, 69, 'A', N'He sent the wrong file.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (274, 69, 'B', N'He used an old e-mail address.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (275, 69, 'C', N'He missed a project deadline.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (276, 69, 'D', N'He lost an important document.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (277, 70, 'A', N'The budget is more reasonable.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (278, 70, 'B', N'The color looks better.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (279, 70, 'C', N'The story is more interesting.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (280, 70, 'D', N'The schedule is more realistic.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (281, 71, 'A', N'Approve a marketing plan', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (282, 71, 'B', N'Produce a sample', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (283, 71, 'C', N'Repair a printer', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (284, 71, 'D', N'Make copies of an agreement', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (285, 72, 'A', N'To seek volunteers for an event', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (286, 72, 'B', N'To notify a contest finalist', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (287, 72, 'C', N'To sell business consultation services', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (288, 72, 'D', N'To offer a small-business loan', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (289, 73, 'A', N'Law', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (290, 73, 'B', N'Technology', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (291, 73, 'C', N'Finance', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (292, 73, 'D', N'Marketing', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (293, 74, 'A', N'represents', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (294, 74, 'B', N'translates', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (295, 74, 'C', N'lightens', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (296, 74, 'D', N'decorates', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (297, 75, 'A', N'Update a Web page design', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (298, 75, 'B', N'Give a presentation', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (299, 75, 'C', N'Sign a consent form', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (300, 75, 'D', N'Pay a fee', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (301, 76, 'A', N'He won an online contest.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (302, 76, 'B', N'He participated in a customer survey.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (303, 76, 'C', N'He spent a certain amount of money.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (304, 76, 'D', N'He returned an item.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (305, 77, 'A', N'emptying', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (306, 77, 'B', N'supplying', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (307, 77, 'C', N'completing', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (308, 77, 'D', N'expanding', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (309, 78, 'A', N'By entering their account number', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (310, 78, 'B', N'By entering their phone number', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (311, 78, 'C', N'By scanning a coupon''s bar code', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (312, 78, 'D', N'By going to the Client Services Department', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (313, 79, 'A', N'He paid for delivery of the items.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (314, 79, 'B', N'He purchased the items in the evening.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (315, 79, 'C', N'He paid over $70 for all items combined.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (316, 79, 'D', N'He purchased only one item at regular price.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (317, 80, 'A', N'The picture frame', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (318, 80, 'B', N'The ceramic mug', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (319, 80, 'C', N'The floral blanket', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (320, 80, 'D', N'The photo album', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (321, 81, 'A', N'To ask Mr. Morello to write a book', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (322, 81, 'B', N'To explain an enclosed contract', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (323, 81, 'C', N'To notify Mr. Morello of a payment', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (324, 81, 'D', N'To describe an updated personnel policy', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (325, 82, 'A', N'Incorrect contact information', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (326, 82, 'B', N'Detailed sales numbers', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (327, 82, 'C', N'A list of suggested changes', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (328, 82, 'D', N'A link to an electronic book', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (329, 83, 'A', N'It moved to a new location in October.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (330, 83, 'B', N'It has launched a new program for its fifth anniversary.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (331, 83, 'C', N'It has won an industry award.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (332, 83, 'D', N'It has decided to focus on scientific publications.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (333, 84, 'A', N'He is a Two Swan Press author.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (334, 84, 'B', N'He wrote Business in Our Lives.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (335, 84, 'C', N'He is an acquaintance of Mr. Morello.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (336, 84, 'D', N'He has purchased items from Two Swan Press before.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (337, 85, 'A', N'It has been delayed.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (338, 85, 'B', N'It has not yet been paid.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (339, 85, 'C', N'It contains multiple books.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (340, 85, 'D', N'It includes free shipping.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (341, 86, 'A', N'It is popular industry-wide.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (342, 86, 'B', N'The number of participants is limited.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (343, 86, 'C', N'It is designed for staff in the sales division.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (344, 86, 'D', N'Participants must attend an orientation meeting.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (345, 87, 'A', N'They will be chosen from a management-training group.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (346, 87, 'B', N'They will undergo competitive interviews.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (347, 87, 'C', N'They will be evaluated by Mr. Wrigley.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (348, 87, 'D', N'They will be recommended by a local business school.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (349, 88, 'A', N'She has worked at Broadside Electronics for less than eighteen months.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (350, 88, 'B', N'She has just transferred from another department.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (351, 88, 'C', N'She has received a positive annual review.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (352, 88, 'D', N'She has made many successful presentations abroad.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (353, 89, 'A', N'She is planning to retire soon.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (354, 89, 'B', N'She has international sales experience.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (355, 89, 'C', N'She has mentored many junior employees.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (356, 89, 'D', N'She recently joined the hiring team.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (357, 90, 'A', N'Increased job satisfaction', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (358, 90, 'B', N'Quick promotions', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (359, 90, 'C', N'Paycheck bonuses', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (360, 90, 'D', N'Clearer career goals', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (361, 91, 'A', N'They are made of plastic.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (362, 91, 'B', N'They are usually prohibited by law.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (363, 91, 'C', N'They require special transportation.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (364, 91, 'D', N'They must be ordered directly from the manufacturer.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (365, 92, 'A', N'To mark a property line', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (366, 92, 'B', N'To draw attention to an exhibit', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (367, 92, 'C', N'To control a crowd at a special event', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (368, 92, 'D', N'To limit public access to a work site', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (369, 93, 'A', N'The height of the fence to be erected', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (370, 93, 'B', N'The dates when the fence is needed', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (371, 93, 'C', N'The perimeter of the area to be enclosed', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (372, 93, 'D', N'The number of entrances needed', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (373, 94, 'A', N'There will be a charge for delivery.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (374, 94, 'B', N'The project involves work at several job sites.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (375, 94, 'C', N'Extra workers must be hired to install the fence.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (376, 94, 'D', N'Inspectors must first approve the project.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (377, 95, 'A', N'It would act as a noise barrier.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (378, 95, 'B', N'It would help keep in dust.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (379, 95, 'C', N'It would serve as a visual screen.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (380, 95, 'D', N'It would improve safety conditions.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (381, 96, 'A', N'To tell him about an upcoming budget cut', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (382, 96, 'B', N'To invite him to a concert', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (383, 96, 'C', N'To introduce him to his new assistant', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (384, 96, 'D', N'To ask him to arrange an event', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (385, 97, 'A', N'He recently attended a San Jose Starlings game.', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (386, 97, 'B', N'He will be leaving in a few weeks to go on vacation.', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (387, 97, 'C', N'He is a professional party planner.', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (388, 97, 'D', N'He recently began working for Loftgren Consulting.', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (389, 98, 'A', N'Reduced ticket prices', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (390, 98, 'B', N'Free food', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (391, 98, 'C', N'Front-row seating', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (392, 98, 'D', N'T-shirts with the team''s logo', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (393, 99, 'A', N'10', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (394, 99, 'B', N'30', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (395, 99, 'C', N'50', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (396, 99, 'D', N'70', 3);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (397, 100, 'A', N'August 13', 0);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (398, 100, 'B', N'August 15', 1);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (399, 100, 'C', N'August 19', 2);
INSERT INTO dbo.AnswerOption (Id, QuestionId, OptionKey, OptionText, OrderIndex) VALUES (400, 100, 'D', N'August 22', 3);
SET IDENTITY_INSERT dbo.AnswerOption OFF;
COMMIT;
PRINT 'import ok';
