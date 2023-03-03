import UIKit

// MARK: - 1. Завершите функцию квадратной суммы так, чтобы она возвела в квадрат каждое переданное в нее число, а затем суммировала результаты вместе.
// Ссылка на задачу: https://www.codewars.com/kata/515e271a311df0350d00000f/train/swift

// Первое решение
func squareSum(_ vals: [Int]) -> Int {
    var acc = 0
    for i in vals {
        acc += i * i
    }
    return acc
}
squareSum([1,3,4])

// Описание решения: создаю переменную, которая будет хранить значения, суммируемые в цикле, который перебирает массив и возводит в квадрат каждое число

// Оптимальное решение

func squareSum2(_ vals: [Int]) -> Int {
    return vals.reduce(0) { $0 + $1 * $1 }
}

squareSum2([1, 2, 3])

// Описание решения: Это решение лучше, потому что оно занимает меньше места, быстрее, легче читается.

// MARK: - 2. Учитывая год, верните век, в котором он находится.
// Ссылка на задачу: https://www.codewars.com/kata/5a3fe3dde1ce0e8ed6000097

// Первое и оптимальное решение решение
func century(_ year: Int) -> Int {
    return (year + 99) / 100
}

// Описание решения: прибавляю в году 99 и делю на 100, чтобы узнать век

// MARK: - 3. Создайте функцию, которая проверяет, делится ли число n на два числа x И y. Все входные данные являются положительными, ненулевыми числами.
// Ссылка на задачу: https://www.codewars.com/kata/5545f109004975ea66000086

// Первое решение
func isDivisible(_ n: Int, _ x: Int, _ y: Int) -> Bool {
    if n % x == 0 && n % y == 0 {
        return true
    }
    return false
}

isDivisible(12, 3, 3)

// Описание решения: в условии if проверил есть ли остаток от деления  Если true - возвращаем true

// Оптимальное решение
func isDivisible2(_ n: Int, _ x: Int, _ y: Int) -> Bool {
    return n % x == 0 && n % y == 0
}

isDivisible2(12, 3, 3)

// Описание решения: Это решение лучше, потому что оно занимает меньше места, быстрее, легче читается.

// MARK: - 4. Завершите решение так, чтобы оно изменило переданную в него строку.
// Ссылка на задачу: https://www.codewars.com/kata/5168bb5dfe9a00b126000018

// Первое и оптимальное решение решение
func reverse(_ str: String) -> String {
    return String(str.reversed())
}

reverse("Hello")

// Описание решения: возвращаю стрингу из реверснутых чаректоров

// MARK: - 5. Учитывая месяц в виде целого числа от 1 до 12, верните, к какой четверти года он принадлежит как целое число.
// Ссылка на задачу: https://www.codewars.com/kata/5ce9c1000bab0b001134f5af

// Первое решение
func quarter(of month: Int) -> Int {
    switch month {
    case 1...3: return 1
    case 4...6: return 2
    case 7...9: return 3
    case 10...12: return 4
    default: return 0
    }
}

quarter(of: 6)

// Описание решения: перебрал свитчем значения. Вернул квартал

// Оптимальное решение
func quarter2(of month: Int) -> Int {
    return (month + 2) / 3
}

quarter2(of: 10)

// Описание решения: прибавляем к значению 2, чтобы попасть в интервал квартала и делим на 3

// MARK: - 6. Часы показывают h часов, m минут и секунд после полуночи. Ваша задача - написать функцию, которая возвращает время с полуночи в миллисекундах.
// Ссылка на задачу: https://www.codewars.com/kata/55f9bca8ecaa9eac7100004a

// Первое решение
func past(_ h: Int, _ m: Int, _ s: Int) -> Int {
    return (((h * 60 * 60) + (m * 60) + s) * 1000)
}

past(1, 1, 1)
// Описание решения: перевожу каждое значение в миллисекунды и складываю все значения

// Оптимальное решение
func past2(_ h: Int, _ m: Int, _ s: Int) -> Int {
    return s * 1000 + m * 60000 + h * 3600000
}

// Описание решения: в уже переведенные значение прибавляю

