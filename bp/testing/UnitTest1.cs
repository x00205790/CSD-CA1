using Microsoft.VisualStudio.TestTools.UnitTesting;
using BPCalculator;
using System;

namespace bpUnitTestProject
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestLowBloodPressure()
        {
            BloodPressure bloodPressure = new BloodPressure() { Systolic = 80, Diastolic = 50 };
            Assert.AreEqual(BPCategory.Low, bloodPressure.Category);
        }

        [TestMethod]
        public void TestIdealBloodPressure()
        {
            BloodPressure bloodPressure = new BloodPressure() { Systolic = 110, Diastolic = 70 };
            Assert.AreEqual(BPCategory.Ideal, bloodPressure.Category);
        }

        [TestMethod]
        public void TestPreHighBloodPressure()
        {
            BloodPressure bloodPressure = new BloodPressure() { Systolic = 130, Diastolic = 85 };
            Assert.AreEqual(BPCategory.PreHigh, bloodPressure.Category);
        }

        [TestMethod]
        public void TestHighBloodPressure()
        {
            BloodPressure bloodPressure = new BloodPressure() { Systolic = 160, Diastolic = 95 };
            Assert.AreEqual(BPCategory.High, bloodPressure.Category);
        }

        [TestMethod]
        public void TestEmergencyBloodPressure()
        {
            BloodPressure bloodPressure = new BloodPressure() { Systolic = 185, Diastolic = 110 };
            Assert.AreEqual(BPCategory.Emergency, bloodPressure.Category);
        }

        [TestMethod]
        public void TestInvalidBloodPressure()
        {
            // Blood pressure values that fall outside the specified ranges
            BloodPressure bloodPressure = new BloodPressure() { Systolic = 50, Diastolic = 130 };

            // Expecting an exception to be thrown
            Assert.ThrowsException<InvalidOperationException>(() => bloodPressure.Category);
        }
    }
}
