import UIKit

// MARK: - 1 Напишите функцию, которая при присвоении числа >= 0 возвращает массив подмассивов восходящей длины.
// Ссылка на задачу: https://www.codewars.com/kata/515f51d438015969f7000013/train/swift
// Первое решение
func pyramid(_ n: Int) -> [[Int]] {
    return (0...n).map { Array(repeating: 1, count: $0) }.filter { !$0.isEmpty }
}

pyramid(3)
// Описание решения: проходим по значениям, используем map, используем свойство repeating для массива: повторяем 1 $0 раз, через фильт убираем пустые значения

// Оптимальное решение
func pyramid2(_ n: Int) -> [[Int]] {
    return (0..<n).map { Array(repeating: 1, count: $0+1) }
}

pyramid2(4)

// Описание решения: используем от нуля, не включая значение, map, создаем массив, count +1 - удобно, чтобы не было пустых значений

// MARK: - 2 Напишите функцию, которая принимает строку из одного или нескольких слов и возвращает одну и ту же строку, но со всеми пятью или более буквенных словами в обратном порядке (как и название этой Ката). Переданные строки будут состоять только из букв и пробелов. Пробелы будут включены только при наличии более одного слова.
// Ссылка на задачу: https://www.codewars.com/kata/5264d2b162488dc400000001

// Первое решение
func spinWords(in sentence: String) -> String {
    return sentence
        .components(separatedBy: " ")
        .map { $0.count >= 5 ? String($0.reversed()) : $0 }
        .joined(separator: " ")
}

spinWords(in: "Helllooo welcome! my")

// Описание решения: разделили слова через проблел на элементы массива, если знаков в слове > 5 или равно - реверсед, если нет, то оставляем значение. Потом объединяем все через пробел

// Популярное решение
func spinWords2(in sentence: String) -> String {
    sentence
        .split(separator: " ")
        .map { "\($0)" }
        .map { $0.count > 4 ? String($0.reversed()) : $0 }
        .joined(separator: " ")
}

spinWords2(in: "Helllooo welcome! my")
// Описание решения: используют split - то же самое, в целом, потом переводят все в строку и через тернарный оператор выбирают значение.

// MARK: - 3 Вам предоставляется массив (который будет иметь длину не менее 3, но может быть очень большим), содержащий целые числа. Массив либо полностью состоит из нечетных целых чисел, либо полностью состоит из четных целых чисел, за исключением одного целого числа N. Напишите метод, который принимает массив в качестве аргумента и возвращает этот "выход" N.
// Ссылка на задачу: https://www.codewars.com/kata/5526fc09a1bbd946250002dc

// Первое решение
func findOutlier(_ array: [Int]) -> Int {
    let marker = array.prefix(3).reduce(0) { $0 + abs($1 % 2) }
    return marker <= 1
    ? array.first(where: { $0 % 2 != 0 })!
    : array.first(where: { $0 % 2 == 0 })!
}



findOutlier([1, 2, 3, 5, 33])
// Описание решения: создаем константу для хранения уникальных значений. (с методом absolute, избегаем отрицательных чисел), которая будет проверять первые 3 значения на четность-нечетность, затем вы возвращаем условие, если маркер <= 1, если true то в множестве первое четное число -

// Оптимальное решение
func findOutlier2(_ array: [Int]) -> Int {
    let odd = array.filter{$0 % 2 != 0}
    return odd.count > 1 ? array.filter{$0 % 2 == 0}[0] : odd[0]
}

findOutlier([1, 2, 3, 5, 33])
// Описание решения: создаем константу, которая отфильтрует массив на нечетность. Если значений больше единицы, фильтруем массив на получения четного значения, а если нет, то присваиваем нечетное значение

// MARK: - 4 Если волк ближе всего к вам животное, верните одно и другое значение в противном случае.
// Ссылка на задачу: https://www.codewars.com/kata/5c8bfa44b9d1192e1ebd3d15/train/swift
// Первое решение
func warnTheSheep(_ queue: [String]) -> String {
    if queue.last == "wolf" {
        return "Pls go away and stop eating my sheep"
    } else {
        return "Oi! Sheep number \(queue.count - (queue.firstIndex(of: "wolf")! + 1))! You are about to be eaten by a wolf!"
    }
}

warnTheSheep(["sheep", "sheep", "sheep", "sheep", "sheep", "wolf", "sheep", "sheep"])

// Описание решения: если последнее значение = волк, то возвращаем первое значение, если нет, то другую строку с вычислением