// MARK: - 7. Учитывая непустой массив целых чисел, верните результат умножения значений по порядку.
// Ссылка на задачу: https://www.codewars.com/kata/57f780909f7e8e3183000078

// Первое и оптимальное решение
func grow(_ arr: [Int]) -> Int {
    return arr.sorted().reduce(1, *)
}

grow([1, 3, 2])

// Описание решения: отсортированный массив перемножил через метод reduce

// MARK: - 8. Напишите программу, которая находит суммирование каждого числа от 1 до числа. Число всегда будет положительным целым числом, большим 0.
// Ссылка на задачу: https://www.codewars.com/kata/55d24f55d7dd296eb9000030

// Первое решение
func summation(_ n: Int) -> Int {
    var acc = 0
    for i in 1...n {
        acc += i
    }
    return acc
}

summation(10)

// Описание решения: с помощью цикла прошелся по входному значению и сплюсовал все

// Оптимальное решение
func summation2(_ n: Int) -> Int {
    (0...n).reduce(0, +)
}

summation2(10)

// Описание решения: без цикла, в одну строку через метод reduce все суммировали

// MARK: - 9. Напишите функцию bmi, которая вычисляет индекс массы тела (bmi = вес / рост2).
// Ссылка на задачу: https://www.codewars.com/kata/57a429e253ba3381850000fb

// Первое решение
func bmi(_ weight: Int, _ height: Double) -> String {
    let bmi = Double(weight) / (height * height)
    switch bmi {
    case 0..<18.5: return "Underweight"
    case 18.5..<25.0: return "Normal"
    case 25.0..<30.0: return "Overweight"
    case 30.0...: return "Obese"
    default: return ""
    }
}

bmi(80, 1.80)

// Описание решения: вычислил массу тела. Перебрал через свитч. Вернул результат

// Оптимальное решение
func bmi2(_ weight: Int, _ height: Double) -> String {
    let index = Double(weight) / (height * height)
    if index <= 18.5 {return "Underweight"}
    if index <= 25.0 {return "Normal"}
    if index <= 30.0 {return "Overweight"}
    return "Obese"
}

bmi2(150, 1.50)
// Описание решения: более лаконично

// MARK: - 10. Если указано число от 0 до 9, верните его словами.
// Ссылка на задачу: https://www.codewars.com/kata/5808dcb8f0ed42ae34000031

// Первое решение
func switchItUp(_ number: Int) -> String {
    switch number {
    case 1: return "One"
    case 2: return "Two"
    case 3: return "Three"
    case 4: return "Four"
    case 5: return "Five"
    case 6: return "Six"
    case 7: return "Seven"
    case 8: return "Eight"
    case 9: return "Nine"
    default: return "Zero"
    }
}

switchItUp(5)

// Описание решения: с помощью свитча определяю и возвращаю результат в стринге

// Оптимальное решение

func switchItUp2(_ number: Int) -> String {
    return ["Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"][number]
}

switchItUp2(1)
// Описание решения: в одну строку, но без использования свитч, как предлагали в задании


// MARK: - 11. Создайте эти три переменные и сохраните соответствующие значения, используя таблицу выше, Создайте четвертую переменную под названием totalGoals, которая хранит сумму всех целей Месси за этот год.
// Ссылка на задачу: https://www.codewars.com/kata/55ca77fa094a2af31f00002a

// Первое решение и оптимальное решение
var laLigaGoals = 43
var championLeagueGoals = 10
var copaDelReyGoals = 5

var totalGoals = laLigaGoals + championLeagueGoals + copaDelReyGoals

// Описание решения: сложил значения всех переменных

// MARK: - 12. Возвращает среднее значение данного массива, округленное до ближайшего целого числа.(вывести среднее значение) Массив никогда не будет пустым.
// Ссылка на задачу: https://www.codewars.com/kata/563e320cee5dddcf77000158

// Первое решение и оптимальное решение
func getAverage(_ marks: [Int]) -> Int {
    return marks.reduce(0, +) / marks.count
}

getAverage([1, 2, 2, 3])

