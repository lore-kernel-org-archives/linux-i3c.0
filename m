Return-Path: <SRS0=yDPd=FD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D217C5519F
	for <linux-i3c@archiver.kernel.org>; Sun, 29 Nov 2020 14:24:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 273E920727
	for <linux-i3c@archiver.kernel.org>; Sun, 29 Nov 2020 14:24:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HvNYStWF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="UX3qBkG4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="mEpjhjI0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 273E920727
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7Oe+WF7N3V7Vc1d7oKm6OToLwDW/IcPzi+a8+2Pqmis=; b=HvNYStWFpkSeRABEhpKyt0vPP
	7kyAZc4gSyemMj+AD/xjQ80WyaGHj723dkstwxwoY91DHmohJx6sYGbVTdi0W6ii6iYymSv1q91bj
	tv1MiGNakZPO480wAufsMDOvgeK3/GLlMsjDJf4uLA+WjAOSmlF/3E8SuOVm2eg3eS087ZJk5a+7w
	DaIgVS1Z1HkpjDjXAnM4UcmrV+a8f+r7WcXVGx0qEDzXVx2GtGwpC4cWAN1sNbNs/gin9r44GzMmj
	4H5tpBCkfuDyDFf6ecv2yrmeI+htM3uUn34WxD43QiRNlnavGRzt7HxykoIeqUZu3wr1iNC55pKkh
	OhESgwjNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjNcc-0005JQ-HZ; Sun, 29 Nov 2020 14:24:14 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjNca-0005J6-HN
 for linux-i3c@lists.infradead.org; Sun, 29 Nov 2020 14:24:13 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0ATEM7R1014478; Sun, 29 Nov 2020 06:24:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=6HLJSNbqupKDA6NkIIamnWz2e6tRBqh6fhldFQb6nC8=;
 b=UX3qBkG4HGoKtFpxyxumcexUbbJkUwK2tKiWd9v0WsFGX9bpJXPRWwzoAiyR1Z7j2+cK
 H10D2nfILtShniqF7Jbp6+yyOdUvygXBeKsW9brz8kGPl2QtTyAwG9e01nNGem53ChR8
 7oNnSPquutkaRV5DdqZzCoV1u/US1hbePDYR4oOpg1+S9j6s6sJYxK+KocMFMAXxtOg+
 OyUUeV7xae8H8VKxLAuB14Pe7E9lKjuKmN8dHrEzh2uJuZCAPchPoQw5Lw+C5nsZ5RAN
 SEeSj9kGgPNzXMC4VFLF7uoVDKkU9hZTb4ryGdW1G71sAFVG9o2KLilnsjhhAg+G+eJb Mg== 
Received: from nam04-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam04lp2053.outbound.protection.outlook.com [104.47.44.53])
 by mx0a-0014ca01.pphosted.com with ESMTP id 353m02tf7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 29 Nov 2020 06:24:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGbhgPjFun9yW24G5PmJe01bls4BeKZf6+nl+WeU21f/pZo/KwQmgGMqh9052oP9BECMuITruyt3jJQ5IPcIe7U3zrdZrlL8w+9ZUtK0QFilEGgQd2MLDxnAqx+qzNPeeR0wAntLSIbha9sICouqyrytIRl+HMl9jLmmIv/aW6krD/aGk4brBVt89z+A5UtdN9CLk6TgNVs6v+J0qIpkkF1Hn70Dd3lpgnTzfTdu6RvruyOS13dhpiG53ooq8DI+yyviIFeTRBUd15HpDYtfw76CepNsAZ1qZphGGG2j0W7DPpXbalHUQP4mUDcVFGGsM/EcSXapar84kRHs435K4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HLJSNbqupKDA6NkIIamnWz2e6tRBqh6fhldFQb6nC8=;
 b=GnMVHhf9EGfAMHYCLNdVqmFq7MTByrr1XESWKkAYW7lugjXtZQcDDRRNErmwNJyavMhtqGh+yc7Q+0oenRVIOxE2RNe8k8JZSZfB+d1naR7zatcsgHTPWN5u61eiRk1ngyyjd1vRi4QZAo0/AofWPGHW619tWi7fnRgy0wkB8wsyBbkaBcRYsJoh0Z4RrBAxi1JjTC+Ct64aVFQTfFaNlQfiZ/psEKdiY7G05NNO4gEyydDxbxhJhpqZgFlO8GUIQpLvEkJ2jaXwQMZpGPaYX8MDo96m768M3f5DxamGwNE3P7gQjnO7vy9jgR/nwwTEr6rezANbURlhfGkhfYFD1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.147) smtp.rcpttodomain=synopsys.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HLJSNbqupKDA6NkIIamnWz2e6tRBqh6fhldFQb6nC8=;
 b=mEpjhjI0lSo8g0jvO1VkAjZNE9+9UHR7/wHyK3OeRePQljfhVnYBtFuZfo9v58AFLDnr3DW9fUWNqMtzm0pGGocWXU0BRwHLq2pMEoQ39pYaio4PI63uKATFA8zdfLjFyYYyk4MoSvGDDX1u92DOaY16apM1rBUM/voD0u51VCM=
