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

    return abs(d)



def unitifySE(start, end):
    """
    Creates unit vector from start to end

    start - (3,) ndarray
    end - (3,) ndarray
    """
        
    d = end - start

    return d / np.linalg.norm(d)


def unitify(vec):
    """
    Creates unit vector from vector

    vec - (3,) ndarray
    """

    return vec / np.linalg.norm(vec)

def isunit(vec):
    """
    returns true if the magnitude of the vector is 1
    """

    return np.linalg.norm(vec) == 1

def definebasis(vec1, vec2):
    """
    Defines a basis where vec1 is the x axis
    vec2 is a linear combination of xhat and yhat

    vec1 - (3,) ndarray
    vec2 - (3,) ndarray

    """

    xhat = unitify(vec1)
    zhat = unitify(np.cross(vec1, vec2))
    yhat = unitify(np.cross(zhat, xhat))

    # print xhat, yhat, zhat
    # print np.linalg.norm(xhat), np.linalg.norm(yhat), np.linalg.norm(zhat)
    # print (isunit(xhat) and isunit(yhat) and isunit(zhat))
    # print np.linalg.norm(zhat) == 1
    # raw_input()

    if np.linalg.norm(xhat) > 0.01:
        if np.linalg.norm(yhat) > 0.01:
            if np.linalg.norm(zhat) > 0.01:
                return xhat, yhat, zhat

    raise ValueError('vectors are parallel')

class Configuration:
    """docstring for Configuration"""
    def __init__(self, splineL_i, splineL_o, cupL, theta, bump, plunge, length, staticCamber):
        self.ID = 0.7175*2
        self.OD = 2.9 # 3.25 worst case
        self.Length = length
        self.CupDepth = cupL # 1.75 
        self.SpiderRadius = 0.803
        self.RollerRadius = 0.5


        if bump >= 1: # Bump
            self.UprightLocation = np.array([60.050, 20.702, 9.411])
        elif bump <= -1: # Droop
            self.UprightLocation = np.array([59.930, 20.612, 7.913])
        else: # Ride
            self.UprightLocation = np.array([60.000, 20.682, 8.688])

        self.staticCamber = staticCamber
        # self.UprightLocation = np.array([60, 20.78 + plunge, 8.69 + bump])
        self.UprightNormal = np.array([0, -1*math.cos(staticCamber*math.pi/180), math.sin(staticCamber*math.pi/180)])
        self.OutboardTripod = self.UprightLocation - np.array([0, splineL_o, 0])
        self.OutboardSplineDiameter = 0.4*2 # 0.435*2
        self.OutboardSplineExtension = 0.6325 + 0.06


        self.theta = theta
        self.DiffLocation = np.array([61.814 + 0.25*math.cos(theta), 3.88, 8.46 + 0.25*math.sin(theta) - 0.5]) # y was previously 3.79, but the other side was worse
        self.DiffNormal = np.array([0, 1, 0])
        self.InboardTripod = self.DiffLocation + np.array([0, splineL_i, 0])
        self.InboardSplineDiameter = 0.4*2 # 0.435*2
        self.InboardSplineExtension = 0.6325 + 0.06

        if bump >= 1: # Bump
            self.PushStart = np.array([57.150, 11.441, 18.593])
            self.PushEnd = np.array([57.853, 19.442, 7.721])
        elif bump <= -1: # Droop
            self.PushStart = np.array([57.130, 11.512, 17.333]) # Actual
            self.PushEnd = np.array([57.730, 19.417, 6.381]) # Actual
        else: # Ride
            self.PushStart = np.array([57.140, 11.542, 18.019])
            self.PushEnd = np.array([57.800, 19.449, 7.076])
        self.PushOD = 0.625

        self.UndertrayStart = np.array([58.288, 7.744, 13])
        self.UndertrayEnd = np.array([73.628, 12.086, 5.513])
        self.UndertrayOD = 0.56


class Results:
    """

    """
    def __init__(self):
        self.UprightDistance = 0
        self.DiffDistance = 0
        self.OutboardSplineDist = 0
        self.InboardSplineDist = 0
        self.PlungeLong = 0
        self.PlungeShort = 0
        self.Angle = 0
        self.PushrodDist = 0
        self.UndertrayDist = 0
        self.Config = None



