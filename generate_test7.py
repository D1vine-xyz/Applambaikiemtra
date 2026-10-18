# -*- coding: utf-8 -*-
"""
Sinh 2 file tu du lieu TOEIC Reading Test 7 (Reading v07):
  1. TOEIC_Reading_Test7_Tagged.docx  — de thi co gan tag chuan
  2. Dap_an_va_Goi_y_Test7.md          — bang dap an + goi y (tham khao)

Chay:  python generate_test7.py
"""
from docx import Document
from docx.shared import Pt, RGBColor

OUT_DOCX = r"C:/Giua-ky/TOEIC_Reading_Test7_Tagged.docx"
OUT_MD   = r"C:/Giua-ky/Dap_an_va_Goi_y_Test7.md"

TITLE = "TOEIC Reading Test 7"
TIME = 75

# =====================================================================
# PART 5  (101-130)
# Moi cau: dict(id, q, opts=[A,B,C,D], ans, hint)
# =====================================================================
PART5 = [
 {"id":101, "q":"If ------- are not satisfied with an item, return it for a full refund within 30 days of purchase.",
  "opts":["you","your","yours","yourself"], "ans":"A",
  "hint":"Cần đại từ nhân xưng làm chủ ngữ cho \"are not satisfied\" → \"you\"."},
 {"id":102, "q":"The location of next month's online gaming forum is yet to be -------.",
  "opts":["concluded","prevented","invited","decided"], "ans":"D",
  "hint":"\"yet to be decided\" = chưa được quyết định; các từ còn lại không hợp nghĩa."},
 {"id":103, "q":"Guests were ------- with the table decorations for the company banquet.",
  "opts":["impressive","impressed","impressing","impressively"], "ans":"B",
  "hint":"Bị động \"were impressed with\" = bị ấn tượng bởi → cần quá khứ phân từ."},
 {"id":104, "q":"The Shubert Company is ------- effective at helping power plants reduce their carbon dioxide emissions.",
  "opts":["once","far","early","very"], "ans":"D",
  "hint":"Cần trạng từ chỉ mức độ trước tính từ \"effective\": \"very effective\"."},
 {"id":105, "q":"Mr. Hodges ------- that volunteers sign up to assist with the Hannock River cleanup by Friday.",
  "opts":["requesting","to be requested","requests","to request"], "ans":"C",
  "hint":"Chủ ngữ số ít + hiện tại đơn → \"requests\" (động từ chia). \"requesting\" thiếu trợ động từ."},
 {"id":106, "q":"Last year, the Daejeon English News ------- the number of readers by adding a digital subscription option.",
  "opts":["needed","increased","joined","asked"], "ans":"B",
  "hint":"\"increased the number of readers\" = tăng số độc giả (hợp với \"adding a digital option\")."},
 {"id":107, "q":"Before the updated design can go into -------, it must be approved by management.",
  "opts":["product","producer","productive","production"], "ans":"D",
  "hint":"\"go into production\" = đi vào sản xuất → cần danh từ \"production\"."},
 {"id":108, "q":"The economic development summit will be held ------- the Xi'an Trade Tower on September 22.",
  "opts":["to","at","down","of"], "ans":"B",
  "hint":"Giới từ chỉ địa điểm cụ thể: \"held at the Xi'an Trade Tower\"."},
 {"id":109, "q":"Inclement weather was ------- responsible for the low turnout at Saturday's Exton Music Festival.",
  "opts":["largely","large","largest","larger"], "ans":"A",
  "hint":"Cần trạng từ bổ nghĩa cho tính từ \"responsible\": \"largely responsible\"."},
 {"id":110, "q":"Our most recent survey was sent to clients just last week, ------- it is too soon to send another one.",
  "opts":["when","since","so","finally"], "ans":"C",
  "hint":"Quan hệ nhân quả: đã gửi tuần trước → VÌ VẬY (so) còn quá sớm để gửi tiếp."},
 {"id":111, "q":"------- necklace that is shipped from Gillis Designers is given a thorough quality check.",
  "opts":["Whenever","Also","All","Each"], "ans":"D",
  "hint":"\"Each necklace\" (số ít) đi với động từ \"is\" → \"Each\" + danh từ đếm được số ít."},
 {"id":112, "q":"Ms. Valdez' sales numbers are good ------- for her to be considered for the employee-of-the-month award.",
  "opts":["forward","even","ahead","enough"], "ans":"D",
  "hint":"\"good enough for her to be considered\" = đủ tốt để được cân nhắc."},
 {"id":113, "q":"Aaron Park's new book features photographs of homes designed and built by the homeowners -------.",
  "opts":["itself","himself","themselves","ourselves"], "ans":"C",
  "hint":"Đại từ phản thân số nhiều chỉ \"the homeowners\" → \"themselves\"."},
 {"id":114, "q":"It is ------- for the audience to hold its applause until the speaker has finished.",
  "opts":["enthusiastic","casual","exclusive","customary"], "ans":"D",
  "hint":"\"It is customary for... to...\" = theo thông lệ, khán giả giữ tiếng vỗ tay."},
 {"id":115, "q":"Despite ------- that Legend Air would perform poorly with the entry of cheaper competition, it posted strong second-quarter earnings.",
  "opts":["predicted","predictable","predicts","predictions"], "ans":"D",
  "hint":"\"Despite + danh từ\" → \"Despite predictions that...\" = bất chấp những dự đoán."},
 {"id":116, "q":"Mr. Nigam was ------- retirement when his boss asked him to be the head of security at the new facility.",
  "opts":["under","ahead of","nearby","close to"], "ans":"D",
  "hint":"\"was close to retirement\" = sắp nghỉ hưu."},
 {"id":117, "q":"Main Street Restaurant offers a menu of ------- prepared lunch and dinner meals.",
  "opts":["thought","thoughtfulness","thoughts","thoughtfully"], "ans":"D",
  "hint":"Cần trạng từ bổ nghĩa cho \"prepared\": \"thoughtfully prepared\" = chuẩn bị chu đáo."},
 {"id":118, "q":"------- our public relations manager, Ms. Ghazarian has just been appointed vice president of media relations.",
  "opts":["Sincerely","Immediately","Solely","Formerly"], "ans":"D",
  "hint":"\"Formerly our PR manager... has just been appointed VP\" = trước đây là..., nay được bổ nhiệm."},
 {"id":119, "q":"Videos of Korean pop music have become very popular ------- adolescents worldwide.",
  "opts":["including","whereas","among","within"], "ans":"C",
  "hint":"\"popular among adolescents\" = phổ biến trong giới thanh thiếu niên."},
 {"id":120, "q":"Milante Shoes ------- altered the firm's marketing strategy after a recent economic shift.",
  "opts":["quick","quickest","quickly","quicken"], "ans":"C",
  "hint":"Cần trạng từ bổ nghĩa cho \"altered\": \"quickly altered\" = nhanh chóng thay đổi."},
 {"id":121, "q":"The annual report has been posted online, ------- the director's office has not yet received a printed copy.",
  "opts":["but","why","with","once"], "ans":"A",
  "hint":"Tương phản: đã đăng online, NHƯNG (but) văn phòng giám đốc chưa nhận bản in."},
 {"id":122, "q":"Hasin Fariz turned a study on the ------- effects of sleep into a best-selling book.",
  "opts":["favorable","favor","favors","favorably"], "ans":"A",
  "hint":"Tính từ bổ nghĩa cho danh từ \"effects\": \"favorable effects\" = tác động tích cực."},
 {"id":123, "q":"Wynston Containers is ------- a yearly shutdown of its factory so that it can be evaluated for safety and efficiency.",
  "opts":["involving","participating","implementing","producing"], "ans":"C",
  "hint":"\"implementing a yearly shutdown\" = thực hiện việc đóng cửa hàng năm."},
 {"id":124, "q":"The Girard Botanical Archive has almost 300,000 plant -------, all neatly pressed onto archival paper.",
  "opts":["authorities","specimens","founders","specifics"], "ans":"B",
  "hint":"\"300,000 plant specimens\" = 300.000 mẫu thực vật (ép lên giấy lưu trữ)."},
 {"id":125, "q":"Hotels and universities are ------- to recycle their used mattresses through the city's recycling program.",
  "opts":["systematic","eligible","familiar","successful"], "ans":"B",
  "hint":"\"are eligible to recycle\" = đủ điều kiện để tái chế."},
 {"id":126, "q":"The ------- to review plans to replace the Tronton Bridge will be scheduled soon.",
  "opts":["heard","hears","hearing","hear"], "ans":"C",
  "hint":"\"The hearing to review plans\" = buổi điều trần xem xét kế hoạch (danh từ)."},
 {"id":127, "q":"Kovox Ltd. aims to optimize quality ------- reducing the impact on the environment.",
  "opts":["which","while","because","unless"], "ans":"B",
  "hint":"\"optimize quality while reducing...\" = tối ưu chất lượng ĐỒNG THỜI giảm tác động."},
 {"id":128, "q":"The grocery store ------- vegetables from out of town until local prices went down last month.",
  "opts":["is buying","will be buying","has been buying","had been buying"], "ans":"D",
  "hint":"Hành động kéo dài rồi kết thúc trước \"prices went down last month\" → quá khứ hoàn thành tiếp diễn."},
 {"id":129, "q":"All Hershel Industries employees must have a valid ID card ------- enter the building.",
  "opts":["in order to","as long as","regarding","always"], "ans":"A",
  "hint":"\"must have a valid ID card in order to enter\" = phải có thẻ ĐỂ vào tòa nhà."},
 {"id":130, "q":"------- and cost factored equally in choosing Cantavox as our main supplier.",
  "opts":["Reliability","Allowance","Dependence","Estimation"], "ans":"A",
  "hint":"\"Reliability and cost factored equally\" = Độ tin cậy và chi phí được cân nhắc như nhau."},
]

