<!DOCTYPE html>
<html lang="ja" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>Ask Kaito - Kaitoに質問 -</title>
    <meta content="Ask Kaito - Kaitoに質問 -" property="og:title">
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }
        body {
            background: repeating-linear-gradient(135deg,transparent,transparent 5px,hsla(0,0%,70%,.08) 0,hsla(0,0%,70%,.08) 10px) hsla(0,0%,70%,.08);
            min-height: 100vh;
            font-family: fa5-proxima-nova,Helvetica Neue,Helvetica,Arial,sans-serif;
            color: #495057;
        }
        .container {
            max-width: 640px;
            margin: 0 auto;
            padding: 0 30px;
        }
        /* header */
        header {
            background: #fff;
            box-shadow: 0 0.25rem 0.125rem 0 rgba(0,0,0,.05);
            height: 64px;
            font-size: 25px;
            /* text-align: center; */
            line-height: 64px;
            /* position: fixed; */
            /* width: 100%; */
        }
        .header-inner {
            max-width: 640px;
            margin: 0 auto;
            padding: 0 30px;
        }
        a {
            text-decoration: none;
            color: #495057;
        }
        .fa-bomb {
            color: #4474a9;
            margin-right: 4px;
        }
        .header-left {
            display: inline-block;
        }
        .header-right {
            float: right;
        }
        .fa-twitter {
            color: #00aced;
            margin-right: 8px;
        }
        .fa-github {
            color: #222;
        }
        /* ask */
        .ask {
            padding: 40px 0;
        }
        .ask-box {
            background: #fff;
            box-shadow: 0 0.25rem 0.125rem 0 rgba(0,0,0,.05);
            padding: 36px 44px;
            border-radius: 2px;
            font-size: 18px;
        }
        .ask-box input[type="text"] {
            width: -webkit-fill-available;
            font-size: 16px;
            border: 1px solid #ddd;
            padding: 8px 12px;
            color: #495057;
            margin-top: 24px;
        }
        .ask-box textarea {
            width: -webkit-fill-available;
            border: 1px solid #ddd;
            height: 80px;
            margin-top: 20px;
            padding: 12px;
            font-size: 16px;
            color: #495057;
        }
        ::-webkit-input-placeholder {
            color: #ccc;
        }
        input[type="submit"] {
            font-size: 16px;
            margin: 8px 0;
        }
    </style>
    <script defer src="https://use.fontawesome.com/releases/v5.0.10/js/all.js" integrity="sha384-slN8GvtUJGnv6ca26v8EzVaR9DC58QEwsIk9q1QXdCU8Yu8ck/tL/5szYlBbqmS+" crossorigin="anonymous"></script>
</head>
<body>
    <header>
        <div class="header-inner">
            <div class="header-left">
                <a href='/'>
                    <i class="fas fa-bomb"></i>
                    Ask Kaito
                </a>
            </div>
            <div class="header-right">
                <a href='https://twitter.com/k_tooooooooooo' target="_blank">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href='https://github.com/Kite0301' target="_blank">
                    <i class="fab fa-github"></i>
                </a>
            </div>
        </div>
    </header>
    <section class="ask">
        <div class="container">
            <div class="ask-box">
                <h3>Kaitoに質問しよう</h3>
                <form action='/send'>
                    <input type="text" name="name" placeholder="名前（任意）">
                    <textarea placeholder="内容（必須）" name="text"></textarea>
                    <input type="submit">
                </form>
            </div>
        </div>
    </section>
    <script>
        history.replaceState('','','/ask');
    </script>
</body>
</html>
