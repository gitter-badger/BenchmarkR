library("hamcrest")
require("benchmarkR")

assertThat(class(benchmarkR:::BenchmarkEnvironment), equalTo("environment"))
assertThat(class(benchmarkR:::ExecEnvironment), equalTo("environment"))
assertThat(class(benchGetter(target = 'profiles')), equalTo("data.frame"))
assertThat(class(benchGetter(target = 'benchmarks')), equalTo("data.frame"))
assertThat(class(benchGetter(target = 'meta')), equalTo("data.frame"))
assertThat(class(benchGetter(target = 'warnings')), equalTo("data.frame"))


assertThat(ncol(benchGetter(target = 'profiles')), equalTo(7))
assertThat(ncol(benchGetter(target = 'benchmarks')), equalTo(4))
assertThat(ncol(benchGetter(target = 'meta')), equalTo(3))
assertThat(ncol(benchGetter(target = 'warnings')), equalTo(3))

addP <- addProfiler()
assertTrue(is.null(addP))
dt <- data.frame(a=c(1,2),b=c(1,2))
addP <- addProfiler(dt)
assertTrue(is.null(addP))
dt <- data.frame(a=c(1,2),b=c(1,2),c=c(1,2),d=c(1,2))
addP <- addProfiler(dt)
assertTrue(is.null(addP))
dt <- data.frame(a=c("A","B"),b=c("C","D"),c=c(1,2),d=c(1,2))
dt2 <- factorsAsStrings(dt)
assertThat(class(dt$a), equalTo("factor"))
assertThat(class(dt2$a), equalTo("character"))

pkg_installation <- installUsedPackages()
assertTrue(is.null(pkg_installation))
pkg_installation <- installUsedPackages(file = "./file/doesntExist.R")
assertTrue(is.null(pkg_installation))
pkg_installation <- installUsedPackages(file = "./test.R")
assertTrue(is.null(pkg_installation))
pkg_installation <- installUsedPackages(file = "./test3.R")
assertFalse(is.null(pkg_installation))

replicate(3, benchmarkSource(file = "./test3.R") )
sysId <- benchGetter(target = "systemId")
sysId_prf <- benchGetter(target = "profile", indexCol = "process", selectValue = "BENCHMARK", returnCol = "systemId")[1]
isSame <- sysId == sysId_prf
assertTrue(isSame)

getterReturn <- benchGetter(target = "profile")
assertTrue(is.null(getterReturn))
getterReturn <- benchGetter(target = "profilerun")
assertTrue(is.null(getterReturn))
getterReturn <- class(benchGetter(target = "warnings"))
assertThat(getterReturn, equalTo("data.frame"))
getterReturn <- benchGetter(target = "usedpackages")
assertTrue(is.null(getterReturn))
getterReturn <- benchGetter(target = "usedpackages", file ="./test.R")
assertTrue(is.null(getterReturn))
getterReturn <- benchGetter(target = "usedpackages", file ="./jahkjad/kjasdksd.R")
assertTrue(is.null(getterReturn))

sysId = setSystemID()
assertFalse(is.null(sysId))
benchCleaner(target = "meta")
assertTrue(nrow(benchGetter(target = "meta")) == 0)

old_sysId <- benchGetter(target = "systemid")
assertTrue(nchar(old_sysId) == 18)
assign("systemId", 666, envir = benchmarkR::ExecEnvironment)
setSystemID()
new_sysId <- benchGetter(target = "systemid")
assertTrue(new_sysId != 666)

assertThat(nrow(utils::installed.packages()[,c(1,3)]), 
           equalTo(nrow(benchGetter(target = "allpackageversions"))))

nopkgs <- benchGetter( target = "usedpackages", file = "./test4.R")
assertTrue(is.null(nopkgs))


update <- benchDBReport()
assertTrue(is.null(update))
update <- benchDBReport(usr = "usr", psw = "psw", con_str = "jdbc:mysql:location/database/table")
assertThat(update, equalTo("DB_UPDATED"))
update <- benchDBReport(usr = "usr", psw = "psw", con_str = "jdbc:other:location/database/table")
assertTrue(is.null(update))
