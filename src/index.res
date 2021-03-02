@val external document: {..} = "document"

let count = ref(0)

let plusButton = document["getElementById"]("plus-one")
let minusButton = document["getElementById"]("minus-one")

let countText = document["getElementById"]("count")

let renderCountText = () => {
  let count = count.contents
  let className = {
    if count > 0 {
      "count-positive"
    } else if count < 0 {
      "count-negative"
    } else {
      "count-zero"
    }
  }

  let numberName = {
    if count == 0 {
      "Zero"
    } else {
      Belt.Int.toString(count)
    }
  }

  countText["innerText"] = "Count is " ++ numberName
  countText["classList"] = "count " ++ className
}

let handleUpdateCount = step => {
  count.contents = count.contents + step
  renderCountText()
}

plusButton["addEventListener"]("click", () => handleUpdateCount(1))
minusButton["addEventListener"]("click", () => handleUpdateCount(-1))