# =====================================================================
# PART 6  (131-146)  — 4 doan van, moi doan co [GAP:xxx]
# =====================================================================
PART6 = [
 {"id":131, "passage":
"""Dear PGD Account Holder,

PGD Bank strives [GAP:131] the highest levels of client security and service. This applies not only to online- and telephone-based services, but also to our brick-and-mortar locations. Our three branch offices have proudly been a part of the community [GAP:132] a combined total of 40 years.

To assist you even better in the future, our Smithville branch will be temporarily closed for renovations July 8-22. [GAP:133] In the meantime, our other two regional branches in Pine Grove and Bradford will maintain normal business [GAP:134]. We value your feedback and will respond to any concerns that you may have as soon as possible.

Sincerely,

Edwin Chen, Operations Manager
PGD Bank""",
  "qs":[
    {"id":131, "opts":["to provide","provided","providing","to be provided"], "ans":"A",
     "hint":"\"strives to provide\" = nỗ lực cung cấp (strive + to V)."},
    {"id":132, "opts":["except","amid","near","for"], "ans":"D",
     "hint":"\"a part of the community for a combined total of 40 years\" → \"for\" + khoảng thời gian."},
    {"id":133, "opts":["Unfortunately, services will be limited.","We thank you for trusting in PGD Bank over these years.","We apologize for any inconvenience this may cause.","Traffic on the boulevard has increased lately."], "ans":"C",
     "hint":"Thông báo đóng cửa để sửa chữa → câu xin lỗi vì sự bất tiện là hợp ngữ cảnh nhất."},
    {"id":134, "opts":["investments","hiring","hours","interests"], "ans":"C",
     "hint":"\"maintain normal business hours\" = duy trì giờ làm việc bình thường."},
  ]},

 {"id":135, "passage":
"""To: Samuel Archerson <sarcherson@vona.co.uk>
From: James Darrers <jdarrers@sky.co.uk>
Date: 10 January
Subject: Cost Accountant position

Dear Mr. Archerson,

Thank you for taking the time to meet with me today. I [GAP:135] our conversation, and I remain very interested in the position of cost accountant. I would welcome the opportunity to return for the third and final round of [GAP:136].

I am confident my years of accounting experience would benefit your firm. As discussed, over the last ten years, I have helped many companies save a [GAP:137] amount of money. I am especially adept at analysing the day-to-day operations of a business and helping to determine more cost-effective methods.

I checked regarding your question about a potential start date. [GAP:138] I hope to hear from you in the near future.

Sincerely,

James Darrers""",
  "qs":[
    {"id":135, "opts":["enjoy","enjoyed","enjoying","will enjoy"], "ans":"B",
     "hint":"Cuộc gặp đã xảy ra → quá khứ: \"I enjoyed our conversation\"."},
    {"id":136, "opts":["revisions","promotions","interviews","receptions"], "ans":"C",
     "hint":"\"the third and final round of interviews\" = vòng phỏng vấn thứ ba và cuối."},
    {"id":137, "opts":["substance","substantiate","substantially","substantial"], "ans":"D",
     "hint":"Tính từ trước danh từ \"amount\": \"a substantial amount of money\"."},
    {"id":138, "opts":["I have four additional questions to ask you.","I would be able to begin during the first week of February.","I am confident I have the potential for this position.","Thank you for the offer of employment."], "ans":"B",
     "hint":"Đoạn trước hỏi về \"start date\" → câu trả lời về thời gian bắt đầu làm việc."},
  ]},

 {"id":139, "passage":
"""To: Mason Wu <mwu@wustudios.co.nz>
From: Trent Tuiloma <ttuiloma@canterburyairport.co.nz>
Subject: Canterbury Airport project
Date: Monday, 2 July

Dear Mr. Wu,

Thank you for agreeing to consult on the Canterbury Airport redesign project. [GAP:139] As a result, I am particularly eager to hear your ideas about upgrading our main terminal.

Can we meet this week? There are a number of [GAP:140] restaurants near my office. If you are available this Friday, we could meet at Celia's Cafe on Cumberland Street. I would also like a few of my colleagues to [GAP:141] us. They would appreciate [GAP:142] ways to enhance the airport user's experience.

I look forward to hearing from you soon.

Sincerely,

Trent Tuiloma
Chairman, Canterbury Airport Redesign Team""",
  "qs":[
    {"id":139, "opts":["I can meet you when you arrive.","Scheduling flights can be quite tricky.","I have long admired your work on regional airports.","There are several dining options at the airport."], "ans":"C",
     "hint":"Câu sau nói \"đặc biệt muốn nghe ý tưởng nâng cấp nhà ga\" → trước đó khen công việc của đối phương."},
    {"id":140, "opts":["excel","excellent","excellently","excelled"], "ans":"B",
     "hint":"Tính từ trước danh từ \"restaurants\": \"a number of excellent restaurants\"."},
    {"id":141, "opts":["join","pay","remind","defend"], "ans":"A",
     "hint":"\"colleagues to join us\" = đồng nghiệp tham gia cùng chúng tôi."},
    {"id":142, "opts":["to discuss","discussing","discuss","discussed"], "ans":"A",
     "hint":"\"would appreciate + to V\" (appreciate + to discuss): đánh giá cao việc thảo luận."},
  ]},

 {"id":143, "passage":
"""SHIRES BERRY (February 15) - The second annual Shiresberry Film Festival begins on April 18 and [GAP:143] for five weeks. This year's offerings will not be limited to entries from North America and Europe. We will also be presenting [GAP:144] from Asia and South America. And everyone's favorite feature from last year's festival will be back: directors and screenwriters will hold question-and-answer sessions after their films' initial screening. Make sure you do not miss this [GAP:145] event. Tickets always sell out quickly. [GAP:146] Shiresberry Film Club members can now purchase priority tickets. Visit the Shiresberry Theater box office or www.shiresberrytheater.com.""",
  "qs":[
    {"id":143, "opts":["run","has run","will run","ran"], "ans":"C",
     "hint":"\"begins on April 18 and will run for five weeks\" = bắt đầu... và sẽ kéo dài 5 tuần (tương lai)."},
    {"id":144, "opts":["movies","clothing","food","books"], "ans":"A",
     "hint":"Liên hoan phim → \"presenting movies from Asia and South America\"."},
    {"id":145, "opts":["political","popular","practical","preliminary"], "ans":"B",
     "hint":"\"this popular event\" = sự kiện nổi tiếng/phổ biến này."},
    {"id":146, "opts":["The awards will be presented by Hunter Johns.","Renovations to the space are nearly complete.","The later offerings were an even bigger success.","Sales are open to the general public on March 3."], "ans":"D",
     "hint":"Câu sau nói \"members can now purchase priority tickets\" → trước đó vé mở bán cho công chúng."},
  ]},
]

