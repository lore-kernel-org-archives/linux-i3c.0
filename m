Return-Path: <SRS0=lIk1=RN=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAD_ENC_HEADER,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC07BC10F0D
	for <linux-i3c@archiver.kernel.org>; Sun, 10 Mar 2019 13:59:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9747E20850
	for <linux-i3c@archiver.kernel.org>; Sun, 10 Mar 2019 13:59:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IOpmWPDV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="Fq5Ew433";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="cFAME8N6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9747E20850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xY0d6tgUfy21pAgDeokVRPpKKyDMumBsU7VY3mvHkUM=; b=IOpmWPDVIJyayx
	3mbCbS6EyOe0siNKLptIZojItQcHRoVoOJSYn+bITpnhrYF74xesd7ZG2JCCoozzPj1TLKHtBLAXS
	8Ir3YrPzKGQ2KdSrEj4a1ta922AlWa1Q3/BV/bTZzX7/vJ6nGw4iZQI8j9HPe/CkBsi8Zy7OAHa37
	JPL2XwMgVZnps+zz/YrIU9KBMBhMEvgj6/A6woh83sH/VEQEBzFv0NcqFojIOnEwOOGQxBC0PctJ1
	76VnN+iCWv/LwmIX9Jytr+lwIfOtWjECih5pzjNDVL1gBqzoKKccEgUtCJjqcURabdq8hPujepKQP
	98QlogyTLIt6MMc9qG6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2yzB-0002sa-WB; Sun, 10 Mar 2019 13:59:30 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2yz7-0002qa-EW
 for linux-i3c@lists.infradead.org; Sun, 10 Mar 2019 13:59:27 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2ADsBMx025122; Sun, 10 Mar 2019 06:59:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=eYhjsyGOCfLPGIALgjI24n0ERlk55slSrZPRy66W5/Y=;
 b=Fq5Ew433tSeeYrPqHIS+U5uwa15w7rX+IN8GQEWwFSP8DdaJ/Q4ykE6YcT/zHWNrvkje
 MeBhFV+mi6M/gK61yhxpgyrF6WZ+pqGeKnb4qqQ7Tu/XqVj/R8PZ/6ig6duplca8NaqY
 loNvr9zn2bqHQOEJ9AR5zfBKYdEGbs0sr0M8do6lqyGS2tPb61AwJYbbhY9HuEMehyB6
 fP+5g6gYxSs6YHTNY+zF1Wf4JJX4Te4N72xE9z1fY7pxb6ATXxBNq4NEf+Hj3bD2WNDB
 ghysm/kIy/QyttzHqr7gTUugaiCEOZNcR2d1632J6nI3CapS5o+ox6NxZRBCbTQ55xDN Gw== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam05-co1-obe.outbound.protection.outlook.com
 (mail-co1nam05lp2050.outbound.protection.outlook.com [104.47.48.50])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2r49y1cqyk-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Sun, 10 Mar 2019 06:59:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYhjsyGOCfLPGIALgjI24n0ERlk55slSrZPRy66W5/Y=;
 b=cFAME8N6BJCx84d1qgARc8T/zb+iaUQfSKR/Z1cHzvgai8hnZGflXs38MClElBM+kECtYjj3BKtHKKUHdRefjPZtaZh1RwldsfRbZUVD7UR4/wIniZEPq3vrqrQ4RNoBhGSpeJFJdhERZtp61oiFLE7L6d/5hgdr33woJ/9j2Wg=
Received: from BYAPR07CA0099.namprd07.prod.outlook.com (2603:10b6:a03:12b::40)
 by MN2PR07MB5920.namprd07.prod.outlook.com (2603:10b6:208:ae::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1686.18; Sun, 10 Mar
 2019 13:59:21 +0000
Received: from BY2NAM05FT058.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::206) by BYAPR07CA0099.outlook.office365.com
 (2603:10b6:a03:12b::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1686.17 via Frontend
 Transport; Sun, 10 Mar 2019 13:59:20 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 BY2NAM05FT058.mail.protection.outlook.com (10.152.100.195) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1709.11 via Frontend Transport; Sun, 10 Mar 2019 13:59:19 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 x2ADxEpo032144
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Sun, 10 Mar 2019 06:59:19 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Sun, 10 Mar 2019 14:59:17 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Sun, 10 Mar 2019 14:59:17 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x2ADxGtU022987;
 Sun, 10 Mar 2019 13:59:16 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x2ADxG52022983;
 Sun, 10 Mar 2019 13:59:16 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v4 6/6] MAINTAINERS: add myself as co-maintainer of i3c
 subsystem
