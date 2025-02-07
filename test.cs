
public class NewBaseType
{
    private int myProperty;
}
skdfjs

public class test : NewBaseType
{

    public string test;
    private string _test;

    public string Test
    {
        get { return _test; }
        set { _test = value; }
    }


    public int MyProperty { get => myProperty; set => myProperty = value; }
    private string myVar;

    public string Property
    {
        get { return myVar; }
        set { myVar = value; }
    }

    public string MyVar { get => myVar; set => myVar = value; }

    public void Ttest()
    {
        myVar = "aaa";
    }
}

