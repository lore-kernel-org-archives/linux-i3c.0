Return-Path: <SRS0=SSUK=ZG=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B91C5C43215
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 05:52:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A6412071B
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 05:52:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O4YbSb2P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="Ytg/keAu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="S8Lujxtz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A6412071B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y3Ahovsh0KW1IoRqCJY/kVcRv5qoEok+tm6Y/rHTLaw=; b=O4YbSb2PsJTX8b
	K+eBlcbRWzfvNegLlE1XuoDeuw7qgoamYjUjs8Fjtm3SIVMBVTvlr7SnMGwVkLvUTpdkyyv0JzqrN
	hywttxjJONnaTGEtfJhd0Dt+0Ia/3YQwOSYGbpVvO4+H2j5mxGD3lrzQ9MVqTtKlG8kVjjIMvuHGE
	Jwmmq4FkoYZpWBLGQxDM3FDp6wPTpGC4utox2TCnuYKLU3BsYvclhm+kLRmtqOKBFt5IZvgiEnZHw
	1/QhZx4fEJrecWqCPzAQ98FBKgYmfYXiOmfT1SWnY8j23WdR991sAh1pwoXwgYbgDhtlzGEm2hmxj
	fCmTKVE8buSj4Wjz7FAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iV83W-0000AU-6P; Thu, 14 Nov 2019 05:52:34 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iV83T-00009S-9r
 for linux-i3c@lists.infradead.org; Thu, 14 Nov 2019 05:52:33 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAE5l2oM032247; Wed, 13 Nov 2019 21:52:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=8wcQyIW538VgXMrmLFvTmjYfQjXV1ED2YIuePXqozMw=;
 b=Ytg/keAuObhxk0+hAoPwQzr+H9r2WNNek1D6BAMrVAyW6bC+sZ+lzaMiKHzKIHwS0JSH
 tmE0Ok50QFZZaY9cXXQ0cVUG1mh7UFtAFQARLaECIirBag7nenezMp8+Yqn0bTMNJqjM
 JTLkLQserHIAN2/DIKOCeqhTOZJX/ar45UKfE+TzHCOes1ndYa+C+pzspQij5x+FT4Cb
 CGC1+VOkDVn0f7elsW+r1GkoJfdyK064+tOAL8RHr0CeKahDKa7XQvmfOTf7jnuPR8XC
 oNMQavUaC3xP3yNT1AnsvTiMV88RhQPOz86dxbmfca9C7DQvzr1M/5FbXKv/nnqqeqJw Jw== 
Received: from nam04-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam04lp2057.outbound.protection.outlook.com [104.47.44.57])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2w7prt0v9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Nov 2019 21:52:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8FhsveFNmnrYjmTwfDH1AIAr/KehRfC3VmKd0n1I8R0IAigKZXEBILVIJFYdsukVC7VADYrge53SbVEmZRNu9/yYlQ1WFrins05EOa5n1WLEvgDjCbMHsRqNSLZiOeCy1Nej8xgbFjhaiQeIBJUWQ2SfiBx6Y2xjElyo4rrgm7wHn6uqy7fRJDsSQVNxO0GIqHpr9c3y0zg2PBfN2axana5yIglc2rq5qss2LRLbm3bwY/i/0vI9JVYz9M7kXSLxgjTRooS9d4dK4u00OTbKr3FZ51ua3TGX2FlQnyI0KV/MyHnUGHka1Vt1yo3G8H9WAXVGg1H2fiyE8QS1VCDzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wcQyIW538VgXMrmLFvTmjYfQjXV1ED2YIuePXqozMw=;
 b=G8T7k5CqCFlWnMWU2FLRS8nj/zKJqEzIugWzqQhSb8xl6w1Bcdwxk3RRwGhutJXf691Pg3Qw9x7tysjvphkJyEbUgNS0kl7noQRY+YQsQVijsl0grmnC0fUWsPGsNkOf2GYY4vq0vQ+w+Xt8GMXpIskJCbrj/7ri8Z8GrIYZkiGCxHqOAabY7JErY3gqQcDaBm4vxa7UQjV6zQy6TcnQXjQZzLRwGj/WUzpdzFhu/vvpFDHeN1XGsw1y+wA4DkR0AHR+DzJcxMsw8b22pEUmbgaQEYKbnYl+MEOy08RFClOHh60YanJxcdPYXmddKRVebu19dEIc27seSM0c9z2zIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 158.140.1.28) smtp.rcpttodomain=kernel.org smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wcQyIW538VgXMrmLFvTmjYfQjXV1ED2YIuePXqozMw=;
 b=S8LujxtzAi2glGDlOrdBqyQAku65RpIFZhxekAXDTmUqi7OHwZtBLuZf8+j8CXn1atZL/q8+VBsK4J8EaLvUEq3QFalECUZQR6ny9Uj0pUYfXWRZA26H7BxwgAccMDrOIMRPQGWuqXxaPDqVR+p3b4eT1qxTTuRI9tY6ohMLqjo=
