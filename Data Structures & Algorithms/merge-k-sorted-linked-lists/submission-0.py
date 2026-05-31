# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def mergeKLists(self, lists: List[Optional[ListNode]]) -> Optional[ListNode]:

        def sort_linked_list(list1,list2):

            dummy = node = ListNode()

            while list1 and list2:

                if list1.val < list2.val:
                    node.next = list1
                    list1 = list1.next
                else:
                    node.next = list2
                    list2 = list2.next
                node = node.next
            node.next = list1 or list2

            return dummy.next

        if len(lists) < 1:
            return None

        else:
            i = 1
            first = lists[0]
            while i < len(lists):
                second = lists[i]
                first = sort_linked_list(first,second)
                i += 1
            return first



