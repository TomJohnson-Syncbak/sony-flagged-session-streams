from __future__ import print_function

import base64
import json

#print('Loading function')


# noinspection PyInterpreter,PyInterpreter
def lambda_handler(event, context):
    output = []

    success = 0
    dropped = 0
    failed = 0

    #print(event)

    for record in event['records']:
        payload = base64.b64decode(record['data'])
        datafields = json.loads(payload)

        # Only pass flagged Sony sessions

        id = record['recordId']

        if 'type' in datafields and datafields['type'] == 'flaggedSession' and 'siteId' in datafields and datafields['siteId'] == 124:
            output.append({'recordId': id, 'data' : base64.b64encode(payload), 'result': 'Ok'})
            #print ('Found flagged session record Id {0}'.format(id)
            success += 1
        else:
            output.append({'recordId': id, 'data' : base64.b64encode(payload), 'result': 'Dropped'})
            #print ('Skipped record Id {0}'.format(id)
            dropped += 1

    print('Successfully delivered {0} flagged Sony records, dropped {1} records, failed to deliver {2} records'.format(success, dropped, failed))

    return {'records': output}
