# test list comprehensions

people = [ "Vinny", "Joyce", "Mike", "Bill", "Dana" ]
greeting = [("Hello, " + person) for person in people]

print(greeting)

for person in people:
	print(f"Hello, " + person)