def calculateConfig(Config):
    """
    Calculates whether a configuration works

    """

    # Create a results object
    Res = Results()
    Res.Config = Config

    # **********************************************************************************************************
    # Change basis to the axle frame

    axlevec = unitifySE(Config.InboardTripod, Config.OutboardTripod)
    try:
        xhat, yhat, zhat = definebasis(axlevec, Config.DiffNormal)
    except ValueError:
        print("The axle is straight. Add code for this if it comes up")
        return

    # This basis has positive x following the axle in the outboard direction

    # This transforms axlebasis to world
    axlebasis = np.hstack([xhat.reshape(3,1), yhat.reshape(3,1), zhat.reshape(3,1)])
    # This transforms world to axle
    axlebasisT = np.linalg.inv(axlebasis)



    # **********************************************************************************************************
    # First find the minimum distance between the axle and the upright

    # Define a basis for the upright
    xhat, yhat, zhat = definebasis(Config.UprightNormal, axlevec)
    # This transforms uprightbasis to world
    uprightbasis = np.hstack([xhat.reshape(3,1), yhat.reshape(3,1), zhat.reshape(3,1)])
    # This transforms world to upright
    uprightbasisT = np.linalg.inv(uprightbasis)

    # Now define the angle between the axle and the upright
    uprightangle = math.acos(unitify(axlevec).dot(unitify(Config.UprightNormal)))

    # This allows us to define the additional offset from angling the axle
    uprightAngleOffset = Config.SpiderRadius*math.cos(30*math.pi/180)*math.sin(uprightangle)

    # Now define the edges with respect to the contact
    edge1 = np.array([Config.CupDepth - Config.RollerRadius - uprightAngleOffset, Config.OD/2, 0])
    edge2 = np.array([Config.CupDepth - Config.RollerRadius - uprightAngleOffset, -Config.OD/2, 0])

    # Transform to world frame, and convert to car origin then to upright origin
    edge1 = axlebasis.dot(edge1) + Config.OutboardTripod - Config.UprightLocation
    edge2 = axlebasis.dot(edge2) + Config.OutboardTripod - Config.UprightLocation

    # Now transform to upright coordinate frame
    edge1 = uprightbasisT.dot(edge1)
    edge2 = uprightbasisT.dot(edge2)

    d1 = (edge1 - np.array([0,0,0]))
    d2 = (edge2 - np.array([0,0,0]))

    Res.UprightDistance = min([d1[0], d2[0]])


    # **********************************************************************************************************
    # Now figure out the distance between the inside of the axle and the Outboard Spline
    # This also uses the upright basis

    # Define the axle the same way, in the axle frame with origin outboard spline
    axle1 = np.array([Config.CupDepth - Config.RollerRadius - uprightAngleOffset, Config.ID/2, 0])
    axle2 = np.array([Config.CupDepth  - Config.RollerRadius - uprightAngleOffset, -Config.ID/2, 0])

    # # Define the spline in the upright frame with origin UprightPosition
    # spline1 = np.array([0, Config.OutboardSplineDiameter/2, 0])
    # spline2 = np.array([0, -Config.OutboardSplineDiameter/2, 0])

    # Transform to world frame, and convert to car origin then to upright origin
    axle1 = axlebasis.dot(axle1) + Config.OutboardTripod - Config.UprightLocation
    axle2 = axlebasis.dot(axle2) + Config.OutboardTripod - Config.UprightLocation

    # Now transform to upright coordinate frame
    axle1 = uprightbasisT.dot(axle1)
    axle2 = uprightbasisT.dot(axle2)

    # the distance we care about is upright y distance.
    # The closest point to the upright axis is what matters
    # We then take that distance and subtract the spline diameter

    d = min(abs(axle1[1]) - Config.OutboardSplineDiameter/2, abs(axle2[1]) - Config.OutboardSplineDiameter/2)

    Res.OutboardSplineDist = d


    # **********************************************************************************************************
    # Now figure out the minimum distance between the axle and the diff

    # Define a basis for the diff
    xhat, yhat, zhat = definebasis(Config.DiffNormal, axlevec)
    # This transforms uprightbasis to world
    diffbasis = np.hstack([xhat.reshape(3,1), yhat.reshape(3,1), zhat.reshape(3,1)])
    # This transforms world to upright
    diffbasisT = np.linalg.inv(diffbasis)

    # Now define the angle between the axle and the diff
    diffangle = math.acos(unitify(axlevec).dot(unitify(Config.DiffNormal)))

    # This allows us to define the additional offset from angling the axle
    diffAngleOffset = Config.SpiderRadius*math.cos(30*math.pi/180)*math.sin(diffangle)

    # Now define edges of the axle in the axle frame, with arbitrary origin at inboard tripod
    edge1 = np.array([-Config.CupDepth + Config.RollerRadius + diffAngleOffset, Config.OD/2, 0])
    edge2 = np.array([-Config.CupDepth + Config.RollerRadius + diffAngleOffset, -Config.OD/2, 0])

    # Transform to world frame, and convert to car origin then to diff origin
    edge1 = axlebasis.dot(edge1) + Config.InboardTripod - Config.DiffLocation
    edge2 = axlebasis.dot(edge2) + Config.InboardTripod - Config.DiffLocation

    # Now transform to diff coordinate frame
    edge1 = diffbasisT.dot(edge1)
    edge2 = diffbasisT.dot(edge2)

    d1 = edge1
    d2 = edge2

    Res.DiffDistance = min([d1[0], d2[0]])

    # **********************************************************************************************************
    # Now figure out the distance between the inside of the axle and the Inboard Spline
    # This also uses the diff basis

    # Define the axle the same way, in the axle frame with origin outboard spline
    axle1 = np.array([-Config.CupDepth + Config.RollerRadius + diffAngleOffset, Config.ID/2, 0])
    axle2 = np.array([-Config.CupDepth + Config.RollerRadius + diffAngleOffset, -Config.ID/2, 0])

    # Transform to world frame, and convert to car origin then to diff origin
    axle1 = axlebasis.dot(axle1) + Config.InboardTripod - Config.DiffLocation
    axle2 = axlebasis.dot(axle2) + Config.InboardTripod - Config.DiffLocation

    # Now transform to diff coordinate frame
    axle1 = diffbasisT.dot(axle1)
    axle2 = diffbasisT.dot(axle2)

    # the distance we care about is diff y distance.
    # The closest point to the upright axis is what matters
    # We then take that distance and subtract the spline diameter

    d = min(abs(axle1[1]) - Config.InboardSplineDiameter/2, abs(axle2[1]) - Config.InboardSplineDiameter/2)

    Res.InboardSplineDist = d

    # **********************************************************************************************************
    # Now calculate plunge

    # These are the max offsets, since depending on tripod orientation, offset changes
    uprightMaxOffset = uprightAngleOffset / math.cos(30*math.pi/180)
    diffMaxOffset = diffAngleOffset / math.cos(30*math.pi/180)

    uprightMaxOffset = max((uprightMaxOffset, Config.OutboardSplineExtension - Config.RollerRadius))
    diffMaxOffset = max((diffMaxOffset, Config.InboardSplineExtension - Config.RollerRadius))

    # First define amount past contact
    outboardMinLength = Config.CupDepth - Config.RollerRadius - uprightAngleOffset
    inboardMinLength = -Config.CupDepth + Config.RollerRadius + diffAngleOffset

    outboardMaxLength = Config.CupDepth - Config.RollerRadius - uprightMaxOffset
    inboardMaxLength = -Config.CupDepth + Config.RollerRadius + diffMaxOffset

    # First check if the axle is long enough
    inboardEnd = [outboardMinLength - Config.Length + Config.RollerRadius, 0, 0]
    inboardEnd = Config.InboardTripod - (axlebasis.dot(inboardEnd) + Config.OutboardTripod)
    inboardEnd = axlebasisT.dot(inboardEnd)
    outboardEnd = [inboardMinLength + Config.Length - Config.RollerRadius, 0, 0]
    outboardEnd = axlebasis.dot(outboardEnd) + Config.InboardTripod - Config.OutboardTripod
    outboardEnd = axlebasisT.dot(outboardEnd)
    d = min(inboardEnd[0], outboardEnd[0])

    Res.PlungeLong = d


    # Then check if the axle is short enough
    inboardDepth = [outboardMaxLength - Config.Length - inboardMaxLength, 0, 0]
    inboardDepth = axlebasis.dot(inboardDepth) + Config.OutboardTripod - Config.InboardTripod
    inboardDepth = axlebasisT.dot(inboardDepth)
    outboardDepth = [inboardMaxLength + Config.Length - outboardMaxLength, 0, 0]
    outboardDepth = -(axlebasis.dot(outboardDepth) + Config.InboardTripod) + Config.OutboardTripod
    outboardDepth = axlebasisT.dot(outboardDepth)
    d = min(inboardDepth[0], outboardDepth[0])

    Res.PlungeShort = d


    # **********************************************************************************************************
    # Calculate angle

    if uprightangle > math.pi/2:
        uprightangle = math.pi - uprightangle

    if diffangle > math.pi/2:
        diffangle = math.pi - diffangle

    Res.Angle = max(uprightangle, diffangle) * 180 / math.pi


    # **********************************************************************************************************
    # Calculate pushrod distance

    # (c1, c2) = ClosestPointLines(Config.InboardTripod, Config.OutboardTripod, Config.PushStart, Config.PushEnd)
    # d = np.linalg.norm(c2-c1) - Config.OD/2 - Config.PushOD/2

    d = ClosestDistanceLines(Config.InboardTripod, Config.OutboardTripod, Config.PushStart, Config.PushEnd) - Config.OD/2 - Config.PushOD/2

    Res.PushrodDist = d


    # **********************************************************************************************************
    # Calculate undertray mounting distance

    (c1, c2) = ClosestPointLines(Config.InboardTripod, Config.OutboardTripod, Config.UndertrayStart, Config.UndertrayEnd)
    d = np.linalg.norm(c2-c1) - Config.OD/2 - Config.UndertrayOD/2

    Res.UndertrayDist = d

    



    return Res

