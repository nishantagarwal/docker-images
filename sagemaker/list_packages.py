import pkg_resources

for dist in list(pkg_resources.working_set):
    print(dist)