// Описание решения: сумму чисел в массиве поделил на количество чисел в массиве

// MARK: - 13. Вы берете своего сына в лес, чтобы увидеть обезьян. Вы знаете, что там есть определенное число (n), но ваш сын слишком молод, чтобы просто оценить полное число, он должен начать считать их с 1. Как хороший родитель, вы будете сидеть и считать вместе с ним. Учитывая число (n), заполните массив всеми числами вплоть до этого числа, но исключая ноль.
// Ссылка на задачу: https://www.codewars.com/kata/56f69d9f9400f508fb000ba7

// Первое решение
func monkeyCount(_ n: Int) -> [Int] {
    var acc = [Int]()
    for i in 1...n {
        acc.append(i)
    }
    return acc
}

monkeyCount(10)

// Описание решения: создал аккумулятор для значений, перебрал значение и добавил в массив

// Оптимальное решение
func monkeyCount2(_ n: Int) -> [Int] {
    return Array(1...n)
}

monkeyCount2(10)
// Описание решения: в одну строку. Очень быстро и круто

// MARK: - 14. Вам будет присвоен массив a и значение x. Все, что вам нужно сделать, это проверить, содержит ли предоставленный массив значение.
// Ссылка на задачу: https://www.codewars.com/kata/57cc975ed542d3148f00015b

// Первое решение
func check<T: Equatable>(_ a: [T], _ x: T) -> Bool {
    for i in a {
        if i == x {
            return true
        }
    }
    return false
}

check(["e", "b"], "e")

// Описание решения: если в массиве есть значение - верну true, если нет - false с помощью цикла

// Оптимальное решение
func check2<T: Equatable>(_ a: [T], _ x: T) -> Bool {
    return a.contains(x)
}

check2(["e", "a"], "a")
// Описание решения: в одну строку, использовав метод contains

// MARK: - 15. Ваша цель - вернуть таблицу умножения для числа, которое всегда является целым числом от 1 до 10.
// Ссылка на задачу: https://www.codewars.com/kata/5a2fd38b55519ed98f0000ce

// Первое решение
func multi_table(_ number: Int) -> String {
    var str = ""
    var one = 1
    for _ in 1...10 {
        str += "\(one) * \(number) = \(number * one)"
        if one != 10 {
            str += "\n"
            
        }
        one += 1
    }
    return str
}

multi_table(5)

// Описание решения:

// Оптимальное решение
func multi_table2(_ number: Int) -> String {
    (1...10).map {"\($0) * \(number) = \($0 * number)"}.joined(separator:"\n")
}

multi_table2(4)

// Описание решения: с помощью метода map прошлись по значениям от 1 до 10, где $0 - принимал данные значения. Далее перемножили. Массив преобразовали в строку с помощью joinet и добавили между строками \n

// MARK: 16. Завершите метод, который принимает логическое значение, и возвращает строку "Да" для true или строку "Нет" для false.
// Ссылка на задачу: https://www.codewars.com/kata/53369039d7ab3ac506000467/train/swift

// Первое решение и оптимальное решение
func boolToWord(_ bool: Bool) -> String {
    return bool ? "Yes" : "No"
}

// Описание решения: с помощью тернатного оператора если true - "Yes" и наоборот

// MARK: - 17. Выполните функцию так, чтобы она нашла среднее значение трех переданных ей баллов и вернула буквенное значение, связанное с этой оценкой.
// Ссылка на задачу: https://www.codewars.com/kata/55cbd4ba903825f7970000f5

// Первое и оптимальное решение
func getGrade(_ s1: Int, _ s2: Int, _ s3: Int) -> String {
    var averageVal = (s1 + s2 + s3) / 3
    switch averageVal {
    case 90...100: return "A"
    case 80...90: return "B"
    case 70...80: return "C"
    case 60...70: return "D"
    case 0...60: return "F"
    default: return ""
    }
}

getGrade(80, 70, 75)

// Описание решения: сумму значений делим на 3, чтобы получить среднее. Далее свитч для различных значений

// MARK: - 18. Создайте функцию, которая дает персонализированное приветствие. Эта функция принимает два параметра: имя и владелец.
// Ссылка на задачу: https://www.codewars.com/kata/5772da22b89313a4d50012f7

