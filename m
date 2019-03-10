Return-Path: <SRS0=lIk1=RN=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA40C10F0F
	for <linux-i3c@archiver.kernel.org>; Sun, 10 Mar 2019 13:59:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF610207E0
	for <linux-i3c@archiver.kernel.org>; Sun, 10 Mar 2019 13:59:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dtp2LUIb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="ENA/dYfu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="Uyg6liK+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF610207E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wbGG6jXWRduyY3b2ToJyFQtKrKNfOeA8EFnPQfF65KY=; b=Dtp2LUIb3xmWbT
	4fvbON0mqV6zwtvE0aUJZeyP85G+JI28qri/eW4OPuLYqnuK0DYPxYjdKgR2krsvNQXZoFvW2Cl3X
	WsN6mKA3zna2KTw0pSaFXPie8bHxUTQ4Pd+E4KgkWbvcdxEREKWDrfzYjhrfgHJysnE1NjR1uCPrj
	nw3kRiDTaYwOjduEvk+v/GYtJPx9bmISqBAJ+fbixNGqfqMWawTL0zVeK0rLvS9MSdCaN8Bu+Ls7J
	8sUQCFk+RhKzU/ZXmPZ57mo/GQoz+HGKE7hBlQcGjq6qvHlXC+q/D1ilfCjwMdwVw8xnVBRv9lBJC
	1qbudyuwSQf1tDCw5f5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2yzC-0002st-Ag; Sun, 10 Mar 2019 13:59:30 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2yz7-0002qY-PL
 for linux-i3c@lists.infradead.org; Sun, 10 Mar 2019 13:59:29 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2ADsBMw025122; Sun, 10 Mar 2019 06:59:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=GT/nD1Mut/FEb6zKYkPUEAXA1p/zPjjWqseBVahs4wM=;
 b=ENA/dYfucf8Z7KIFCcUF419vCZPBkPK3aNLV/aD1jqcfgNTzumqjfTw5Nqj5RoIOaHcr
 YNpjUMOMvqi5aDqDOADfzhaRQFgVnjzCYJyCW6DLJGKzQiMs46x7/XhgiFl3bP3UjGyr
 x+dtw1JpRnYo6mx7wzVDiBF234M5dmq+xG0NDL97Fz22BcRIdZRXku9geoaElIBmt6G8
 smbFrvsxRliURMry+b4gATHpPavircdzCS35AI6kwJ37uYgraW72TXISckZ3wqE5cWeH
 TNbgJNZktb6vh0oSYzFPpC+koq2sEBrsYvt/QsE7pIT1pVIN/y1sjD6TnrfUZtJmsJtN pw== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam05-co1-obe.outbound.protection.outlook.com
 (mail-co1nam05lp2050.outbound.protection.outlook.com [104.47.48.50])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2r49y1cqyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Sun, 10 Mar 2019 06:59:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GT/nD1Mut/FEb6zKYkPUEAXA1p/zPjjWqseBVahs4wM=;
 b=Uyg6liK+9SmCUvpRrpaKAQxga3+AVlQl8SiGWkyeuiebzrI5byzHieCHHUZ4EjzhRkp7hP6InMt2lYOnNEYBr6wH5YvMgWIqjPs7cPM5xWsR/UZDHBJGU52fAdVWQYh6YrEIUhQhLcK5KNAnsrKv6p5ywpUWqzxq8C9sd9YpKkM=
