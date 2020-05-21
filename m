Return-Path: <SRS0=vMx1=7D=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37310C433DF
	for <linux-i3c@archiver.kernel.org>; Thu, 21 May 2020 09:32:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC68A2072C
	for <linux-i3c@archiver.kernel.org>; Thu, 21 May 2020 09:32:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TVLb0uWJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="WJ+H2gmp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="bCx+JoTm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC68A2072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0tUY9+v23R6De5/FBp9yQ+XDZbesyK0evzwXhaRoWCc=; b=TVLb0uWJxCoC2G
	G/S9Nn5D5fe2YRqMarpxak0h++IDpN1yHaq+8BHGlTn64JkGE1xdlZeDnXoUFG+WvKZdvUcdN6g7W
	lXh1MDmSK2JUmLgm8g0W1xDoRyerytk3K6RRmxH8wh+xbkoJspPO58HyIPJ2LEInzkVssg+S2sRjk
	JxXk2tgelvUhBNnMqercqwK2KvYMnicfSFsBWJh5PAYqdFf90tuwx9uZWUgCeJSYywQ1ptHNIg7Es
	ts4gB6P7/yoysWXHtIIp276WcWszANrRPd8jzln+qejE+0bK4U5DbIAB7UEp1NTRVOuKdfgEyTvkI
	KRTa7jdEuoZzkFzw/DKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbhZ6-0007PO-EH; Thu, 21 May 2020 09:32:36 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbhZ3-0007Ov-MR
 for linux-i3c@lists.infradead.org; Thu, 21 May 2020 09:32:35 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04L9VZm5028962; Thu, 21 May 2020 02:32:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=JHmKkW+kRaatdEgmZLtY5NNYuTuKd1ZuAmEq+PjE/nA=;
 b=WJ+H2gmpRwJjknDXep7HDf6wcF3kNHlP2cD1a6k70eWafukYJEg7AxpLz3NfoUnPrBrq
 1UU9Wly0iqMiKmbsHziC2BnT/43ab8LVCoGrmvl8S32E34Ktu47xMFYQUE/ABSFcdHme
 tokwlEhKY+gSxeQancZ12bmj5OkgItaQvlwwiKMzD13Dmw3mxieK8W4U8YYiemErHWDQ
 a4LkSnp3qUdeSbqnfMVnRNOasSUE5l+Q9bQ2D4Orab3aUZanvjDpLuLLkvcv65R0ZrYP
 6KiOcOIXHzSCqGntOD99LQ9zeYylphfE30Agcgne5cYorpo4W282z4sv0ivLInb0yOEB ww== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
 by mx0a-0014ca01.pphosted.com with ESMTP id 312cqymnj6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 May 2020 02:32:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnbCC8nlDW0wOaC/GA3+xANfTvT4fVRZ7zunN8hTaF6zYqLwO1wShL/d0haKfbqSKhXUNbFUwSbngGcaingxdeNoXVtQvG7O8vtr6mV7qRSJx1l00BTptg/AKkT3t8QsR3q/yGTYU/RqAzzaVQyh18fSJbpcWiA/gqZpSl62uwMxVkTl+nixa4AvIFf/+FAH/ok6wXEKkRdCvlp3zVuXA1REIkyGVF5+rO+cZY98IyZDo8yn0EQf5BsFX6zRMXBtOacaaAZlKhLYEIHV3W3kqZyhcUv/DaD7smMi+G5RX0DqTtydo+LyVWIPCEe9sZQOFn7edILXBOISYVw1sTlYSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHmKkW+kRaatdEgmZLtY5NNYuTuKd1ZuAmEq+PjE/nA=;
 b=jflI1WvvneN7QiIJmGAqkS4abXp7qj+A4FPc6CCN8MK5W1N2EVZye58BjPNGgbx8OAXk84k31NaFWB74oqrx4lM3wpEsr8W5FFS5tgEqo5CX3hbitW7LI1Q+iQvao+JQ7bcDMX7v4UG3Z+stHAYYVBwGOox9bI440P0RPc2oj5xeew7wXWy+5I+b10sIZF8SHMXLeqrRfIMjIysmEjpYdk+BdLgPyETXrExXhZ+PJQJAxrTCD4I/D6fpl3gydLp7y6sQotNQWYG8BjzjHbwVYiAaS9aZCA5w9VbLCMBU4tNnXdm3aXNqi9UdLE1a0JDPLmJAPtxqrQPcWMTphQT8Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.23) smtp.rcpttodomain=synopsys.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHmKkW+kRaatdEgmZLtY5NNYuTuKd1ZuAmEq+PjE/nA=;
 b=bCx+JoTmThRs/fGh1nf7n58e3kcT5ObY6FyVBC3MRneVm5DD1HGhBTdEdTHAvqLBqfR5LL+wq5FBRKYJimIJxEVWDmLPla1RanjUSPPMxL39LXmGMJ4l9JCXyU+cWDZaLZpNckRay8+30Qm1oPJrLtHBVoo+vxa4mPOpQGYLIik=
