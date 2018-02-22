var CV = artifacts.require("CV");

contract ('CV', function() {
    it("should set personal info", async function() {
        var cv = await CV.deployed();
        var info = ["Luke", "1.1.1987", "Waw", 123456, "email", "photo"];
        await cv.setPersonalInfo("Luke", "1.1.1987", "Waw", 123456, "email", "photo");
        var infoResponse = (await cv.getPersonalInfo.call());
        infoResponse[3] = infoResponse[3].toNumber();

        assert.deepEqual (infoResponse, info, "Set info not working properly");
    });

    it("should set job info", async function() {
        var cv = await CV.deployed();
        var job = ["Promise", "1.1.1990", "2.2.2000", "coding"];
        await cv.setJob("Promise", "1.1.1990", "2.2.2000", "coding");
        var jobResponse = (await cv.getJob.call(0));
        var jobCount = (await cv.countJob.call());

        assert.deepEqual (jobResponse, job, "Set job not working properly");
        assert.equal (jobCount, 1, "Job count not working properly");
    })

    it("should set school info", async function () {
        var cv = await CV.deployed();
        var school = ["PW", "1.1.1990", "2.2.2000", "EITI"];
        await cv.setSchool("PW", "1.1.1990", "2.2.2000", "EITI");
        var schoolResponse = (await cv.getSchool.call(0));
        var schoolCount = (await cv.countSchool.call());

        assert.deepEqual(schoolResponse, school, "Set school not working properly");
        assert.equal(schoolCount, 1, "School count not working properly");
    })

    it("should set certifications info", async function () {
        var cv = await CV.deployed();
        var cert = "Microsoft cert";
        await cv.setCert("Microsoft cert");
        var certResponse = (await cv.getCert.call(0));
        var certCount = (await cv.countCerts.call());

        assert.deepEqual(certResponse, cert, "Set certificates not working properly");
        assert.equal(certCount, 1, "Certificates count not working properly");
    })

    it("should set Interests info", async function () {
        var cv = await CV.deployed();
        var interest = "Ethereum";
        await cv.setInterest("Ethereum");
        var interestResponse = (await cv.getInterest.call(0));
        var interestsCount = (await cv.countInterests.call());

        assert.deepEqual(interestResponse, interest, "Set certificates not working properly");
        assert.equal(interestsCount, 1, "Certificates count not working properly");
    })    

    it("should set Languages info", async function () {
        var cv = await CV.deployed();
        var language = "English";
        await cv.setLanguage("English");
        var languageResponse = (await cv.getLanguage.call(0));
        var LanguagesCount = (await cv.countLanguages.call());

        assert.deepEqual(languageResponse, language, "Set languages not working properly");
        assert.equal(LanguagesCount, 1, "Languages count not working properly");
    })  
});