// Оптимальное решение
func warnTheSheep2(_ queue: [String]) -> String {
    let ind = Array(queue.reversed()).firstIndex(where: { $0 == "wolf" })
    return ind! == 0 ? "Pls go away and stop eating my sheep" : "Oi! Sheep number \(ind!)! You are about to be eaten by a wolf!"
}

warnTheSheep2(["sheep", "wolf", "sheep"])

// Описание решения: тот же формат, но через тернарный оператор

// MARK: - 5 В этой простой Kata ваша задача - создать функцию, которая превращает строку в мексиканскую волну. Вам будет передана строка, и вы должны вернуть эту строку в массиве.
// Ссылка на задачу: https://www.codewars.com/kata/58f5c63f1e26ecda7e000029

// Первое решение
func wave(_ y: String) -> [String] {
    var result = [String]()
    var index = 0
    for c in y {
        if c.isLetter {
            let ind = y.index(y.startIndex, offsetBy: index)
            let cap = y.replacingCharacters(in: ind...ind, with: String(c.uppercased()))
            result.append(cap)
        }
        index += 1
    }
    return result
}

wave("hello")
// Описание решения: создаем переменную резалт, создаем переменную индекс, пробегаем через цикл, если значение с большой буквы, то входное значение делаем новую строку cap, По завершении цикла, функция возвращает массив всех новых строк result, где каждая новая строка содержит исходную строку y, но с одной буквой замененной на заглавную в соответствии с текущим индексом.

// Оптимальное решение
func wave2(_ y: String) -> [String] {
    var wave = [String]()
    for i in y.indices {
        if !y[i].isWhitespace {
            wave.append(y[..<i] + y[i].uppercased() + y[y.index(after: i)...])
        }
    }
    return wave
}

wave2("hello")
// Описание решения: цикл по строке, новые строки waveElement добавляются в массив wave. По завершении цикла, функция возвращает массив всех новых строк wave, где каждая новая строка содержит исходную строку y, но с одной буквой замененной на заглавную в соответствии с текущим индексом.

// MARK: - 6 В этой ката вам нужно написать функцию, которая получит две строки (n1 и n2), каждая из которых представляет целое число в виде двоичного числа. Третий параметр будет предоставлен (o) в виде строки, представляющей один из следующих операторов: сложение, вычитание, умножение. Ваша задача состоит в том, чтобы написать функцию вычисления, чтобы она выполняла арифметику, и возвращаемый результат должен быть строкой, представляющей двоичный результат.
// Ссылка на задачу: https://www.codewars.com/kata/546ba103f0cf8f7982000df4/swift

// Первое решение и оптимальное решение
enum Operator {
    case ADD, SUBTRACT, MULTIPLY
    
    var transform: (Int, Int) -> Int {
        switch self {
        case .ADD:
            return (+)
        case .SUBTRACT:
            return (-)
        case .MULTIPLY:
            return (*)
        }
    }
}

func calculate(_ a: String, _ b: String, _ op: Operator) -> String {
    let n1 = Int(a, radix: 2)!
    let n2 = Int(b, radix: 2)!
    let result = op.transform(n1, n2)
    
    return String(result, radix: 2)
}

calculate("1", "1", .ADD)
calculate("1", "10", .MULTIPLY)
calculate("101", "10", .SUBTRACT)
// Описание решения: создаем две константы с входными параментами, которые переводят из двоичного числа в обычное, далее трансформируем эти числа через свитч в энуме и возвразаем результат снова в строке

// MARK: - 7 Приведена упорядоченный ряд чисел от 1 до N. Возможно, одно число было удалено из него, а остальные цифры были смешанными. Найдите номер, который был удален.
// Ссылка на задачу: https://www.codewars.com/kata/595aa94353e43a8746000120/train/swift

// Первое решение
func findDeletedNumber(_ array: [Int], _ mixArray: [Int]) -> Int {
    return array.reduce(0, +) - mixArray.reduce(0, +)
}
findDeletedNumber([1,2,3,4,5,6,7,8,9], [3,2,4,6,7,8,1,9])

// Описание решения: разница всех чисел

// Оптимальное решение
func findDeletedNumber2(_ array: [Int], _ mixArray: [Int]) -> Int {
    return array.first(where: { !mixArray.contains($0) }) ?? 0
}

findDeletedNumber2([1,2,3,4,5,6,7,8,9], [3,2,4,6,7,8,1,9])
// Описание решения: в массиве первый элемент, которого нет в другом массиве, и проверка на nil

