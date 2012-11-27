package main

import (
	"fmt"
	"time"
)

var hour_map = map[int]string{
	0:  "Twelve",
	1:  "One",
	2:  "Two",
	3:  "Three",
	4:  "Four",
	5:  "Five",
	6:  "Six",
	7:  "Seven",
	8:  "Eight",
	9:  "Nine",
	10: "Ten",
	11: "Eleven",
}

var minute_map = map[int]string{
	0:  "o'clock",
	5:  "Five past",
	10: "Ten past",
	15: "Quarter past",
	20: "Twenty past",
	25: "Twenty-five past",
	30: "Thirty",
	35: "Twenty-five to",
	40: "Twenty to",
	45: "Quarter to",
	50: "Ten to",
	55: "Five to",
}

var (
	now    = time.LocalTime()
	minute = now.Minute
	hour   = now.Hour
)

func nearest_hour() (nearest int) {
	if minute > 32 {
		nearest = (hour + 1) % 12
	} else {
		nearest = hour % 12
	}
	return
}

func nearest_minute() (nearest int) {
	e := minute % 5
	if e <= 2 {
		nearest = minute - e
	} else {
		nearest = (minute + (5 - e)) % 60
	}
	return
}

func main() {
	if nearest_minute() == 0 || nearest_minute() == 30 {
		fmt.Println(hour_map[nearest_hour()],
			minute_map[nearest_minute()])
	} else {
		fmt.Println(minute_map[nearest_minute()],
			hour_map[nearest_hour()])
	}
}
