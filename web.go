package main

import (
	"database/sql"
	"fmt"
	"html/template"
	"log"
	"math/rand"
	"net/http"
	"os"
	"strconv"
	"time"

	_ "github.com/mattn/go-sqlite3"
)

// Question ...
type Question struct {
	ID        int64
	Name      string
	Text      string
	CreatedAt string
}

func rootHandler(w http.ResponseWriter, r *http.Request) {
	db, err := sql.Open("sqlite3", "./data.db")
	if err != nil {
		panic(err)
	}
	questions := []Question{}
	rows, err := db.Query("SELECT * FROM questions")
	if err != nil {
	}
	for rows.Next() {
		var q Question
		if err := rows.Scan(&q.ID, &q.Name, &q.Text, &q.CreatedAt); err != nil {
		}
		questions = append(questions, q)
	}
	if err := rows.Err(); err != nil {
	}

	sortedQuestions := []Question{}
	len := len(questions)
	for index := 0; index < len; index++ {
		sortedQuestions = append(sortedQuestions, questions[len-1-index])
	}

	t := template.Must(template.ParseFiles("templates/root.html.tpl"))
	if err := t.ExecuteTemplate(w, "root.html.tpl", sortedQuestions); err != nil {
		log.Fatal(err)
	}
}

func askHandler(w http.ResponseWriter, r *http.Request) {
	t := template.Must(template.ParseFiles("templates/ask.html.tpl"))
	if err := t.ExecuteTemplate(w, "ask.html.tpl", nil); err != nil {
		log.Fatal(err)
	}
}

func sendHandler(w http.ResponseWriter, r *http.Request) {
	r.ParseForm()
	name := r.Form["name"][0]
	var text string
	if name == "" {
		name = "匿名ユーザー"
	}
	text = r.Form["text"][0]
	if text == "" {
		askHandler(w, r)
		return
	}
	t := time.Now()
	ye, mo, da := t.Date()
	time := strconv.Itoa(ye) + "/" + strconv.Itoa(int(mo)) + "/" + strconv.Itoa(da)
	time = time + " " + fmt.Sprintf("%02d", t.Hour())
	time = time + ":" + fmt.Sprintf("%02d", t.Minute())

	db, err := sql.Open("sqlite3", "./data.db")
	if err != nil {
		panic(err)
	}
	const sql = "INSERT INTO questions(name, text, created_at) values (?,?,?)"

	ch := make(chan bool)
	go func() {
		rec, err2 := db.Exec(sql, name, text, time)
		if err2 != nil {
		}
		_, err3 := rec.LastInsertId()
		if err3 != nil {
		}
		ch <- true
	}()
	<-ch

	rootHandler(w, r)
}

func dbExec(db *sql.DB, sql string) {
	if _, err := db.Exec(sql); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}

func setDummy() {
	db, err := sql.Open("sqlite3", "./data.db")
	if err != nil {
		panic(err)
	}
	const sql = "INSERT INTO questions(name, text, created_at) values (?,?,?)"
	db.Exec(sql, "にんじゃわんこ", "いつからプログラミングをやっているのですか？", "2018/04/12 12:44")
	db.Exec(sql, "匿名ユーザー", "なんで大学やめたんですか？", "2018/04/12 13:18")
	db.Exec(sql, "ひつじ仙人", "好きな食べ物はなんじゃ？", "2018/04/12 17:21")
}

func main() {
	// DBの用意
	os.Create("./data.db")
	var db *sql.DB
	db, err := sql.Open("sqlite3", "./data.db")
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
	// テーブルの作成
	var sql string
	sql = `
    CREATE TABLE IF NOT EXISTS questions (
    	id   INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    	name TEXT NOT NULL,
    	text INTEGER NOT NULL,
        created_at TEXT NOT NULL
    );
    `
	dbExec(db, sql)

	setDummy()

	rand.Seed(time.Now().UnixNano())
	http.HandleFunc("/", rootHandler)
	http.HandleFunc("/ask", askHandler)
	http.HandleFunc("/send", sendHandler)
	http.ListenAndServe(":8080", nil)
}