// MARK: - 8 Создайте функцию add(n)/Add(n), которая возвращает функцию, которая всегда добавляет n к любому числу
// Ссылка на задачу: https://www.codewars.com/kata/538835ae443aae6e03000547/train/swift

// Первое решение
func add(_ n: Int) -> ((Int) -> Int) {
    return { val2 in n + val2 }
}

add(1)(2)
// Описание решения: с помощью клоужера сделали сложение

// Оптимальное решение
func add2(_ n: Int) -> ((Int) -> Int) {
    return { return $0 + n }
}

add2(1)(2)
// Описание решения: то же решение, но через $0

// MARK: - 9 Ваша задача состоит в том, чтобы написать функцию maskify, которая меняет все, кроме последних четырех символов, на '#'.
// Ссылка на задачу: https://www.codewars.com/kata/5412509bd436bd33920011bc/swift

// Первое решение
func maskify(_ string:String) -> String {
    guard string.count > 4 else { return string }
    return (0...string.count - 5).map { _ in "#" }.joined() + string.suffix(4)
}

maskify("4556364607935616")
maskify("11111")
// Описание решения: если у нас меньше, чем 4 символа - оставляем, как есть. Возращаем от 0 до индекса значения минус требуемые 4 + 1 (потому что индекс), мэпим и эти значения определяем в знак, потом объединяем и плюсуем последние 4 символа

// Оптимальное решение
func maskify2(_ string:String) -> String {
    string.enumerated().map { $0 < string.count - 4 ? "#" : "\($1)"}.joined()
}

maskify2("4556364607935616")
maskify2("11111")
// Описание решения: обращаемся к методу enumerated: получаем индексы, мэпим, если индекс больше 4 - определяем требуемый знак, иначе берем значение в стрингу, объединяем

// MARK: - 10 Есть зал ожидания с N стульями, установленными в один ряд. Стулья последовательно нумеруются от 1 до N. Первый находится ближе всего к входу (который также является выходом). Найти стул ближе к выходу
// Ссылка на задачу: https://www.codewars.com/kata/542f0c36d002f8cd8a0005e5/swift

// Первое и оптимальное решение
func lastChair(_ n: Int) -> Int {
    n > 1 ? n - 1 : 1
}

lastChair(10)
// Описание решения: если больше 1, минусуем 1, или оставляем 1

// MARK: - 11 Вам нужно вернуть n-е треугольное число. Вы должны вернуть 0 для значений вне диапазона:
// Ссылка на задачу: https://www.codewars.com/kata/525e5a1cb735154b320002c8/train/swift

// Первое решение
func triangular(_ n: Int) -> Int{
    return n > 0 ? n * (n + 1) / 2 : 0
}

triangular(10)
triangular(-10)
// Описание решения: если число больше 0: то прибавляем единицу к числу, умножаем на само значение и делим на 2

// Оптимальное решение
func triangular2(_ n: Int) -> Int{
    guard n > 0 else { return 0 }
    return n * (1 + n) / 2
}

triangular2(10)
triangular2(-10)
// Описание решения: в целом, то же самое все, но с guard

// MARK: - 12 Сильное число - это число, в котором сумма факториала его цифр равна самому числу. Найти сильное или нет
// Ссылка на задачу: https://www.codewars.com/kata/5a4d303f880385399b000001/train/swift

// Первое решение
func strongNumber(_ number: Int) -> String {
    return number == 1 || number == 2 || number == 145 || number == 40585 ? "STRONG!!!!" : "Not Strong !!"
}

strongNumber(1)
strongNumber(14)
// Описание решения: вычислили, какие есть сильные числа, если нет, то не strong

// Оптимальное решение
func strongNumber2(_ number: Int) -> String {
    return String(number).map({ fac(Int(String($0))!) }).reduce(0, +) == number ? "STRONG!!!!" : "Not Strong !!"
}

func fac(_ number: Int) -> Int {
    guard number > 1 else { return 1 }
    return number * fac(number-1)
}

strongNumber2(1)
strongNumber2(14)
// Описание решения: создали фунцию, которая подготавливает число, потом передаем его в фунцию, плюсуем все значения и проверием, равно ли номеру

// MARK: - 13 Артуру нужно, чтобы вы вернули правду, если ему нужно пригласить больше женщин, или ложь, если он готов.
// Ссылка на задачу: https://www.codewars.com/kata/58acfe4ae0201e1708000075/train/swift

// Первое и оптимальное решение
func inviteMoreWomen(_ arr: [Int]) -> Bool {
    return arr.reduce(0, +) > 0
}

inviteMoreWomen([1, 1])
inviteMoreWomen([-1, -1, 1])
// Описание решения: если сумма больше нуля - то больше

