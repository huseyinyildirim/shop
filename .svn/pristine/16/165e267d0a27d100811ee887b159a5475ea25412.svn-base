using System;

namespace SHOP
{
    public interface IPerson
    {
        string FullName { get; set; }
    }

    [Serializable]
    public class PersonalIdentification : IPerson
    {
        private string _name;

        public PersonalIdentification()
        {
        }

        public PersonalIdentification(string name)
        {
            _name = name;
        }

        public virtual string FullName
        {
            get { return _name; }
            set { _name = value; }
        }
    }

    [Serializable]
    public struct Deneme2
    {
        public int X { get; set; }
        public int Y { get; set; }
        public int Z { get; set; }
    }

    [Serializable]
    public class Kullanici
    {
        private static object Kilitleyici = new object();
        private static string _ID;
        public static string ID
        {
            get
            {
                lock (Kilitleyici)
                {
                    return _ID;
                }
            }
            set
            {
                lock (Kilitleyici)
                {
                    _ID = value;
                }
            }
        }
    }

}