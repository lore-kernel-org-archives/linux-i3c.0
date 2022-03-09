Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78859C433EF
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Mar 2022 15:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ybKYZaXy+KyscdxuAziDrn29ssKfuMyhxwFq+ars2TI=; b=LzNvJMgtItx8nA
	mu7XkktwVrBzrUFdkqrlynJ8YvTwlPShptjarz/9Psb7iBv+Hn7QnNmKukHuJri5ko7j5FlW29Nep
	RtjUoTN9NW7262GFYnjYa3qi/mNajcepJ3UkNqJfdGsDMu0L+2VgtXLFgo/XBDDOw8/V3+k/IP2Vn
	KCKsYkQUzzI7xe34OnN5kxyoxXXcN5ypwSt3a9hshESIB9HQn+UGc9kX2poK4nCsWlGWpXSOIrpuC
	IUMR5V4BdMoYtTJlgZTMTYe7RFK8TqDwQ7cy5QLN4iJq9woNVpdacV5T2togre9jF/afdL0Jb0gdz
	eGOI9vCN2x/b4ImTHkgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRxzq-0098CR-Np; Wed, 09 Mar 2022 15:13:02 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRxzn-0098A2-K2
 for linux-i3c@lists.infradead.org; Wed, 09 Mar 2022 15:13:01 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 229EeF5R016960; 
 Wed, 9 Mar 2022 15:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=rPDKcb8uae4SyY7G1heeqxfXlh5W95QCYcRADpkPaTM=;
 b=1H96g/vumHa2oU6W8C3LqWpwGcdbK6we4T0HWW/17MhV0dMoc4PYnfBIjm22Us249fl4
 6iHuiBQ1wYC4zk9IUnGfyMj1MP7o47i9FAJpeWimeB8AX/ZZSuD1ZXjhhOoi30s9NeuS
 R8YUblpkIEAieVbNz1RBOE0i8PRUToubF8dtQspOhdfIoWu+nuI13Cqsh+muremsPfvy
 anvMpQWvk9mOYUmzvaFNYBQNUBKEMNPhxVBTG7JcerfA8jPQ4/o6f+PGQOSYlrbCe/DY
 lxPSUrpIXHwfve/Kz4dzIAYAb9dVz6nkrUMmwHUXsh1mLxpNsLI4KCKdJLTOei9wXPgM Tg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekx9cj951-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Mar 2022 15:12:47 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 229FCjwb006893;
 Wed, 9 Mar 2022 15:12:46 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by userp3020.oracle.com with ESMTP id 3envvmjdcx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Mar 2022 15:12:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aIjsHE5jDMd1+5+ZaglIVy++Bmn6ZzaQaelGhWAPTCRIQGtQ7zqVhq5a9lRLkNKhS3weM3zhtpW0fcx2jEX5UTiKX/1nDJC8w3JJk8N1DdBTguuAwz2mmGAWpL99d7W0O5OE8q3ym6Z6kCwp0Gjy2XKhi4HxIOpEz09SXloaL2khxnDSGuxHBooMdhWhnbM9Ji6SaAcLaNV4omg7g1zyKHkP4O+jdeugvRI8GkJbB8/+mbATdx2NwTj5TqJE4W1V7V9dF6DddPheHD4oejj0PryyAOrnIPiK3o1c7lxoQ9sPDbNg38/oATjz+Ypkdeu7Ztip6TY1I+9eu+lmEAryJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPDKcb8uae4SyY7G1heeqxfXlh5W95QCYcRADpkPaTM=;
 b=c1trLy5Qe8SGGstSJKrHAyoNR459oFn4Eksco2Ao8OvZ0gnPaxfxvvkIDeMhrvR/bv4e5pSqw2mpDytltW6BZEYx8eGp3d/RvwZUrTba+7KoR2d/Ms14DfUHwigz70aI65ynb6OOu1mgzQ9vbFWE/CFsmrGO0WdFiSqXaHOPH8mzpY7nopJIDjxOJeFTZmsljZ1M88hMa51Q5/0p1vH2rllK9oAU4QFxnNDEglHMI7/kavpz7oNd3Dt7crK2iRew8ddccDskjN917knOa51iKsAmCsctdAMpeDXznm2YB+0LnIbAXsAt7ld5boOHpmIc9+cZR5GO0UJNZ0pOIO8NLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPDKcb8uae4SyY7G1heeqxfXlh5W95QCYcRADpkPaTM=;
 b=uDyyoUMEhEL/RgzED93rnTpaeK3jLhjj0mN0ERoJ6d5doZ/9o0UCliMs+cguHz628xWNRNV6JiZKVW+F2a+tYaYF8mSZ91E846y9G+oyBcDgCMTQOSCeIDswdsXhyk16+c/bm0lN0Y7WcOgSMNumSKdDs15ScrCG7jeSFJmlGwU=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DS7PR10MB5040.namprd10.prod.outlook.com
 (2603:10b6:5:3b0::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 15:12:39 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5038.026; Wed, 9 Mar 2022
 15:12:39 +0000
Date: Wed, 9 Mar 2022 18:12:27 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: quic_jiles@quicinc.com
Cc: linux-i3c@lists.infradead.org
Subject: [bug report] i3c: remove i2c board info from i2c_dev_desc
Message-ID: <20220309151227.GA6714@kili>
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0043.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dcc40b56-0f9a-4c77-7834-08da01df402a
X-MS-TrafficTypeDiagnostic: DS7PR10MB5040:EE_
X-Microsoft-Antispam-PRVS: <DS7PR10MB50409E8D61C7BA13DBC60EB88E0A9@DS7PR10MB5040.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cYye7WuyDin13HqSyap1N7HFEc4W+qxvSlxhPdPefaQTNC5uWPr19jFT9ftEhFzCtkZMNz36lRJvMy8NR02F0mSs+0t+eI13TQeZfyu4E+lFBhgJaQ/dj9l9T2KkK7zcnZD/jius8UW6bK3fsqsIDAdI/ZQq0Epo5SWE/z53prp9US337w+R9m2iG2FAsml5mhS473HMsYIcJL7iYeZo6f5aMuoJQev3ESV+vHrUNJxkV9W4FVawtxX9pxxpPZTVs0OetODCxSoI3JVW6QrIKfhwHSS3HcdqQSy4WCKFqXRB2+7qE5S53/0+zVt8C8lTDkA2yAxXjn9GMK+Lfx2Xvwv1FaMaf3TY/VWfSdVAlcvB6A5nFsWMCcNnW0kiP4dJFmFqIANEEky6QcJ/IEiYdJExCcXSGwAHMvxfY6LnVq5do8jHXRXgYP9FFwyi31x2/VyE2B5UdVnpzThKfAveqncpn9pI+BoiO4RStl3unOOok+izGEHF17isW26rdxEtdDWDqqq767BkBva7lRGOjSQgklgmPfvFXe6zeI3kaXn+YThJTVsFGxc/GCIIl5tMpCSnJz3xvujFhHyUcZ9V7qVmym4a7YiTpUecz4DHJQYlLZcgWM/jQXwC2j9ZQ5mXr6SXTaKlIQY3wZ0l2Qjxzljbuc20juFgTeXbYJakY2N4NcPfS9GQjNhSZyFIPdtFSGUtXsUUNq33HsAnvHIwjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(316002)(83380400001)(38350700002)(33656002)(5660300002)(4326008)(66946007)(2906002)(66476007)(8936002)(8676002)(44832011)(66556008)(508600001)(1076003)(33716001)(6486002)(6916009)(186003)(26005)(38100700002)(52116002)(9686003)(6666004)(6512007)(6506007)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HjHwNtRzJwH5Ubrc+95cxu4zLW0vA8wsewPkqpNeBXPYr+5NAHdQwFr6/kNP?=
 =?us-ascii?Q?2tNml7uyEVvo0aUbxHwoaGM8U9zHVx+yPOipMNZ5RpiYvJUrWRTbq5/4+45z?=
 =?us-ascii?Q?7/p7V2GTd/KTE6DJM2TQBw+WStYumAnoNbnJrZWlebXbNGjWaylsxEM3Bhp+?=
 =?us-ascii?Q?pAFtnb8dauIkqEkCCp4nvTN8EunmiAnWAe4hA5jxpSJ0YgoycCdFRG69PFXa?=
 =?us-ascii?Q?b/JkythWClLr5eFkk79n8JTIZXsLTJdaWh/Qqs/dspfHNSzV1y39oeeDrPXV?=
 =?us-ascii?Q?h5u9y0f5xT92cwzkVpTWOPGiS0tXJgIlqfNv1GkRGvA767kLOw7V8G9mx5H/?=
 =?us-ascii?Q?nGcgToSOpkiA0NtpCUXoFrJJS05jtvfw+2l8OHfGViryWiTQ5nTznxk7glpQ?=
 =?us-ascii?Q?3bhVdfZQEPG5S00OBwAdy03WZMJ0vNeIoN8Mx33d8AvqGx5OlQLDCmdT4QRr?=
 =?us-ascii?Q?kLmfrDoN6EBT6A+uANqtGsAOjHiIfES6nzTXBisJ0Eh3ySFX9qAYS7J7PIk7?=
 =?us-ascii?Q?JrTXk0mk18+JwuVwVFaBKqKfftOlwo/3Jg/qoqN9PHUVWlWQqcoWM6rjDIuX?=
 =?us-ascii?Q?Prhm54kpGnuwXFuaeZO68AfnJuPAh8haYbtL/N6NUQY0TTAWivR2urAW9eKz?=
 =?us-ascii?Q?WUMZvIakr5Rpgn/7jwiX5c8Kpe1EAqEKhzVSYlAgy3ElnkL3UwkzjHE481Wq?=
 =?us-ascii?Q?Vxmc86WFiE+u988hDhRpDORC+9/E4/dTV+pPMyEH+i1lCBpNCqpgrFqOeCHm?=
 =?us-ascii?Q?qHw98FLqqt3Uu2nRY4V11S2ZAgDBq+v24kWJZWmdYvN7IT9QGPLyVxNwCKZy?=
 =?us-ascii?Q?R/g+KK13dEeaj7t+J2u5JH7siQ1wL4qKVqhXu7Fsy+UqYuqZ3PYEZ1gW4Nqq?=
 =?us-ascii?Q?Q+gRP4pgIMKbSwwjxX5nho9WaXc9Je/1MFo29GIq/f7zoM/L4t9lfteMz70m?=
 =?us-ascii?Q?wMLnwgETU+dYSSBQIakPc/vg8pr4F/P6J4ewCug2Wqe1NntqaCWJkz2LUMGI?=
 =?us-ascii?Q?Umiv1DgTM16eKp3Qup03KKe9FMm26A0Yt8bqbTTUXdV7/vXN1r4+n48SOkQa?=
 =?us-ascii?Q?mA8aZ1Cn/BjnYNh0ad32eo3VfZWkWQHIpfm3ZzloJFm2sRo/uE4hmmtUqg7D?=
 =?us-ascii?Q?x1I4nIK6+znWiLd5eYG2nZ4UdaMu8tbPnRaUsJ1XpFHh8WUOa11T/k9NYMGM?=
 =?us-ascii?Q?gac4MtKzvgbpeq97clrR+YpZgKmI+/2SgMcptOk9tWTqml8t4odYjTQ1OxVp?=
 =?us-ascii?Q?9BbljbBGz/yVxvurR2GGcdr6DC9yxvM+60KL2A0oUbNFim69NREZjPGVAiIs?=
 =?us-ascii?Q?gDUjeRTxCJ4RE/vZJc4G8xhIg6rBGOQva+FrsKPt2aW/+huB546hcSE/Qi3o?=
 =?us-ascii?Q?M8sEkYfQtSgaZN6HYioqqL7njmAIp0LR3WWK0BTHcfQiH9wDYgbhh67ie9dO?=
 =?us-ascii?Q?Vruje91/NdKN9V7st89kv95leSe6Fvlta8nYiMNwoYYv+iJx8GD1fjlPTSaA?=
 =?us-ascii?Q?fw1dPxL+6LEhEK2e8HNNGBGFAmW/xl8hZzu6Q7FEExKn2lbYU6LqMTZSXa4M?=
 =?us-ascii?Q?+SodjMyl4a6rCjh3skqTeFBUP1VS5lYBdZtpUZ44DiqxEWUZyYUk5KhK115a?=
 =?us-ascii?Q?4MuHcZGuVF0J53S1vBZwN/uBPcz1GTSj1ngPzIzrE48sUySxj+3hc03GNgu7?=
 =?us-ascii?Q?TeVV+w=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc40b56-0f9a-4c77-7834-08da01df402a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 15:12:39.5799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/fxYarF9hKKGMafyJ+AEqlVavHBlsd8erfKD+Ej7E3vFuUMurmgQ1E7qHAWLv7BrrXU+g9vzye+NKmtKDhOUc3jPD+dAosQeO6FGwJAgoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5040
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10281
 signatures=692062
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 bulkscore=0
 phishscore=0 malwarescore=0 suspectscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203090085
X-Proofpoint-ORIG-GUID: ReeAdf46UkDqs1sAgA6C00bHSN63l7zc
X-Proofpoint-GUID: ReeAdf46UkDqs1sAgA6C00bHSN63l7zc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_071259_838069_42877224 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello Jamie Iles,

The patch 31b9887c7258: "i3c: remove i2c board info from
i2c_dev_desc" from Jan 17, 2022, leads to the following Smatch static
checker warning:

	drivers/i3c/master.c:2311 i3c_master_i2c_adapter_init()
	error: potentially dereferencing uninitialized 'i2cdev'.

drivers/i3c/master.c
    2286 static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
    2287 {
    2288         struct i2c_adapter *adap = i3c_master_to_i2c_adapter(master);
    2289         struct i2c_dev_desc *i2cdev;
                                      ^^^^^^

    2290         struct i2c_dev_boardinfo *i2cboardinfo;
    2291         int ret;
    2292 
    2293         adap->dev.parent = master->dev.parent;
    2294         adap->owner = master->dev.parent->driver->owner;
    2295         adap->algo = &i3c_master_i2c_algo;
    2296         strncpy(adap->name, dev_name(master->dev.parent), sizeof(adap->name));
    2297 
    2298         /* FIXME: Should we allow i3c masters to override these values? */
    2299         adap->timeout = 1000;
    2300         adap->retries = 3;
    2301 
    2302         ret = i2c_add_adapter(adap);
    2303         if (ret)
    2304                 return ret;
    2305 
    2306         /*
    2307          * We silently ignore failures here. The bus should keep working
    2308          * correctly even if one or more i2c devices are not registered.
    2309          */
    2310         list_for_each_entry(i2cboardinfo, &master->boardinfo.i2c, node)
--> 2311                 i2cdev->dev = i2c_new_client_device(adap, &i2cboardinfo->base);
                         ^^^^^^
Uninitialized

    2312 
    2313         return 0;
    2314 }

regards,
dan carpenter

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