# =====================================================================
# PART 7  (147-200)
# =====================================================================
PART7 = [
 {"id":147, "passage":
"""Sedwick Electronics Hiring Event
March 2, 10 A.M.-5 P.M.
22 Myer Street, Hanover, PA 17331

Sedwick Electronics is opening a new manufacturing facility in Hanover, Pennsylvania, and we need to fill many positions. We offer a wonderful work environment and great benefits to our employees.

Come to the event and hear from employees from our Lancaster facility about their experience, learn about the open positions, and speak with our recruiters. No RSVP is necessary. Bring copies of your resume.""",
  "qs":[
    {"id":147, "q":"For whom is the advertisement intended?",
     "opts":["Recruiters","Job seekers","Local business owners","Current Sedwick Electronics employees"], "ans":"B",
     "hint":"Quảng cáo \"Hiring Event\" mời người đến nghe về vị trí tuyển, gặp nhà tuyển dụng, mang hồ sơ → dành cho người tìm việc."},
    {"id":148, "q":"What is stated about Sedwick Electronics?",
     "opts":["It is moving its headquarters.","It offers a training program for new employees.","It requires employees to wear uniforms.","It will have more than one location."], "ans":"D",
     "hint":"\"opening a new manufacturing facility in Hanover\" + nhân viên từ \"Lancaster facility\" → có nhiều hơn một địa điểm."},
  ]},

 {"id":149, "passage":
"""Aguni Plumbing Supply Returns

Beginning March 1 at all Aguni Plumbing Supply locations, customers will be able to come to our stores to return purchases made online. For a complete refund, the return must be made within 30 days of purchase and must be accompanied by a receipt. In addition, the merchandise must be returned in the original packaging, and all components must be included. After 30 days, refunds will be limited to in-store credit only. Defective items may be exchanged for the same item only.""",
  "qs":[
    {"id":149, "q":"What will happen on March 1?",
     "opts":["A shipment will be returned.","A new policy will go into effect.","A promotional sale will take place.","A customer survey will be published."], "ans":"B",
     "hint":"\"Beginning March 1... customers will be able to return purchases made online\" → chính sách mới có hiệu lực."},
    {"id":150, "q":"What is NOT a requirement for a complete refund?",
     "opts":["The return must be made at the original purchase location.","The return must be made within a certain time frame.","The item must be returned with all its components.","The item must be returned in the original packaging."], "ans":"A",
     "hint":"Đề KHÔNG yêu cầu trả tại nơi mua ban đầu (ngược lại cho phép trả online tại cửa hàng)."},
  ]},

 {"id":151, "passage":
"""Springfield Community School Computer Courses

Course: Internet Safety
This course teaches students everything they need to navigate the Web safely.
  Course ID: 249800:01 | Class Time: Tuesday 5:30-7:30 PM | Instructor: Patrick McCann | Room: 211
  Course ID: 249800:02 | Class Time: Saturday 1:00-3:00 PM | Instructor: Nora Farid | Room: 166

Course: Spreadsheet Basics
This course teaches the basics of online spreadsheets. Students will learn how to create effective charts for calculating and analyzing data clearly and easily.
  Course ID: 225810:01 | Class Time: Thursday 5:30-8:30 PM | Instructor: Remi Sanders | Room: 118
  Course ID: 225810:02 | Class Time: Sunday 1:00-4:00 PM | Instructor: Nora Farid | Room: 315""",
  "qs":[
    {"id":151, "q":"Why would people enroll in the course taught by Ms. Sanders?",
     "opts":["To practice designing Web sites","To improve their Internet searches","To get tips on creating spreadsheets","To learn how to advertise on the Internet"], "ans":"C",
     "hint":"Khóa của Ms. Sanders là \"Spreadsheet Basics\" → học cách tạo biểu đồ/charts."},
    {"id":152, "q":"What is indicated about Ms. Farid?",
     "opts":["She also teaches children.","She is Ms. Sanders' supervisor.","She teaches twice a week.","She used to work as a data analyst."], "ans":"C",
     "hint":"Ms. Farid dạy Spreadsheet Basics (Sunday) và Internet Safety (Saturday) → dạy 2 buổi/tuần."},
  ]},

 {"id":153, "passage":
"""Sally Witham (4:47 P.M.) Hi Wakiko. I just finished up here at the Kyoto store. I'll be on the train that arrives in Tokyo at 11:35 tomorrow morning. How should I get to your location?

Wakiko Ohara (4:48 P.M.) I'll have an associate pick you up at the station. How do things look in Kyoto?

Sally Witham (4:49 P.M.) The Kyoto store is doing a great job. It has everything that we at the home office are looking for. Athletic shoes and sandals are displayed according to specifications, and sales associates are friendly and knowledgeable.

Wakiko Ohara (4:51 P.M.) You should like things here, too. Do you want to begin your visit after lunch, say at 2:00?

Sally Witham (4:52 P.M.) Sounds good. See you tomorrow.""",
  "qs":[
    {"id":153, "q":"Why did Ms. Witham contact Ms. Ohara?",
     "opts":["To review sales figures","To arrange a store visit","To discuss employee performance reviews","To determine the most convenient train to take"], "ans":"B",
     "hint":"Bà báo giờ tàu đến Tokyo và hỏi \"How should I get to your location?\" → sắp xếp chuyến thăm cửa hàng."},
    {"id":154, "q":"At 4:51 P.M., what does Ms. Ohara most likely mean when she writes, \"You should like things here, too\"?",
     "opts":["The Tokyo store is being run according to corporate policy.","Ms. Witham will find the athletic shoes she needs.","Ms. Ohara's associate is always punctual.","The Tokyo store is located next to a popular restaurant."], "ans":"A",
     "hint":"Sau khi bà Witham khen Kyoto store tuân thủ \"specifications\", bà Ohara ngụ ý Tokyo cũng vận hành đúng chính sách."},
  ]},

 {"id":155, "passage":
"""Bridge Inspection Report

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

Notes: Small cracks in asphalt. The bridge is overall structurally sound. Inform the Department of Transportation about the small cracks in the asphalt.""",
  "qs":[
    {"id":155, "q":"What did Ms. Tulio most likely do?",
     "opts":["Make repairs","Hire a contractor","Perform an inspection","Authorize a construction plan"], "ans":"C",
     "hint":"\"Report completed by: Vivian Tulio\" + bảng chấm điểm từng bộ phận → cô thực hiện kiểm tra (thanh tra)."},
    {"id":156, "q":"What part of the structure is in most need of maintenance?",
     "opts":["The support elements","The road surface","The drainage features","The safety barriers"], "ans":"B",
     "hint":"\"Road surface\" có rating 3 (thấp nhất, \"Shows deterioration\") → cần bảo trì nhất."},
    {"id":157, "q":"What is probably true about the Blaine River Drawbridge?",
     "opts":["It was not designed for pedestrian use.","It will be closed for the month of October.","It does not have the required signage.","It is the oldest bridge on the Ridgeline Highway."], "ans":"A",
     "hint":"\"Sidewalk or walkway: 6 = Not applicable\" → cầu không dành cho người đi bộ."},
  ]},

 {"id":158, "passage":
"""Subway Sound to be Upgraded

BOSTON (April 1) - The public address systems at selected subway stations are scheduled to be refurbished, the Transit Authority announced this week. The systems are used to make announcements to commuters both on the platforms and in the stations.

Local commuters welcomed the news, although for some it was long overdue. "It can be pretty difficult to understand the announcements at some of the stations I use most frequently," said Ian Miller, who has taken the subway to work nearly every week for the past eighteen years. "I had heard the reports about it on TV, and all I can say is that it is about time!"

Some of the systems currently in use are more than 30 years old. Worn-out speakers, wiring, microphones, and amplifiers will be replaced with new, more reliable devices. The work should be completed in October and cost more than $11 million.

Boston's subway system came together in stages over the course of several years. The foundational component of the system's Green Line first opened on Tremont Street in the late 1890s. It was the first of its kind in the United States.""",
  "qs":[
    {"id":158, "q":"What is the purpose of the article?",
     "opts":["To clarify where subway riders can locate information","To describe improvements at some subway stations","To announce the creation of a new subway line","To explain why subway schedules will be revised"], "ans":"B",
     "hint":"Bài nói hệ thống loa \"scheduled to be refurbished... replaced with new devices\" → mô tả việc nâng cấp."},
    {"id":159, "q":"How does Mr. Miller feel about the plans?",
     "opts":["He expects the project to fail.","He is concerned about the cost.","He believes the work is unnecessary.","He has been waiting for the changes."], "ans":"D",
     "hint":"\"I had heard the reports... all I can say is that it is about time!\" → ông đã chờ đợi sự thay đổi."},
    {"id":160, "q":"The word \"stages\" in paragraph 5, line 2, is closest in meaning to",
     "opts":["steps","scenes","train cars","platforms"], "ans":"A",
     "hint":"\"came together in stages\" = hình thành theo từng giai đoạn → \"steps\"."},
  ]},

 {"id":161, "passage":
"""To: All Staff
From: Selene Hong
Date: March 25
Subject: Reminder

Dear Staff,

I would like to draw your attention to several new procedures regarding business trip expense reports. [1] Beginning next month, business-related dining receipts must be accompanied by a listing of each dinner attendee. Also, please make sure that you do not include receipts for any non-work-related items or activities with your report. [2] Finally, note that our accounting software will now automatically calculate for you the total to be reimbursed. You need only to upload images of your receipts for the software to do this. I will be happy to respond to your questions. [3] However, I will be flying to Tokyo this Friday to meet clients, so I will not be checking e-mail that day. [4]

Sincerely,

Selene Hong
Assistant Director, Human Resources Department
Datoric Systems""",
  "qs":[
    {"id":161, "q":"What is indicated about Datoric Systems?",
     "opts":["It has increased the spending amount allowed for business dinners.","It will adopt new procedures for filing travel expense reports.","It has office locations in several countries.","It plans to hold a company celebration."], "ans":"B",
     "hint":"Email thông báo \"several new procedures regarding business trip expense reports\"."},
    {"id":162, "q":"Why is the accounting software mentioned?",
     "opts":["To highlight a special capability it has","To encourage staff to install it","To help employees log on to it","To point out that it will be replaced"], "ans":"A",
     "hint":"\"the software will now automatically calculate... You need only to upload images\" → nêu tính năng đặc biệt."},
    {"id":163, "q":"In which of the positions marked [1], [2], [3], and [4] does the following sentence best belong? \"Following these steps will enable us to quickly issue your reimbursement payment.\"",
     "opts":["[1]","[2]","[3]","[4]"], "ans":"C",
     "hint":"Câu tóm tắt \"Following these steps...\" đặt sau khi liệt kê đủ các bước → vị trí [3]."},
  ]},

 {"id":164, "passage":
"""E-Commerce Opening Doors for African Fashion Industry

ADDIS ABABA (6 May) - Africa's role as a consumer of fashion has been on the rise in recent years. This trend is largely due to the emergence of e-commerce, which provides Africans the opportunity to buy clothing from retailers with no physical presence on the continent. Perhaps more importantly, though, the growth of e-commerce is enabling small-scale African designers to also become producers of fashion, as they showcase their collections to consumers worldwide. African shopping Web sites like Jumjum and Longa are making the work of African designers available for purchase not just throughout the continent, but also as far away as London and New York. [1] "African designers are finally gaining visibility," says Mazaa Absher, founder of Abbi Sportscore, Africa's fastest-growing athletic footwear company. "We have always had terrific design and production capacity here on the continent, but it was hard getting it out into the world. Now we are generating more sales online than we are in our stores." [2] Even as Ms. Absher has transformed her company into an international powerhouse, she continues to highlight the advantages of manufacturing its products in her home city of Nazret. [3] Africa's strong textile sector and innovative designs combine tradition and wearability, and this formula is allowing companies like hers to set their sights beyond the continent. "As more cities in Ethiopia-and all over Africa-improve their manufacturing capacity, it will become easier to reach the rest of the world," says Ms. Absher. [4]""",
  "qs":[
    {"id":164, "q":"What is the main topic of the article?",
     "opts":["New trends in marketing athletic footwear","Increased competition in the African clothing market","Recent growth in the African fashion industry","The largest clothing companies in Africa"], "ans":"C",
     "hint":"Chủ đề: \"Africa's role as a consumer of fashion has been on the rise... designers to become producers\" → tăng trưởng ngành thời trang châu Phi."},
    {"id":165, "q":"What is indicated about Abbi Sportscore?",
     "opts":["It sells its products only online.","It manufactures its shoes in Nazret.","It will be moving its main offices soon.","It was the first shoe company in Ethiopia."], "ans":"B",
     "hint":"\"manufacturing its products in her home city of Nazret\" → sản xuất giày ở Nazret."},
    {"id":166, "q":"What is suggested about the Jumjum and Longa Web sites?",
     "opts":["They sell only handcrafted goods.","They receive orders from around the world.","They offer free shipping to London and New York.","They are planning to open retail stores."], "ans":"B",
     "hint":"\"available for purchase... as far away as London and New York\" → nhận đơn hàng toàn cầu."},
    {"id":167, "q":"In which of the positions marked [1], [2], [3], and [4] does the following sentence best belong? \"The city boasts four garment factories, with a fifth scheduled to be built this year in nearby Wonji.\"",
     "opts":["[1]","[2]","[3]","[4]"], "ans":"C",
     "hint":"Câu về \"garment factories\" nói về thành phố Nazret → đặt sau \"her home city of Nazret\" ở [3]."},
  ]},

 {"id":168, "passage":
"""Gary Park (10:23 A.M.) I e-mailed you the cover design for our September issue a few minutes ago. Did you receive it?

Jill Riley (10:26 A.M.) Yes, but is this the latest version? I thought we agreed that the background color should be lighter so the article titles are more visible.

Gary Park (10:28 A.M.) I forgot-sorry about that! I'm just now sending the file with the most recent version.

Jill Riley (10:30 A.M.) Opening it now... That's more like it. I'll forward it to Graphics and request a sample printout.

Jill Riley (10:35 A.M.) Good morning, Mr. Ojeda. Our new cover design is ready. When do you think you'll have a chance to work on it?

Frank Ojeda (10:38 A.M.) Send it to me now. I'll have a print copy ready for your approval after lunch.""",
  "qs":[
    {"id":168, "q":"Where do the people most likely work?",
     "opts":["At a bookstore","At a public library","At a television studio","At a magazine publisher"], "ans":"D",
     "hint":"Họ bàn về \"cover design\", \"September issue\", \"article titles\", \"Graphics\", \"printout\" → nhà xuất bản tạp chí."},
    {"id":169, "q":"Why does Mr. Park apologize?",
     "opts":["He sent the wrong file.","He used an old e-mail address.","He missed a project deadline.","He lost an important document."], "ans":"A",
     "hint":"\"I forgot... I'm just now sending the file with the most recent version\" → gửi nhầm file cũ."},
    {"id":170, "q":"At 10:30 A.M., what does Ms. Riley most likely mean when she writes, \"That's more like it\"?",
     "opts":["The budget is more reasonable.","The color looks better.","The story is more interesting.","The schedule is more realistic."], "ans":"B",
     "hint":"Trước đó bà yêu cầu \"background color should be lighter\" → \"That's more like it\" = màu trông đẹp hơn."},
    {"id":171, "q":"What will Mr. Ojeda do by the afternoon?",
     "opts":["Approve a marketing plan","Produce a sample","Repair a printer","Make copies of an agreement"], "ans":"B",
     "hint":"\"I'll have a print copy ready for your approval after lunch\" → tạo bản in mẫu."},
  ]},

 {"id":172, "passage":
"""8 February

Ms. Mala Chelvi
60 Jalan Tun Razak
54200 Kuala Lumpur

Dear Ms. Chelvi,

We are delighted to inform you that you have been nominated as a finalist for the Small Business Challenge competition this year. Now in its fifth year, this competition is designed to highlight innovative products and services launched by young entrepreneurs. The Web application that you developed, which provides a means of matching charitable organizations with volunteers, earned one of the top scores from our panel of judges.

In the next round of the challenge, you will participate in a live presentation about your product before a panel of expert judges. The three people with the best presentations will receive one-time grants of MYR 10,000 each to invest in their businesses.

Please go to sbc.org/competition and submit an outline of your presentation, a brief video that clearly illustrates the use of your application, and a passport-sized photograph of yourself. You will also need to sign a consent form allowing us to use your name and photo, if needed, in promotional materials on our Web site. The deadline for submission of these materials is 10 March.

Best regards,

Felix Pang
Chairperson, Small Business Challenge Committee""",
  "qs":[
    {"id":172, "q":"What is the purpose of the letter?",
     "opts":["To seek volunteers for an event","To notify a contest finalist","To sell business consultation services","To offer a small-business loan"], "ans":"B",
     "hint":"\"you have been nominated as a finalist for the Small Business Challenge\" → thông báo lọt vào chung kết."},
    {"id":173, "q":"What does Ms. Chelvi most likely specialize in?",
     "opts":["Law","Technology","Finance","Marketing"], "ans":"B",
     "hint":"\"The Web application that you developed\" → chuyên về công nghệ."},
    {"id":174, "q":"The word \"illustrates\" in paragraph 3, line 2, is closest in meaning to",
     "opts":["represents","translates","lightens","decorates"], "ans":"A",
     "hint":"\"a video that clearly illustrates the use\" = minh họa/thể hiện → \"represents\"."},
    {"id":175, "q":"What is Ms. Chelvi asked to do by March 10?",
     "opts":["Update a Web page design","Give a presentation","Sign a consent form","Pay a fee"], "ans":"C",
     "hint":"\"You will also need to sign a consent form... The deadline... is 10 March.\""},
  ]},

 {"id":176, "passage":
"""To: friedewald@parasur.net.sr
From: client services@mhf.ca
Date: April 2, 12:21 P.M.
Subject: Your feedback

Dear Mr. Riedewald,

Thank you for filling out the McMann Home Furnishings (MHF) survey. To show our appreciation, we have added reward points to your account. They can be applied to the purchase of products offered online as well as those offered in our retail stores. Clearance items and those priced $15.00 and above may not be purchased using credits.

To use your reward points for an online purchase, select the items you would like to purchase and then check out. At the bottom of the page, select "Apply credits." The value of the applied credits will appear on your order receipt as a special discount.

If you would prefer to use reward points at one of our retail locations, you can do so by logging in to your account on our Web site. Go to the My Rewards page, and then select "Print as a coupon." The coupon will have a bar code that can be scanned at the store's checkout counter.

Sincerely,

Client Services, McMann Home Furnishings

Online Order #1157
McMann Home Furnishings Store
March 19, 11:31 A.M.

Hand-Painted Picture Frame | Quantity: 1 | Price: 10.00 | Special Discount: -10.00
Sailboat Ceramic Mug | Quantity: 4 | Price: 40.00 | Clearance Discount: -20.00
Floral Blanket | Quantity: 1 | Price: 25.00 | Seasonal Item Discount: -17.00
Photo Album | Quantity: 1 | Price: 34.00

Item total: 62.00 | Shipping: Free | Total: 62.00""",
  "qs":[
    {"id":176, "q":"According to the e-mail, how did Mr. Riedewald receive reward points?",
     "opts":["He won an online contest.","He participated in a customer survey.","He spent a certain amount of money.","He returned an item."], "ans":"B",
     "hint":"\"Thank you for filling out the MHF survey. To show our appreciation, we have added reward points.\""},
    {"id":177, "q":"In the e-mail, the phrase \"filling out\" in paragraph 1, line 1, is closest in meaning to",
     "opts":["emptying","supplying","completing","expanding"], "ans":"C",
     "hint":"\"filling out (a survey)\" = điền/hoàn thành → \"completing\"."},
    {"id":178, "q":"How can customers apply their reward points in an MHF retail store?",
     "opts":["By entering their account number","By entering their phone number","By scanning a coupon's bar code","By going to the Client Services Department"], "ans":"C",
     "hint":"\"select 'Print as a coupon.' The coupon will have a bar code that can be scanned at the store's checkout counter.\""},
    {"id":179, "q":"According to the receipt, what is true about Mr. Riedewald?",
     "opts":["He paid for delivery of the items.","He purchased the items in the evening.","He paid over $70 for all items combined.","He purchased only one item at regular price."], "ans":"D",
     "hint":"Frame $10-10=0; mug $40-20=20; blanket $25-17=8; photo album $34 (không giảm) → chỉ 1 món giá gốc."},
    {"id":180, "q":"What item did Mr. Riedewald most likely purchase using reward credits?",
     "opts":["The picture frame","The ceramic mug","The floral blanket","The photo album"], "ans":"A",
     "hint":"Picture frame $10 có \"Special Discount -10.00\" = $0 → mua bằng điểm thưởng (credit)."},
  ]},

 {"id":181, "passage":
"""4 December

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

Items from multiple orders may be combined in the same package. We will notify you when your order has shipped.""",
  "qs":[
    {"id":181, "q":"What is a purpose of the letter?",
     "opts":["To ask Mr. Morello to write a book","To explain an enclosed contract","To notify Mr. Morello of a payment","To describe an updated personnel policy"], "ans":"C",
     "hint":"\"Enclosed please find your royalty payment\" → thông báo khoản thanh toán nhuận bút."},
    {"id":182, "q":"What was sent in a previous message to Mr. Morello?",
     "opts":["Incorrect contact information","Detailed sales numbers","A list of suggested changes","A link to an electronic book"], "ans":"B",
     "hint":"\"recently received an e-mail that listed the sales figures and the royalties\" → số liệu bán hàng."},
    {"id":183, "q":"What does Ms. Wicklin mention about Two Swan Press?",
     "opts":["It moved to a new location in October.","It has launched a new program for its fifth anniversary.","It has won an industry award.","It has decided to focus on scientific publications."], "ans":"C",
     "hint":"\"Two Swan Press was given the Publisher of the Year Award by the UK Book Industry.\""},
    {"id":184, "q":"What is suggested about Mr. Booth?",
     "opts":["He is a Two Swan Press author.","He wrote Business in Our Lives.","He is an acquaintance of Mr. Morello.","He has purchased items from Two Swan Press before."], "ans":"A",
     "hint":"Đơn hàng áp \"Discount Applied (AUX1417)\" — mã giảm giá dành riêng cho tác giả → ông Booth là tác giả."},
    {"id":185, "q":"What is indicated about the order?",
     "opts":["It has been delayed.","It has not yet been paid.","It contains multiple books.","It includes free shipping."], "ans":"D",
     "hint":"Order \"Shipping: Free\" + web \"free shipping on all orders over £35\" (balance £45)."},
  ]},

 {"id":186, "passage":
"""To: All Staff
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

New mentorship pairs are now being formed. Interested parties should contact Tim Wrigley in the Personnel Department.""",
  "qs":[
    {"id":186, "q":"What does the e-mail indicate about the mentoring program?",
     "opts":["It is popular industry-wide.","The number of participants is limited.","It is designed for staff in the sales division.","Participants must attend an orientation meeting."], "ans":"B",
     "hint":"\"will match a maximum of ten junior employees\" → số người tham gia có giới hạn."},
    {"id":187, "q":"How will the junior employees most likely be selected?",
     "opts":["They will be chosen from a management-training group.","They will undergo competitive interviews.","They will be evaluated by Mr. Wrigley.","They will be recommended by a local business school."], "ans":"C",
     "hint":"\"complete the attached application and return to... Tim Wrigley... Mr. Wrigley will send notification of his selections.\""},
    {"id":188, "q":"What is suggested about Ms. Drummond?",
     "opts":["She has worked at Broadside Electronics for less than eighteen months.","She has just transferred from another department.","She has received a positive annual review.","She has made many successful presentations abroad."], "ans":"A",
     "hint":"Chương trình dành cho người \"less than eighteen months\" và Ms. Drummond nộp đơn tham gia."},
    {"id":189, "q":"What is most likely true about Ms. Russo?",
     "opts":["She is planning to retire soon.","She has international sales experience.","She has mentored many junior employees.","She recently joined the hiring team."], "ans":"B",
     "hint":"Ms. Russo là VP of Sales; Ms. Drummond muốn học về \"markets abroad\" → VP Sales có kinh nghiệm bán hàng quốc tế."},
    {"id":190, "q":"What benefit from the mentoring program have both Ms. Drummond and Ms. Russo enjoyed?",
     "opts":["Increased job satisfaction","Quick promotions","Paycheck bonuses","Clearer career goals"], "ans":"A",
     "hint":"Ms. Drummond \"happier person when I arrive to work\" + Ms. Russo \"more satisfied with my own duties\" → cả hai tăng sự hài lòng."},
  ]},

 {"id":191, "passage":
"""https://www.runklefencing.co.uk

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
Today's date: 8 August

Fence Details: I need a temporary three-metre-tall fence installed around the Stockport Event Centre within the next two weeks. This is to prevent the public from entering while we make renovations from 18 to 30 August. Two gates are needed so that workers and vehicles may enter and leave the location.

To: mcarhart@stockporteventcentre.co.uk
From: hmontalbo@runklefencing.co.uk
Date: 9 August
Subject: Quote Number 080817
Attachment: fencequote_mcarhart

Dear Ms. Carhart,

Thank you for your enquiry. Please see the attached estimate for the work you requested. Note that the price of delivery is included at no further charge unless a rush order-one providing less than three weeks' notice-is required. This is a rough estimate based on the information you provided. If you ring us at (0117) 555-2938 and provide us with a missing detail, I can give you a more accurate quote.

You might also consider including a plastic curtain with your order. This would be wrapped around and fastened to the fence, hiding the construction site from the view of pedestrians. If this interests you, we can include it in the revised quote.

Best Regards,

Howard Montalbo""",
  "qs":[
    {"id":191, "q":"What does the Web site indicate about fences taller than three meters?",
     "opts":["They are made of plastic.","They are usually prohibited by law.","They require special transportation.","They must be ordered directly from the manufacturer."], "ans":"B",
     "hint":"\"local regulations commonly allow a maximum height of three metres\" → cao hơn 3m thường bị cấm."},
    {"id":192, "q":"According to the form, why does Ms. Carhart need a temporary fence installed?",
     "opts":["To mark a property line","To draw attention to an exhibit","To control a crowd at a special event","To limit public access to a work site"], "ans":"D",
     "hint":"\"This is to prevent the public from entering while we make renovations.\""},
    {"id":193, "q":"What information does Ms. Carhart fail to give about the fence she needs?",
     "opts":["The height of the fence to be erected","The dates when the fence is needed","The perimeter of the area to be enclosed","The number of entrances needed"], "ans":"C",
     "hint":"Cô đã cho chiều cao (3m), ngày (18-30 Aug), số cổng (2) nhưng THIẾU chu vi khu vực."},
    {"id":194, "q":"What is implied about Ms. Carhart's fence project?",
     "opts":["There will be a charge for delivery.","The project involves work at several job sites.","Extra workers must be hired to install the fence.","Inspectors must first approve the project."], "ans":"A",
     "hint":"Email: giao miễn phí \"unless a rush order... less than three weeks' notice\"; cô cần trong 2 tuần → rush order → tính phí giao."},
    {"id":195, "q":"Why does Mr. Montalbo recommend adding a curtain?",
     "opts":["It would act as a noise barrier.","It would help keep in dust.","It would serve as a visual screen.","It would improve safety conditions."], "ans":"C",
     "hint":"\"hiding the construction site from the view of pedestrians\" → tấm chắn thị giác."},
  ]},

 {"id":196, "passage":
"""To: Daniel Rodrigues Pereira
From: Livia Romero
Subject: Company outing
Date: August 5

Hello Daniel,

I hope you are settling in well. I'm sure you have had a busy few weeks. Around this time of year, the office manager typically begins arranging our annual company outing. I think we mentioned this during your interview in June. Previously, we have done things like going to a concert and taking a local river cruise. The outing is always great for morale, and everyone looks forward to it.

This year, I think it would be a good idea to get tickets to a sporting event. I know that many staff members are fans of the San Jose Starlings baseball team. It should be an evening game when the team is playing at home. We have a budget of $600.00 this year. Looking at the ticket prices, it seems that will be just enough to get a ticket for every staff member. I'm sure Elise can assist you with this; she has often helped organize the outings. Let me know if you have any questions.

Best,

Livia Romero
Director of Administration, Loftgren Consulting

San Jose Starlings
Plan your next event with the San Jose Starlings! Discounted tickets are available for groups of ten or more. The more tickets you buy, the more you save-perfect for family gatherings, company outings, or charity fund-raisers! Get perks such as free tickets for the organizer, discounts on food, and your group's name displayed on the scoreboard.

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

Purchase tickets online at www.sanjosestarlings.com/tickets.""",
  "qs":[
    {"id":196, "q":"Why did Ms. Romero send the e-mail to Mr. Rodrigues Pereira?",
     "opts":["To tell him about an upcoming budget cut","To invite him to a concert","To introduce him to his new assistant","To ask him to arrange an event"], "ans":"D",
     "hint":"Bà gợi ý vé thể thao và nhờ anh lo sự kiện (\"I'm sure Elise can assist you with this\") → nhờ anh sắp xếp."},
    {"id":197, "q":"What does the e-mail imply about Mr. Rodrigues Pereira?",
     "opts":["He recently attended a San Jose Starlings game.","He will be leaving in a few weeks to go on vacation.","He is a professional party planner.","He recently began working for Loftgren Consulting."], "ans":"D",
     "hint":"\"I hope you are settling in well... your interview in June\" → anh mới bắt đầu làm việc."},
    {"id":198, "q":"According to the flyer, what is a benefit of buying tickets as a group?",
     "opts":["Reduced ticket prices","Free food","Front-row seating","T-shirts with the team's logo"], "ans":"A",
     "hint":"\"Discounted tickets are available for groups of ten or more.\""},
    {"id":199, "q":"How many employees does Loftgren Consulting most likely have?",
     "opts":["10","30","50","70"], "ans":"C",
     "hint":"Budget $600; 50 vé = $550 (vừa đủ), 70 vé = $700 (vượt ngân sách) → 50 nhân viên."},
    {"id":200, "q":"On what date could Loftgren Consulting employees attend a game?",
     "opts":["August 13","August 15","August 19","August 22"], "ans":"B",
     "hint":"Cần \"evening game when the team is playing at home\" → Aug 15 (7:05 P.M., Home)."},
  ]},
]