Received: from CO2PR05CA0070.namprd05.prod.outlook.com (2603:10b6:102:2::38)
 by MN2PR07MB6766.namprd07.prod.outlook.com (2603:10b6:208:16d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Sun, 29 Nov
 2020 14:24:02 +0000
Received: from MW2NAM12FT055.eop-nam12.prod.protection.outlook.com
 (2603:10b6:102:2:cafe::d) by CO2PR05CA0070.outlook.office365.com
 (2603:10b6:102:2::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.9 via Frontend
 Transport; Sun, 29 Nov 2020 14:24:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 158.140.1.147)
 smtp.mailfrom=cadence.com; synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.147 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.147; helo=sjmaillnx1.cadence.com;
Received: from sjmaillnx1.cadence.com (158.140.1.147) by
 MW2NAM12FT055.mail.protection.outlook.com (10.13.180.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.11 via Frontend Transport; Sun, 29 Nov 2020 14:24:01 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 0ATENwI6021390
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Sun, 29 Nov 2020 06:23:59 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Sun, 29 Nov 2020 15:23:58 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Sun, 29 Nov 2020 15:23:58 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 0ATENwGE019933;
 Sun, 29 Nov 2020 15:23:58 +0100
Received: (from pthombar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 0ATENwtY019932;
 Sun, 29 Nov 2020 15:23:58 +0100
From: Parshuram Thombare <pthombar@cadence.com>
To: <alexandre.belloni@bootlin.com>, <slongerbeam@gmail.com>,
 <vitor.soares@synopsys.com>
Subject: [PATCH v9 6/7] i3c: master: sysfs key for acquire bus
Date: Sun, 29 Nov 2020 15:23:52 +0100
Message-ID: <1606659832-19883-1-git-send-email-pthombar@cadence.com>
X-Mailer: git-send-email 2.2.2
In-Reply-To: <1606659554-19229-1-git-send-email-pthombar@cadence.com>
References: <1606659554-19229-1-git-send-email-pthombar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9df742c-8cf1-406a-d209-08d894726ac0
X-MS-TrafficTypeDiagnostic: MN2PR07MB6766:
X-Microsoft-Antispam-PRVS: <MN2PR07MB6766B6E24420E09387370A96C1F60@MN2PR07MB6766.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cgA1ROMKAujmhAM3J02PYqtPJCacTlWPMt17qC6Z49plktcuXcJwDtmWOT+drQ2LHB9OoCDfjPKAVJG3C8nr0G46ssu5pP4THM7CeMuPjCBYy032aoPxLu5KFn5Dted2QX8mYxjCvtesqUFel/RLrfgONjyqv0S8QXBqii0wrTczLxpnt/YBJ8OPLSLFRqzRmCpkT8NIWhusocyXVEe4pIuAC/pprxNKGvbdq9elKXaJplzbpc3PNlE+W59Fioo9DE0Jo0ZfJBp7KEuBWfUBNPwcP/augsGfg9afxtC2sDEsH/KHjiTxD1SEiCnroALtBsaYGGTuBw+FwuMLB/1uVnlG3a5jSGpFc5l4PtBA5T5bfnDrMVDZZtaV8G9Ch1+3/L2s9HOCGia5sdS5s4fgeiWkFsx+3H0FYOEDmGljVPM=
X-Forefront-Antispam-Report: CIP:158.140.1.147; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:sjmaillnx1.cadence.com; PTR:unknown.Cadence.COM; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(36092001)(46966005)(6666004)(54906003)(82310400003)(8676002)(2906002)(26005)(83380400001)(107886003)(4326008)(36756003)(8936002)(478600001)(356005)(86362001)(316002)(2616005)(5660300002)(82740400003)(42186006)(36906005)(186003)(47076004)(70206006)(70586007)(336012)(426003)(7636003)(110136005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2020 14:24:01.0549 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9df742c-8cf1-406a-d209-08d894726ac0
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.147];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM12FT055.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR07MB6766
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-29_07:2020-11-26,
 2020-11-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=994
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011290097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201129_092412_748663_7BD8EDF0 
X-CRM114-Status: GOOD (  15.93  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: praneeth@ti.com, mparab@cadence.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, Parshuram Thombare <pthombar@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Added support to acquire I3C bus through sysfs interface.

Signed-off-by: Parshuram Thombare <pthombar@cadence.com>
---
 drivers/i3c/master.c |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index c01ba00..beb7495 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -581,6 +581,23 @@ static ssize_t i2c_scl_frequency_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(i2c_scl_frequency);
 
+static ssize_t i3c_acquire_bus_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct i3c_master_controller *master = dev_to_i3cmaster(dev);
+	int ret;
+
+	i3c_bus_normaluse_lock(&master->bus);
+	ret = i3c_master_acquire_bus(master);
+	i3c_bus_normaluse_unlock(&master->bus);
+	if (!ret)
+		i3c_master_enable_mr_events(master);
+
+	return ret ?: count;
+}
+static DEVICE_ATTR_WO(i3c_acquire_bus);
+
 static struct attribute *i3c_masterdev_attrs[] = {
 	&dev_attr_mode.attr,
 	&dev_attr_current_master.attr,
@@ -591,6 +608,7 @@ static ssize_t i2c_scl_frequency_show(struct device *dev,
 	&dev_attr_pid.attr,
 	&dev_attr_dynamic_address.attr,
 	&dev_attr_hdrcap.attr,
+	&dev_attr_i3c_acquire_bus.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(i3c_masterdev);
-- 
1.7.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
