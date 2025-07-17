#!/usr/bin/env python3

from tkinter import *
import requests

def show_help():
    help_win = Toplevel()
    help_win.title("Help")
    help_win.geometry("400x150")
    help_win.resizable(False, False)
    help_win.configure(bg="#2f2f2f")

    label = Label(help_win, text=(
        " This tool allows users to mask URLs.\n"
        " However, this tool does NOT generate phishing links.\n"
        " Please, use this tool with responsibility...\n\n"
        " By ne0mesys"
        ), bg="#2f2f2f", fg="white", font=("Arial", 13), wraplength=350, justify="left")

    label.pack(padx=20, pady=20)

def copy_to_clipboard(label, root):
    text = label.cget("text")
    if text and not text.startswith("Something went wrong"):
        root.clipboard_clear()
        root.clipboard_append(text)
        root.update()

def generate(entry1, entry2, entry3, output_label, copy_button):
    real_domain = entry1.get()
    fake_domain = entry2.get()
    fake_tags = entry3.get()

    try: 
        response = requests.get("https://da.gd/s", params={"url": real_domain}, timeout=2)
        short_url = response.text.strip()

        if short_url.startswith("http"):
            masked_url = f"https://{fake_domain}-{fake_tags}@{short_url.replace('https://', '')}"
            output_label.config(text=f"{masked_url}", fg="cyan")

            copy_button.config(state=NORMAL)
            copy_button.pack(pady=10)

            return masked_url
        else: 
            output_label.config(text="Something went wrong (Invalid URL)", fg="red")
            return "Algo ha salido mal"
    except requests.exceptions.RequestException as e:
        output_label.config(text="Connection error", fg="red")
        return "Algo ha salido mal"

def main():
    
    # Main Window
    root = Tk()
    root.geometry("600x850")
    root.title("URL Masker")
    root.configure(bg="#373737")
    root.resizable(False, False)

    # Frames
    frame = Frame(root, bg="#373737")

    # Labels
    label1 = Label(frame, text="Enter real domain: ", font=("Arial", 25), bg="#373737", fg="white")
    sub_label1 = Label(frame, text="(Ex. https://google.com)", font=("Arial", 15), bg="#373737", fg="white")
    
    label2 = Label(frame, text="Enter fake domain: ", font=("Arial", 25), bg="#373737", fg="white")
    sub_label2 = Label(frame, text="(Ex. youtube.com)", font=("Arial", 15), bg="#373737", fg="white")

    label3 = Label(frame, text="Enter fake tags: ", font=("Arial", 25), bg="#373737", fg="white")
    sub_label3 = Label(frame, text="(Ex. add-friend, account, login)", font=("Arial", 15), bg="#373737", fg="white")

    label4 = Label(frame, bg="#373737")
    label5 = Label(frame, bg="#373737")
    label6 = Label(frame, bg="#373737")
    label7 = Label(frame, bg="#373737")
    label8 = Label(frame, bg="#373737")

    result_label = Label(frame, text="", font=("Arial", 25), bg="#373737", fg="white", wraplength=500, justify="center")

    # Entries
    entry1 = Entry(frame, font=("Arial", 20))
    
    entry2 = Entry(frame, font=("Arial", 20))

    entry3 = Entry(frame, font=("Arial", 20))

    # Buttons 
    button = Button(frame, text="Generate", font=("Arial", 25), bg="green", fg="white", command=lambda: generate(entry1, entry2, entry3, result_label, copy_button))
    
    help_button = Button(frame, text="Help", font=("Arial", 25), bg="gray", fg="white", command=lambda: show_help())

    copy_button = Button(frame, text="Copy URL", font=("Arial", 18), bg="blue", state=DISABLED, fg="white", command=lambda: copy_to_clipboard(result_label, root))

    # Pack
    frame.pack(pady=20)
    label1.pack(padx=20, side=TOP)
    sub_label1.pack(padx=10)
    label4.pack(pady=5)
    entry1.pack(padx=10)
    label5.pack(pady=30)

    label2.pack(padx=10)
    sub_label2.pack(padx=10)
    label6.pack(pady=5)
    entry2.pack(padx=10)
    label7.pack(pady=30)

    label3.pack(padx=10)
    sub_label3.pack(padx=10)
    label8.pack(pady=5)
    entry3.pack(padx=10)

    button.pack(pady=15, padx=10)
    help_button.pack(pady=15, padx=10)
    
    result_label.pack(pady=10)


    root.mainloop()


if __name__ == '__main__':
    main()