if __name__ == '__main__':

    # vec1 = np.array([1, 0, 0])
    # vec2 = np.array([0, 1, 0])
    # vec3 = np.array([0, 0, 1])

    # print np.hstack([vec1.reshape(3,1), vec2.reshape(3,1), vec3.reshape(3,1)]).dot(np.array([1, 3, 4]).reshape(3,1))

    goodS = list()
    D1 = []
    D2 = []
    D3 = []
    D4 = []
    D5 = []
    D6 = []
    D7 = []
    D8 = []

    for s in range(170, 200+1):
        spline_i = s*0.01
        spline_o = 2.04
        trange = 36
        for c in range(163, 163+1):
            cup = c * 0.01
            for l in range(1481, 1481+1):
                length = l * 0.01
                flag = 0
                for cam in range(-30, 10+1):
                # for c in range(0, 0+1):
                    camber = cam*0.1
                    D1 = []
                    D2 = []
                    D3 = []
                    D4 = []
                    D5 = []
                    D6 = []
                    D7 = []
                    D8 = []
                    for t in range(trange):
                        theta = 2*np.pi*t/trange

                        # raw_input("Spline: " +str(spline) + " Angle: " + str(theta))

                        Bump = Configuration(spline_i, spline_o, cup, theta, 1, -0.08, length, camber-0.25)
                        Ride = Configuration(spline_i, spline_o, cup, theta, 0, 0, length, camber)
                        Droop = Configuration(spline_i, spline_o, cup, theta, -1, 0.049, length, camber+0.25)
                        # print Droop.InboardTripod, Droop.OutboardTripod
                        BumpR = calculateConfig(Bump)
                        RideR = calculateConfig(Ride)
                        DroopR = calculateConfig(Droop)

                        # print BumpR.UprightDistance, BumpR.DiffDistance
                        # print DroopR.UprightDistance, DroopR.DiffDistance
                        # print RideR.UprightDistance, RideR.DiffDistance

                        # print BumpR.OutboardSplineDist, BumpR.InboardSplineDist
                        # print DroopR.OutboardSplineDist, DroopR.InboardSplineDist
                        # print RideR.OutboardSplineDist, RideR.InboardSplineDist


                        d1 = min(BumpR.UprightDistance, RideR.UprightDistance, DroopR.UprightDistance)
                        d2 = min(BumpR.OutboardSplineDist, RideR.OutboardSplineDist, DroopR.OutboardSplineDist)
                        d3 = min(BumpR.DiffDistance, RideR.DiffDistance, DroopR.DiffDistance)
                        d4 = min(BumpR.InboardSplineDist, RideR.InboardSplineDist, DroopR.InboardSplineDist)
                        d5 = min(BumpR.PlungeLong, RideR.PlungeLong, DroopR.PlungeLong)
                        d6 = min(BumpR.PlungeShort, RideR.PlungeShort, DroopR.PlungeShort)
                        d7 = min(BumpR.PushrodDist, RideR.PushrodDist, DroopR.PushrodDist)
                        d8 = min(BumpR.UndertrayDist, RideR.UndertrayDist, DroopR.UndertrayDist)

                        if (d1 < 0.125 or d2 < 0.0625 or d3 < 0.125 or d4 < 0.0625 or d5 < -0.0625 or d6 < -0.0625 or d7 < 0.5 or d8 < 0.5):
                            flag = 1
                            # print d1, d2, d3, d4, d5, d6, d7, d8
                            break

                        D1.append(d1)
                        D2.append(d2)
                        D3.append(d3)
                        D4.append(d4)
                        D5.append(d5)
                        D6.append(d6)
                        D7.append(d7)
                        D8.append(d8)

                        # print d7



                    if flag == 1:
                        print "bad"
                        break

                if flag == 0:
                    goodS.append((spline_i, spline_o, cup, length, min(D1), min(D2), min(D3), min(D4), min(D5), min(D6), min(D7), min(D8)))
                    # print (spline, length)
                    print "good"

    for axle in goodS:
        print axle

    # print min(D1), min(D2), min(D3), min(D4), min(D5), min(D6), min(D7), min(D8)

# Stuff to add
# Axle Plunge + 
# Angle Calc +
# Pushrod clearance ~
# Better cup contact assumptions ~
# Static Camber +
# Static Toe
# Eccentric Diff ~
# Nonstraight upright +


