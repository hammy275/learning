class Node {
    $val;
    [Node]$next;
    Node($val) {
        $this.val = $val;
    }
}

class LinkedList {
    [Node]$head = $null;
    [Node]$tail = $null;

    append($newVal) {
        if ($null -eq $this.head) {
            # Set head if we have no head
            $this.head = [Node]::new($newVal);
            $this.tail = $this.head;
        } else {
            # Set to element after tail
            $this.tail.next = [Node]::new($newVal);
            $this.tail = $this.tail.next;
        }
    }

    [bool]contains($val) {
        $current = $this.head;
        while ($null -ne $current) {
            if ($current.val -eq $val) {
                return $true;
            }
            $current = $current.next;
        }
        return $false;
    }

    [bool]remove($val) {
        # If removing from head, get rid of it there.
        if ($this.head.val -eq $val) {
            $this.head = $this.head.next;
            return $true;
        } else {
            # Iterate through, and if we find our value, remove it.
            $current = $this.head;
            while ($null -ne $current.next) {
                if ($current.next.val -eq $val) {
                    if ($current.next -eq $this.tail) {
                        # If the to be removed node is the tail, move the tail back.
                        $this.tail = $current;
                    }
                    $current.next = $current.next.next;
                    return $true;
                }
                $current = $current.next;
            }
            return $false;
        }
    }

    [object]get($index) {
        if ($null -eq $this.head) {
            throw "Index out of bounds!";
        }
        $current = $this.head;
        for ($i = 0; $i -lt $index; $i++) {
            $current = $current.next;
            if ($null -eq $current) {
                throw "Index out of bounds!";
            }
        }
        return $current.val;
    }

    [string]ToString() {
        if ($null -eq $this.head) {
            return "Empty linked list!";
        }
        [string]$toRet = "";
        $current = $this.head;
        while ($null -ne $current) {
            $toRet += $current.val.ToString() + " ";
            $current = $current.next;
        }
        return $toRet;
    }
}

# Just some basic code to make sure our linked list is working.
[LinkedList]$list = [LinkedList]::new();
$list.append(1);
$list.append(2);
Write-Host ($list);
Write-Host $list.contains(3);
$list.append(3);
Write-Host $list.contains(2);
Write-Host $list.remove(2);
Write-Host $list;
Write-Host $list.remove(1);
Write-Host $list;
Write-Host $list.get(0);
$list.append(2);
$list.append(5);
$list.append(8);
Write-Host $list.remove(8);
Write-Host $list;
$list.append(6);
Write-Host $list;