Received: from BYAPR07CA0062.namprd07.prod.outlook.com (2603:10b6:a03:60::39)
 by MN2PR07MB5920.namprd07.prod.outlook.com (2603:10b6:208:ae::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1686.18; Sun, 10 Mar
 2019 13:59:20 +0000
Received: from CO1NAM05FT038.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::209) by BYAPR07CA0062.outlook.office365.com
 (2603:10b6:a03:60::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1686.16 via Frontend
 Transport; Sun, 10 Mar 2019 13:59:20 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 CO1NAM05FT038.mail.protection.outlook.com (10.152.96.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.11 via Frontend Transport; Sun, 10 Mar 2019 13:59:19 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 x2ADxEpn032144
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Sun, 10 Mar 2019 06:59:18 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Sun, 10 Mar 2019 14:59:15 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Sun, 10 Mar 2019 14:59:15 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x2ADxFvl022682;
 Sun, 10 Mar 2019 13:59:15 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x2ADxFSa022674;
 Sun, 10 Mar 2019 13:59:15 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v4 5/6] i3c: master: Add module author
Date: Sun, 10 Mar 2019 13:58:42 +0000
Message-ID: <20190310135843.21154-6-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190310135843.21154-1-pgaj@cadence.com>
References: <20190310135843.21154-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(346002)(136003)(396003)(39860400002)(376002)(2980300002)(36092001)(189003)(199004)(50466002)(42186006)(8676002)(107886003)(51416003)(26005)(86362001)(305945005)(6916009)(54906003)(16586007)(356004)(316002)(106466001)(246002)(105596002)(186003)(2351001)(4326008)(76176011)(47776003)(8936002)(50226002)(126002)(476003)(486006)(2616005)(426003)(7636002)(87636003)(6666004)(4744005)(446003)(48376002)(11346002)(478600001)(26826003)(336012)(2906002)(5660300002)(1076003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR07MB5920; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 868aaaca-eb47-42f9-77be-08d6a5609799
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060);
 SRVR:MN2PR07MB5920; 
X-MS-TrafficTypeDiagnostic: MN2PR07MB5920:
X-Microsoft-Exchange-Diagnostics: 1; MN2PR07MB5920;
 20:M7bMFxY1aqO1wWeizEjA39yrqTLAN3Exp029FQsy4sPe5QnDk66wLYuMPsyoCZ6ROXtWaq1tOYcOKNNPvTf9Lv+omA7tVx0DcnwqNTOEfWofVUCTvjWbIGMTh6aVeydK+bYNXYIhVfQOSiJYeVee3pfNCk4XVwBBwJdwWqRI6T8kC3W55N093cq0NpIXwo+nJN4c739a/R626glPVoQMEzj00d/U9Gti7RZanwxndxZbI59voDqddmaWEsMFx27d4m3i3UVY8O1xde4JQ0VYp7+qt8nFHC2A8QluioaGyUkcTffkFqRbOzorOT3suTw4p7X1LyQ/zcf8qg7/7YRYv83JrtdwPheQM0JFVmINHEbbYkoe5U3+GS2Ik7CHZMIplU08cT5M210j+r/L5uZJDnyR1epESDjHHQVgSfvnZY5LqXl58sbDi3CLgmfcfGmVTCOPrLTR6PvtaS30Q1Q607q8SCBeG4aC3SOMgyTzGWfZA2j/p4zv8YUGDbBVIvcF
X-Microsoft-Antispam-PRVS: <MN2PR07MB5920BF89B77263B41F28FD47C24F0@MN2PR07MB5920.namprd07.prod.outlook.com>
X-Forefront-PRVS: 0972DEC1D9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MN2PR07MB5920;
 23:e6OrpNLL0L9Dk4ytdvJi1BvHpPyoGRFNfd0L0xv/c?=
 =?us-ascii?Q?hp9UWvqZ9Gy/MIortAcZiXC/Suk+yefGvvtaGw3r3f5WsxaRQMwk7s+wzTIM?=
 =?us-ascii?Q?Z6wxUUrnG3R7dYmWeTTi+hxf+I6XMAAzZlaFNpuJ+YnAdthsxaXhOiDLslEl?=
 =?us-ascii?Q?j+0rJRUGJ4HokH1MYpgO5txNcgk8Vz+7fSK8iOvbV3MNv8keKuiOivQ/6kLn?=
 =?us-ascii?Q?Mc9BSh3zViDUrPjCcM9kF/3iiOsDfFINNfMJN6r8HUWK5RJFWLnO5Bkh51nF?=
 =?us-ascii?Q?s2EtZgNEOt6h0fOmSIjuplGOOZ2aORXCWHXIBTOlqbD75PbaSo7wqLOFpWJu?=
 =?us-ascii?Q?Q3/snOJ0oar2bKuGF63XMEdpyWLPXeIamhmNF+UwRJsNtgl0ES0CaJoN2/lw?=
 =?us-ascii?Q?8aCcvvabHdzcVBHCt4kUvOnjPt0D2oxQiI91btwsrI56EORYnkCML4bDTGRt?=
 =?us-ascii?Q?LOUSrR26iQRyOQSimxmqbFcLOz9sjwUXbt1B/VkRYt3a+PPCl9L3bigshc4I?=
 =?us-ascii?Q?JH4hyCLGYygf9mjC0sbt7j6793Xl7J5lc7QPNZFvfaUhChkAaDFG0ifcmrm3?=
 =?us-ascii?Q?8GN2MqQq3doX7Q+cynX7+0IzjWclKMxiv0sj98ZSatOFBhCDepedKEoAIWFt?=
 =?us-ascii?Q?b2Yh029uOLc4jfQu0iXoRJkXxfoaJuITy56z4PmxUSY3G4VLKBpIEmU9uhp3?=
 =?us-ascii?Q?V+Uti9gIRiGsPg/60bidIwqc9yCH6cZZ6TtpgojB5sg0RNGdre3c0a5EAY7d?=
 =?us-ascii?Q?FErItSwgYUTd0pE4Im4dpUicHaYxXJn21P6U7dHyv+PL5Nr1UvEwvbxlNa2n?=
 =?us-ascii?Q?XvrW1/pmENjCfm8p3SDW7d0ekwd1u5RNTbBmvfTkfDBwsUx2YrKB0nne2f4F?=
 =?us-ascii?Q?2K4h99Vt/VZoKTE0D63tSxMtxTxBMZTD2U2lAKCYbEBjYsZEdIWWZKDCANeX?=
 =?us-ascii?Q?jHGqlWaPXo6PpgNX6t1ienY+CF60dm9Dua4Bti534lnwog5ta8tvKuJHMqPM?=
 =?us-ascii?Q?GXnOSX09Jiv+O9YPLIBM7vO0/gpX1NGhSBGn/mhGDdCW0lZpmPpmn1JkiH5O?=
 =?us-ascii?Q?2s5WI67f3rFZvZPbjzM4ZYY9VRYIPMhSqEV0ofSsVkxezcQ1VTiU4vY0TG2v?=
 =?us-ascii?Q?xiVzUgCKl4=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: xYhyQwL5+tHV8gkhDuRLb01a9DekPxGGdbrftgFM5U2J44ff9z71Z8hWFc0uKC6Ua3Ak47RSwc9xELNz8fXZNpV0/5s8KuZrP2bsDrLYfC2XuoBx4Fu1R7juKoFbNEJnzfA0Hm8lKnPqGw2qzTlREDUE17NfxUrUo+QcKY6xyNe1WQPsnQHyWGJPJDcCOkeLOqraz3TjbcmIWMPB+ypw2uLPBBbc9u00ydGFUayYMf9w8SJ83EG9s0Ov/PXPpcY147fMfLdV/2e6rs+YfKeVvvKxU9Idem5roayTvonCzKIN4v7j44WgskmHnY7AqitqbOml8C3heIH7j/rzSchZnVlKuBnk/X13WpnHncObmNbK+SiqWeOrIlwqkWH9wqZ2xdTXQ4oge4pUXTgHOKsTeBGYEBgLxJWAJBJnjGN873c=
X-Microsoft-Exchange-Diagnostics: 1; MN2PR07MB5920;
 20:uDqPmVh8tP+zkUN9xXFIcl/ngbtVJkFa66fTyUSt9g0nFCmuDnrA0L64a/nMFAA7hHdKf8rqCV8z3HZWEvE/uUd1sCf8ryMK+oI2wdD6uauaXc8KAF/WPHPd3lIdEiMmxXuWa6+JTEbqOsQ2m0mvzl37uQZM8V/rBwcayENYoQQj5NPZUqtLBr1FyWT8GpFFfEqhhJyqXQszyNJqANuuxiMrPlaF4C7c1FAhL8kKji6UpEpSDwH59/V0vBOo1v8m
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2019 13:59:19.6843 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 868aaaca-eb47-42f9-77be-08d6a5609799
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR07MB5920
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-10_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903100109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190310_065926_075792_45D706BC 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, agolec@cadence.com,
 Przemyslaw Gaj <pgaj@cadence.com>, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

This adds myself as an author of I3C framework.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 drivers/i3c/master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 7a84158..8d68001 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2018 Cadence Design Systems Inc.
  *
  * Author: Boris Brezillon <boris.brezillon@bootlin.com>
+ * Author: Przemyslaw Gaj <pgaj@cadence.com>
  */
 
 #include <linux/atomic.h>
@@ -2931,5 +2932,6 @@ static void __exit i3c_exit(void)
 module_exit(i3c_exit);
 
 MODULE_AUTHOR("Boris Brezillon <boris.brezillon@bootlin.com>");
+MODULE_AUTHOR("Przemyslaw Gaj <pgaj@cadence.com>");
 MODULE_DESCRIPTION("I3C core");
 MODULE_LICENSE("GPL v2");
-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
