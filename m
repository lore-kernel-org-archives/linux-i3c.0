Return-Path: <SRS0=3/jM=UV=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2B3C43613
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Jun 2019 20:56:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BE2E20657
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Jun 2019 20:56:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="efQBtpJN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="IylR3VPx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="RrqEeWvj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BE2E20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yXjc0DYP1cMczfLXNKeimHqeXv7/4tZZTlgTHasanXc=; b=efQBtpJNU1Ov6f
	U2qvVePXHlFcjwUK8SYMiJ0Nq3+LYHgAuslvtC+QImTmksysf0G4gMW9RUwvh+VVZl/jmZxB/duxd
	Yt3YHLa84I/si+fGso8NzZCZZMLYoe79O+in9Rsbrmr8FSbAPGdN4K00+lg0iM+cfBCGSAVKkbakn
	F+55d1exLvgL9esfoU3//w1ysuuE7ix3K9c8fhGoCvf5M0zQ4Tvv8Fh3NZmKFTUts8NWzw7B8QY9K
	H/JmsxNFFkzgPSuFfTy4EpRjE3fA7RXOW07HjnoPQaG+khAsqw0dTfLyH2gwE8xU4O/f5t0rciO5R
	SUK+Xb5aaFhb1z4r8ruA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hen3e-0007Cl-97; Sat, 22 Jun 2019 20:56:22 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hen3b-0007CN-IA
 for linux-i3c@lists.infradead.org; Sat, 22 Jun 2019 20:56:20 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5MKoeLj003105; Sat, 22 Jun 2019 13:56:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=9bZyR72VEoJHsIe2OIPG69siOeOQVQAn/YWncJBdsfY=;
 b=IylR3VPxDs3UwTJr+4cQ+NG3NkZhiD9vMnW2dyNZ4Ra+TMRX3K61WaDuBwViLdSMgbtP
 VCrySWNLycG9oVehedt0Y6uGej08GzXhZ23K7yYg4efkvEoxvmlvLnRLmRz26TaSPB3o
 6Fc+sEs9a1QvVqJxzKQPd42fNQcopWmjWxZyFkeA+tI5x8+rj3EE/K7sQBCGFGTKfeoP
 1Pafx2x5sww9CSe/2/dVvaH0HEUkyRg5WrQ+Gki44rq8fC0kEmDK0FtEx0nC9aENUrSR
 Ailw6jMHrzgTtt1JogSVpgFvEoU0ogkP7/eQqRr5DdVs2gCDDEq2iefoNWCTWdABM3kU sw== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam03-co1-obe.outbound.protection.outlook.com
 (mail-co1nam03lp2053.outbound.protection.outlook.com [104.47.40.53])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2t9fwthj9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Sat, 22 Jun 2019 13:56:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bZyR72VEoJHsIe2OIPG69siOeOQVQAn/YWncJBdsfY=;
 b=RrqEeWvjRJ1F5Dlopcje53Ls2KMX/2MCafXYgxrjIPX++Fac+Iv30P1oJ3xfmDhSMxV/NsjPsvyT4IsdrEIBQka88EF3Q+m8ykfyj7pdFtv9gw1u5d0cD3IPGsetmaPuN4ofVnFEFlkTd0GCSV9VfMmrQnE+XWy6htsI6fGYsYs=
Received: from CY1PR07CA0025.namprd07.prod.outlook.com
 (2a01:111:e400:c60a::35) by DM6PR07MB6969.namprd07.prod.outlook.com
 (2603:10b6:5:1eb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.13; Sat, 22 Jun
 2019 20:56:15 +0000
Received: from DM3NAM05FT064.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::204) by CY1PR07CA0025.outlook.office365.com
 (2a01:111:e400:c60a::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2008.15 via Frontend
 Transport; Sat, 22 Jun 2019 20:56:15 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 DM3NAM05FT064.mail.protection.outlook.com (10.152.98.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2032.6 via Frontend Transport; Sat, 22 Jun 2019 20:56:14 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x5MKuB6n029139
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Sat, 22 Jun 2019 16:56:12 -0400
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Sat, 22 Jun 2019 22:56:10 +0200
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Sat, 22 Jun 2019 22:56:10 +0200
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x5MKuAJI010190;
 Sat, 22 Jun 2019 21:56:10 +0100
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x5MKuA5V010189;
 Sat, 22 Jun 2019 21:56:10 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v5 6/7] i3c: master: Add module author
Date: Sat, 22 Jun 2019 21:55:04 +0100
Message-ID: <1561236905-8901-7-git-send-email-pgaj@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1561236905-8901-1-git-send-email-pgaj@cadence.com>
References: <1561236905-8901-1-git-send-email-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(376002)(396003)(39860400002)(136003)(2980300002)(36092001)(189003)(199004)(16586007)(8936002)(478600001)(26005)(86362001)(305945005)(8676002)(70206006)(186003)(70586007)(81156014)(81166006)(4326008)(6666004)(4744005)(5660300002)(50466002)(36756003)(87636003)(6916009)(76130400001)(48376002)(26826003)(42186006)(2906002)(336012)(356004)(486006)(68736007)(446003)(476003)(126002)(316002)(69596002)(11346002)(54906003)(47776003)(426003)(51416003)(76176011)(2351001)(107886003)(53936002)(50226002)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR07MB6969; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd7e219a-3ee9-4de8-33a5-08d6f754109e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR07MB6969; 
X-MS-TrafficTypeDiagnostic: DM6PR07MB6969:
X-Microsoft-Antispam-PRVS: <DM6PR07MB69692A34F54AA3EE2C157137C2E60@DM6PR07MB6969.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:376;
X-Forefront-PRVS: 0076F48C8A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: qXrjC8d4TBpFdsfLtOBcjjkUSmmFuqt3k2QBCOIOO3VjQ7n9K02fIt3wGPhP8XaoNzjeVS7PE6biOcNHQlOjFOXaZIHLxt5XmPdbSPun2Ofs8ofgMkqJESHdyhBAoCEFBaDVDjNLeFbWmgSj/GKSI4K/NQwmGNgV3QHbupK6l/hrQID5u8zzvhthogTJUTnvjgoha3B6YNlse24A0MhXnCnrdDxV4MdxYS5eFP+xM1W3HBYqNfHrjxIKuY7x0BmwavKtz2/os+g4XyG4PeRWu4VfGpAIdPM2POfg4ArHCr/XCh8gjlAcyiWFjBObc1mqMTAyzeurEqpeKil4cSXxa7mRyXzuqs1EDgVOGbivbTpFHXEToEbvpM6s3N3Gkf5sfcpqtYWkkBIB1oZzF+lsKZOj8DxTpAM3/cF0g639b6M=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2019 20:56:14.4838 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7e219a-3ee9-4de8-33a5-08d6f754109e
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB6969
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp
 include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-22_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=993 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906220190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190622_135619_722293_0E5BBB0A 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
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
index 3b44e66..5186b55 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2018 Cadence Design Systems Inc.
  *
  * Author: Boris Brezillon <boris.brezillon@bootlin.com>
+ * Author: Przemyslaw Gaj <pgaj@cadence.com>
  */
 
 #include <linux/atomic.h>
@@ -3098,5 +3099,6 @@ static void __exit i3c_exit(void)
 module_exit(i3c_exit);
 
 MODULE_AUTHOR("Boris Brezillon <boris.brezillon@bootlin.com>");
+MODULE_AUTHOR("Przemyslaw Gaj <pgaj@cadence.com>");
 MODULE_DESCRIPTION("I3C core");
 MODULE_LICENSE("GPL v2");
-- 
2.4.5


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
