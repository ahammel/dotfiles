package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"strconv"
)

func main() {
	var (
		status_token   string
		energy_left_f  float64
		energy_full_f  float64
		energy_percent float64
	)

	f, err := os.Open("/sys/class/power_supply/BAT0/uevent")
	if err != nil {
		fmt.Println(err)
		return
	}
	defer f.Close()

	bf := bufio.NewReader(f)

	for {
		line, isPrefix, err := bf.ReadLine()

		// Exception handling block
		if err == io.EOF {
			break
		}
		if err != nil {
			fmt.Println(err)
			return
		}
		if isPrefix {
			fmt.Println("Error: Unexpected long line reading ", f.Name())
		}

		line_s := string(line)

		// Pattern matching
		switch {
		case len(line_s) < 25: // Avoids slice errors
			continue
		case line_s[:20] == "POWER_SUPPLY_STATUS=":
			if line_s[20:] == "Discharging" {
				status_token = "-"
			} else {
				status_token = "+"
			}
		case line_s[:25] == "POWER_SUPPLY_ENERGY_FULL=" || line_s[:25] == "POWER_SUPPLY_CHARGE_FULL=":
			energy_full_f, err = strconv.ParseFloat(line_s[25:], 64)
			if err != nil {
				fmt.Println("Error: %s", err)
			}
		case line_s[:24] == "POWER_SUPPLY_ENERGY_NOW=" || line_s[:24] == "POWER_SUPPLY_CHARGE_NOW=":
			energy_left_f, err = strconv.ParseFloat(line_s[24:], 64)
			if err != nil {
				fmt.Println("Error: %s", err)
			}
		}
	}

	energy_percent = (energy_left_f / energy_full_f) * 100

	fmt.Printf("%.0f%% %s\n", energy_percent, status_token)

	return
}
