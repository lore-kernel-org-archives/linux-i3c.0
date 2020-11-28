Return-Path: <SRS0=Ihvx=FC=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF15C63697
	for <linux-i3c@archiver.kernel.org>; Sat, 28 Nov 2020 14:48:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E22E12465A
	for <linux-i3c@archiver.kernel.org>; Sat, 28 Nov 2020 14:48:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vEwSMRFM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="e0VtdVDa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="UvE4G0kl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E22E12465A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Im2AhzZE5wvvZBnVb4kkQcV0QfWCvHRMBWhXLh5bzGU=; b=vEwSMRFMq4EWnUyjLQCYXCxXec
	RgDcLrlVJL2LIKLTldS9iCSVcHj1OUxZ3td6y7VUEKBAXSC5rNWjeoAhPrupRfolzJXLtFsrfgWvG
	/IBM1t2V4Nq4yt2cfSgqtALsjRhCAykHNl/YE50ozjpk9Liofz8jJgbF19s0BnouWyD0t4/YCObJS
	/5eb64jAsg49i3afg/4yIsg/aT4U9bQD1bhgzoTvS9j5+QVcJlkA2PZoAp2TrjVD4gxZ43+Tga+bD
	06Yq2iuAYwBIKMg8Tr88TPFDmtiTMdOPBdbpN2Cc56pFyJZ4Pr2AO7ckvz6AKf3liKZrKUYb0HAkV
	m7hE/8MA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj1WK-0003xG-2x; Sat, 28 Nov 2020 14:48:16 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj1WH-0003wu-OI
 for linux-i3c@lists.infradead.org; Sat, 28 Nov 2020 14:48:14 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0ASEmAiC027106; Sat, 28 Nov 2020 06:48:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=QVLEsxpNGaMWv/9e6vww9tEBk/03TpXXpSZn2TUCTBo=;
 b=e0VtdVDac1yiNUtT5V4DQAlDGHnZZyQnWvRT9naYg8elSMQIc825HJkWpja9BokjfjRY
 dWfplo2G1hKfLUVFIIn/n3tASDelo4Hsmt9ViMSTC1u1imhVrn+yodG6sJdh/VaTe38J
 htZfdagKDgw9o2xzNXP/p5wNiepa4gWRlUHVCXAUQvqQ4uKJtGtlFJGwrl1TAq7b/ROb
 lezOccc9rqfg7NOf1HMh2Y6k/2ju5rC9ifKodPGG75lqkZpc8zqNxN5jh8987yYJMgnx
 TaSOGsytFYBiDqIrjf+Cvo5JLVIawfpA412AHoUCikR7yyJof623NxXCXxnWBQgpK+sA Sw== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by mx0a-0014ca01.pphosted.com with ESMTP id 353m02rf5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 28 Nov 2020 06:48:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LHd4WqlEIxLUPO3gbU0+4WffwkjJkyHLTqcUU3wXi8zF14ZmjyoW+r0WBNANLkoRAheseC8LfBxwD0verszi4p32QTYGv4DiBk30pKI0IHjU5L8nuhJq+2SbEIk5TfZ7DE49OS0VCQH7ajUgiX8Mtx0g8q6VayPInTpupNDojvFdlpvdDXutemEG8O0E+abgaS0GrO0h871DBllFfaJbLwOutUyQdzLpByxciopuAVslRGHSs7Ib7sii9s5eP+MKKcYuPQW7PPHBjB9s5hcZPwQfb++5x/V+en+D6LWXuobTZuoTaOz5jk8J6jsRm+RjrhjMMtz3rCHvLR6RozwTzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVLEsxpNGaMWv/9e6vww9tEBk/03TpXXpSZn2TUCTBo=;
 b=JCfcycYLkUqFNyI3bqsnr15+QwgQ09uen0UnzdRWaUo/VJBXH7J4omCzoj9ENAsXrpFmZ50LULmoUWD+5JNrC0wdbjaEhuiZfpm/s2mY7YHhblVEEZLsMbhiGhYbt3l1LHnlaWlpRJ5Qx8PmTFYcS0yueA9SCor4IgK31E533SSTPg7r1lK8Ie+8wti0cepkxDTGnVK7UuapI27tuKLc7lZzH1tYiO6fKDPNjQ5+2D7/gR3iVnx1uVjj335gnmSyBAQvmuj1Wr7M0LrZrjAMBRZsrLREI/bxlMeCUwyzVqJdFmLwzKOBtPMYbfJTZ8RsqC70xe6j6i/1E5nc+IClOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.23) smtp.rcpttodomain=synopsys.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVLEsxpNGaMWv/9e6vww9tEBk/03TpXXpSZn2TUCTBo=;
 b=UvE4G0klBsZsdvuhSeJOw7A+GrVW/f1LEGYy9PlgJIzgeSKEWp4piMGV9mkOLiDrzWc1G+VihPZb3Q7+zuJuPXXAHeRNJlGKOrzVCovAUO0K/tKe6hKjQYWy+3KgIR6MXQpqSWCIy3C/Bxf8mwLukiKNCGDBCGLW7yk7Qnt2Jag=