Received: from BYAPR07CA0101.namprd07.prod.outlook.com (2603:10b6:a03:12b::42)
 by BYAPR07MB4488.namprd07.prod.outlook.com (2603:10b6:a02:c4::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.24; Thu, 14 Nov
 2019 05:52:27 +0000
Received: from DM3NAM05FT007.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::206) by BYAPR07CA0101.outlook.office365.com
 (2603:10b6:a03:12b::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Thu, 14 Nov 2019 05:52:27 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 DM3NAM05FT007.mail.protection.outlook.com (10.152.98.113) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.15 via Frontend Transport; Thu, 14 Nov 2019 05:52:26 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 xAE5qNCT011070
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 13 Nov 2019 21:52:25 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 14 Nov 2019 06:52:23 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 14 Nov 2019 06:52:23 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xAE5qNQw020526;
 Thu, 14 Nov 2019 06:52:23 +0100
Received: (from pgaj@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xAE5qN9g020525;
 Thu, 14 Nov 2019 06:52:23 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH 1/3] i3c: master: add data hold delay support
Date: Thu, 14 Nov 2019 06:51:53 +0100
Message-ID: <20191114055155.20446-2-pgaj@cadence.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20191114055155.20446-1-pgaj@cadence.com>
References: <20191114055155.20446-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(136003)(346002)(396003)(376002)(36092001)(199004)(189003)(426003)(186003)(446003)(7636002)(107886003)(16586007)(316002)(54906003)(42186006)(4326008)(50466002)(2351001)(11346002)(70206006)(336012)(70586007)(26005)(305945005)(6916009)(126002)(476003)(2616005)(486006)(14444005)(6666004)(356004)(26826003)(48376002)(86362001)(51416003)(478600001)(76176011)(8676002)(50226002)(2906002)(47776003)(246002)(8936002)(36756003)(1076003)(5660300002)(76130400001)(87636003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR07MB4488; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7a7f768-24ac-4c0c-18a2-08d768c6d412
X-MS-TrafficTypeDiagnostic: BYAPR07MB4488:
X-Microsoft-Antispam-PRVS: <BYAPR07MB4488A90B05686A7330F7EC27C2710@BYAPR07MB4488.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 02213C82F8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4QvapGJS9LgYgMAYlCURyNWAaCejwRS2kGY/NvRVMv08zbdhx9hT3URV6fLaOgTtdDEoQDuTdvRrn+EJMhLzwchYuWKu9fp8Zhre6u7QS93JpIUcbLsKC9UQGhCkFTfrDn1X11sa4OiXHRHMH8tIDDdEcIwvqV6jDM0P1PplcL2pypAdJX3Gwlwti2495fboT0dfF6rlQg5shopFc4sNmZ7zdVS4LRwqduhgETDi1H3TKjBKH7Mxin69f3f5YVo6dOEUAA7x/y8WPdm6wpbIow5iagBxmCiA516nr3qH1w6hz4uL4WDs5+HxoPG7DCdTENuDuSvMlIhCCY3GFjwd2qIqAGlaymiBGTBofRl0UzkYTqSuzZeZsrjiyRimaByKVuNopq3hh+6Rj5peAYmF4G7kS7M/2WYc5lRIr6R2UOvF53mqb/yLShttM0VuRuhboiZWXTrt5DqOgkAVV0aqNQ==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2019 05:52:26.5892 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a7f768-24ac-4c0c-18a2-08d768c6d412
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB4488
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-13_06:2019-11-13,2019-11-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=1
 mlxlogscore=854 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911140055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191113_215231_742335_AB0E532F 
X-CRM114-Status: GOOD (  10.99  )
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

This patch adds support for THD_DEL (Data Hold Delay) to Cadence
I3C master constoller driver.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 drivers/i3c/master/i3c-master-cdns.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 10db0bf0655a..90ea98eef905 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -60,6 +60,7 @@
 #define CTRL_HALT_EN			BIT(30)
 #define CTRL_MCS			BIT(29)
 #define CTRL_MCS_EN			BIT(28)
+#define CTRL_THD_DEL(x) 		(((x) << 24) & GENMASK(25, 24))
 #define CTRL_HJ_DISEC			BIT(8)
 #define CTRL_MST_ACK			BIT(7)
 #define CTRL_HJ_ACK			BIT(6)
@@ -1186,7 +1187,7 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
 	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
 	unsigned long pres_step, sysclk_rate, max_i2cfreq;
 	struct i3c_bus *bus = i3c_master_get_bus(m);
-	u32 ctrl, prescl0, prescl1, pres, low;
+	u32 ctrl, prescl0, prescl1, pres, low, thd_del;
 	struct i3c_device_info info = { };
 	int ret, ncycles;
 
@@ -1264,6 +1265,8 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
 	 * We will issue ENTDAA afterwards from the threaded IRQ handler.
 	 */
 	ctrl |= CTRL_HJ_ACK | CTRL_HJ_DISEC | CTRL_HALT_EN | CTRL_MCS_EN;
+	if (!of_property_read_u32(m->dev.of_node, "thd_del", &thd_del))
+		ctrl |= CTRL_THD_DEL(thd_del);
 	writel(ctrl, master->regs + CTRL);
 
 	cdns_i3c_master_enable(master);
-- 
2.14.0


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