// MARK: - 14 найти длину самого короткого слова в стоке
// Ссылка на задачу:

// Первое решение
func find_short(_ str: String) -> Int {
    return str.components(separatedBy: " ").sorted{ $0.count < $1.count }.first?.count ?? 0
}

find_short("i want to travel the world writing code one day")
// Описание решения: сначала разделил на отдельные элементы в массиве, потом отсортировал, сравнил, взял первое значение count

// Оптимальное решение
func find_short2(_ str: String) -> Int
{
    return str.components(separatedBy: " ").map { $0.count }.min() ?? 0
}

find_short2("i want to travel the world writing code one day")
// Описание решения: то же самое, но через map

// MARK: - 15 Найдите общую сумму внутренних углов (в градусах) в n-сторонном простом многоугольнике. N будет больше 2.
// Ссылка на задачу: https://www.codewars.com/kata/5a03b3f6a1c9040084001765/train/swift

// Первое и оптимальное решение
func angle(_ n: Int) -> Int {
    return 180 * (n - 2)
}

angle(5)
// Описание решения: умножаем 180 градусов на количество сторон минус 2 (формула)

// MARK: - 16 Учитывая делитель и границу, найдите наибольшее целое число N
// Ссылка на задачу: https://www.codewars.com/kata/5aba780a6a176b029800041c/train/swift

// Первое решение
func maxMultiple(_ d: Int, _ b: Int) -> Int {
    return Array(1...b).last(where: {$0 % d == 0}) ?? 0
}

maxMultiple(10, 25)
// Описание решения: создаем массив с от 1 до b, берем последнее значение, где у значения остаток от деления будет ноль

// Оптимальное решение
func maxMultiple2(_ d: Int, _ b: Int) -> Int {
    return b - b % d
}

maxMultiple2(10, 55)
// Описание решения: вычитаем число b из остатка на деления

// MARK: - 17 Ваша задача - преобразовать строки в то, как они будут написаны Джейденом Смитом. Струны являются фактическими цитатами Джейдена Смита, но они не написаны с заглавной буквы так, как он их первоначально напечатал.
// Ссылка на задачу: https://www.codewars.com/kata/5390bac347d09b7da40006f6/train/swift

// Первое и оптимальное решение
extension String {
    func toJadenCase() -> String {
        return capitalized
    }
}

let testString = "hello my friend"
testString.toJadenCase()
// Описание решения: с помощью экстеншена сделали расширение на строку, применили к значению

// MARK: - 18 Учитывая положительное целое число N, верните дополнительные совершенные числа в диапазоне от 1 до N.
// Ссылка на задачу: https://www.codewars.com/kata/5a662a02e626c54e87000123/swift

// Первое решение
func extraPerfect(_ n: Int) -> [Int] {
    var arr = [Int]()
    for i in 1...n {
        if i % 2 != 0 {
            arr.append(i)
        }
    }
    return arr
}

extraPerfect(3)
// Описание решения: с помощью цикла собрали нечетные числа в массив

// Оптимальное решение
func extraPerfect2(_ n: Int) -> [Int] {
    return (1...n).filter { $0 % 2 == 1 }
}

extraPerfect2(3)
// Описание решения: с помощью фильтра собрали нечетные числа в массив

// MARK: - 19 Каков общий вес в килограммах (содержание воды плюс сухое вещество), выходящий из духовки?
// Ссылка на задачу: https://www.codewars.com/kata/58ce8725c835848ad6000007/swift

// Первое и оптимальное решение
func potatoes (_ p0: Int, _ w0: Int, _ p1: Int) -> Int {
    return w0 * (100 - p0) / (100 - p1)
}

potatoes(99, 100, 97)
// Описание решения: начальный вес умножаем на 100 минус начальный процент, делим на 100 - конечный процент воды, получаем чистое сухое вещество

// MARK: - 20 Ваша задача состоит в том, чтобы сделать функцию, которая может взять любое неотрицательное целое число в качестве аргумента и вернуть его с цифрами в порядке убывания. По сути, переупорядочить цифры, чтобы создать максимально возможное число.
// Ссылка на задачу: https://www.codewars.com/kata/5467e4d82edf8bbf40000155/swift

// Первое и оптимальное решение
func descendingOrder(of number: Int) -> Int {
    Int(String("\(number)".sorted(by: >))) ?? 0
}

descendingOrder(of: 101010301435)
// Описание решения: интерполируем в строке числа, сортируем строку, потом переводим в Int, делаем unwrap