// Первое и оптимальное решение
func great(_ name: String, _ owner: String) -> String {
    return name == owner ? "Hello boss" : "Hello guest"
}

// Описание решения: с помощью тернарного оператора вернул нужное значение, сравнив строки

// MARK: - 19. Напишите код, который выдает общую сумму за разные дни (d).
// Ссылка на задачу: https://www.codewars.com/kata/568d0dd208ee69389d000016/train/swift

// Первое решение
func RentalCarCost(_ days: Int) -> Int {
    var sum = 0
    sum = days * 40
    if days >= 7 {
        sum -= 50
    } else if days >= 3 {
        sum -= 20
    }
    return sum
}
RentalCarCost(5)

// Описание решения: создал переменную. Вычислил стоимость дней. С помощью условий выявил скидку

// Оптимальное решение
func RentalCarCost2(_ days: Int) -> Int {
    let cost = days * 40
    var discount = days >= 7 ? 50 : 20
    return days >= 3 ? cost - discount : cost
}

RentalCarCost2(5)
// Описание решения: с помощью дополнительной переменной вычислили тернарным оператором скидку. В ретерне вычисляем дополнительную скидку

// MARK: - 20. Функция не возвращает правильные значения. Ты можешь понять почему?
// Ссылка на задачу: https://www.codewars.com/kata/515e188a311df01cba000003/train/swift

// Первое решение
func getPlanetName(_ id: Int) -> String {
    switch id {
    case 1: return "Mercury"
    case 2: return "Venus"
    case 3: return "Earth"
    case 4: return "Mars"
    case 5: return "Jupiter"
    case 6: return "Saturn"
    case 7: return "Uranus"
    case 8: return "Neptune"
    default: return ""
    }
}

getPlanetName(5)
// Описание решения: не было return

// MARK: - 21 В этой игре герой перемещается слева направо. Игрок бросает кости и перемещает количество пробелов, указанных кубиками, два раза. Создайте функцию для терминальной игры, которая занимает текущую позицию героя и броска (1-6) и возвращает новую позицию.
// Ссылка на задачу: https://www.codewars.com/kata/563a631f7cbbc236cf0000c2/train/swift

// Первое и оптимальное решение
func move(_ p: Int, _ r: Int) -> Int {
    return p + r * 2
}

// Описание решения: когда бросаем кости, перемещаем вправо на 2 раза больше. Плюс позиция

// MARK: - 22. Эта функция должна проверить, делится ли без остатка base на factor

// Ссылка на задачу: https://www.codewars.com/kata/55cbc3586671f6aa070000fb/swift
// Первое и оптимальное решение
func checkForFactor(_ base: Int, _ factor: Int) -> Bool {
    return ((base % factor) == 0)
}

checkForFactor(9, 3)

// Описание решения: проверяем равен ли нулю остаток

// MARK: - 22. Очень просто, учитывая целое число или число с плавающей запятой, найдите его противоположность.

// Ссылка на задачу: https://www.codewars.com/kata/56dec885c54a926dcd001095
// Первое и оптимальное решение
func opposite(number: Double) -> Double {
    return -number
}

opposite(number: 10)
opposite(number: -10)
// Описание решения: добавляем минус к number

// MARK: - 23. Нам нужна функция, которая может преобразовать число (целое число) в строку.
// Ссылка на задачу: https://www.codewars.com/kata/5265326f5fda8eb1160004c8

// Первое и оптимальное решение
func numberToString(number: Int) -> String {
    return String(number)
}

numberToString(number: 10)
// Описание решения: переводим в стринг

// MARK: - 24. Учитывая массив целых чисел в виде строк и чисел, верните сумму значений массива, как если бы все они были числами. Верните свой ответ в виде цифры.

// Ссылка на задачу: https://www.codewars.com/kata/57eaeb9578748ff92a000009
// Первое решение
func sumMix(_ arr: [Any]) -> Int {
    let intArray = arr.compactMap{Int("\($0)")}
    return intArray.reduce(0, +)
}

