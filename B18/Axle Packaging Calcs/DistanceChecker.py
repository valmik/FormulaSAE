import numpy as np
import math




def ClosestPointLines(start1, end1, start2, end2):
    """
    Computes the minimum distance between two infinite lines

    Inputs are start and end points for each line in the same coordinate frame

    start1 - (3,) ndarray
    end1 - (3,) ndarray
    start2 - (3,) ndarray
    end2 - (3,) ndarray

    """

    # First find the closest points of the two infinite cylinders
    # Since the shortest segment connecting two infinite lines is
    # perpendicular to both lines, the closest segment between two
    # cylinders must also lie on that line
    # We use the algorithm on wikipedia
    # https://en.wikipedia.org/wiki/Skew_lines#Nearest_Points

    p1 = start1
    p2 = start2
    d1 = (end1 - start1)
    d1 = d1 / np.linalg.norm(d1) # make it unit vector
    d2 = (end2 - start2)
    d2 = d2 / np.linalg.norm(d2) # make it unit vector
    n = np.cross(d1, d2)
    n1 = np.cross(d1, n)
    n2 = np.cross(d2, n)

    n1 = n1 / np.linalg.norm(n1)
    n2 = n2 / np.linalg.norm(n2)

    c1 = p1 + (np.dot((p2-p1), n2)/(np.dot(d1, n2))) * d1
    c2 = p2 + (np.dot((p1-p2), n1)/(np.dot(d2, n1))) * d2

    return (c1, c2)



def ClosestDistanceLines(start1, end1, start2, end2):
    """
    Computes the minimum distance between two infinite lines

    Inputs are start and end points for each line in the same coordinate frame

    start1 - (3,) ndarray
    end1 - (3,) ndarray
    start2 - (3,) ndarray
    end2 - (3,) ndarray

    """

    # First find the closest points of the two infinite cylinders
    # Since the shortest segment connecting two infinite lines is
    # perpendicular to both lines, the closest segment between two
    # cylinders must also lie on that line
    # We use the algorithm on wikipedia
    # https://en.wikipedia.org/wiki/Skew_lines#Nearest_Points

    p1 = start1
    p2 = start2
    d1 = (end1 - start1)
    d2 = (end2 - start2)
    n = np.cross(d1, d2)
    n = n / np.linalg.norm(n)

    d = n.dot(start2 - start1)

    return d


if __name__ == '__main__':
    start1 = np.array([57.132, 11.531, 17.471])
    end1 = np.array([57.545, 19.373, 5.902])
    start2 = np.array([61.728, 5.884, 8.692])
    end2 = np.array([59.872, 18.533, 7.386])
    OD = 2.9
    pushOD = 0.625
    print ClosestDistanceLines(start1, end1, start2, end2) - OD/2 - pushOD/2

    (c1, c2) = ClosestPointLines(start1, end1, start2, end2)
    print np.linalg.norm(c2-c1) - OD/2 - pushOD/2