Date: Sun, 10 Mar 2019 13:58:43 +0000
Message-ID: <20190310135843.21154-7-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190310135843.21154-1-pgaj@cadence.com>
References: <20190310135843.21154-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(346002)(136003)(396003)(39860400002)(376002)(2980300002)(36092001)(189003)(199004)(50466002)(42186006)(8676002)(107886003)(51416003)(26005)(86362001)(305945005)(6916009)(54906003)(16586007)(356004)(316002)(106466001)(246002)(105596002)(186003)(2351001)(4326008)(76176011)(47776003)(8936002)(50226002)(126002)(476003)(486006)(2616005)(426003)(7636002)(87636003)(6666004)(4744005)(446003)(48376002)(11346002)(478600001)(26826003)(336012)(2906002)(5660300002)(1076003)(36756003)(42413003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR07MB5920; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b3debd3-e94f-4194-234b-08d6a56097ba
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060);
 SRVR:MN2PR07MB5920; 
X-MS-TrafficTypeDiagnostic: MN2PR07MB5920:
X-Microsoft-Exchange-Diagnostics: 1; MN2PR07MB5920;
 20:g3o7CuawHB61OSfs/CpdCH/vv75ipVBkGlfUeG9iQCD2INjwMG3AgUXzGJ/1IH95dzFr7h2Gr2EXwTbWJHcXL8tesSEf8wOQxMmbczkdmtw8iVrFB3KeePqWxgjSJcuF9lfLSFXyqcM8r3Y8T2aNzcssYQRI/DM6qQQu/hX5coanJNaMfHaalpQOe28KpsU3RQaKc/EnDv6hmKAlQxmY2xeCRgrlzpDeBBkY7C3bzf1b3g18p4SrETT/cfOqohwjHh6KhgLdRjotQF1nf8GTSmH/C8/VS6V3qfzbqxE2PRZPCXogKqr8d6VziXw/zLc4gmeK7HByw0udbuDO8zQ78JVdOSwHE0X8xOf4g4qj872jzAF4uFhb6ahAGszmUtuFnbMpq/QHjL1bd+5jJjgBJdYwaHPxhzuGYmxw8+D4h/ThNsVVr1FIdr/xBs4OS6NX//33fxy6qEntFjPzeHStT8DK7e/6/hO2AIv2xGvfadWZy6gz8Dit/ceecGJp8EqB