sumMix([1, 2, "3"])

// Описание решения: через интерполяцию переводим в строку значения, потом в Int, через compactMap убираем опционал. Через reduce складываем значения

// Оптимальное решение
func sumMix2(_ arr: [Any]) -> Int {
    return arr.reduce(0) { $0 + (Int("\($1)") ?? 0) }
}

// Описание решения: в одну строку, использовав метод reduce

// MARK: - 25. исходя из таблицы сделал решение
// Ссылка на задачу: https://www.codewars.com/kata/5933a1f8552bc2750a0000ed/train/swift

// Первое и оптимальное решение
func nthEven(_ n: Int) -> Int {
    return 2 * n - 2
}

// Описание решения: умножаем число в 2 раза и минусуем 2

// MARK: - 26. На каждого дракона нужно 2 патрона. Выяснить, хватит ли ему патронов

// Ссылка на задачу: https://www.codewars.com/kata/59ca8246d751df55cc00014c/train/swift
// Первое решение
func hero(bullets: Int, dragons: Int) -> Bool {
    return bullets % dragons == 0
}

hero(bullets: 10, dragons: 5)

// Описание решения: Решение прошло. Но оно неэффективно. Если патронов больше - выдает false

// Оптимальное решение
func hero2(bullets: Int, dragons: Int) -> Bool {
    return bullets >= dragons * 2
}

hero2(bullets: 10, dragons: 4)

// Описание решения: эффективное решение

// MARK: - 27. добавить "codewars" в массив 1000 раз

// Ссылка на задачу: https://www.codewars.com/kata/525c1a07bb6dda6944000031/train/swift
// Первое решение
func KataTwist() {
    var array = [String]()
    for _ in 1...1000 {
        array.append("codewars")
    }
}

KataTwist()

// Описание решения: создал константу, через цикл добавил 1000 раз "codewars"

// Оптимальное решение
func KataTwist2() {
    Array(repeating: "codewars", count: 1000)
}

KataTwist2()

// Описание решения: в одну строку, с помощью repeating

// MARK: - 28. переводить входные значения в такой формат "$3.00"

// Ссылка на задачу: https://www.codewars.com/kata/55902c5eaa8069a5b4000083/swift
// Первое решение
func formatMoney(_ val:Double) -> String {
    return String(format: "$%.2f", val)
}

formatMoney(3)

// Описание решения: не супер-понятно, как здесь что устроено. Нашел в интернете формат

// Оптимальное решение
func formatMoney2(_ val:Double) -> String {
    let str = String(format: "%.2f", val)
    return String("$" + "\(str)")
}

formatMoney(10)
// Описание решения: более-менее можно понять, что делает фунция


// MARK: - 29. Из сроки с любыми символами достать все цифры и суммировать их

// Ссылка на задачу: https://www.codewars.com/kata/598f76a44f613e0e0b000026/swift
// Первое решение
func sumOfIntegersInString(_ string: String) -> Int {
    let n = string.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: " ")
    let num = n.components(separatedBy: " ")
    var array = num.compactMap{Int(String($0)) ?? 0}
    let sum = array.reduce(0, +)
    return sum
}

sumOfIntegersInString("gerg 325 22")
// Описание решения: если в массиве есть значение - верну true, если нет - false с помощью цикла

// Оптимальное решение
func sumOfIntegersInString2(_ string: String) -> Int {
    return string.components(separatedBy: CharacterSet.decimalDigits.inverted).compactMap({Int($0)}).reduce(0, +)
}

sumOfIntegersInString("ehrerhe 2 23 245wg")

// Описание решения: в одну строку, использовав метод contains

// MARK: - 30. вычислить a b c (максимальное значение, используя различные состояния)
// Ссылка на задачу: https://www.codewars.com/kata/5ae62fcf252e66d44d00008e/train/swift

// Первое и оптимальное решение
func expressionMatter(_ a: Int, _ b: Int, _ c: Int) -> Int {
    return [
        a + b + c,
        a * b * c,
        (a + b) * c,
        a * (b + c),
        a * b + c,
        a + b * c]
        .max() ?? 0
}

