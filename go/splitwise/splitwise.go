package main

import (
	"context"
	"fmt"
	"github.com/joho/godotenv"
	"os"

	"github.com/anvari1313/splitwise.go"
)

func main() {
	err := godotenv.Load()
	if err != nil {
		fmt.Println("Error when loading environment variables from .env file %w", err)
	}
	SPLITWISE_API_KEY := os.Getenv("SPLITWISE_API_KEY")
	auth := splitwise.NewAPIKeyAuth(SPLITWISE_API_KEY)
	client := splitwise.NewClient(auth)

	groups, err := client.Groups(context.Background())
	if err != nil{
		panic(err)
	}
	for _, group := range groups {
		fmt.Println(group.Name)
	}
	//currentUser, err := client.CurrentUser(context.Background())
	//if err != nil {
	//	panic(err)
	//}
	//
	//fmt.Println(currentUser)
}