# =====================================================================
# Tao .docx
# =====================================================================
def add_p(doc, text, bold=False, size=None, color=None, italic=False):
    para = doc.add_paragraph()
    run = para.add_run(text)
    run.bold = bold
    run.italic = italic
    if size:
        run.font.size = Pt(size)
    if color:
        run.font.color.rgb = RGBColor.from_string(color)
    return para

def emit_question(doc, q, has_qtext=True):
    """Viet 1 khoi [Q:id]...[/Q:id]."""
    add_p(doc, f"[Q:{q['id']}]", bold=True, color="1F4E79")
    if has_qtext:
        add_p(doc, f"[QTEXT]{q['q']}[/QTEXT]")
    for i, opt in enumerate(q["opts"]):
        letter = "ABCD"[i]
        add_p(doc, f"[OPTION:{letter}]{opt}[/OPTION:{letter}]")
    add_p(doc, f"[ANSWER]{q['ans']}[/ANSWER]")
    add_p(doc, f"[HINT]{q['hint']}[/HINT]")
    add_p(doc, "[SHUFFLE_Q]yes[/SHUFFLE_Q]")
    add_p(doc, "[SHUFFLE_A]yes[/SHUFFLE_A]")
    add_p(doc, f"[/Q:{q['id']}]", bold=True, color="1F4E79")

