# Skeleton file for the Python "linked-list" exercise.


class Node(object):
    def __init__(self, value, next=None, prev=None):
        self.value = value
        self.next = next
        self.prev = prev


class LinkedList(object):
    def __init__(self):
        self.head = Node(None)
        self.tail = self.head

    def _tail(self):
        p = self.head
        while True:
            if not p.next:
                return p
            p = p.next

    def push(self, item):
        last = self._tail()
        node = Node(item, None, last)
        last.next = node

    def pop(self):
        node = self._tail()
        if node.prev:
            node.prev.next = None
            return node.value

        raise ValueError('there is nothing to pop')

    def unshift(self, item):
        first = self.head.next
        node = Node(item, first, self.head)
        self.head.next = node
        if first:
            first.prev = node

    def shift(self):
        if self.head.next:
            node = self.head.next
            self.head.next = node.next
            if node.next:
                node.next.prev = self.head
            return node.value

        raise ValueError('there is nothing to shift')