Received: from MWHPR15CA0036.namprd15.prod.outlook.com (2603:10b6:300:ad::22)
 by CY1PR07MB2665.namprd07.prod.outlook.com (2a01:111:e400:c637::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Thu, 21 May
 2020 09:32:28 +0000
Received: from MW2NAM12FT054.eop-nam12.prod.protection.outlook.com
 (2603:10b6:300:ad:cafe::3d) by MWHPR15CA0036.outlook.office365.com
 (2603:10b6:300:ad::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24 via Frontend
 Transport; Thu, 21 May 2020 09:32:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 199.43.4.23)
 smtp.mailfrom=cadence.com; synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.23 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.23; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.23) by
 MW2NAM12FT054.mail.protection.outlook.com (10.13.180.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.11 via Frontend Transport; Thu, 21 May 2020 09:32:27 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 04L9WNk8021888
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 21 May 2020 05:32:25 -0400
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 21 May 2020 11:32:23 +0200
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 21 May 2020 11:32:23 +0200
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 04L9WNGt000467;
 Thu, 21 May 2020 11:32:23 +0200
Received: (from pthombar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 04L9WNbI000466;
 Thu, 21 May 2020 11:32:23 +0200
From: Parshuram Thombare <pthombar@cadence.com>
To: <bbrezillon@kernel.org>, <vitor.soares@synopsys.com>
Subject: [PATCH v2 1/2] i3c: master add i3c_master_attach_boardinfo to
 preserve boardinfo
Date: Thu, 21 May 2020 11:32:22 +0200
Message-ID: <1590053542-389-1-git-send-email-pthombar@cadence.com>
X-Mailer: git-send-email 2.2.2
In-Reply-To: <1590053467-32079-1-git-send-email-pthombar@cadence.com>
References: <1590053467-32079-1-git-send-email-pthombar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.23; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:rmmaillnx1.cadence.com; PTR:InfoDomainNonexistent;
 CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(36092001)(46966005)(336012)(478600001)(186003)(36906005)(54906003)(316002)(42186006)(86362001)(110136005)(82310400002)(2906002)(356005)(26005)(82740400003)(81166007)(47076004)(8936002)(426003)(107886003)(36756003)(8676002)(70206006)(4326008)(2616005)(5660300002)(70586007);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a008c0a-e903-4247-6d28-08d7fd69e08e
X-MS-TrafficTypeDiagnostic: CY1PR07MB2665:
X-Microsoft-Antispam-PRVS: <CY1PR07MB26652E3786E3EA817B0DE6E0C1B70@CY1PR07MB2665.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 041032FF37
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7c+9uyGweQcp1xWjlTNQWrxMOTSdQ9xUMxUIom7gY8U+00qC4fCEXk57xM2xvwua35bHAuwILcqCXVfP39yNkYlCPkq/NxS3cKF5XT7HDMQj48zUGt2EzMRzWUAhHbIWKqFL6q8KnBugBoqBV6XsawNDZ89qe3RGAX+TcmB7IE9P8tzt/ajl7/LcQuviLwQVTChEVLXDlop/XtXKXiIcVRN7DAdZ+e+bslYVOsWHFbo6X4Jscnvxpk+iY+jUCwXVMniYTcUjesZH6UDyR3Oy9Ul7C2SiRAQBn0DY7vT6ukg852NfsDhffLHHWTvSJ7F+64lgmE9ET9K/OEB79hFH3ZLkZEIcFI+60bXpjxgRvUcqcWwp3reA4Gs2ZpaheuAxBqqIdnIJHoW4vIq1hpUIDlCcfD8l79d/0FafD3ZSSg9V1iQ5Q3K5vKTzjEaQR0iPBaCZLZ9xr1A3JVg/3yoThRR5e11ZkWIgDC0RNu+5eUQ/m0WSvQ3oStIkBcKdrxWGnL5y8NNQIEtxx/f3trAlAlrgumKN/mGXrJCO5a4Tx5s=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2020 09:32:27.5599 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a008c0a-e903-4247-6d28-08d7fd69e08e
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.23];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR07MB2665
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-21_05:2020-05-20,
 2020-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 lowpriorityscore=0 spamscore=0 cotscore=-2147483648 impostorscore=0
 mlxlogscore=933 phishscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 malwarescore=0 suspectscore=2 bulkscore=0 adultscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005210069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_023233_740444_86CB2912 
X-CRM114-Status: GOOD (  15.06  )
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
Cc: mparab@cadence.com, Parshuram Thombare <pthombar@cadence.com>,
 praneeth@ti.com, linux-kernel@vger.kernel.org, pgaj@cadence.com,
 linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Boardinfo was lost if I3C object for devices with boardinfo
available are not created or not added to the I3C device list
because of some failure e.g. SETDASA failed, retrieve info failed etc
This patch adds i3c_master_attach_boardinfo which scan boardinfo list
in the master object and 'attach' it to the I3C device object.

Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Signed-off-by: Parshuram Thombare <pthombar@cadence.com>
---
 drivers/i3c/master.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 5f4bd52121fe..3d995f247cb7 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1776,6 +1776,21 @@ static void i3c_master_bus_cleanup(struct i3c_master_controller *master)
 	i3c_master_detach_free_devs(master);
 }
 
+static void i3c_master_attach_boardinfo(struct i3c_dev_desc *i3cdev)
+{
+	struct i3c_master_controller *master = i3cdev->common.master;
+	struct i3c_dev_boardinfo *i3cboardinfo;
+
+	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
+		if (i3cdev->info.pid != i3cboardinfo->pid)
+			continue;
+
+		i3cdev->boardinfo = i3cboardinfo;
+		i3cdev->info.static_addr = i3cboardinfo->static_addr;
+		return;
+	}
+}
+
 static struct i3c_dev_desc *
 i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
 {
@@ -1831,10 +1846,10 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 	if (ret)
 		goto err_detach_dev;
 
+	i3c_master_attach_boardinfo(newdev);
+
 	olddev = i3c_master_search_i3c_dev_duplicate(newdev);
 	if (olddev) {
-		newdev->boardinfo = olddev->boardinfo;
-		newdev->info.static_addr = olddev->info.static_addr;
 		newdev->dev = olddev->dev;
 		if (newdev->dev)
 			newdev->dev->desc = newdev;
-- 
2.17.1


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