def build_docx():
    doc = Document()
    # Meta
    add_p(doc, f"[EXAM:TITLE]{TITLE}[/EXAM:TITLE]", bold=True, size=16)
    add_p(doc, f"[EXAM:TIME]{TIME}[/EXAM:TIME]")

    # Part 5
    add_p(doc, "[PART:5]", bold=True, size=14, color="C00000")
    for q in PART5:
        emit_question(doc, q, has_qtext=True)

    # Part 6
    add_p(doc, "[PART:6]", bold=True, size=14, color="C00000")
    for g in PART6:
        add_p(doc, f"[GROUP:{g['id']}]", bold=True, color="2E75B6")
        add_p(doc, "[PASSAGE]")
        for line in g["passage"].split("\n"):
            add_p(doc, line)
        add_p(doc, "[/PASSAGE]")
        for q in g["qs"]:
            emit_question(doc, q, has_qtext=False)
        add_p(doc, f"[/GROUP:{g['id']}]", bold=True, color="2E75B6")

    # Part 7
    add_p(doc, "[PART:7]", bold=True, size=14, color="C00000")
    for g in PART7:
        add_p(doc, f"[GROUP:{g['id']}]", bold=True, color="2E75B6")
        add_p(doc, "[PASSAGE]")
        for line in g["passage"].split("\n"):
            add_p(doc, line)
        add_p(doc, "[/PASSAGE]")
        for q in g["qs"]:
            emit_question(doc, q, has_qtext=True)
        add_p(doc, f"[/GROUP:{g['id']}]", bold=True, color="2E75B6")

    doc.save(OUT_DOCX)
    return OUT_DOCX

