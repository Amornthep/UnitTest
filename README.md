# Test
# Tech Exam: Software Engineering - Flutter or Golang position

Do not be serious, we just want to know more about you. 
Please do the exam with fun and we will be waiting to discuss it with you in the next interview session :satisfied:


## Test Coverage

คือวิธีการที่เราจะรู้ว่า code ส่วนไหนที่ยังไม่ได้ถูกเขียน Test
วิธีการคิด % ของ Test Coverage คือ อัตราส่วนระหว่างจำนวน Line of code ที่ถูกเรียกจาก Test กับ จำนวน Line of code ทั้งหมด เช่น เขียน code 100 บรรทัด เราเขียน test แค่ function เดียวทีมี 30 บรรทัด แสดงว่า code coverage = 30/100 * 100 = 30%

Test Coverage ที่มากอาจไม่ได้หมายถึงการเขียน Test ที่มีคุณภาพ แต่อย่างน้อยเป็นสิ่งที่ทีมมั่นใจได้ว่า file นี้ได้ถูกเขียน test ครอบคลุมไว้แล้วระดับนึง

VSCode Extension :

[Flutter Coverage](https://marketplace.visualstudio.com/items?itemName=Flutterando.flutter-coverage)  : ช่วยสำหรับอ่านค่า coverage ของแต่ละ file

![Flutter Coverage](https://miro.medium.com/max/814/1*niJK4mmfETEAKXwXWzDcoQ.png)

[Coverage Gutters](https://marketplace.visualstudio.com/items?itemName=ryanluker.vscode-coverage-gutters&ssr=false#review-details)  : ช่วยสำหรับ check ส่วนที่ถูก test กับส่วนที่ยัง ไม่ถูก test ของ file

![Coverage Gutters](https://miro.medium.com/max/1372/1*onQ_79pPFw_ZmJtZIEqaYg.png)

ref:https://xeladu.medium.com/show-test-coverage-of-a-flutter-app-in-visual-studio-code-7e26c3b94aaf