expressionMatter(1, 2, 1)

// Описание решения: создал массив, в котором метод макс с ?? - вычислили максимальное возможное значение

// MARK: - 31. Существует два нуля: +0 (или просто 0) и -0. Выявить какой у нас ноль
// Ссылка на задачу: https://www.codewars.com/kata/5c5086287bc6600001c7589a
// Первое решение
func isNegativeZero(_ n: Float) -> Bool {
    return (n.sign == .minus && n == 0)
}

isNegativeZero(-0.0)

// Описание решения: с помощью .sign - вычисляем знак у Float и сравниваем с .minus и равно ли 0

// Популярное решение
func isNegativeZero2(_ n: Float) -> Bool {
    return String(n) == "-0.0"
}

isNegativeZero2(-0)

// Описание решения: не такое универсальное. Если написать просто -0 в условии , то код сразу сломается

// MARK: - 32. дан круг с числами. Нужно вычислять число напротив заданного
// Ссылка на задачу: https://www.codewars.com/kata/58841cb52a077503c4000015

// Первое и оптимальное решение
func circleOfNumbers(_ n: Int, _ fst: Int) -> Int {
    return (n / 2 + fst) % n
}

circleOfNumbers(10, 2)

// Описание решения: делим общее количество цифр пополам, прибавляем заданное число и делаем проверку, чтобы не было повторных кругов


// MARK: - 33. Функция, принимающая массив интов, возвращающая сумму 2х самых маленьких чисел

// Ссылка на задачу: https://www.codewars.com/kata/558fc85d8fd1938afb000014/swift
// Первое решение
func sumOfTwoSmallestIntegersIn(_ array: [Int]) -> Int {
    return array.sorted()[0] + array.sorted()[1]
}

sumOfTwoSmallestIntegersIn([1, 4, 3])

// Описание решения: возвращаем два отсортированных массива с разницы индексами и плюсуем

// Оптимальное решение
func sumOfTwoSmallestIntegersIn2(_ array: [Int]) -> Int {
    return array.sorted()[0...1].reduce(0, +)
}

sumOfTwoSmallestIntegersIn2([1, 4, 3])
// Описание решения: в одну строку, использовав метод contains

// MARK: - 34. привести заданные строки к формату, заданному в условии
// Ссылка на задачу: https://www.codewars.com/kata/5667e8f4e3f572a8f2000039

// Первое решение
func accum(_ s: String) -> String {
    return s.enumerated().map { index, value in
        (0...index).map { $0 == 0 ? value.uppercased() : value.lowercased()
        }.joined()
    }.joined(separator: "-")
}

accum("RqaEzty")

// Описание решения: перебираем через enumerated().map, берем индексы, если равно ноль - Большая буква, если нет - маленькая. Объединяем первые буквы, далее через joined(separator: "-") связываем значения

// Оптимальное решение
func accum2(_ str: String) -> String {
    return str.enumerated().map {
        repeatElement(String($1), count: $0 + 1)
            .joined()
            .capitalized
    }
    .joined(separator: "-")
}

accum2("RqaEzty")

// Описание решения: перебираем значения, метод repeatElement, используем индексы +1 , объединяем, делаем первой букву большой, остальные маленькие .capitalized, объединяем все .joined(separator: "-")

// MARK: - 35. Измените функцию spacify так, чтобы она возвращала заданную строку с пробелами, вставленными между каждым символом.
// Ссылка на задачу: https://www.codewars.com/kata/57f8ee485cae443c4d000127/train/swift

// Первое решение и оптимальное значение
func spacify(_ str: String) -> String {
    return str.map { String($0) }.joined(separator: " ")
}

spacify("Heelo")

// Описание решения: перебираем. Объединяем + с помощью сеператора ставим пробелы

// MARK: - 36. Определите общее количество цифр в целом (n>=0), заданном в качестве входных данных для функции. Например, 9 - это одна цифра, 66 - 2 цифры, а 128685 - 6 цифр. Будьте осторожны, чтобы избежать переполнения/недополза. Все входные данные будут действительными.
// Ссылка на задачу: https://www.codewars.com/kata/58fa273ca6d84c158e000052/train/swift