X-Microsoft-Antispam-PRVS: <MN2PR07MB5920C4F0C09E27F4F9C23E45C24F0@MN2PR07MB5920.namprd07.prod.outlook.com>
X-Forefront-PRVS: 0972DEC1D9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MN2PR07MB5920;
 23:lGJksx3qBLNzuSqAfftKBk9nHq3X8Lg6CDYza5Gn3?=
 =?us-ascii?Q?YoGqZ07aDQpy4ZVIcZTguLPLn3Ng2FFZVV848J4Gx+CNNP6WWcWk7c0MhhnN?=
 =?us-ascii?Q?LV0PTkaEsoca6MAuCM27OE74Fd/vBw1ZFuIY7x2Tu0ifhC0DQmUwQ0K/unZC?=
 =?us-ascii?Q?ybX2g4a8uqk7r9q0wRxA4sBLVvJy+HFpG74GpN5twdUgv2J+QXIjN6jCkkjT?=
 =?us-ascii?Q?cEN6jNyVo1dtbOvip7Lt9XYFzpn2HCqRIpWYA3aqzWW/4Ot0TxC+OrVSWqFK?=
 =?us-ascii?Q?Xoscgp4Kk1uDSEWa/d5RqMxjlwSXmQbC6Q0N4v80IDSXc0zBVF7LRVeeQC2y?=
 =?us-ascii?Q?Pc43X39wsDrCD6evyUr+/GvR8GF4GA4FMb22trRLV2t7ZJdYySCwLUZGJUTH?=
 =?us-ascii?Q?n8cLny0MyVdGtsrXiKOQs5R2TA8yAW87cVxiqsmarpIjieSfmbREegMYuM2h?=
 =?us-ascii?Q?m1KesoTrdGBlsSQeniSXfKutLw1vJvBXS+Fp4nfztIFvgPhPC5D+x717pPex?=
 =?us-ascii?Q?8xYF85DSf+tpYkON4/iTHNlgiDAyvogt34ANE3CjrURo1MZ2K91PE8dwKeL/?=
 =?us-ascii?Q?u9fQqJSCM6Wsw7J9vn8Tjax4tr7LDx6PasyF6KQ4FnPHq2WUtENJ8BJtAOw3?=
 =?us-ascii?Q?QzDyZbVSOypIjrE8pgge0FXjZlst21fvg8aXB9cOXS210NksSBB5TUrVLG3C?=
 =?us-ascii?Q?q8qtMY6mVolz4Psjw0gYZpBbN652PihbJFzPnc1rjRr13WvXdFJzJm/81OYJ?=
 =?us-ascii?Q?m93gZRSWcwATnKerXL5CcBCkoWH4xys97BIw11juMTp7SvqBmgRF12sw5KpM?=
 =?us-ascii?Q?wxLWacNU8ilhfVbth5fpJq0Tj26wXYWHIat8kTt1LNtDDuMy1P6yNuJQp8tn?=
 =?us-ascii?Q?EGVcEePXHFTELw11CukOglvHTZ7INCgv5I3L1HcQ58RHFfT6yIMaXwY04jyR?=
 =?us-ascii?Q?hrg1NffUGYcvSqT2JTap8yMHNoztU+ZDneDZZWA3XjehAwINZo9wCyItaySL?=
 =?us-ascii?Q?lPXdtDNE+BQbERt1f554Fa4nvxrYT0JIw4je1llR2Tss2OJb486rEZ0rHaZf?=
 =?us-ascii?Q?oXSlwZIhHXVTqCu4vfMFJj66GtO7CTSzsKK0/g6K3UgCiZckG/MLiwfo/fAE?=
 =?us-ascii?Q?tZowb/GRzLi7w83RYW7dws0AjfaphLS?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 94CaeItZk6D88gfrFbDnjiyJAiQMfC0krq3W3o8MTWHCogjvKTkPu8yADVOcr6D4nZeQwrYMAWQ7Gj/4ZB/LA35CWC6SUa3Ygr622H80gEdIKKD9mJI6Ci5x7TruzgHu8LMcdyFg/lnmaSkS2KSfX/BQnQCbldB36ssoQMZHOiaA6QNBaUVeDrJBbzUpW3J8G4QgE8+ZyVPVIDvjuD9YOd7Rly75EvUDBbS0Ta87e1wXlQxRTuwPlmfDgexbSgUkEOgW8A7kNX8z0uxKo59RXoc9LYD+1DXsSWimKP/JIgsAVIcemfkhxYrZ0DfDfzhK3AIXUneDUr0g/d64uko/v+ZbFw6tfsRwipcDFM7KRS5ELf4l+ybRGosG/mDLAnHDYgwJIXswXSGv+o03f3VQx26ThngAN3NeS9JnqIIoNbY=
X-Microsoft-Exchange-Diagnostics: 1; MN2PR07MB5920;
 20:Cc+A0S8zdr2hDSfJnE8jWJ73F3k8hWgFknGsLeIhxo5TX6P9wsLd/v3LzOskl7MVyrSYZj6NqWYUwBXpT/5MQq6pauiKzm+LqUVMk5T0ALjBgTalRNKiqHih+/P6zN433KpEtPmYYmNOSNQ1i1dxvOXOJuYwgDB2uahd/rjypMCWuRYykXa3LjeaKt+z8Fh8dpfkqGA1Z7DKQWKU9+Wdce3aZ9B3GVPkfP6Xq+jykFVZHoMuwq1ccgg06loV15Xq
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2019 13:59:19.9885 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3debd3-e94f-4194-234b-08d6a56097ba
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
 mlxlogscore=943 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903100109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190310_065925_691636_7274DF67 
X-CRM114-Status: UNSURE (   8.78  )
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

As discussed with Boris Brezillon - I'm adding myself as the co-maintainer.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dce5c09..a5003bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7175,6 +7175,7 @@ F:	drivers/i2c/i2c-stub.c
 
 I3C SUBSYSTEM
 M:	Boris Brezillon <bbrezillon@kernel.org>
+M:	Przemyslaw Gaj <pgaj@cadence.com>
 L:	linux-i3c@lists.infradead.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git
 S:	Maintained
-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