Received: from DM5PR13CA0056.namprd13.prod.outlook.com (2603:10b6:3:117::18)
 by BYAPR07MB8007.namprd07.prod.outlook.com (2603:10b6:a03:111::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Sat, 28 Nov
 2020 14:48:01 +0000
Received: from DM6NAM12FT026.eop-nam12.prod.protection.outlook.com
 (2603:10b6:3:117:cafe::bf) by DM5PR13CA0056.outlook.office365.com
 (2603:10b6:3:117::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.7 via Frontend
 Transport; Sat, 28 Nov 2020 14:48:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 199.43.4.23)
 smtp.mailfrom=cadence.com; synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.23 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.23; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.23) by
 DM6NAM12FT026.mail.protection.outlook.com (10.13.179.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.11 via Frontend Transport; Sat, 28 Nov 2020 14:48:01 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 0ASElwDl012515
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Sat, 28 Nov 2020 09:47:59 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Sat, 28 Nov 2020 15:47:58 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Sat, 28 Nov 2020 15:47:58 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 0ASElwhR021422;
 Sat, 28 Nov 2020 15:47:58 +0100
Received: (from pthombar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 0ASElvMH021421;
 Sat, 28 Nov 2020 15:47:57 +0100
From: Parshuram Thombare <pthombar@cadence.com>
To: <alexandre.belloni@bootlin.com>, <slongerbeam@gmail.com>,
 <vitor.soares@synopsys.com>
Subject: [PATCH v9 5/7] i3c: master: add defslvs processing
Date: Sat, 28 Nov 2020 15:47:56 +0100
Message-ID: <1606574876-21386-1-git-send-email-pthombar@cadence.com>
X-Mailer: git-send-email 2.2.2
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8211a81e-a0b3-4f1e-2c27-08d893ac9aa9
X-MS-TrafficTypeDiagnostic: BYAPR07MB8007:
X-Microsoft-Antispam-PRVS: <BYAPR07MB8007141078F5872B74337BD2C1F70@BYAPR07MB8007.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mePDLxIlP3bCHEjHaTIv0JN5kNWkoxmrrDbG+enk5yTftTSlhEPUK2FpBWrP9wzfxClajK7+ERor/UpbwO8XxkCXZftuvMfJ+WvWfn/PCm0f+3fvqmpGlXK4sgj5j/psddciQI4qeZEW4mGU8AxIsgkKYkj6QPx4v5xhKtWDTI8MzSavIEImFVHMJPDEBDRsUiffdgibvd/Ypx6GXoeoUZqlJ3HGUJm4oWtFry2xX179oRr+jm+4eePdc8THrq0+GhlQy/g+QugxBOLBGoqqF5vrKKtWaByw9DmUW4jCWMyLVbcOP2s64XoGlQEQ1dGdZRrFtzl3gAIAQKgwU1KsZYeTKdQz45leBlQC0jgxR3LPTOyWCJCsdQxKWtZfN5+Z9DqTVEoN7CdbHOA5nWy/riCRrVvcmrQO5Ywrn+xyZYI=
X-Forefront-Antispam-Report: CIP:199.43.4.23; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:rmmaillnx1.cadence.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(36092001)(46966005)(426003)(82310400003)(83380400001)(70206006)(86362001)(356005)(5660300002)(81166007)(8676002)(47076004)(82740400003)(8936002)(36756003)(107886003)(336012)(2616005)(186003)(70586007)(478600001)(26005)(316002)(2906002)(110136005)(54906003)(42186006)(36906005)(4326008);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2020 14:48:01.0641 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8211a81e-a0b3-4f1e-2c27-08d893ac9aa9
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.23];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT026.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB8007
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-28_09:2020-11-26,
 2020-11-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011280090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201128_094813_947033_154536F6 
X-CRM114-Status: GOOD (  22.92  )
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

Added defslvs processing code to the I3C master subsystem.

Signed-off-by: Parshuram Thombare <pthombar@cadence.com>
---
 drivers/i3c/master.c       |   68 ++++++++++++++++++++++++++++++++++++++++++-
 include/linux/i3c/master.h |    7 ++++
 2 files changed, 73 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 51ef706..c01ba00 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2172,7 +2172,7 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 	else
 		expected_dyn_addr = newdev->info.dyn_addr;
 
-	if (newdev->info.dyn_addr != expected_dyn_addr) {
+	if (!master->secondary && newdev->info.dyn_addr != expected_dyn_addr) {
 		/*
 		 * Try to apply the expected dynamic address. If it fails, keep
 		 * the address assigned by the master.
@@ -2867,12 +2867,20 @@ int i3c_secondary_master_register(struct i3c_master_controller *master,
 				  struct device *parent,
 				  const struct i3c_master_controller_ops *ops)
 {
-	int ret;
+	int ret, sz;
 
 	ret = i3c_master_init(master, parent, ops, true);
 	if (ret)
 		return ret;
 
+	sz = sizeof(struct i3c_ccc_dev_desc) * I3C_BUS_MAX_DEVS;
+	master->defslvs_data.devs = devm_kzalloc(&master->dev, sz,
+						 GFP_KERNEL);
+	if (!master->defslvs_data.devs) {
+		ret = -ENOMEM;
+		goto err_cleanup_bus;
+	}
+
 	ret = device_add(&master->dev);
 	if (ret)
 		goto err_cleanup_bus;
@@ -2905,6 +2913,62 @@ int i3c_secondary_master_register(struct i3c_master_controller *master,
 }
 EXPORT_SYMBOL_GPL(i3c_secondary_master_register);
 
+static int
+i3c_master_populate_bus(struct i3c_master_controller *master, u8 dyn_addr)
+{
+	struct i3c_dev_desc *olddev;
+	struct i3c_ccc_dev_desc *desc;
+	int ret, slot;
+
+	i3c_bus_for_each_i3cdev(&master->bus, olddev)
+		i3c_master_put_i3c_addrs(olddev);
+
+	master->this->info.dyn_addr = dyn_addr;
+	i3c_master_get_i3c_addrs(master->this);
+
+	desc = master->defslvs_data.devs;
+	for (slot = 1; slot < master->defslvs_data.ndevs; slot++) {
+		ret = i3c_master_add_i3c_dev_locked(master,
+						    desc[slot].dyn_addr);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
+/**
+ * i3c_master_process_defslvs() - process I3C device list received in
+ * DEFSLVS for device plug/unplug and address change.
+ * @m: I3C master object
+ * @dyn_addr: Current dynamic address of this device
+ *
+ * This function may sleep, so should not be called in the atomic context.
+ */
+int i3c_master_process_defslvs(struct i3c_master_controller *m, u8 dyn_addr)
+{
+	int ret;
+
+	i3c_bus_normaluse_lock(&m->bus);
+	ret = i3c_master_acquire_bus(m);
+	i3c_bus_normaluse_unlock(&m->bus);
+	if (ret)
+		return ret;
+
+	i3c_bus_maintenance_lock(&m->bus);
+	ret = i3c_master_populate_bus(m, dyn_addr);
+	i3c_bus_maintenance_unlock(&m->bus);
+	if (!ret) {
+		i3c_bus_normaluse_lock(&m->bus);
+		i3c_master_register_new_i3c_devs(m);
+		i3c_bus_normaluse_unlock(&m->bus);
+	}
+	i3c_master_enable_mr_events(m);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(i3c_master_process_defslvs);
+
 /**
  * i3c_master_unregister() - unregister an I3C master
  * @master: master used to send frames on the bus
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 77c0422..835f823 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -478,6 +478,8 @@ struct i3c_master_controller_ops {
  *	in a thread context. Typical examples are Hot Join processing which
  *	requires taking the bus lock in maintenance, which in turn, can only
  *	be done from a sleep-able context
+ * @defslvs_data: list used to pass i3c device list received in DEFSLVS message,
+ *	from DEFSLVS controller driver to I3C core
  *
  * A &struct i3c_master_controller has to be registered to the I3C subsystem
  * through i3c_master_register(). None of &struct i3c_master_controller fields
@@ -497,6 +499,10 @@ struct i3c_master_controller {
 	} boardinfo;
 	struct i3c_bus bus;
 	struct workqueue_struct *wq;
+	struct {
+		u32 ndevs;
+		struct i3c_ccc_dev_desc *devs;
+	} defslvs_data;
 };
 
 /**
@@ -523,6 +529,7 @@ struct i3c_master_controller {
 
 void i3c_master_yield_bus(struct i3c_master_controller *m,
 			  u8 sec_mst_dyn_addr);
+int i3c_master_process_defslvs(struct i3c_master_controller *m, u8 dyn_addr);
 int i3c_master_do_i2c_xfers(struct i3c_master_controller *master,
 			    const struct i2c_msg *xfers,
 			    int nxfers);
-- 
1.7.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
