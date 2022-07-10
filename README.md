# Test #
การเขียน Test เพื่อให้เรามั่นใจว่า code ที่เราเขียนขึ้นมามีการทำงานที่ถูกต้อง รวมถึง มั่นใจว่าในอนาคตถ้ามีการแก้ไข code ส่วนนี้ Test ที่ได้ยังคงต้องถูกต้องเหมือนเดิม

## Unit Test ##
เป็นการทดสอบการทำงานของส่วนย่อยที่สุด อาจจะเป็น Class หรือ Function โดยในการทำ Unit Test เราจะไม่มีการเชื่อมต่อกับส่วนภายนอก เช่น Server เราจะใช้การทำ Mock แทน ในหนึ่ง function ของเราอาจจะมีได้หลาย test case ขึ้นอยู่กับ logic ที่เราเขียนขึ้นมา ยิ่งถ้ามีการทำงานหลายเงื่อนไข ยิ่งควรมีการเขียน test case ให้ครบทุกเงื่อนไข

## Integration Test ##
เป็นการทดสอบการเชื่อมต่อกับภายนอก App เช่น API เขียน test ด้วยการเชื่อมต่อ API ว่าสามารถใช้งานได้อยู่จริง

## Widget Test ##
เป็นการทดสอบการแสดงผลของ Widget ว่ามีการแสดงผลถูกต้องตามที่เราต้องการหรือไม่

## Testing Pyramid ##
อันนี้เป็นตัวอย่าง Strategy หนึ่งของ Flutter test pyramid โดยจะเน้นเขียน Unit test ให้ครอบคลุมได้มากที่สุดก่อน จากนั้นจะมี Widget test ตาม widget ที่เรามี และสุดท้าย Integration tests ซึ่ง อาจจะเป็นเพียง test connect api หรือ เป็น Flow การทำงานของ page ที่ต่อ api จริง

![Testing Pyramid](https://koenig-media.raywenderlich.com/uploads/2020/04/testing-pyramid.001.jpeg)


## Test Coverage ##

คือวิธีการที่เราจะรู้ว่า code ส่วนไหนที่ยังไม่ได้ถูกเขียน Test
วิธีการคิด % ของ Test Coverage คือ อัตราส่วนระหว่างจำนวน Line of code ที่ถูกเรียกจาก Test กับ จำนวน Line of code ทั้งหมด เช่น เขียน code 100 บรรทัด เราเขียน test แค่ function เดียวทีมี 30 บรรทัด แสดงว่า code coverage = 30/100 * 100 = 30%

Test Coverage ที่มากอาจไม่ได้หมายถึงการเขียน Test ที่มีคุณภาพ แต่อย่างน้อยเป็นสิ่งที่ทีมมั่นใจได้ว่า file นี้ได้ถูกเขียน test ครอบคลุมไว้แล้วระดับนึง

VSCode Extension :

[Flutter Coverage](https://marketplace.visualstudio.com/items?itemName=Flutterando.flutter-coverage)  : ช่วยสำหรับอ่านค่า coverage ของแต่ละ file

![Flutter Coverage](https://miro.medium.com/max/814/1*niJK4mmfETEAKXwXWzDcoQ.png)

[Coverage Gutters](https://marketplace.visualstudio.com/items?itemName=ryanluker.vscode-coverage-gutters&ssr=false#review-details)  : ช่วยสำหรับ check ส่วนที่ถูก test กับส่วนที่ยัง ไม่ถูก test ของ file

![Coverage Gutters](https://miro.medium.com/max/1372/1*onQ_79pPFw_ZmJtZIEqaYg.png)

ref:https://xeladu.medium.com/show-test-coverage-of-a-flutter-app-in-visual-studio-code-7e26c3b94aaf

## [Mock คืออะไรมีตัวอะไรให้ใช้อีกบ้าง?](https://www.somkiat.cc/test-double-mock-stub-and-dummy/) ##
เราใช้ [Mocktail](https://pub.dev/packages/mocktail) ในการทำ mock


