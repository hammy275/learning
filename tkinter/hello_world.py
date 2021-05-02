import tkinter as tk

# You can use from tkinter import ttk, and use ttk.whatever for better theming at the cost of customization
# You can use both at the same time, but ttk looks better :p

# Learning from https://realpython.com/python-gui-tkinter/

window = tk.Tk()

def btn_exit_func(event):
    print("Exiting...")
    exit(0)

def btn_test_handle(event):
    print("Launching second window!")
    window_2 = tk.Toplevel(window)
    frm_extra = tk.Frame(master=window_2)
    btn_exit = tk.Button(master=frm_extra, text="Exit!")
    btn_exit.bind("<Button-1>", btn_exit_func)
    btn_exit.pack()
    frm_extra.grid(row=0, column=0)
    window_2.mainloop()


# Use releif attribute to change border around frames
frm_main = tk.Frame(relief=tk.SUNKEN)
frm_2 = tk.Frame(relief=tk.RIDGE)
frm_place_test = tk.Frame(bg="red", width=20, height=20)
frm_grid_test_1 = tk.Frame(bg="blue", width=24, height=24)
frm_grid_test_2 = tk.Frame(bg="green", width=24, height=24)

lbl_greet = tk.Label(master=frm_main, text="Hello World!")
lbl_greet.pack()

# What a terrible color scheme lol
lbl = tk.Label(master=frm_main, text="I have color!", foreground="#ff0000", background="#00ff00")
lbl.pack()

btn_test = tk.Button(master=frm_main, text="Click me!", width=24, height=4)
btn_test.bind("<Button-1>", btn_test_handle)
btn_test.pack()


# Use entry.get() to get text
# Use entry.delete(start_index, end_index) to remove chars (tk.END as ending index to get rid of all)
ent_test = tk.Entry(master=frm_2, width=24)
ent_test.pack()

# Determines direction to place elements (affects window resizing!)
#frm_main.pack(side=tk.RIGHT)

# Probably the best setup (change side if you want). This way, it's fully responsive to resizing in all directions.
#frm_2.pack(fill=tk.BOTH, side=tk.LEFT, expand=True)

# This is kinda disgusting. Absolute coordinates don't ever seem like a good idea...
#frm_place_test.place(x=25, y=25)

# Looks to be the best option. Albeit, it has the flaw of not being use-able alongside pack.
# Grid is formed with the top left being 0,0
# padx and pady add horizontal and vertical padding respectively.
# !!!!!!!!! padx and pady can be added to any element! !!!!!!!!!!!!
frm_grid_test_1.grid(row=0, column=0, padx=16, pady=16)
frm_grid_test_2.grid(row=1, column=0, padx=16, pady=16)
frm_2.grid(row=0, column=1)
frm_main.grid(row=1, column=1)


# Configures each row and column for resizing with grid(). 
# First argument is the index for the row/column.
# Weight if 0 = no resizing, otherwise it resizes that much in comparison to others. Weight 2's resize twice as quickly as weight 1's, etc.
window.rowconfigure(0, weight=1, minsize=64)
window.rowconfigure(1, weight=1, minsize=64)

window.columnconfigure(0, weight=1, minsize=64)
window.columnconfigure(1, weight=1, minsize=64)



window.mainloop()