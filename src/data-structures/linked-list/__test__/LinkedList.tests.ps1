Import-Module $PSScriptRoot\..\LinkedList.psd1 -Force

Describe "LinkedList" {

    it 'should append node to linked list' {
        $linkedList = New-Object LinkedList

        $linkedList.head | Should  BeNullOrEmpty
        $linkedList.tail | Should  BeNullOrEmpty
        $linkedList.append(1)
        $linkedList.append(2)

        $linkedList.ToString() | should be "1,2"
    }

    it 'should prepend node to linked list' {
        $linkedList = New-Object LinkedList

        $linkedList.Append(1)
        $linkedList.Prepend(2)

        $linkedList.ToString() | should be '2,1'
    }
}