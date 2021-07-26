Return-Path: <SRS0=qHOf=MS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C71C4338F
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Jul 2021 07:33:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF94960F38
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Jul 2021 07:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF94960F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QmB43j+MymEyC1rU2f2+nv8ulKcFoEVHezBsbzdcjwY=; b=vYTlk/t6rVK/34
	OQS/4UQIejOgnCXeS6MJCvySOFIYTiBid7gE1ge7uwC0JtD8LirW/KSgBs6g0SmEbJ77eKTYJahbL
	Qb7JiJYF9J22qEd2suNxOv/X3KNHSla1TiNKGjPJJOGKN94RK7BYujIGSTsJkzbgRnHzCr1JAd6EH
	TJOYfvjdFEoOXqw1bnG7QikwL8GlA4xCh6IHriYAbOQE0XeqK3rI8B0YEWhZEQZIzZPBlhfgdJZv7
	rNcvFifRrGz+Vz0mxtHYptGZEaZ6xBCRb3B0Z3pO0op17rUhUKVgZ9CTR77dkxHBaVFMxm5XYaf2O
	g1hIvUtqdTeyYP9nFb1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7v7X-009yLu-0j; Mon, 26 Jul 2021 07:33:51 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7v7T-009yHV-DK
 for linux-i3c@lists.infradead.org; Mon, 26 Jul 2021 07:33:49 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16Q7Vfgn006794; Mon, 26 Jul 2021 07:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=iUmlVHZkr/lDQsOnNKHxRdyIu1N7e7iEDiVEYuOCJMc=;
 b=uzsmc2z2QTeq/fbmL6ArrHH3vB8l6wlJVKpJZBFOZCzRYIqHWyg8DZ1i3ZYogdcu3fj7
 rl3HmHhFcHLud/CHlhqsywyJkFC/+GLFqTt6CHuirR72RfVSpAw2zjgwNm30y15B2PpO
 5pCMcYbrrU8k1kk1ZaxfSs2ckDpoNqdAu6/Yptt0sLPEk/giYAm6V9ol/GVJv3TiN84S
 xKeJxTIbONOjp836yswDBNAh2Zb4ZPiU2hw2LgyIfd9kPy8uRqEGC56pku820e3nTjBH
 bLJDXiytLRU9ngxcdYotpuyKKRc4UAtTbkCyOf15YLYpR7zTv4t59yV441/T8aTti2qO 1g== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=iUmlVHZkr/lDQsOnNKHxRdyIu1N7e7iEDiVEYuOCJMc=;
 b=KtBML+I4X6XTlcQcMl9uHWX4VjBupjg4pUVbpWshFQLxDwdVzjabuRhyiGBa57T5X38R
 iapAoEN+Nm4+JRA76PP3W+UxyCVA6uFI0s2yQPb8+E+3lc7KIhtf2XUHLawfj0mMbnhm
 v/mRQKbfB1rbczNId35jRaFvXrIFHTt29/Wce64oTX8VZc1QpAIQ4q4TLoE0cP1aNydE
 qjz7CvA8YxPzK6nVIu9i9hyH7i9+jDs+pfHwKZboje+7/QFawuw9t5WCdeRv4Nzw1OGR
 RCYsmaLSdM+BS/6VuPO+Osks9SaLBgbVqXdN1EpM22zofXGmzXdYxF9WCAuUK5F0afU1 PA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a18nfruq3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Jul 2021 07:33:33 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16Q7VcjW013387;
 Mon, 26 Jul 2021 07:33:32 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by aserp3030.oracle.com with ESMTP id 3a08wdxr6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Jul 2021 07:33:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VA42pYh+fbhm9+A+/9ArHHRBO+W5TKhTEdK1/3isQxulNxE9cpzGFzoQWE+WKubHiQDF9/q2PWh4qKlS3zI9Y9Ul2ASJWCiGnLEqYT6K1U+ugSSry1KyjDdShpbBmNXKthm3YEOT2FYDpahFXUWr+8RPz6vl2LWoZaWdI9w/KDK0UCXFwUvZqjg88ah9io0DMTsrPv1Eflcf4dfq/faxd1Buf9Qq3lPZVuIamxBCfiUwd9K/pFWLqh8gNW1fMoYt+/j0Z9DqAtrTbaQTbI2bCOm0QuRc3Fjc4BGjWKhTkzBrVQlToHlcd4hJjnTkrYW+mPGqOO9TDzYDuaESmmsWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUmlVHZkr/lDQsOnNKHxRdyIu1N7e7iEDiVEYuOCJMc=;
 b=IxZMiCq8KrdxUIjxY4uwSTtox6m8G/wqkf4L+la5KueFprAh1Ly5TfN2faSnMwhS6Togi0jFs0PDC+PJPV3H51gApgVmXZG1ftkuRA4yB8yMSepAXJOnTYP8rV4ZcrszXxy858w9b/2oy7RlwPwUa87zQ2r1m7GEpCzveIC9CigsSh/SRKbGgqhDGAy0i0zB4GmmcD+kHh3kwwxNSRBCvGd8wyx1MpoZugF9mRjXfX+/jpl1l2QiVblNm5Y2WD3bBqJ2GnRJhx94h1kyx2Zdi0S9s6ARfcrjwXVUrjRD0NdYxj6HG1SOHdYZZD6F+ZuXwIWR9z7/XogHQkS7FId3qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUmlVHZkr/lDQsOnNKHxRdyIu1N7e7iEDiVEYuOCJMc=;
 b=fmi8FDJZIRcCILsAIG8jvgGvXYPSr/XvaV4hcBhVzlbn2g0UaJB4oBBjTXnW23ymBFr+HqF5bQSOIvXK9zr1kC9BP3dtsQvQmwXAteLQeXyp3AcBfA5Ixul+8qF1CXSrNkq3r8x8sETFqrJ+dbaMGaXDi3aY/Yxgh4IPWNAjMfU=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4577.namprd10.prod.outlook.com
 (2603:10b6:303:97::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Mon, 26 Jul
 2021 07:33:29 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 07:33:29 +0000
Date: Mon, 26 Jul 2021 10:33:19 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: miquel.raynal@bootlin.com
Cc: linux-i3c@lists.infradead.org
Subject: [bug report] i3c: master: svc: Add Silvaco I3C master driver
Message-ID: <20210726073319.GA9515@kili>
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: LO4P123CA0105.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (102.222.70.252) by LO4P123CA0105.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend
 Transport; Mon, 26 Jul 2021 07:33:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d6f2dc5-e98a-4072-c465-08d95007a9a1
X-MS-TrafficTypeDiagnostic: CO1PR10MB4577:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB45776231A3945701BA6799DB8EE89@CO1PR10MB4577.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /FvjveByk6J9zYB4XiLqkmTuOAMkVVknFkLlxKZeEXYNUn32TZ0xXDnW3VRH/rLAkHtD1JSmi5ib1z/ZXjuBHzImYHueuez9aoHh5EwBzMY+RDtqv41IyB6dszFLuRjmPdz7GEmMmYSgg+stq6P5pstUQxyniaeEDoUIYZ9ScQ3U9rKNaOkUoDAgo24mJJwqa7GjPiQHwmPtO3GM/NTGyt7ou1Mvzhg9ypkVi5fR/FPHmN8r6fSTb1mK4Hh2Yhx12S6v+62c+X7ot59QecIsuEuggmPf/YHOYvj90ZPRM4Qi7QuPJ30bFxyxyc8LD+omknvbY/KQIb7tUAj9o08EyzcX4PLLNQM6556aCsoSwG8Hl1JOikXLoizKSuFjT6JBjFr4FwTimVTauT836BCdv6+1pRYR1e8c/MRWr1i/1TQ+6Zm77e87QnuGqaSNxxdp1HkgaPQeXDbI3Z9hQUT8Zm1TYKyckwVSiWZwSkVaN4rO6nJMd7j3wU4ZTVvDRrFhz4s194BWH02itQyAEKIfLI5tewY4d2oXKdzpgxYLnpvfLONmen+usa30lIVlY/kN+4c4HwvML+s2P4alN4IyO/4UnVyQJbrN3DEtMmVQ9YZf+J343py6/OvBoVu3F7dpc5Br3zQO2DMJvc0DhzgCNTPnW/0A4sRfu9QhhLfx2srPlYJEo9+K2BJxkIg5BZ3oYBHfMiV9xrj7+Nu5X7RPcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(66946007)(6916009)(2906002)(8936002)(8676002)(38100700002)(6666004)(38350700002)(4326008)(66556008)(66476007)(33656002)(186003)(86362001)(9686003)(44832011)(9576002)(1076003)(5660300002)(956004)(55016002)(33716001)(498600001)(26005)(52116002)(6496006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VadwYAiXZ2lmBfofj4eowjOu2r1zaj5xgBsVGOkL6IFdPhZFM9sVmefSJk6f?=
 =?us-ascii?Q?tEQVk4vQVcZ7ox9onUEXiqiaEHg4n14P9112zMksLOBmXRTLejYZ0haYUS2W?=
 =?us-ascii?Q?yaDdkx0bHluuB+xSNmmneK8dkNhIpOmoEpJmS2KWy6wDknTBXK5PJCB6zwjB?=
 =?us-ascii?Q?yVxOrItSj3ohiU/+dRT1bUfJAa9u+1z5cGs3UfqnDfgpHSXO8SyFFX29K7Hs?=
 =?us-ascii?Q?MnX2Z1DocmLXeJmOXSGLVy81iCLHmceP18ypWosOleBHceFtq1IievWdVWYg?=
 =?us-ascii?Q?AJqNsqPC/tePdFo1cDNFKDeD0UIb3A8VNndf1k2P0pU+W7D1g7Skgp1vJof0?=
 =?us-ascii?Q?w6BYOc/QmUdsWXw+9kNU9W2LYm64KdEP4OJqApWkbaWa7/p5926+HmFAXLqi?=
 =?us-ascii?Q?6qDmw231yBnPzXesOXR9IpMLznJjkyNbgo3MQ5BJB77+d3UWKPHdm5lC5jYZ?=
 =?us-ascii?Q?xdDlWjEK06MK7qdb+8uf/n8yLpVo3UKXrSaRWsebFt0g52YmPTFzqnXfq1rL?=
 =?us-ascii?Q?UeaXLlK2vrP8l2iwQUcpiv+wfVPSp9roIQWIzkF5qDJWFhCFhuPbjcbSCWhl?=
 =?us-ascii?Q?PAozMN4HJwYNURbt0MbIoIfggp0kcuHx8iHTYhI/wzr6toaPNf5KGevS4L3h?=
 =?us-ascii?Q?U8loL94EhF0Wn8RzYuIggtGlH3war9/hDZOBPQRzgCaJQ00wS1LSvN8TfrsF?=
 =?us-ascii?Q?ApPP52/nUckrFYfIIxqDF1FkB5VxoxabSvbjVX61F5NtcNj2VjBKMdbTj9Hv?=
 =?us-ascii?Q?BYi6WqWDULht6mCo5Z7SvdKDV92pbGy4jYCDbjYJsfCZgv0q1kA4sZRvP62I?=
 =?us-ascii?Q?0y2ZCAMLV7iNN+Ln4WFB1X4QTB0hM05WGaX55OFXBXGWwX/Hvv9enJCmBAR3?=
 =?us-ascii?Q?8DcKmpk1dTeTlndIIYsmM149/3qBzvpn/cEWzhbf2lJ86KV7cNICRqL0/2zj?=
 =?us-ascii?Q?e2/g2bk5d+O+LT57AZBpaNYB6lpzgwAvcXrxJof4enteX6KRL5+edyFlOIzM?=
 =?us-ascii?Q?p5GW5o1FwtObcbHrfk6wZPzWBZJd1sXevTiCKPAUtNbYdCMCBSfGQ1scPxet?=
 =?us-ascii?Q?W7kSzu3bzqEN9gYTOUSE/bXPY7s/h8l/Ju4lMfTpo1wg95kNUFgKbt6EgZGw?=
 =?us-ascii?Q?0P1RuvZb5gOI+Glw+9Uu2BHrn4ukPh8vmX6ky8cSModTjQaMsfsMs2UwolR6?=
 =?us-ascii?Q?tTAurtePrQmAHkA5ffFkKWSUUprkInuWzehoDSLiX/AHQjt6EiRLUOMKFWPY?=
 =?us-ascii?Q?b6ePpSMXVr0uf0uGNjneYvvJkrIx8nOcfft9eTbPiJsScNG3c6hNvWEFGe5D?=
 =?us-ascii?Q?XO1AAZl1ZRAMaepzV0IqYqp3?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d6f2dc5-e98a-4072-c465-08d95007a9a1
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 07:33:29.3458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E02vxxb8l4MBi7gR1AQ5n+3fJgX4Vly3Fs8Fg5qOnZeuLOEi6H5FW3NIN63MV6AnYV5pTlMtxKKj9qWmLS9XV3aYE3ZmwRTacT5LbhyWhMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4577
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10056
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107260044
X-Proofpoint-GUID: CBIoWSy24INAhE75OLk1xkp1q-L0w9B1
X-Proofpoint-ORIG-GUID: CBIoWSy24INAhE75OLk1xkp1q-L0w9B1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_003347_543350_DB14699F 
X-CRM114-Status: GOOD (  11.31  )
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

Hello Miquel Raynal,

The patch dd3c52846d59: "i3c: master: svc: Add Silvaco I3C master
driver" from Jan 21, 2021, leads to the following static checker
warning:

	drivers/i3c/master/svc-i3c-master.c:690 svc_i3c_master_do_daa_locked()
	warn: sleeping in atomic context

drivers/i3c/master/svc-i3c-master.c
    670 static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
    671 					u8 *addrs, unsigned int *count)
    672 {
    673 	u64 prov_id[SVC_I3C_MAX_DEVS] = {}, nacking_prov_id = 0;
    674 	unsigned int dev_nb = 0, last_addr = 0;
    675 	u32 reg;
    676 	int ret, i;
    677 
    678 	while (true) {
    679 		/* Enter/proceed with DAA */
    680 		writel(SVC_I3C_MCTRL_REQUEST_PROC_DAA |
    681 		       SVC_I3C_MCTRL_TYPE_I3C |
    682 		       SVC_I3C_MCTRL_IBIRESP_NACK |
    683 		       SVC_I3C_MCTRL_DIR(SVC_I3C_MCTRL_DIR_WRITE),
    684 		       master->regs + SVC_I3C_MCTRL);
    685 
    686 		/*
    687 		 * Either one slave will send its ID, or the assignment process
    688 		 * is done.
    689 		 */
--> 690 		ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
    691 					 SVC_I3C_MSTATUS_RXPEND(reg) |
    692 					 SVC_I3C_MSTATUS_MCTRLDONE(reg),
    693 					 1, 1000);
                                                 ^
This is called with a lock held and the code is doing a 1 us sleep.

    694 		if (ret)
    695 			return ret;
    696 

regards,
dan carpenter

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