// Первое и оптимальное решение
func digits(num n: UInt64) -> Int {
    return String(n).count
}

digits(num: 623141)

// Описание решения: переводим в стринг и обращаемся к count

// MARK: - 37. вычислить количество невходящих букв
// Ссылка на задачу: https://www.codewars.com/kata/56541980fa08ab47a0000040/swift

// Первое решение
func printerError(_ s: String) -> String {
    var count = 0
    for i in s {
        count += ("a"..."m").contains(i) ? 0 : 1
    }
    return "\(count)/\(s.count)"
}

printerError("aaaabbbbccccwwww")

// Описание решения: перебираем значения, если нет в промежутке букв - +1

// Оптимальное решение
func printerError2(_ s: String) -> String {
    return "\(s.filter {$0 > "m" }.count)/\(s.count)"
}

printerError2("aaaabbbbccccwwww")

// Описание решения: в одну строку, использовав метод filter

// MARK: - 38. Учитывая двумерный массив целых чисел, верните сглаженную версию массива со всеми целыми числами в отсортированном (по возрастании) порядке. Учитывая [[3, 2, 1], [4, 6, 5], [], [9, 7, 8], ваша функция должна возвращать [1, 2, 3, 4, 5, 6, 7, 8, 9].
// Ссылка на задачу: https://www.codewars.com/kata/57ee99a16c8df7b02d00045f

// Первое и оптимальное решение
func flattenAndSort<T: Comparable>(_ arr: [[T]]) -> [T] {
    return arr.flatMap { $0 }.sorted()
}

flattenAndSort([[1, 2]])

// Описание решения: с помощью .flatMap убираем вложенность, потом сортируем

// MARK: - 39. Напишите функцию, которая вернет количество различных буквенных символов без учета регистра и числовых цифр, которые встречаются более одного раза во входной строке. Можно предположить, что входная строка содержит только алфавиты (как прописные, так и строчные) и числовые цифры.
// Ссылка на задачу: https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1/train/swift

// Первое решение
func countDuplicates(_ s:String) -> Int {
    var dict: [Character : Int] = [:]
    s.lowercased().forEach {
        dict[$0] = dict[$0] == nil ? 1 : dict [$0]! + 1
    }
    return dict.filter {$0.value > 1}.count
}

countDuplicates("aAbBcd")

// Описание решения: cоздаем словарь. Переводим всю строку в строчные буквы, перебираем. Проверяем, пустое ли это значение по ключу, если да - то единица, если нет - то добавляем +1 в счетчик. Возвращаем через фильтр значения больше единицы и вызываем count

// самое популярное решение
func countDuplicates2(_ s:String) -> Int {
    var counts: [String: Int] = [:]
    for character in Array(s) {
        counts[character.lowercased(), default: 0] += 1
    }
    return counts.values.filter{ $0 > 1 }.count
}

countDuplicates2("aAbBcd")

// Описание решения: практически тот же формат, но используют String, и полноценный for in и свойство словаря counts

// MARK: - 40. Учитывая массив целых чисел, найдите тот, который появляется нечетное количество раз. Всегда будет только одно целое число, которое появляется нечетное количество раз.
// Ссылка на задачу: https://www.codewars.com/kata/54da5a58ea159efa38000836/train/swift

// Первое решение
func findIt(_ seq: [Int]) -> Int {
    var dict: [Int: Int] = [:]
    seq.forEach {
        dict[$0] = dict[$0] == nil ? 1 : dict[$0]! + 1
    }
    return dict.filter { $0.value % 2 != 0 }.first!.key
}

findIt([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5])
// Описание решения: cоздаем словарь. перебираем. Проверяем, пустое ли это значение по ключу, если да - то единица, если нет - то добавляем +1 в счетчик. Возвращаем через фильтр значения нечетные и вызываю первый ключ

// Оптимальное решение
func findIt2(_ seq: [Int]) -> Int {
    seq.reduce(0, ^)
}

findIt2([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5])

// Описание решения: в одну строку, использовав побитовый XOR