# =====================================================================
# Tao bang dap an + goi y (markdown)
# =====================================================================
def build_md():
    L = []
    L.append("# Đáp án & Gợi ý — TOEIC Reading Test 7 (Reading v07)\n")
    L.append("*(File tham khảo — dùng để điền tag `<answer>` và `<hint>` khi soạn đề.)*\n")

    L.append("## Part 5 — Incomplete Sentences (101–130)\n")
    L.append("| Câu | Đáp án | Gợi ý |")
    L.append("|-----|--------|-------|")
    for q in PART5:
        L.append(f"| {q['id']} | **{q['ans']}** | {q['hint']} |")

    L.append("\n## Part 6 — Text Completion (131–146)\n")
    L.append("| Câu | Đáp án | Gợi ý |")
    L.append("|-----|--------|-------|")
    for g in PART6:
        for q in g["qs"]:
            L.append(f"| {q['id']} | **{q['ans']}** | {q['hint']} |")

    L.append("\n## Part 7 — Reading Comprehension (147–200)\n")
    L.append("| Câu | Đáp án | Gợi ý |")
    L.append("|-----|--------|-------|")
    for g in PART7:
        for q in g["qs"]:
            L.append(f"| {q['id']} | **{q['ans']}** | {q['hint']} |")

    with open(OUT_MD, "w", encoding="utf-8") as f:
        f.write("\n".join(L) + "\n")
    return OUT_MD

if __name__ == "__main__":
    docx_path = build_docx()
    md_path = build_md()
    total = len(PART5) + sum(len(g["qs"]) for g in PART6) + sum(len(g["qs"]) for g in PART7)
    print("DOCX:", docx_path)
    print("MD  :", md_path)
    print("Total questions:", total)
    # kiem tra id lien tuc 101..200
    ids = [q["id"] for q in PART5]
    for g in PART6 + PART7:
        ids += [q["id"] for q in g["qs"]]
    expected = list(range(101, 201))
    print("IDs OK:", ids == expected)
