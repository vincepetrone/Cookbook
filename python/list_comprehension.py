# test list comprehensions

people = [ "Vinny", "Joyce", "Mike", "Bill", "Dana" ]
#greeting = [("Hello, " + p) for p in people]

#print(greeting)

#for person in people:
#	print(f"Hello, " + person)

#vips = []
#for person in people:
#	if person == "Vinny":
#		vips.append(person)

vips = [ p for p in people if p == "Vinny" ]
print(vips)
